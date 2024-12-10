Patches for webtrees docker https://hub.docker.com/r/nathanvaughn/webtrees

## Patches description
webtrees-docker/app_patches/patch-last-name-first.sh - changes the display format of the full name: put last name first

## How to apply all patches automatically with docker start
```bash
# change dirctory to you webrees docker
cd webtrees-docker
# copy contents of this repository
git clone https://github.com/bsnjoy/webtrees-patches.git webtrees-docker
```

edit docker-compose.yml to include patches directory in volumes and add command to execute
nano docker-compose.yml
```bash
    volumes:
      - ./app_patches:/patches/
    command: ["/patches/startup.sh"]
```

start container
```bash
docker-compose up -d
```

## Structure
webtrees-docker/app_patches - place patches here. Patch file name should start with patch- 
They are automatically executed by startup.sh script when the container starts to fix the project code.

## Patch testing / Manual apply patch
```bash
# login to docker container
docker exec -it webtrees-docker_app_1 /bin/bash
cd /patches
# execute desired patch
./patch-last-name-first.sh
```