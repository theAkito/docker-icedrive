#!/bin/bash
#########################################################################
# Copyright (C) 2021 Akito <the@akito.ooo>                              #
#                                                                       #
# This program is free software: you can redistribute it and/or modify  #
# it under the terms of the GNU General Public License as published by  #
# the Free Software Foundation, either version 3 of the License, or     #
# (at your option) any later version.                                   #
#                                                                       #
# This program is distributed in the hope that it will be useful,       #
# but WITHOUT ANY WARRANTY; without even the implied warranty of        #
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the          #
# GNU General Public License for more details.                          #
#                                                                       #
# You should have received a copy of the GNU General Public License     #
# along with this program.  If not, see <http://www.gnu.org/licenses/>. #
#########################################################################

if [[ "$EUID" != 0 ]]; then echo "Please run me as root."; exit 1; fi;

password="$1"

useradd --system --create-home --uid 755 --gid 754 --shell /bin/bash --password "${password}" rclone
mkdir -p /home/rclone/data/mount
mkdir -p /home/rclone/data/cache
mkdir /home/rclone/config
chown -R rclone:rclone /home/rclone
chmod -R 777 /home/rclone/data