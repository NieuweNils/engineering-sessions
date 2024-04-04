FROM python:3.11-slim

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY main.py main.py
COPY util.py util.py

ENTRYPOINT ["python"]

CMD ["main.py"]
