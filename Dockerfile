FROM davigotxi/docker-centos-supervisor

RUN yum install -y openssh-server
ADD sshd.conf /etc/supervisor/conf.d/sshd.conf

RUN mkdir -p /var/run/sshd

RUN echo "root:Password1" | chpasswd

EXPOSE 22

