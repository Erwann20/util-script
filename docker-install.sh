function installDocker {
    sudo apt update
    sudo apt install apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
    sudo apt update
    apt-cache policy docker-ce
    sudo apt install docker-ce
    sudo usermod -aG docker ${USER}
    su - ${USER}
    sudo usermod -aG docker username
    echo 'install docker terminé !'
}

function installDockerCompose {
    sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    docker-compose --version
    echo 'install docker-compose terminé !'
}

read -r -p "Voulez vous installer docker ? [y/N] " response

if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    installDocker
else
    echo 'installation annulée'
fi

read -r -p "Voulez vous installer docker-compose ? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    installDocker
else
    echo 'installation annulée'
fi
