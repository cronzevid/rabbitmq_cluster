FROM centos:7

RUN yum install -y https://github.com/rabbitmq/erlang-rpm/releases/download/v22.3.4.11/erlang-22.3.4.11-1.el7.x86_64.rpm \
                   https://github.com/rabbitmq/rabbitmq-server/releases/download/v3.8.9/rabbitmq-server-3.8.9-1.el7.noarch.rpm \
                   net-tools vim tmux nmap-ncat

COPY rabbitmq.conf /etc/rabbitmq/rabbitmq.conf
COPY ca_certificate.pem /etc/rabbitmq/ca_certificate.pem
COPY server_certificate.pem /etc/rabbitmq/server_certificate.pem
COPY server_key.pem /etc/rabbitmq/server_key.pem
COPY cookie /var/lib/rabbitmq/.erlang.cookie

RUN chmod 600 /var/lib/rabbitmq/.erlang.cookie && \
    chown rabbitmq:rabbitmq /var/lib/rabbitmq/.erlang.cookie

CMD ["/usr/sbin/rabbitmq-server"]
