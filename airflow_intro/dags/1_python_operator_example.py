"""
example python job
---

calls some python functions with the python operator

- Project: Lunch & Learn
- Maintainer: [Nils Nieuwenkamp](mailto:nils.nieuwenkamo@eneco.com?subject=example_python_job)
- Product Owner: [Marjolein Knijff](mailto:marjolein.knijf@eneco.com?subject=example_python_job)
- Team: Engineering Chapter
- VCS: [GitHub](https://github.com/NieuweNils/engineering-sessions/tree/main/airflow/dags/0_python_operator_example.py)
"""
import random
from datetime import datetime, timedelta
from pprint import pprint

from airflow import DAG
from airflow.models import Variable
from airflow.operators.python import PythonOperator

DAG_ID = "python_example"
DS = "{{ ds }}"

env = Variable.get("environment")
default_arguments = {
    "owner": "nils",
    "email": [
        "nils.nieuwenkamp@eneco.com"
        "marjolein.knijff@eneco.com"
    ],
    "email_on_failure": env == "prd",
    "email_on_retry": False,
    "retries": 2,
    "retry_delay": timedelta(minutes=5),
    "start_date": datetime(2024, 4, 4),
}


def print_context(ds=None, **kwargs):
    """Print the Airflow context and ds variable from the context."""
    pprint(kwargs)
    print(ds)
    return "Whatever you return gets printed in the logs"


def call_a_function(**kwargs):
    print_context(**kwargs)


def return_data() -> int:
    return random.randint(0, 42)  # this will get stored in XCom


def accept_data(**kwargs):
    ti = kwargs['ti']
    data = ti.xcom_pull(task_ids='return_data')
    print(f"{data} ** 2 = {data ** 2}")


def print_message():
    return "you've made it!"


with DAG(
        dag_id=DAG_ID,
        default_args=default_arguments,
        description="PythonOperator",
        schedule="30 12 * * *",
        catchup=False,
        access_control={
            "DEFAULT": {"can_read", "can_edit"},
        },
        doc_md=__doc__,
        tags=["lunch_and_learn", "python", "example"],
) as dag:
    task = {}

    task['first'] = PythonOperator(
        task_id="print_the_context",
        python_callable=print_context
    )

    task['second'] = PythonOperator(
        task_id="call_a_function",
        python_callable=call_a_function
    )

    task['third'] = PythonOperator(
        task_id="return_data",  # only use this for very small amounts of data! Try to default to using a datastore to store data
        python_callable=return_data,
        provide_context=True,
    )

    task['fourth'] = PythonOperator(
        task_id="accept_data",  # only use this for very small amounts of data! Try to default to using a datastore to store data
        python_callable=accept_data
    )

    task['last'] = PythonOperator(
        task_id="last_task",
        python_callable=print_message
    )

    task['first'] >> task['second'] >> task['last']
    task['third'] >> task['fourth'] >> task['last']
