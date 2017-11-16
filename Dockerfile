FROM centos:7
MAINTAINER Satoshi Nagayasu <snaga@uptime.jp>

#ADD oracle-instantclient12.2-basic-12.2.0.1.0-1.x86_64.rpm /tmp
#ADD oracle-instantclient12.2-devel-12.2.0.1.0-1.x86_64.rpm /tmp

ENV ORACLE_HOME=/usr/lib/oracle/12.2/client64
ENV LD_LIBRARY_PATH=$ORACLE_HOME/lib
ENV LANG=C

# pip
RUN yum install -y gcc python-devel
RUN curl -o get-pip.py https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py; rm get-pip.py

# Oracle support
RUN yum install -y libaio unzip
RUN rpm -ivh https://s3-ap-northeast-1.amazonaws.com/uptime-dev01/oracle/oracle-instantclient12.2-basic-12.2.0.1.0-1.x86_64.rpm
RUN rpm -ivh https://s3-ap-northeast-1.amazonaws.com/uptime-dev01/oracle/oracle-instantclient12.2-devel-12.2.0.1.0-1.x86_64.rpm
#RUN rpm -ivh /tmp/oracle-instantclient12.2-basic-12.2.0.1.0-1.x86_64.rpm
#RUN rpm -ivh /tmp/oracle-instantclient12.2-devel-12.2.0.1.0-1.x86_64.rpm

# PostgreSQL support
RUN rpm -ivh https://download.postgresql.org/pub/repos/yum/10/redhat/rhel-7-x86_64/pgdg-centos10-10-2.noarch.rpm
RUN yum install -y postgresql10-devel

# MySQL support
RUN rpm -ivh https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
RUN yum install -y mysql-community-devel

# Hecatoncheir
RUN curl -O https://codeload.github.com/snaga/Hecatoncheir/zip/develop; unzip develop
RUN cd Hecatoncheir-develop; pip install -r requirements.txt; pip install .
