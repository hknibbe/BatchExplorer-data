#!/bin/bash
echo '# Running apt-get update ...'
apt-get update
echo '# Installing imagemagick ...'
apt-get install -y imagemagick
echo '# Installing blender ...'
apt-get install -y blender
echo '# Installing python-pip ...'
apt-get install -y python-pip
echo '# Installing azure-batch ...'
pip install azure-batch==4.1.3
echo '# Installing packages-microsoft-prod.deb ...'
wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
echo '# Installing apt-transport-https ...'
sudo apt-get -y install apt-transport-https
echo '# Running apt-get update ...'
sudo apt-get update
echo '# Installing install dotnet-sdk-2.1 ...'
sudo apt-get -y install dotnet-sdk-2.1
wget -O azcopy.tar.gz https://aka.ms/downloadazcopyprlinux
tar -xf azcopy.tar.gz
./install.sh
# Added to install Blender from website
wget https://download.blender.org/release/Blender2.79/blender-2.79b-linux-glibc219-x86_64.tar.bz2
mkdir /tmp/blender
tar -vxf blender-2.79b-linux-glibc219-x86_64.tar.bz2 -C /tmp/
sudo mv /usr/bin/blender /usr/bin/blender.old
sudo ln -sf /tmp/blender-2.79b-linux-glibc219-x86_64/blender /usr/bin/blender
# End of blender
echo "## DONE ##"
exit $?

