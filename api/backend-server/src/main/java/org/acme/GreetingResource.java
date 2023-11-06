package org.acme;

import io.smallrye.mutiny.Uni;
import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import org.jboss.resteasy.reactive.RestResponse;
import org.jboss.resteasy.reactive.server.ServerExceptionMapper;

@Path("/v1")
public class GreetingResource {

    @Inject
    AppleRepository appleRepository;

    @GET
    @Path("/hello")
    @Produces(MediaType.TEXT_PLAIN)
    public String hello() {
        return "Hello from RESTEasy Reactive";
    }

    @POST
    @Path("/apple")
    public Uni<Integer> addApple(Apple apple){
        return appleRepository.addApple(apple);
    }

    @GET
    @Path("/apple/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Uni<Apple> getApple(@PathParam("id") Integer id){
        return appleRepository.findApple(id);
    }

    @ServerExceptionMapper
    public RestResponse<String> mapException(NotFoundException x) {
        return RestResponse.status(Response.Status.NOT_FOUND,  x.getMessage());
    }
}