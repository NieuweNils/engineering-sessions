# Use the official Python image from the Docker Hub
FROM python:3.8.12-slim

# install some usefull binaries (including the postgres binaries needed for psycopg to work on M1 chip architecture)
RUN apt update  \
    && apt upgrade -y \
    && apt install less -y \
    && apt install vim -y \
    && apt install iputils-ping -y \
    && apt install net-tools -y \
    && apt install dnsutils -y \
    && apt install curl -y \
    && apt install wget -y \
    && apt-get -y install libpq-dev gcc \
    && apt autoremove

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container at /app
COPY ./app/requirements.txt .

# Install the dependencies
RUN pip install -r requirements.txt

# Copy the rest of the application code into the container at /app
COPY ./app/backend.py .

# Expose the port that Flask runs on
EXPOSE 5000

# Command to run the Flask application
CMD ["python", "backend.py"]
