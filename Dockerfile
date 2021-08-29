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

FROM rclone/rclone

ARG TAG="v1.3.9"
ARG BRANCH="master"
ARG BUILD_VERSION
ARG BUILD_REVISION
ARG BUILD_DATE

LABEL maintainer="Akito <the@akito.ooo>"
LABEL org.opencontainers.image.authors="Akito <the@akito.ooo>"
LABEL org.opencontainers.image.vendor="Akito"
LABEL org.opencontainers.image.version="${BUILD_VERSION}"
LABEL org.opencontainers.image.revision="${BUILD_REVISION}"
LABEL org.opencontainers.image.created="${BUILD_DATE}"
LABEL org.opencontainers.image.title="Icedrive"
LABEL org.opencontainers.image.description="Using Icedrive WebDAV access with RClone."
LABEL org.opencontainers.image.url="https://hub.docker.com/r/akito13/icedrive"
LABEL org.opencontainers.image.documentation="https://doc.akito.ooo/books/home/page/setting-up-webdav-access-with-rclone"
LABEL org.opencontainers.image.source="https://github.com/theAkito/docker-icedrive"
LABEL org.opencontainers.image.licenses="GPL-3.0+"

COPY docker/entrypoint.sh /config/rclone

WORKDIR /data

ENTRYPOINT [ "/bin/sh" ]
CMD [ "/config/rclone/entrypoint.sh" ]
