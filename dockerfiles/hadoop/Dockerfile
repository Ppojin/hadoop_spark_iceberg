FROM adoptopenjdk/openjdk8:slim

RUN apt-get update
RUN apt-get install -y wget ssh

ARG HADOOP_VERSION=3.3.5
ARG HADOOP_FILE_NAME=hadoop-${HADOOP_VERSION}
## arm
ARG HADOOP_ZIP_FILE_NAME=${HADOOP_FILE_NAME}-aarch64
## x86
# ARG HADOOP_ZIP_FILE_NAME=${HADOOP_FILE_NAME}.tar.gz

# ARG HADOOP_DOWNLOAD_URL=https://dlcdn.apache.org/hadoop/common/hadoop-${HADOOP_VERSION}/${HADOOP_ZIP_FILE_NAME}

ENV HADOOP_HOME=/opt/hadoop
ENV HADOOP_CONF_DIR=/etc/hadoop
ENV YARN_CONF_DIR=/etc/hadoop

WORKDIR /root/.ssh
RUN ssh-keygen -q -t rsa -N '' -f ./id_rsa
RUN cat ./id_rsa.pub >> ./authorized_keys
RUN chmod 0600 ./authorized_keys
RUN ls


# hadoop setting
WORKDIR /opt
ADD hadoop-3.3.5-aarch64.tar.gz     .
# RUN wget            ${HADOOP_DOWNLOAD_URL}
# RUN tar -xvzf       ${HADOOP_ZIP_FILE_NAME}
# RUN rm -f           ${HADOOP_ZIP_FILE_NAME}
RUN ln -s           /opt/${HADOOP_FILE_NAME}        /opt/hadoop
RUN ln -s           ${HADOOP_HOME}/etc/hadoop       /etc/hadoop

WORKDIR /root
RUN rm -rf          ${HADOOP_HOME}/share/doc
RUN mkdir           ${HADOOP_HOME}/dfs
RUN mkdir -p        ${HADOOP_HOME}/yarn/timeline

ADD core-site.xml   ${HADOOP_CONF_DIR}/core-site.xml
ADD hdfs-site.xml   ${HADOOP_CONF_DIR}/hdfs-site.xml
ADD mapred-site.xml ${HADOOP_CONF_DIR}/mapred-site.xml
ADD yarn-site.xml   ${HADOOP_CONF_DIR}/yarn-site.xml
ADD hadoop-env.sh   ${HADOOP_CONF_DIR}/hadoop_env.sh

ENV PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin

run hdfs namenode -format

ENV YARN_RESOURCEMANAGER_USER=root
ENV YARN_NODEMANAGER_USER=root
# RUN echo "export JAVA_HOME=$JAVA_HOME" >> ${HADOOP_CONF_DIR}/hadoop-env.sh

RUN mkdir -p $HADOOP_HOME/dfs/data
RUN mkdir -p $HADOOP_HOME/yarn/data

ENV NAMENODE_VERSION=/opt/hadoop/dfs/name/current/VERSION

ADD start.sh .
RUN chmod a+x ./start.sh
CMD ["/bin/bash", "-c", "./start.sh"]
