build:
	docker build -t advancedtelematic/voak-ats-garage-client-nginx .

start:
	docker run -d -p 9000:9000 -e API_HOST='http://cms.prod01.internal.advancedtelematic.com:8080/api/v1' advancedtelematic/voak-ats-garage-client-nginx
