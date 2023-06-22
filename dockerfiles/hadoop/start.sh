#!/bin/bash

if test -f "$NAMENODE_VERSION"; then
    echo "$NAMENODE_VERSION exists."
else
    echo "$NAMENODE_VERSION dosen't exists."
    echo 'Y' | hdfs namenode -format
fi

hdfs --config $HADOOP_CONF_DIR namenode