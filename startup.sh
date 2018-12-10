#!/bin/bash

wget https://github.com/chamilo/chamilo-lms/releases/download/v1.11.6/chamilo-1.11.6-php5.tar.gz
tar xvf chamilo-lms-1.11.6-php5.tar.gz
rm chamilo-lms-1.11.6-php5.tar.gz
cd ./dockerimage
docker build -t 'opsforge/chamilo:latest' .
cd ..
docker-compose up -d

echo ""
echo "Chamilio on Docker successfully set up"
echo ""
