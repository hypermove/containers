#!/bin/bash
#installs ntpd + kubernetes + docker
#requires an ip address mapping
#Tested on Centos-7
#run it as root or with sudo.

export LC_ALL=en_US.UTF-8
yum update -y
yum install -y ntp
systemctl enable ntpd
systemctl start ntpd
systemctl status ntpd

#you need to provide ip addressing mapping in ipmapping.txt file.
cat ipmapping.txt >> /etc/hosts
cat /etc/hosts #verify
echo "[virt7-docker-common-release]" >> /etc/yum.repos.d/virt7-docker-common-release.repo
echo "name=virt7-docker-common-release" >> /etc/yum.repos.d/virt7-docker-common-release.repo
echo "baseurl=http://cbs.centos.org/repos/virt7-docker-common-release/x86_64/os/" >> /etc/yum.repos.d/virt7-docker-common-release.repo
echo "gpgcheck=0" >> /etc/yum.repos.d/virt7-docker-common-release.repo
yum update -y
yum install -y --enablerepo=virt7-docker-common-release kubernetes docker
