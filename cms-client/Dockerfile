FROM advancedtelematic/voak-ats-client

RUN apt-get update
RUN apt-get install -y nginx

COPY client.conf /etc/nginx/conf.d/client.conf
COPY start-nginx-and-client.sh /root/start-nginx-and-client.sh

EXPOSE 9000

ENTRYPOINT /root/start-nginx-and-client.sh
CMD []
