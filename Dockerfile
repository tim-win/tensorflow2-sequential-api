FROM nvidia/cuda:10.0-cudnn7-runtime-centos7

CMD ["supervisord", "-c", "/opt/workspace/etc/supervisord.conf"]

RUN mkdir -p /opt/workspace /opt/data
WORKDIR /opt/workspace


RUN yum install -y epel-release gcc
RUN yum install -y python36-devel python36-pip nginx redis
RUN pip3.6 install --upgrade pip

RUN pip3 install 'tensorflow-gpu==2.0.0rc1'

COPY ./requirements.txt /opt/requirements.txt
RUN pip3 install -r /opt/requirements.txt

COPY ./ /opt/workspace/

