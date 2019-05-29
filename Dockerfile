FROM quay.io/coreos/etcd:v3.2.26
COPY ./startup.sh /
RUN chmod +x /startup.sh
ENTRYPOINT ["/startup.sh"]
