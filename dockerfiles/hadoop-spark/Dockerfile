FROM hadoop

# RUN yum install -y wget openssl-devel bzip2-devel libffi-devel
# RUN yum groupinstall -y "Development Tools"

RUN apt-get install -y build-essential zlib1g-dev libffi-dev

ARG PYTHON_VERSION_MIJOR=3
ARG PYTHON_VERSION_MINOR=$PYTHON_VERSION_MIJOR.10
ARG PYTHON_VERSION=$PYTHON_VERSION_MINOR.12
ARG PYTHON_URL=https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz

ARG SPARK_VERSION_MIJOR=3
ARG SPARK_VERSION_MINOR=$SPARK_VERSION_MIJOR.4
ARG SPARK_VERSION=$SPARK_VERSION_MINOR.0
ARG SPARK_FILE_NAME=spark-$SPARK_VERSION-bin-hadoop$SPARK_VERSION_MIJOR
ARG SAPRK_URL=https://dlcdn.apache.org/spark/spark-${SPARK_VERSION}/${SPARK_FILE_NAME}.tgz

# install python
WORKDIR /opt
ADD Python-3.10.12.tgz  .
# RUN wget      $PYTHON_URL
# RUN tar -xvzf Python-${PYTHON_VERSION}.tgz
# RUN rm -f     Python-${PYTHON_VERSION}.tgz
RUN ./Python-${PYTHON_VERSION}/configure --enable-optimizations
RUN make altinstall
RUN ln -sf /usr/local/bin/python${PYTHON_VERSION_MINOR} /usr/bin/python3
RUN ln -sf /usr/local/bin/python${PYTHON_VERSION_MINOR} /usr/bin/python

RUN rm -rf ./Python-${PYTHON_VERSION}/configure

# install spark
WORKDIR /opt
ADD spark-3.4.0-bin-hadoop3.tgz .
# RUN wget $SAPRK_URL
# RUN tar -xvzf $SPARK_FILE_NAME.tgz 
# RUN rm -f $SPARK_FILE_NAME.tgz
RUN ln -s /opt/$SPARK_FILE_NAME /opt/spark

WORKDIR /root
ENV SPARK_HOME=/opt/spark
ENV PATH=$PATH:$SPARK_HOME/bin

# spark history log directory
RUN mkdir $SPARK_HOME/eventLog

# copy spark config file
ADD spark-defaults.conf $SPARK_HOME/conf

# iceberg
ADD iceberg-spark-runtime-3.4_2.12-1.3.0.jar $SPARK_HOME/jars/iceberg-spark-runtime-3.4_2.12-1.3.0.jar