#!/bin/bash

#Setup TileMill
curl -L http://nodejs.org/dist/v0.10.46/node-v0.10.46-linux-x64.tar.gz -o node-v0.10.46.tar.gz
sudo tar --strip-components 1 -xzvf node-v* -C /usr/local
rm node-v*
sudo yum install -y git
git clone https://github.com/mapbox/tilemill.git ~/tilemill
cd ~/tilemill
npm install

# Check TileMill map sources exist
MAP_SOURCES="/vagrant/tilemill/map_source"
sudo yum install -y unzip

if [ ! -d $MAP_SOURCES ]; then
  echo "Creating Tilemill map sources directory"
  mkdir -p $MAP_SOURCES
fi

if [ ! -f "$MAP_SOURCES/10m-admin-0-countries.shp" ]; then
  echo "Downloading countries"
  curl -L "https://s3.amazonaws.com/fiftycuatro.maps/10m-admin-0-countries.zip" -o "$MAP_SOURCES/10m-admin-0-countries.zip"
  unzip -d $MAP_SOURCES "$MAP_SOURCES/10m-admin-0-countries.zip"
fi

if [ ! -f "$MAP_SOURCES/10m-graticules-1.shp" ]; then
  echo "Downloading graticules"
  curl -L "https://s3.amazonaws.com/fiftycuatro.maps/10m-graticules-1.zip" -o "$MAP_SOURCES/10m-graticules-1.zip"
  unzip -d $MAP_SOURCES "$MAP_SOURCES/10m-graticules-1.zip"
fi

if [ ! -f "$MAP_SOURCES/Phoenix-cropped-3857.tif" ]; then
  echo "Downloading Phoenix FAA chart"
  curl -L "https://s3.amazonaws.com/fiftycuatro.maps/Phoenix-cropped-3857.tif" -o "$MAP_SOURCES/Phoenix-cropped-3857.tif"
fi

if [ ! -f "$MAP_SOURCES/15-H-3857.tif" ]; then
  echo "Downloading terrain"
  curl -L "https://s3.amazonaws.com/fiftycuatro.maps/15-H-terrain.zip" -o "$MAP_SOURCES/15-H-terrain.zip"
  unzip -d $MAP_SOURCES "$MAP_SOURCES/15-H-terrain.zip"
fi
