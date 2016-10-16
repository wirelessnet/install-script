#!/bin/bash
##########################################################
# System: ubuntu 16.04, i386.							 #
# MUST ensurce the Internet connection.                  #
# Put the file into your home directory.                 #
##########################################################
mkdir WNT
cd WNT
echo "Installing Contiki..."
sudo apt-get update
sudo apt-get install build-essential binutils-msp430 gcc-msp430 msp430-libc msp430mcu mspdebug binutils-avr gcc-avr gdb-avr avr-libc avrdude openjdk-8-jdk openjdk-8-jre ant libncurses5-dev git
git clone https://github.com/wirelessnet/wnt-contiki.git
# Test the example manually: http://anrg.usc.edu/contiki/index.php/Hello_World
echo "Finish the installation of contiki!"
echo "Installing NS2..."
sudo apt-get install libx11-dev libxmu-dev libxmu-headers libxt-dev libtool g++ patch tcl tk tcl-dev tk-dev gnuplot
git clone https://github.com/wirelessnet/wnt-ns2.git
cd wnt-ns2
./install
cd ..
echo "The NS2 has been installed. If you want to configure '.bashrc' file automatically, press any key. Otherwise, press 'Ctrl+D'"
read ch
pathto=$(pwd)
echo "export PATH=\$PATH:$pathto/wnt-ns2/bin:$pathto/wnt-ns2/tcl8.5.10/unix:$pathto/wnt-ns2/tk8.5.10/unix" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:$pathto/wnt-ns2/otcl-1.14:$pathto/wnt-ns2/lib" >> ~/.bashrc
echo "export LD_LIBRARY=\$LD_LIBRARY:$pathto/wnt-ns2/tcl8.5.10/library" >> ~/.bashrc
echo "echo \"==================Welcome to use NS2 for WNT!=====================\"" >> ~/.bashrc
echo "echo \"If you have any questions, please contact wireless_net@163.com\"" >> ~/.bashrc
echo "The '.bashrc' file is configured!"
