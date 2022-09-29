#
# Set base image
#
ARG BASE_IMAGE
FROM ${BASE_IMAGE}

RUN apt update -y
RUN apt-get install -y libjson-glib-dev libgstrtspserver-1.0-dev

WORKDIR /home