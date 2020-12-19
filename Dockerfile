FROM python:3.7
USER root

COPY . /code
WORKDIR /code

RUN apt-get update
RUN apt-get install -y gosu

RUN pip install --upgrade pip
RUN pip3 install -r requirements.txt
RUN apt-get install -y python3-openpyxl
ENV PYTHONPATH /usr/local/lib/python3.7/site-packages

ARG UID
ARG GID
ENV UID ${UID}
ENV GID ${GID}

COPY ./setVolumePermission.sh /usr/local/bin/setVolumePermission.sh
RUN chmod +x /usr/local/bin/setVolumePermission.sh

ENTRYPOINT ["/usr/local/bin/setVolumePermission.sh"]
