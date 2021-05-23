# DS Icons

Little script to fetch DS and 3DS icons from [ds-scene.net](http://www.ds-scene.net/?s=releases).

## Usage

The script receives two optional arguments:

> sh fetch-ds-icons.sh [DS_SYSTEM] [MAX_ID]

Where:

* DS_SYSTEM: the system to fetch the icons (DS or 3DS)
* MAX_ID: maximum title id to fetch (6464 for DS or 1155 for 3DS)

## Docker

While using docker, it can be executed by the `docker-compose.yml` configuration.

> docker-compose up

or running direct from the command line:

> docker run --rm -it -v "${pwd}:/ds-icons:rw" alpine:latest sh -c "cd /ds-icons && sh fetch-ds-icons 3ds"
