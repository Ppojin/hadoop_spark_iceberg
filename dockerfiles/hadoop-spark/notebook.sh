#!/bin/bash

export "PYTHONPATH=${PYTHONPATH}:/root/site-packages"

python -m pip install --upgrade pip
python -m pip install -t ./site-packages notebook pyspark

python -m notebook /notebook --ip=namenode --allow-root
