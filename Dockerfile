FROM debian:wheezy
MAINTAINER Zain ul Abideen <zain@qubit.com>

# Install OpenSSH
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install openssh-server && \
    rm -rf /var/lib/apt/lists/*

# sshd needs this directory to run
RUN mkdir -p /var/run/sshd

# Copy configuration and entrypoint script
COPY sshd_config /etc/ssh/sshd_config
COPY entrypoint /

COPY PUBLIC_KEY.pub /home/USER_NAME/.ssh/keys/PUBLIC_KEY.pub

EXPOSE 22

ENTRYPOINT ["/entrypoint"]
