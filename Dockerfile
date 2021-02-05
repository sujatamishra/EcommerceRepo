FROM python:3

ENV PYTHONUNBUFFERED 1

WORKDIR /app

ADD . /app

COPY ./wait-for-mysql.sh /app/wait-for-mysql.sh

COPY ./wait-for-mysql.py /app/wait-for-mysql.py

COPY ./requirements.txt /app/requirements.txt

RUN pip3 install -r requirements.txt

COPY . /app

