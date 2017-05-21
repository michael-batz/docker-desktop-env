FROM fedora:25
MAINTAINER Michael Batz <mail@michael-batz.de>

# install KDE, xrdp and further tools
RUN dnf -y install plasma-workspace.x86_64 xrdp.x86_64 passwd \
    openssh-clients.x86_64 telnet.x86_64 firefox.x86_64 \
    # cleanup for a smaller image
    && dnf -y clean all

# copy start script
COPY scripts/* /opt/container/

# execute run.sh
CMD ["/opt/container/run.sh"]
