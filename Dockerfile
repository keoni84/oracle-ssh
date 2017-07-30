# -----------------------------------------------------------------------------
# Base oracle linux container with ssh
# -----------------------------------------------------------------------------
FROM oraclelinux:7-slim
MAINTAINER john.headley@hpe.com

ENV http_proxy http://proxy.houston.hpecorp.net:8080
ENV https_proxy http://proxy.houston.hpecorp.net:8080

RUN yum update && \
yum install -y openssh-server && \
ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key && \
ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key

RUN mkdir /var/run/sshd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
