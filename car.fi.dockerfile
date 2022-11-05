FROM osrm/osrm-backend
RUN apt-get update
RUN apt-get install -y wget
RUN wget http://download.geofabrik.de/europe/finland-latest.osm.pbf
RUN osrm-extract -p /opt/car.lua finland-latest.osm.pbf
RUN osrm-partition finland-latest.osrm
RUN osrm-customize finland-latest.osrm
EXPOSE 5000
