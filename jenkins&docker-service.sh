# checking if jenkins and docker services are running or not

#! bin/bash

set -e

if systemctl is-active --quiet jenkins && systemctl is-active --quiet docker; then
        echo "jenkins and docker services are running fine !"

else
        if ! systemctl is-active --quiet jenkins; then

                echo "jenkins is not active, restarting...... "

                systemctl restart jenkins

        fi
        if ! systemctl is-active --quiet docker; then

                echo "docker is not active, restarting.... "

                systemctl restart docker
        fi



fi
