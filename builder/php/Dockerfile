# zcloud-php-builder
FROM php:apache-stretch

# Maintainer 
LABEL maintainer="Gao <gaoshiming@zdns.cn>"

# TODO: Rename the builder environment variable to inform users about application you provide them
# ENV BUILDER_VERSION 1.0

LABEL io.k8s.description="Platform for building php" \
      io.k8s.display-name="builder zcloud php" \
      io.openshift.expose-services="80:http" \
      io.openshift.tags="builder,zcloud,php"

# Install required packages here:
#RUN apk install php

# TODO (optional): Copy the builder files into /opt/app-root
# COPY ./<builder_folder>/ /opt/app-root/

# Sets io.openshift.s2i.scripts-url label that way, or update that label
LABEL io.openshift.s2i.scripts-url="image:///usr/libexec/s2i"
# Copy the S2I scripts to /usr/libexec/s2i
COPY ./s2i/bin/ /usr/libexec/s2i

# Drop the root user and make the content of /opt/app-root owned by user 1001
#RUN chown -R 1001:1001 /opt/app-root

# This default user 
#USER 1000

# TODO: Set the default port for applications built using this image
EXPOSE 80

# Set the default CMD for the image
CMD ["/usr/libexec/s2i/usage"]
