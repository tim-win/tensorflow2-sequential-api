FROM nvidia/cuda:10.0-cudnn7-runtime-centos7

CMD ["python3", "/opt/workspace/main.py"]

RUN mkdir -p /opt/workspace /opt/data


WORKDIR /opt/workspace

RUN yum install -y epel-release
RUN yum install -y python36-devel python36-pip
RUN pip3 install tensorflow-gpu==2.0.0-rc1


RUN yum install -y gcc
COPY ./requirements.txt /opt/requirements.txt
RUN pip3 install -r /opt/requirements.txt

COPY ./ /opt/workspace/

