"""
example job that alerts slack on failure
---

calls some python functions with the python operator and always fails and sends a slack alert

- Project: Lunch & Learn
- Maintainer: [Nils Nieuwenkamp](mailto:nils.nieuwenkamo@eneco.com?subject=example_slack_job)
- Product Owner: [Marjolein Knijff](mailto:marjolein.knijf@eneco.com?subject=example_slack_job)
- Team: Engineering Chapter
- VCS: [GitHub](https://github.com/NieuweNils/engineering-sessions/tree/main/airflow/dags/5_custom_slack_operator_example.py)
"""
import logging
from datetime import datetime, timedelta

from airflow import DAG, AirflowException
from airflow.models import Variable
from airflow.operators.python import PythonOperator
from operators.slack_reporter import task_failure_slack_reporter

DAG_ID = "slack_example"


def send_slack_alert(context):
    logging.info("Task failure callback initiated, sending alert to slack..")
    if env == "prd":
        logging.info("env == prod, sending a message to slack_webhook_test")
        task_failure_slack_reporter(context, slack_connection_name="slack_webhook_test")
    if env == "acc":
        logging.info("env == acc, sending a message to slack_webhook_test")
        task_failure_slack_reporter(context, slack_connection_name="slack_webhook_test")
    if env == "test":
        logging.info("env == test, sending a message to slack_webhook_test")
        task_failure_slack_reporter(context, slack_connection_name="slack_webhook_test")


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
    "on_failure_callback": send_slack_alert if env in ["test", "acc", "prod"] else None,

}


def print_message():
    print(f"you are in in env: {env}")
    raise AirflowException("If you raise an airflowexception, this will get logged and the task will be set to failed")
    # ah-oh: this never returns :(
    return "this will never happen!"


with DAG(
        dag_id=DAG_ID,
        default_args=default_arguments,
        description="SlackReporter",
        schedule="30 12 * * *",
        catchup=False,
        access_control={
            "DEFAULT": {"can_read", "can_edit"},
        },
        doc_md=__doc__,
        tags=["lunch_and_learn", "slack", "example"],
) as dag:
    task = PythonOperator(
        task_id="failable_task",
        python_callable=print_message
    )
