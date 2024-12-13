#!/bin/bash
script_dir=$(dirname "$(realpath "$0")")
cd $script_dir
docker-compose down
tar --exclude='./app_data/cache' -zcvf "../backup/webtrees-docker-$(date +%F).tar.gz" ./
docker-compose up -d
docker exec -it webtrees-docker_app_1 /patches/startup.sh
