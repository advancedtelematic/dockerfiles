A dockerfile for OSRM
=====================

Data Container
--------------

You may want to use a Data container to provide your own configuration files, and the maps.
You can start a simple one with this command:

    $ docker run -t -d -v ~/volumes/osrm/etc:/opt/osrm/etc -v ~/volumes/osrm/data:/opt/osrm/data -v ~/volumes/osrm/profiles:/opt/osrm/profiles --name osrm-data busybox:ubuntu-14.04

In /opt/osrm/etc/ will be the following configuration files:
    - extractor.ini: the osrm-extract configuration file. Will be passed with option -c to osrm-extract
    - contractor.ini: the osrm-prepare configuration file.
    - osrm.conf: the osrm-routed configuration file.
Those files are provided at the first execution and you can modify them later.

In /opt/osrm/data/ MUST be your osm files:
    - when building, the script will try to find a file called map.osm.pbf.
    - when runing, the script will try to find a file called map.osrm
See the Build section for further information.

In /opt/osrm/profiles/ will be the .lua profiles that OSRM needs to build the maps.
These profiles are set in extractor.ini and contractor.ini.
By default a profile.lua is copied in this foder, and correspond to the car.lua file provided by OSRM itself.


Build Section
-------------

Be sure to have run osrm-data as explain before.

Run OSRM, and execute the following commands:

    $ docker run -ti --rm --volumes-from=osrm-data xcgd/osrm-backend /bin/bash
    
    # Some scripts were deployed in /opt/osrm/bin

    $ cd /opt/osrm/bin

    $ ./build

This may take a while, depending on the map you are trying to prepare

All files will be deployed in your data volume.


Run section
-----------

If you have your OSM map extracted in your data volume, you can run the following:

    $ docker run -d -p 9876:5000 --volumes-from=osrm-data --name=osrm_server xcgd/osrm-backend

Now you can send request on host:9876 according to the API define here: https://github.com/Project-OSRM/osrm-backend/wiki/Server-api
