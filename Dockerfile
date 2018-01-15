FROM ubuntu:xenial

RUN apt-get update && \ 
	apt-get install -y software-properties-common && \
        apt-add-repository ppa:ansible/ansible && \
        apt-get update && \
	apt-get install -y ansible && \
	mkdir /playbooks

WORKDIR /playbooks

CMD ["tail", "-f", "/dev/null"]	
