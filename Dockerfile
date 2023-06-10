FROM kuzma343/ansible:latest

RUN apt-get update && apt-get install -y software-properties-common
RUN apt-add-repository -y ppa:ansible/ansible
RUN apt-get update && apt-get install -y ansible

RUN echo "[ubuntu_hosts]
192.168.0.160 ansible_user=kuzma ansible_password=qwerty
" >> /etc/ansible/hosts


CMD ["/bin/bash"]
