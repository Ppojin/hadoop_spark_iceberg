#!/bin/bash

docker exec -it namenode python3 -m pip install notebook pyspark

docker exec -it namenode mkdir /notebook

docker exec -it namenode python3 -m notebook /notebook --ip=namenode --allow-root
