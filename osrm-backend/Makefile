.PHONY: all osrm-backend osrm-backend-data

all: osrm-backend osrm-backend-data

osrm-backend:
	docker build -t advancedtelematic/osrm-backend .

osrm-backend-data: osrm-backend
	cd osrm-data && \
		docker build -t advancedtelematic/osrm-backend-data .

