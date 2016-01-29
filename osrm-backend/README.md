A dockerfile for OSRM
=====================

Build Map Data
--------------

	docker run -e "MAP_PBF_URL=http://download.geofabrik.de/europe/spain.html" -v ~/volumes/osrm/data:/opt/osrm/data --rm osrm-data


Run OSRM
--------

	docker run -d -p 80:5000 -v ~/volumes/osrm/data:/opt/osrm/data --name=osrm-server osrm-backend

