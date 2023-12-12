FROM python:alpine

WORKDIR /ansible/playbooks

# add openssh && install ansible
RUN apk add --update --no-cache openssh \
    && python3 -m pip install --user ansible

# add ansible bin to path
ENV PATH="$PATH:/root/.local/bin/"
