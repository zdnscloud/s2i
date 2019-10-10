# zdnscloud/s2i-nodejs-builder
FROM node:alpine

# Maintainer 
LABEL maintainer="Gao <gaoshiming@zdns.cn>"

# TODO: Rename the builder environment variable to inform users about application you provide them
# ENV BUILDER_VERSION 1.0

LABEL io.k8s.description="Platform for building nodejs" \
      io.k8s.display-name="builder zcloud nodejs" \
      io.expose-services="80:http" \
      io.tags="builder,zcloud,nodejs"

# Install required packages here:
RUN apk add --no-cache bash && npm install -g npm

RUN mkdir -p /opt/app-root
WORKDIR /opt/app-root

# TODO (optional): Copy the builder files into /opt/app-root
# COPY ./<builder_folder>/ /opt/app-root/

# Copy the S2I scripts to /usr/libexec/s2i
COPY ./s2i/bin/ /usr/libexec/s2i
LABEL io.openshift.s2i.scripts-url="image:///usr/libexec/s2i"

# This default user is created in the openshift/base-centos7 image
USER root

# TODO: Set the default port for applications built using this image
# EXPOSE 8080

# TODO: Set the default CMD for the image
CMD ["/usr/libexec/s2i/usage"]
