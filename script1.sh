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
    mkdir $git_dir
    }
#4
install_IDEA(){
    brew install --cask intellij-idea-ce 
    cd ~/inst/idea/IdeaIC2022.2
    cp -r  ~/inst/idea/ ~/Library/Application\ Support/JetBrains/
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
     #time +15sek
     sleep 15
     mkdir ~/.nvm
     export NVM_DIR="$HOME/.nvm"
     [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
     [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
    if [ "$cpu" == "Intel(R) Core(TM) i7-9750H CPU @ 2.60GHz" ] ; then
     echo "intel"
     nvm install 16.15.0 
     nvm use 16.15.0 
     nvm alias default  16.15.0
    else
     echo "M*"
     softwareupdate --install-rosetta 
     arch -x86_64 zsh 
     nvm install v12.16.3
    fi
    }
#9
install_activemq(){
    mkdir -p $install
    cd $install
    pwd
    mkdir -p $emq_dir
    curl -O https://archive.apache.org/dist/activemq/5.16.2/apache-activemq-5.16.2-bin.tar.gz
    tar xvzf apache-activemq-5.16.2-bin.tar.gz
    mv apache-activemq-5.16.2 $emq_dir
    }
#10
install_amazonJDK(){
    mkdir -p $install
    cd $install
    pwd
    curl -O https://corretto.aws/downloads/latest/amazon-corretto-15-x64-macos-jdk.pkg
    sudo installer -pkg amazon-corretto-15-x64-macos-jdk.pkg -target LocalSystem
    }
#11
install_Compass(){
brew install --cask mongodb-compass
cd ~/inst/compas/Connections
cp ~/inst/compas/Connections/af74fed9-6463-4ef0-8eeb-93c9f8b80a8d.json ~/Library/Application\ Support/MongoDB\ Compass/Connections/
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
git_dir=~/cloudally
emq_dir=~//cloudally/src
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
rm -r $install
echo "end for"

