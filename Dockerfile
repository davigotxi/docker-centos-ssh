FROM davigotxi/docker-centos-supervisor

RUN yum install -y openssh-server
ADD sshd.conf /etc/supervisor/conf.d/sshd.conf

RUN mkdir -p /var/run/sshd

RUN sed -ri 's/#PermitRootLogin yes/PermitRootLogin yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config
RUN echo "root:Password1" | chpasswd

EXPOSE 22

