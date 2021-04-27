# Pull base image.
FROM ubuntu:latest

RUN \
# Update
apt-get update -y && \
# Install python-dev
apt-get install -y gcc python-dev libkrb5-dev && \
# need python3-pip
apt-get install -y python3-pip  && \
# need upgrade pip
pip3 install --upgrade pip  && \
# virtualenv
pip3 install --upgrade virtualenv && \
# ansible
pip3 install ansible


################################
# copy .ssh file to .ssh file in docker image
################################
RUN useradd -m user
ARG USER_HOME
COPY ansible_ssh_config_file/id_rsa.pub  /home/user/.ssh/id_rsa.pub
COPY ../secrets/id_rsa  /home/user/.ssh/id_rsa
COPY ansible_ssh_config_file/config  /home/user/.ssh/config
RUN cat /home/user/.ssh/config
RUN cat /home/user/.ssh/id_rsa.pub
RUN cat /home/user/.ssh/id_rsa



################################
# copy ansible file to docker
################################

COPY ansible /home/ansible
WORKDIR /home/ansible/playbooks
RUN ansible-playbook -i ../inventories/mednourconsulting_gcp/hosts deploy_siteweb_static.yml
RUN ls



