"""
example python job
---

calls some python functions that use libraries that are unavailable in airflow's base python with the PythonVirtualenvOperator

- Project: Lunch & Learn
- Maintainer: [Nils Nieuwenkamp](mailto:nils.nieuwenkamo@eneco.com?subject=example_python_job)
- Product Owner: [Marjolein Knijff](mailto:marjolein.knijf@eneco.com?subject=example_python_job)
- Team: Engineering Chapter
- VCS: [GitHub](https://github.com/NieuweNils/engineering-sessions/tree/main/airflow/dags/0_python_operator_example.py)
"""
# when using a PythonVirtualenvOperator, you still import all the DAG dependencies outside functions
from datetime import datetime, timedelta

from airflow import DAG
from airflow.models import Variable
from airflow.operators.python import PythonVirtualenvOperator

DAG_ID = "python_venv_example"

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


def do_db_call_with_fancy_new_library(limit):
    # you have to specify all functions used in the VirtualEnvOperator within the function
    from airflow.providers.snowflake.hooks.snowflake import SnowflakeHook
    import snowflake.connector as snowflake_connector

    snowflake_connector.paramstyle = 'numeric'

    snowflake_hook = SnowflakeHook(snowflake_conn_id="snowflake_ae_code", supports_autocommit=True)
    with snowflake_hook.get_conn() as sf_connection:
        with sf_connection.cursor() as sf_cursor:
            print(f"querying [{limit}] records from the data marketplace")
            sf_cursor.execute(f"""
                                    SELECT 
                                        * 
                                    FROM DATA_MARKETPLACE.KAFKA_KNMI.CCO_CODE_KNMI_CLIMATOLOGY
                                    LIMIT {limit}
                                    """
                              )
            while True:
                print("fetching batch of up to 1000 results..")
                rows = sf_cursor.fetchmany(1_000)
                if not rows:
                    break
                print(f"first row of batch: {rows[0]}")


with DAG(
        dag_id=DAG_ID,
        default_args=default_arguments,
        description="PythonVirtualEnvOperator",
        schedule="30 12 * * *",
        catchup=False,
        access_control={
            "DEFAULT": {"can_read", "can_edit"},
        },
        doc_md=__doc__,
        tags=["lunch_and_learn", "python", "example", "virtualenv"],
) as dag:
    PythonVirtualenvOperator(
        task_id="do_a_database_call_with_fancy_new_library",
        python_callable=do_db_call_with_fancy_new_library,
        requirements=["snowflake-connector-python==2.9.0"]
    )
