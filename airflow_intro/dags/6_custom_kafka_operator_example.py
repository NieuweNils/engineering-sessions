"""
kafka example job
---

calls the custom axual kafka operator to produce messages to an axual stream(=kafka topic)

NB: the current implementation of the operator uses certificates of the former Team CODE (2017-2023 RIP)

- Project: Lunch & Learn
- Maintainer: [Nils Nieuwenkamp](mailto:nils.nieuwenkamo@eneco.com?subject=example_kafka_producer_job)
- Product Owner: [Marjolein Knijff](mailto:marjolein.knijf@eneco.com?subject=example_kafka_producer_job)
- Team: Engineering Chapter
- VCS: [GitHub](https://github.com/NieuweNils/engineering-sessions/tree/main/airflow/dags/5_custom_kafka_operator_example.py)
"""
import os
from datetime import datetime, timedelta

from airflow import DAG
from airflow.models import Variable
from operators.axualkafka_operator import AxualKafkaOperator

DAG_ID = "kafka_example"
TOPIC_NAME = "your_topic_goes_here"

env = Variable.get("environment")
default_arguments = {
    "owner": "nils",
    "email": [
        "nils.nieuwenkamp@eneco.com"
        "marjolein.knijff@eneco.com"
    ],
    "email_on_failure": env == "prd",
    "email_on_retry": False,
    "retries": 0,
    "retry_delay": timedelta(minutes=5),
    "start_date": datetime(2024, 4, 4),

}


def payload_generator(**kwargs):
    your_data = []  # in an actual app, there would be a call to a datastore (and some transform functions) here

    for record in your_data:
        key = 'key'
        record_content = {"some_data": "you want to produce to kafka"}
        yield key, record_content


with DAG(
        dag_id=DAG_ID,
        default_args=default_arguments,
        description="Example of how to use the custom Axual Kafka Operator",
        schedule="30 12 * * *",
        catchup=False,
        access_control={
            "DEFAULT": {"can_read", "can_edit"},
        },
        doc_md=__doc__,
        tags=["lunch_and_learn", "kafka", "example"],
) as dag:

    # NB: the current implementation of the operator uses certificates of the former Team CODE(2017 - 2023 RIP)
    # NB: make sure your stream accepts messages using these credentials if you want to use the operator
    AxualKafkaOperator(
        task_id="send_to_kafka",
        kafka_conn_id="esp",
        topic=TOPIC_NAME,
        # https://dev.azure.com/enecomanagedcloud/Event%20Streaming%20Platform/_git/esp-avro-schemas?path=/src/avro/com/eneco/streaming/knmi/ClimatologyHourly.avsc
        schema=os.path.join(
            os.path.dirname(os.path.abspath(__file__)), "ClimatologyHourly.avsc"
        ),
        payload_generator=payload_generator,
    )
