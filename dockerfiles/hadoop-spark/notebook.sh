#!/bin/bash

export "PYTHONPATH=${PYTHONPATH}:/root/site-packages"

if [ -d "./site-packages" ] 
then
    echo "Directory ./site-packages exists." 
else
    echo "Directory ./site-packages DOES NOT exists." 
    python -m pip install --upgrade pip
    python -m pip install -t ./site-packages notebook pyspark
fi

python -m notebook /notebook --ip=namenode --allow-root
