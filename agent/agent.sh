#!/bin/bash
set -e

YUM_PACKAGE_NAME="qemu-guest-agent tar"
DEB_PACKAGE_NAME="qemu-guest-agent tar"
DISTRO=$(cat /etc/*-release | grep -w PRETTY_NAME | cut -d= -f2 | tr -d '"')

 if cat /etc/*release | grep ^NAME | grep CentOS; then
    echo "======================================================================="
    echo "Installing packages $YUM_PACKAGE_NAME on $DISTRO"
    echo "======================================================================="
    yum install -y $YUM_PACKAGE_NAME
    systemctl start qemu-guest-agent
    systemctl enable qemu-guest-agent
    /bin/bash -c "$(curl -s -S http://169.254.169.254/vm-tools.sh)"
 elif cat /etc/*release | grep ^NAME | grep Red; then
    echo "======================================================================="
    echo "Installing packages $YUM_PACKAGE_NAME on $DISTRO"
    echo "======================================================================="
    yum install -y $YUM_PACKAGE_NAME
    systemctl start qemu-guest-agent
    systemctl enable qemu-guest-agent
    /bin/bash -c "$(curl -s -S http://169.254.169.254/vm-tools.sh)"
 elif cat /etc/*release | grep ^NAME | grep Fedora; then
    echo "======================================================================="
    echo "Installing packages $YUM_PACKAGE_NAME on $DISTRO"
    echo "======================================================================="
    yum install -y $YUM_PACKAGE_NAME
    systemctl start qemu-guest-agent
    systemctl enable qemu-guest-agent
    /bin/bash -c "$(curl -s -S http://169.254.169.254/vm-tools.sh)"
 elif cat /etc/*release | grep ^NAME | grep Ubuntu; then
    echo "======================================================================="
    echo "Installing packages $DEB_PACKAGE_NAME on $DISTRO"
    echo "======================================================================="
    apt-get update
    apt-get install -y $DEB_PACKAGE_NAME
    systemctl start qemu-guest-agent
    systemctl enable qemu-guest-agent
    /bin/bash -c "$(curl -s -S http://169.254.169.254/vm-tools.sh)"
 elif cat /etc/*release | grep ^NAME | grep Debian ; then
    echo "======================================================================="
    echo "Installing packages $DEB_PACKAGE_NAME on $DISTRO"
    echo "======================================================================="
    apt-get update
    apt-get install -y $DEB_PACKAGE_NAME
    systemctl start qemu-guest-agent
    systemctl enable qemu-guest-agent
    /bin/bash -c "$(curl -s -S http://169.254.169.254/vm-tools.sh)"
 elif cat /etc/*release | grep ^NAME | grep Mint ; then
    echo "======================================================================="
    echo "Installing packages $DEB_PACKAGE_NAME on $DISTRO"
    echo "======================================================================="
    apt-get update
    apt-get install -y $DEB_PACKAGE_NAME
    systemctl start qemu-guest-agent
    systemctl enable qemu-guest-agent
    /bin/bash -c "$(curl -s -S http://169.254.169.254/vm-tools.sh)"
 elif cat /etc/*release | grep ^NAME | grep Knoppix ; then
    echo "======================================================================="
    echo "Installing packages $DEB_PACKAGE_NAME on $DISTRO"
    echo "======================================================================="
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
