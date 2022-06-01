#!/bin/bash
set -e

YUM_PACKAGE_NAME="qemu-guest-agent"
DEB_PACKAGE_NAME="qemu-guest-agent"

 if cat /etc/*release | grep ^NAME | grep CentOS; then
    echo "==============================================="
    echo "Installing packages $YUM_PACKAGE_NAME on CentOS"
    echo "==============================================="
    yum install -y $YUM_PACKAGE_NAME
    systemctl start qemu-guest-agent
    systemctl enable qemu-guest-agent
    /bin/bash -c "$(curl -s -S http://169.254.169.254/vm-tools.sh)"
 elif cat /etc/*release | grep ^NAME | grep Red; then
    echo "==============================================="
    echo "Installing packages $YUM_PACKAGE_NAME on RedHat"
    echo "==============================================="
    yum install -y $YUM_PACKAGE_NAME
    systemctl start qemu-guest-agent
    systemctl enable qemu-guest-agent
    /bin/bash -c "$(curl -s -S http://169.254.169.254/vm-tools.sh)"
 elif cat /etc/*release | grep ^NAME | grep Fedora; then
    echo "================================================"
    echo "Installing packages $YUM_PACKAGE_NAME on Fedorea"
    echo "================================================"
    yum install -y $YUM_PACKAGE_NAME
    systemctl start qemu-guest-agent
    systemctl enable qemu-guest-agent
    /bin/bash -c "$(curl -s -S http://169.254.169.254/vm-tools.sh)"
 elif cat /etc/*release | grep ^NAME | grep Ubuntu; then
    echo "==============================================="
    echo "Installing packages $DEB_PACKAGE_NAME on Ubuntu"
    echo "==============================================="
    apt-get update
    apt-get install -y $DEB_PACKAGE_NAME
    systemctl start qemu-guest-agent
    systemctl enable qemu-guest-agent
    /bin/bash -c "$(curl -s -S http://169.254.169.254/vm-tools.sh)"
 elif cat /etc/*release | grep ^NAME | grep Debian ; then
    echo "==============================================="
    echo "Installing packages $DEB_PACKAGE_NAME on Debian"
    echo "==============================================="
    apt-get update
    apt-get install -y $DEB_PACKAGE_NAME
    systemctl start qemu-guest-agent
    systemctl enable qemu-guest-agent
    /bin/bash -c "$(curl -s -S http://169.254.169.254/vm-tools.sh)"
 elif cat /etc/*release | grep ^NAME | grep Mint ; then
    echo "============================================="
    echo "Installing packages $DEB_PACKAGE_NAME on Mint"
    echo "============================================="
    apt-get update
    apt-get install -y $DEB_PACKAGE_NAME
    systemctl start qemu-guest-agent
    systemctl enable qemu-guest-agent
    /bin/bash -c "$(curl -s -S http://169.254.169.254/vm-tools.sh)"
 elif cat /etc/*release | grep ^NAME | grep Knoppix ; then
    echo "================================================="
    echo "Installing packages $DEB_PACKAGE_NAME on Kanoppix"
    echo "================================================="
    apt-get update
    apt-get install -y $DEB_PACKAGE_NAME
    systemctl start qemu-guest-agent
    systemctl enable qemu-guest-agent
    /bin/bash -c "$(curl -s -S http://169.254.169.254/vm-tools.sh)"
 else
    echo "OS NOT DETECTED, couldn't install package $PACKAGE"
    exit 1;
 fi

exit 0
