A dockerfile for OSRM
=====================

Build Docker
------------

	make


Build Map Data
--------------

	docker run --rm -e "MAP_PBF_URL=http://download.geofabrik.de/europe/spain-latest.osm.pbf" -v /var/lib/osrm/data:/var/lib/osrm/data advancedtelematic/osrm-backend-data


Run OSRM
--------

	docker run -d -p 80:5000 -v /var/lib/osrm/data:/var/lib/osrm/data --name=osrm-server advancedtelematic/osrm-backend

