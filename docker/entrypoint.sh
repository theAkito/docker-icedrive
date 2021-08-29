#!/bin/sh
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


password_filepath='/config/rclone/pw.txt'
obscured_password="$(tr -d '\n' <<<"$(<password_filepath)")"

cmd=(
  rclone
    mount
      # https://rclone.org/commands/rclone_mount/
    --allow-other
      # Allow access to other users. Not supported on Windows.
      # Needed for the WebDAV mount to be opened by other users besides the user mounting the volume inside the Docker container.
    --vfs-cache-mode full
      # In this mode all reads and writes are buffered to and from disk. When data is read from the remote this is buffered to disk as well.
      # In this mode the files in the cache will be sparse files and rclone will keep track of which bits of the files it has downloaded.
      # So if an application only reads the starts of each file, then rclone will only buffer the start of the file.
      # These files will appear to be their full size in the cache, but they will be sparse files with only the data that has been downloaded present in them.
      # This mode should support all normal file system operations and is otherwise identical to --vfs-cache-mode writes.
      # When reading a file rclone will read --buffer-size plus --vfs-read-ahead bytes ahead.
    --vfs-cache-max-size 20G
      # Max total size of objects in the cache. (default off)
    --buffer-size 16M
      #   VFS File Buffering
      # The --buffer-size is buffered in memory whereas the --vfs-read-ahead is buffered on disk.
      # When using this mode it is recommended that --buffer-size is not set too big and --vfs-read-ahead is set large if required.
      # IMPORTANT not all file systems support sparse files. In particular FAT/exFAT do not.
      # Rclone will perform very badly if the cache directory is on a filesystem which doesn't support sparse files and it will log an ERROR message if one is detected.
      #
      # The --buffer-size flag determines the amount of memory, that will be used to buffer data in advance.
      # Each open file will try to keep the specified amount of data in memory at all times.
      # The buffered data is bound to one open file and won't be shared.
      # This flag is a upper limit for the used memory per open file.
      # The buffer will only use memory for data that is downloaded but not not yet read.
      # If the buffer is empty, only a small amount of memory will be used.
      # The maximum memory used by rclone for buffering can be up to --buffer-size * open files.
    --webdav-url "https://webdav.icedrive.io"
      # URL of http host to connect to.
    --webdav-vendor "other"
      # Name of the Webdav site/service/software you are using.
    --webdav-pass "${obscured_password}"
      # Password.
      # Input to this must be obscured.
      # https://rclone.org/commands/rclone_obscure/
    icedrive: /data/mount
      # https://rclone.org/webdav/
      # Mount the remote as file system on a mountpoint.
      # https://rclone.org/commands/rclone_mount/
)

# Run RClone.
"${cmd[@]}"