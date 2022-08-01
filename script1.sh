#!/bin/bash

install_brew(){
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    }

install_tunnelblick(){
    brew install --cask tunnelblick
    }

install_git(){
    brew install git
    }

install_IDEA(){
    brew install --cask intellij-idea-ce 
    }

install_robo_3t(){
    brew install --cask robo-3t
    }    

install_maven(){
    brew install maven
    }

install_nessus(){
    brew install --cask tenable-nessus-agent
    }   

install_nvm_node(){
    brew install nvm
    }

install_activemq(){
    mkdir -p $install
    cd $install
    cd $git_dir
    pwd
    curl -O https://archive.apache.org/dist/activemq/5.16.2/apache-activemq-5.16.2-bin.tar.gz
    tar xvzf apache-activemq-5.16.2-bin.tar.gz
    mv apache-activemq-5.16.2 $emq_dir
    rm -r $install
    }

install_amazonJDK(){
    mkdir -p $install
    cd $install
    pwd
    curl -O https://corretto.aws/downloads/latest/amazon-corretto-15-x64-macos-jdk.pkg
    sudo installer -pkg amazon-corretto-15-x64-macos-jdk.pkg -target LocalSystem
    rm -r $install
    }


git_dir=~/src/cloudally/zion
emq_dir=~/src
install=~/installlll

param_if=$@
if [ -z "$param_if" ] ; then
    install_brew || exit 1
    install_tunnelblick || exit 1
    install_git || exit 1
    install_IDEA || exit 1
    install_robo_3t || exit 1
    install_maven|| exit 1
    install_nessus|| exit 1
    install_nvm_node|| exit 1
    install_activemq || exit 1
    install_amazonJDK || exit 1
fi
echo "end"
for param_case in $@; do
case $param_case in
    brew) install_brew|| exit 1;;
    tunnelblick) install_tunnelblick || exit 1;;
    git) install_git || exit 1;;
    idea) install_IDEA || exit 1;;
    robo) install_robo_3t || exit 1;;
    maven) install_maven|| exit 1;;
    nessus) install_nessus|| exit 1;;
    node) install_nvm_node|| exit 1;;
    activemq) install_activemq || exit 1;;
    amazon) install_amazonJDK || exit 1
esac
done
echo "end for"
