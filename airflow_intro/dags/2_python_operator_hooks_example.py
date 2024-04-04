"""
example python job using hook
---

calls some python functions that use a SnowflakeHook with the python operator

- Project: Lunch & Learn
- Maintainer: [Nils Nieuwenkamp](mailto:nils.nieuwenkamo@eneco.com?subject=example_python_job_using_hook)
- Product Owner: [Marjolein Knijff](mailto:marjolein.knijf@eneco.com?subject=example_python_job_using_hook)
- Team: Engineering Chapter
- VCS: [GitHub](https://github.com/NieuweNils/engineering-sessions/tree/main/airflow/dags/0_python_operator_example.py)
"""
from datetime import datetime, timedelta

from airflow import DAG
from airflow.models import Variable
from airflow.operators.python import PythonOperator
from airflow.providers.snowflake.hooks.snowflake import SnowflakeHook

DAG_ID = "python_hooks_example"
LIMIT = "{{ (dag_run.conf.get('limit', '') if dag_run and dag_run.conf else 100) or 100}}"  # LIMIT for the SQL SELECT statement. Defaults to 100 if not set in the dag_conf

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


# # !!!NB!!! do NOT do this:
#
# snowflake_hook = SnowflakeHook(snowflake_conn_id="snowflake_ae_code", supports_autocommit=True)
# sf_connection = snowflake_hook.get_conn()
# sf_cursor = sf_connection.get_cursor()
#
# def etl(limit:int):
#     sf_cursor.execute(""""some SQL statement""")

# # The statements outside the function are evaluated EVERY time a DAG file is read by airflow.
# # These connections are established EVERY time as well.
# # Enough of these statements causes Airflow to break at some point.


def do_db_call(limit: int):
    snowflake_hook = SnowflakeHook(snowflake_conn_id="snowflake_ae_code", supports_autocommit=True)
    with snowflake_hook.get_conn() as sf_connection:
        with sf_connection.cursor() as sf_cursor:
            print(f"querying [{limit}] records from the data marketplace")
            statement = f"""
                                    SELECT 
                                        * 
                                    FROM DATA_MARKETPLACE.KAFKA_KNMI.CCO_CODE_KNMI_CLIMATOLOGY
                                    LIMIT {limit}
                                    """
            print(statement)
            sf_cursor.execute(statement)
            while True:
                print("fetching batch of up to 1000 results..")
                rows = sf_cursor.fetchmany(1_000)
                if not rows:
                    break
                print(f"first row of batch: {rows[0]}")


with DAG(
        dag_id=DAG_ID,
        default_args=default_arguments,
        description="PythonOperator using Snowflake Hook",
        schedule="30 12 * * *",
        catchup=False,
        access_control={
            "DEFAULT": {"can_read", "can_edit"},
        },
        doc_md=__doc__,
        tags=["lunch_and_learn", "python", "example"],
) as dag:
    PythonOperator(
        task_id="do_a_database_call",
        python_callable=do_db_call,
        op_kwargs={"limit": LIMIT},
    )
