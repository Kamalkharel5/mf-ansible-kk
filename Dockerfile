FROM python:3.11-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends openssh-client curl \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir ansible ansible-lint

ENV ANSIBLE_COLLECTIONS_PATHS=/usr/share/ansible/collections

RUN ansible-galaxy collection install ibm.ibm_zos_core:1.8.0 -p /usr/share/ansible/collections
