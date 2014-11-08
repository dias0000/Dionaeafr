#!/bin/sh


pip install Django
pip install pygeoip
pip install django-pagination
pip install django-tables2
pip install django-compressor
pip install django-htmlmin
pip install django-filter

cd /opt/
git clone https://github.com/benjiec/django-tables2-simplefilter
cd django-tables2-simplefilter
python setup.py install


cd /opt/
git clone git://git.bro-ids.org/pysubnettree.git
cd pysubnettree
python setup.py install


cd /opt/
wget http://nodejs.org/dist/v0.8.16/node-v0.8.16.tar.gz
tar xzvf node-v0.8.16.tar.gz
cd node-v0.8.16
./configure
make
make install

npm install -g less


cd /opt/
wget https://github.com/rubenespadas/DionaeaFR/zipball/master
unzip master
chmod 777 rubenespadas-DionaeaFR-ae2a941
mv rubenespadas-DionaeaFR-ae2a941 DionaeaFR


cd /opt/
wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz
gunzip GeoLiteCity.dat.gz
mv GeoLiteCity.dat /opt/DionaeaFR/DionaeaFR/static/


cd /opt/
wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz
gunzip GeoIP.dat.gz
mv GeoIP.dat /opt/DionaeaFR/DionaeaFR/static/

cd /opt/DionaeaFR/
python manage.py collectstatic
python manage.py runserver 0.0.0.0:8000
