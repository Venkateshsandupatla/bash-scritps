# checking if jenkins and docker services are running or not

#! bin/bash

set -e

if systemctl is-active --quiet jenkins && systemctl is-active --quiet docker; then
        echo "jenkins and docker services are running fine !"

else
        if ! systemctl is-active --quiet jenkins; then

                echo "jenkins is not active, restarting...... "

                systemctl restart jenkins

                # the below command is sued to save the timestamp in a log file, for our reference
                echo "[$(date +%y-%m-%d %H:%M:%S)] jenkins service restarted" >> /var/log/service-monitorr.log


        fi
        if ! systemctl is-active --quiet docker; then

                echo "docker is not active, restarting.... "

                systemctl restart docker

               # the below command is sued to save the timestamp in a log file, for our reference
                echo "[$(date +%y-%m-%d %H:%M:%S)] docker service restarted" >> /var/log/service-monitorr.log
        fi



fi
