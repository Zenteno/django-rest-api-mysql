FROM python:3.9-slim-buster

RUN mkdir /code
RUN apt update &&  apt install default-libmysqlclient-dev build-essential -y
WORKDIR /code
COPY requirements.txt /code/
RUN pip install --upgrade pip && pip install -r requirements.txt
COPY . /code/
EXPOSE 8080
CMD python manage.py migrate && python manage.py runserver 0.0.0.0:8080