#! /bin/bash
##########################################################################
#                                                                        #
# Docker Desktop Environment                                             #
# run.sh                                                                 #
#                                                                        #
# Michael Batz <mail@michael-batz.de>                                    #
#                                                                        #
##########################################################################

# init environment variables
if [ -z ${ROOT_PASSWORD+x} ]; then ROOT_PASSWORD=root; fi
if [ -z ${USER_USERNAME+x} ]; then USER_USERNAME=desktop; fi
if [ -z ${USER_PASSWORD+x} ]; then USER_PASSWORD=desktop; fi

# create user
adduser ${USER_USERNAME}

# set passwords
echo "root:${ROOT_PASSWORD}" | chpasswd
echo "${USER_USERNAME}:${USER_PASSWORD}" | chpasswd

# temp workaroun for startup
echo "startxfce4" > /root/.Xclients && chmod +x /root/.Xclients
echo "startxfce4" > /home/desktop/.Xclients && chmod +x /home/desktop/.Xclients

# start systemwide D-BUS
/usr/bin/dbus-daemon --system --fork

# start xrdp
/usr/sbin/xrdp-sesman
/usr/sbin/xrdp -n
