#!/bin/bash -x
git_dir=~/src/cloudally/zion
emq_dir=~/src
install=~/tmp/install
sudo su $0 #$*
if [ $1 -ne [1-9] ]; then
exit$?;
install_brew(){
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"t
    }
install_git(){
    brew install git
    mkdir -p $git_dir
    cd $git_dir
}
install_amazonJDK(){
    #mkdir -p $install
    #cp $install
    #wget https://corretto.aws/downloads/latest/amazon-corretto-15-x64-macos-jdk.pkg
    installer -pkg amazon-corretto-15-x64-macos-jdk.pkg -target LocalSystem
}
install_IDEA(){
    brew install --cask intellij-idea-ce
    }
install_tunnelblick(){
    brew install --cask tunnelblick
    }
install_nessus(){
    brew install --cask tenable-nessus-agent
#/Library/NessusAgent/run/sbin/nessuscli agent link --key=643a332c831b4e0cfb54104be0db41bafa95666ed704db8a7d23ce5efbcd2b5f --host=cloud.tenable.com --port=443 --groups=CloudAlly_Workstations
}
install_nvm_node(){
    brew install nvm
    #перезапустить шелл
    #Переписать переменные
    #Записать файл
    #nvm install 16.15.0
    #nvm use 16.15.0
    #nvm alias default  16.15.0
}

install_robo_3t(){
brew install --cask robo-3t
}
install_activemq(){
    #mkdir -p $install
    #cp $install
    wget https://archive.apache.org/dist/activemq/5.16.2/apache-activemq-5.16.2-bin.tar.gz
    tar xvzf apache-activemq-5.16.2-bin.tar.gz
    mv apache-activemq-5.16.2 $emq_dir
    }
install_maven(){
    brew install maven
}
install_brew
if [ $? -ne "0" ]; then
             exit1;
fi
install_git
if [ $? -ne "0" ]; then
             exit1;
fi
install_amazonJDK
if [ $? -ne "0" ]; then
             exit1;
fi
install_tunnelblick
if [ $? -ne "0" ]; then
             exit1;
fi
install_nessus
if [ $? -ne "0" ]; then
             exit1;
fi
install_nvm
if [ $? -ne "0" ]; then
             exit1;
fi
install_robo
if [ $? -ne "0" ]; then
             exit1;
fi
install_activemq
if [ $? -ne "0" ]; then
             exit1;
fi
install_IDEA
if [ $? -ne "0" ]; then
            exit1;




if [ `id -u` -ne "0" ]; then
sudo $0 $*
install_amazonJDK
echo "конец рут"
exit$?
fi            