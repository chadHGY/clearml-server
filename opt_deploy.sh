# Remove any previous installation of ClearML Server.
[ -e /opt/clearml/ ] && sudo rm -R /opt/clearml/
[ -e ~/.clearml/ ] && rm -R ~/.clearml/
[ -e ~/clearml.conf ] && rm ~/clearml.conf

# Create local directories for the databases and storage.
sudo mkdir -p /opt/clearml/data/elastic_7
sudo mkdir -p /opt/clearml/data/mongo_4/db
sudo mkdir -p /opt/clearml/data/mongo_4/configdb
sudo mkdir -p /opt/clearml/data/redis
sudo mkdir -p /opt/clearml/logs
sudo mkdir -p /opt/clearml/config
sudo mkdir -p /opt/clearml/data/fileserver

# Grant access to the Dockers, depending upon the operating system.
sudo chown -R 1000:1000 /opt/clearml

# Download the ClearML Server docker-compose YAML file.
sudo curl https://raw.githubusercontent.com/allegroai/clearml-server/master/docker/docker-compose.yml -o /opt/clearml/docker-compose.yml

# configure for ClearML Agent Services
export CLEARML_HOST_IP=$(hostname -I | cut -d' ' -f1)
# export CLEARML_AGENT_GIT_USER=git_username_here
# export CLEARML_AGENT_GIT_PASS=git_password_here

# Run docker-compose with the downloaded configuration file.
docker compose -f /opt/clearml/docker-compose.yml up -d
