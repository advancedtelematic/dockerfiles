FROM osrm-backend

VOLUME ["/opt/osrm/data"]
COPY extractor.sh /opt/osrm/bin/
COPY extractor.ini /opt/osrm/etc/
COPY .stxxl /opt/osrm/etc/
COPY profile.lua /opt/osrm/profiles/

ENTRYPOINT ["/opt/osrm/bin/extractor.sh"]
