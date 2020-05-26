FROM centos/systemd

RUN yum -y install httpd; yum clean all; systemctl enable httpd.service
#RUN apt-get update

RUN yum install openssh-server -y

RUN mkdir /root/.ssh

ADD authorized_keys /root/.ssh

RUN chmod 600 /root/.ssh/authorized_keys

RUN chmod 700 /root/.ssh


EXPOSE 80

CMD ["/usr/sbin/init"]



