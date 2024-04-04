"""
example dockerised job
---

runs a dockerised app using the KubernetesPodOperator

- Project: Lunch & Learn
- Maintainer: [Nils Nieuwenkamp](mailto:nils.nieuwenkamo@eneco.com?subject=example_dockerised_job)
- Product Owner: [Marjolein Knijff](mailto:marjolein.knijf@eneco.com?subject=example_dockerised_job)
- Team: Engineering Chapter

NB!! also add the link to where the APPLICATION CODE is! not just the DAG code
- VCS (DAG): [GitHub](https://github.com/NieuweNils/engineering-sessions/tree/main/airflow/dags/4_kubernetes_pod_operator_example.py)
- VCS (app): [GitHub](https://github.com/NieuweNils/engineering-sessions/tree/main/airflow/app)
"""
from datetime import datetime, timedelta

from airflow import DAG
from airflow.kubernetes.secret import Secret
from airflow.models import Variable
from airflow.providers.cncf.kubernetes.operators.kubernetes_pod import KubernetesPodOperator
from kubernetes.client import models as k8s

DAG_ID = "kubernetes_pod_operator_example"

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

KEY_PATH = k8s.V1EnvVar(
    name="KEY_PATH",
    value="/etc/snowflake/some.key",
)

VERY_SECRET_HOSTNAME = Secret(
    deploy_type="env",
    deploy_target="EBASE_SFTP_HOST",
    secret="ebase-dm-retail-sftp-credentials",
    key="SFTP_HOST"
)

with DAG(
        dag_id=DAG_ID,
        default_args=default_arguments,
        description="KubernetesPodoperator example",
        schedule="30 12 * * *",
        catchup=False,
        access_control={
            "DEFAULT": {"can_read", "can_edit"},
        },
        doc_md=__doc__,
        tags=["lunch_and_learn", "python", "example", "docker", "kubernetesPodOperator"],
) as dag:
    KubernetesPodOperator(
        dag=dag,
        task_id="print_something_from_a_docker_container",
        namespace="{{ var.value.kubernetes_namespace }}",
        image="acrcodep.azurecr.io/lunch_and_learn_docker_airflow_demo:0.0.3",
        image_pull_policy='Always',
        name="lunch_and_learn_docker_airflow_demo",
        env_vars=[
            KEY_PATH
        ],
        secrets=[
            VERY_SECRET_HOSTNAME
        ],
        in_cluster=True,
        get_logs=True,
        is_delete_operator_pod=True
    )
