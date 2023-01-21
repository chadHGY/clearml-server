# environment variables
[ ! -f .env ] || export $(grep -v '^#' .env | xargs)
export CLEARML_HOST_IP=$(hostname -I | cut -d' ' -f1)

# make directory
sudo mkdir -p ${CLEARML_PREFIX}/data/fileserver
sudo mkdir -p ${CLEARML_PREFIX}/data/redis
sudo mkdir -p ${CLEARML_PREFIX}/data/mongo_4/db
sudo mkdir -p ${CLEARML_PREFIX}/data/mongo_4/configdb
sudo mkdir -p ${CLEARML_PREFIX}/data/elastic_7
sudo mkdir -p ${CLEARML_PREFIX}/logs
sudo mkdir -p ${CLEARML_PREFIX}/logs/elastic_7
sudo mkdir -p ${CLEARML_PREFIX}/config
sudo mkdir -p ${CLEARML_PREFIX}/config/services

# config
sudo cp -n ./apiserver/config/default/services/* ${CLEARML_PREFIX}/config/services/
sudo cp -n ./apiserver/config/default/apiserver.conf ${CLEARML_PREFIX}/config
sudo cp -n ./apiserver/config/default/hosts.conf ${CLEARML_PREFIX}/config
sudo cp -n ./apiserver/config/default/logging.conf ${CLEARML_PREFIX}/config
sudo cp -n ./apiserver/config/default/secure.conf ${CLEARML_PREFIX}/config

# prepare docker compose file
sudo cp -n ./docker/docker-compose.yml ${CLEARML_PREFIX}/docker-compose.yml

# chonge permission
sudo chown -R 1000:1000 ${CLEARML_PREFIX}

# docker compose up
docker compose -f ${CLEARML_PREFIX}/docker-compose.yml up -d




