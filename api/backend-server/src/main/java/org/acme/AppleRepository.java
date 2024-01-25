package org.acme;

import io.quarkus.runtime.StartupEvent;
import io.smallrye.mutiny.Uni;
import io.vertx.mutiny.sqlclient.Row;
import io.vertx.mutiny.sqlclient.RowSet;
import io.vertx.mutiny.sqlclient.Tuple;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.enterprise.event.Observes;
import jakarta.inject.Inject;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.microprofile.config.inject.ConfigProperty;


@Slf4j
@ApplicationScoped
public class AppleRepository {
    @Inject
    io.vertx.mutiny.pgclient.PgPool client;
    @Inject
    @ConfigProperty(name = "myapp.schema.create", defaultValue = "true")
    boolean schemaCreate;

    void config(@Observes StartupEvent ev) {
        if (schemaCreate) {
            initdb();
        }
    }

    private void initdb() {
        client.query("DROP TABLE IF EXISTS apples").execute()
                .flatMap(r -> client.query("CREATE TABLE apples (id SERIAL PRIMARY KEY, circumference DOUBLE PRECISION NOT NULL, seeds INT NOT NULL)").execute())
                .flatMap(r -> client.query("INSERT INTO apples (circumference, seeds) VALUES ('2.12', 2)").execute())
                .flatMap(r -> client.query("INSERT INTO apples (circumference, seeds) VALUES ('0.23', 4)").execute())
                .flatMap(r -> client.query("INSERT INTO apples (circumference, seeds) VALUES ('3.14', 18)").execute())
                .await().indefinitely();
    }



    public Uni<Integer> addApple(Apple apple){
        return client.preparedQuery("INSERT INTO apples (circumference, seeds) VALUES ($1, $2) RETURNING id")
                .execute(Tuple.of(apple.circumference(), apple.seeds()))
                .onItem().transform(rows -> rows.iterator().next().getInteger(0));
    }

    public Uni<Apple> findApple(Integer id) {
        return client.preparedQuery("SELECT circumference, seeds from apples where id = $1")
                .execute(Tuple.of(id))
                .onItem().transform(RowSet::iterator)
                .onItem().transform(iterator -> iterator.hasNext() ? from(iterator.next()) : null);

    }

    public Uni<Apple> updateApple(Integer id, Apple apple) {
        return client.preparedQuery("UPDATE apples SET circumference=$1, seeds=$2 where id = $3 RETURNING seeds, circumference")
                .execute(Tuple.of(apple.circumference(), apple.seeds(), id))
                .onItem().transform(RowSet::iterator)
                .onItem().transform(iterator -> iterator.hasNext() ? from(iterator.next()) : null);
    }

    public Uni<Boolean> deleteApple(Integer id) {
        return client.preparedQuery("DELETE FROM apples WHERE id = $1 RETURNING 1")
                .execute(Tuple.of(id))
                .onItem().transform(RowSet::iterator)
                .onItem().transform(iterator -> iterator.hasNext() ? true : null);
    }

    private static Apple from(Row row) {
        return new Apple(row.getInteger("seeds"), row.getDouble("circumference"));
    }

}
