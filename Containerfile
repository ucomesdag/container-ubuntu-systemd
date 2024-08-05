FROM ubuntu:bionic

ARG BUILD_DATE

LABEL summary="Ubuntu Systemd Container Image."
LABEL maintainer="Uco Mesdag <uco@mesd.ag>"
LABEL build-date=${BUILD_DATE}

ENV container=podman

# Enable apt repositories.
RUN sed -i 's/# deb/deb/g' /etc/apt/sources.list

# Enable systemd and install required packages.
RUN apt-get update && apt-get install -y systemd systemd-sysv sudo && apt-get clean && \
    (cd /lib/systemd/system/sysinit.target.wants/ ; for i in * ; do [ $i = systemd-tmpfiles-setup.service ] || rm -f $i ; done) ; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ; \
    rm -f /lib/systemd/system/multi-user.target.wants/* ; \
    rm -f /etc/systemd/system/*.wants/* ; \
    rm -f /lib/systemd/system/local-fs.target.wants/* ; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev* ; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl* ; \
    rm -f /lib/systemd/system/basic.target.wants/* ; \
    rm -f /lib/systemd/system/anaconda.target.wants/* ; \
    rm -f /lib/systemd/system/plymouth* ; \
    rm -f /lib/systemd/system/systemd-update-utmp*

VOLUME ["/sys/fs/cgroup"]
CMD ["/lib/systemd/systemd"]
