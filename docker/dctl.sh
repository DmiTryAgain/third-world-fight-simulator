#!/bin/bash
set -e
#first cd current dir
cd "$(dirname "${BASH_SOURCE[0]}")"

export DEFAULT_USER="1000";
export DEFAULT_GROUP="1000";

export USER_ID=`id -u`
export GROUP_ID=`id -g`
export USER=$USER


if [ "$USER_ID" == "0" ];
then
    export USER_ID=$DEFAULT_USER;
fi

if [ "$GROUP_ID" == "0" ];
then
    export GROUP_ID=$DEFAULT_GROUP;
fi


test -e "./.env" || { cp .env.example .env; };
#load .env
export $(egrep -v '^#' .env | xargs)

if [ $# -eq 0 ]
  then
    echo "HELP:"
    echo "build - make docker build"
    echo "up - docker up in console"
    echo "up silent - docker up daemon"
    echo "down - docker down"
fi

function runInMySql {
    local command=$@
    docker exec -i ${PROJECT_PREFIX}_mysql su mysql -c "$command"
    return $?
}

function runInPhp {
    local command=$@
    echo $command;
    docker exec -i ${PROJECT_PREFIX}_php su www-data -c "cd /var/www/html/;$command"
    return $?
}

if [ "$1" == "build" ];
  then
    docker-compose build
fi

if [ "$1" == "up" ];
  then
    if [ "$2" == "silent" ];
        then
            docker-compose -p ${PROJECT_PREFIX} up -d;
        else
            docker-compose -p ${PROJECT_PREFIX} up
    fi
fi

if [ "$1" == "down" ];
  then
    docker-compose -p ${PROJECT_PREFIX} down
fi

if [ "$1" == "fulldown" ];
  then
    docker-compose -p ${PROJECT_PREFIX} down --rmi local
fi