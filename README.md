![Docker Image Version (latest semver)](https://img.shields.io/docker/v/akito13/icedrive?style=plastic)

![Docker Stars](https://img.shields.io/docker/stars/akito13/icedrive?style=plastic)
![Docker Pulls](https://img.shields.io/docker/pulls/akito13/icedrive?style=plastic)

![Docker Image Size (latest semver)](https://img.shields.io/docker/image-size/akito13/icedrive?style=plastic)

[![Upstream](https://img.shields.io/badge/upstream-project-yellow?style=plastic)](https://github.com/rclone/rclone)

[![Guide](https://img.shields.io/badge/documentation-guide-informational?style=plastic)](https://doc.akito.ooo/books/home/page/setting-up-webdav-access-to-icedrive-with-rclone)

![GitHub](https://img.shields.io/github/license/theAkito/docker-icedrive?style=plastic)
![Liberapay patrons](https://img.shields.io/liberapay/patrons/Akito?style=plastic)

## What
Minimal [Icedrive](https://icedrive.net) access over [WebDAV](https://en.wikipedia.org/wiki/WebDAV) with [RClone](https://rclone.org).

## Why
Icedrive is quite unknown, which means it lacks community support. Therefore, this provider lacks a wide variety of ready to use client solutions.
This repository provides one of those solutions.

## How
1. [Install Docker](https://doc.akito.ooo/books/essentials/page/install-docker-on-a-debian-based-system).
2. [Install Docker Compose](https://docs.docker.com/compose/install/).
3. Clone this repository and change to its directory.
4. Adjust the volume locations (optional) and provide your login username for your Icedrive account in the  `docker-compose.yaml` file.
5. If you do not use the default locations, replace `/home/rclone` with the location you chose ajusted to earlier in the  `docker-compose.yaml` file, in the following block of commands:
```bash
# Change to user `root`.
sudo -s
# Prepare directory structure and permissions.
# If you want to use a custom location, adjust all mentions of `/home/rclone/`
# to your target location in both, this script and the following lines.
bash tools/prep-os.sh
# Copy base files to directory structure prepared with the script used in the previous step.
cp config/* /home/rclone/config
cp docker-compose.yml /home/rclone
# Make the `docker-compose.yaml` file private for the user `rclone`.
# Then, only user `root` or user `rclone` are able to use the file.
# Note, that `rclone` needs to have Docker access, to be allowed to use Docker and docker-compose.
# https://docs.docker.com/engine/install/linux-postinstall/
chmod 600 /home/rclone/docker-compose.yaml
chown -R rclone:rclone /home/rclone
```

4. Save your password encrypted and encoded for RClone to use:
```bash
bash prep-pw.sh "<your-password-here>"
```
4. Run the daemon:
```bash
# Change to user `root` or user `rclone`, if it has Docker access.
sudo -s
cd /home/rclone
docker-compose up -d
```

## Get
Latest build:
```bash
docker pull akito13/icedrive
```
Fixed version:
```bash
docker pull akito13/icedrive:0.4.0
```
Tags follow semver, without the `v`.
Git tags equal Docker tags, so no need to check tags explicitly on Docker Hub.

## Build
Build yourself:
```bash
bash docker-build.sh
```

## License
Copyright (C) 2021  Akito <the@akito.ooo>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.