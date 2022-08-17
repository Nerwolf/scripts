#!/bin/bash
#1
install_brew(){
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    }
#2
install_tunnelblick(){
    brew install --cask tunnelblick
    cd ~/inst/tunel_config/config
    cp -r *.tblk ~/Library/Application\ Support/Tunnelblick/Configurations/
    }   
#3
install_git(){
    brew install git
    }
#4
install_IDEA(){
    brew install --cask intellij-idea-ce 
    cd ~/inst/idea/IdeaIC2022.2
    cp -r  ~/inst/idea/IdeaIC2022.2 ~/Library/Application\ Support/Tunnelblick/Configurations/
    }
#5
install_robo_3t(){
    brew install --cask robo-3t
    mkdir -m 755 ~/.3T
    cd ~/.3T
    mkdir -m 755 1.4.4
    echo "3412810664113603438" > robo3t.key
    cd cd ~/inst
    cp ./robo3t.json ~/.3T/robo-3t/1.4.4/
    }    
#6
install_maven(){
    brew install maven
    }
#7
install_nessus(){
    brew install --cask tenable-nessus-agent
    }   
#8
install_nvm_node(){
    brew install nvm
    }
#9
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
#10
install_amazonJDK(){
    mkdir -p $install
    cd $install
    pwd
    curl -O https://corretto.aws/downloads/latest/amazon-corretto-15-x64-macos-jdk.pkg
    sudo installer -pkg amazon-corretto-15-x64-macos-jdk.pkg -target LocalSystem
    rm -r $install
    }
#11
install_Compass(){
brew install --cask mongodb-compass
}
#12
install_mpm(){
    cp ~/inst/cloudally 
    cd ~/cloudally/CAWeb/cloudallyPartnerPortal/src/main/webapp
    npm install
   #npm run dist:dev 
   #npm run start
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
    #install_robo_3t || exit 1
    install_maven|| exit 1
    install_nessus|| exit 1
    install_nvm_node|| exit 1
    install_activemq || exit 1
    install_amazonJDK || exit 1
    install_Compass || exit 1
    install_mpm|| exit 1
fi

echo "end"
for param_case in $@; do
case $param_case in
    brew) install_brew|| exit 1;;
    tunnelblick) install_tunnelblick || exit 1;;
    git) install_git || exit 1;;
    idea) install_IDEA || exit 1;;
    compass) install_Compass || exit 1;;
    maven) install_maven|| exit 1;;
    nessus) install_nessus|| exit 1;;
    node) install_nvm_node|| exit 1;;
    activemq) install_activemq || exit 1;;
    amazon) install_amazonJDK || exit 1
esac
done
echo "end for"
