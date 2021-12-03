# syntax=docker/dockerfile:1

FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /app

COPY . .

RUN apt-get update
RUN apt-get install -y python3
RUN apt-get install -y python3-pip
RUN apt-get install -y cmake
RUN pip3 install -r requirements.txt

RUN mkdir build
WORKDIR /app/build
RUN cmake ../ && make

RUN adduser --disabled-password --gecos '' techproguser

WORKDIR /app

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
