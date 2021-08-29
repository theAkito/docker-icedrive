![Docker Image Version (latest semver)](https://img.shields.io/docker/v/akito13/icedrive?style=plastic)

![Docker Stars](https://img.shields.io/docker/stars/akito13/icedrive?style=plastic)
![Docker Pulls](https://img.shields.io/docker/pulls/akito13/icedrive?style=plastic)

![Docker Image Size (latest semver)](https://img.shields.io/docker/image-size/akito13/icedrive?style=plastic)

[![Upstream](https://img.shields.io/badge/upstream-project-yellow?style=plastic)](https://github.com/rclone/rclone)

![GitHub](https://img.shields.io/github/license/theAkito/docker-icedrive?style=plastic)
![Liberapay patrons](https://img.shields.io/liberapay/patrons/Akito?style=plastic)

## What
Minimal [Icedrive](https://icedrive.net) access over [WebDAV](https://en.wikipedia.org/wiki/WebDAV) with [RClone](https://rclone.org).

## Why
Icedrive is quite unknown, which means it lacks community support. Therefore, this provider lacks a wide variety of ready to use client solutions.
This repository provides one of those solutions.

## How
1. Clone this repository and change to its directory.
2. Adjust the volume locations (optional) and provide your login username for your Icedrive account in the  `docker-compose.yaml` file.
3. Save your password encrypted and encoded for RClone to use:
```bash
bash prep-pw.sh "<your-password-here>"
```
4. Run the daemon:
```bash
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