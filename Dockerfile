#
# Vault Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >

ENV VAULT_VERSION 1.15.2

# Update & install needed packages
RUN apt-get update && \
    apt-get install -y wget unzip

#Download the signing key to a new keyring
RUN cd /tmp && \
    wget https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip && \
    unzip vault_${VAULT_VERSION}_linux_amd64.zip && \
    mv vault /usr/local/bin/

CMD ["vault", "server", "-dev", "-dev-listen-address=0.0.0.0:8200"]
