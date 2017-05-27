FROM fedora:25
MAINTAINER Michael Batz <mail@michael-batz.de>

# locale settings
ARG build_locale=de_DE
ARG build_timezone=Europe/Berlin

# set locales
ENV LANG ${build_locale}.utf8

# setup
RUN dnf -y group install xfce-desktop \
    && dnf -y install \
        # enlightenment
        # enlightenment terminology \
        # locales
        glibc-locale-source langpacks-de.noarch langpacks-en.noarch \
        # xrdp and required tools
        xrdp.x86_64 passwd \
        # tools for usage
        openssh-clients.x86_64 telnet.x86_64 \
        firefox.x86_64 chromium.x86_64 \
    # setup locales
    && localedef -c -i ${build_locale} -f UTF-8 ${build_locale}.utf-8 \
    && rm /etc/localtime \
    && ln -s /usr/share/zoneinfo/${build_timezone} /etc/localtime \
    # create directory for dbus
    && mkdir -p /run/dbus \
    # cleanup for a smaller image
    && dnf -y clean all

# copy start script
COPY scripts/* /opt/container/

# execute run.sh
CMD ["/opt/container/run.sh"]
