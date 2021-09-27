FROM proxysql/proxysql:2.3.1_arm64

# Add a mysql client for the script use in the liveness/readiness probes
RUN apt update && apt -y install default-mysql-client gettext-base && apt clean all

# Create non-root user in the root group to be able to run with any user id
RUN useradd -rm -s /bin/bash -g root -u 1000 k8s-proxysql

# give write access to the group and give ownership to k8s-proxysql:root
RUN chmod 775 /var/lib/proxysql && chown -R 1000:0 /var/lib/proxysql

USER 1000

ENTRYPOINT ["proxysql", "-f", "-D", "/var/lib/proxysql"]

