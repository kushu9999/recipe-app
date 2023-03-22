# base image
FROM python:3.9-alpine3.13

LABEL maintainer="Kusha Dulani"

ENV PYTHONUNBUFFERED 1

WORKDIR /app

COPY ./requirements.txt requirements.txt
COPY ./requirements.dev.txt requirements.dev.txt

EXPOSE 8000

ARG DEV=false
RUN pip install --upgrade pip && \
    pip install -r requirements.txt && \
    if [ $DEV = "true" ]; then \
        pip install -r requirements.dev.txt ; \
    fi 

RUN adduser --disabled-password --gecos '' kushal

COPY . .

USER kushal


