#!/bin/bash
#########################################################################
# Title:         Restart Running Containers Script                      #
# Author(s):     desimaniac                                             #
# URL:           https://github.com/saltyorg/Saltbox                    #
# Description:   Stop running containers and start them back up.        #
# --                                                                    #
#########################################################################
#                   GNU General Public License v3.0                     #
#########################################################################


# Regular color(s)
NORMAL="\033[0;39m"
GREEN="\033[32m"

echo -e "
$GREEN
 ┌───────────────────────────────────────────────────────────────────────────────────┐
 │ Title:             Restart Running Containers Script                              │
 │ Author(s):         desimaniac                                                     │
 │ URL:               https://github.com/saltyorg/Saltbox                            │
 │ Description:       Stop running containers and start them back up.                │
 ├───────────────────────────────────────────────────────────────────────────────────┤
 │                        GNU General Public License v3.0                            │
 └───────────────────────────────────────────────────────────────────────────────────┘
$NORMAL
"

containers=$(comm -12 <(docker ps -a -q | sort) <(docker ps -q | sort))
for container in $containers;
do
    echo Stopping $container
    docker=$(docker stop $container)
done

sleep 10

for container in $containers;
do
    echo Starting $container
    docker=$(docker start $container)
done
