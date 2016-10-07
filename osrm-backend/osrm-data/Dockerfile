FROM advancedtelematic/osrm-backend

VOLUME ["/var/lib/osrm/data"]
COPY extractor.sh /opt/osrm/bin/

ENTRYPOINT ["/opt/osrm/bin/extractor.sh"]
