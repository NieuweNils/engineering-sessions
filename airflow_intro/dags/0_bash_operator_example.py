"""
example bash job
---

calls some bash functions with the bash operator

- Project: Lunch & Learn
- Maintainer: [Nils Nieuwenkamp](mailto:nils.nieuwenkamo@eneco.com?subject=example_bash_job)
- Product Owner: [Marjolein Knijff](mailto:marjolein.knijf@eneco.com?subject=example_bash_job)
- Team: Engineering Chapter
- VCS: [Github](https://github.com/NieuweNils/engineering-sessions/tree/main/airflow/dags/0_bash_operator_example.py)
"""
from datetime import datetime, timedelta

from airflow.models import Variable
from airflow.operators.bash import BashOperator

from airflow import DAG

DAG_ID = "bash_example"
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

with DAG(
        dag_id=DAG_ID,
        default_args=default_arguments,
        description="one DAG to introduce all DAGs (and in the darkness teach them)",
        schedule="30 12 * * *",
        catchup=False,
        access_control={
            "DEFAULT": {"can_read", "can_edit"},
        },
        doc_md=__doc__,
        tags=["lunch_and_learn", "bash", "example"],
) as dag:
    last_task = BashOperator(
        task_id="last_task",
        bash_command='echo "{{ ds }}"'
    )
    for i in range(3):
        task = BashOperator(
            task_id=f"task_{i}",
            bash_command='echo "{{ ds }}" && sleep 3'
        )

        task >> last_task
