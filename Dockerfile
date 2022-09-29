#
# Set base image
#
ARG BASE_IMAGE=nvcr.io/nvidia/deepstream:6.1.1-triton
FROM ${BASE_IMAGE}

RUN apt update -y
RUN apt-get install -y libjson-glib-dev libgstrtspserver-1.0-dev

WORKDIR /home