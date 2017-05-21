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
echo "${ROOT_PASSWORD}" | passwd root --stdin
echo "${USER_PASSWORD}" | passwd ${USER_USERNAME} --stdin

# start xrdp
/usr/sbin/xrdp-sesman
/usr/sbin/xrdp -n
