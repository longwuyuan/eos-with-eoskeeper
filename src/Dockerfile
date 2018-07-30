FROM eoscanada/eos:v1.0.7

WORKDIR /

# eoskeeper is a python app and the eos image does not bundle python
RUN apt-get -y update && \
    apt-get -y install git python python-pip supervisor vim lsof && \
    pip install sh requests && \
    git clone https://github.com/eosstore/eoskeeper.git

ADD conf/* /

# Set/Expose env vars to create eoskeeper config file.
ENV ROLE='"F"' BLOCK_PRODUCER_NAME='"eosbp"' EOSIO_LOG_FILE='"/data/eosio.log"' EOSKEEPER_LOG_FILE='"/data/eoskeeper.log"' INFLUXDB_URL='"http://eoskeeperdb-influxdb:8086/write?db=eosdb"' MOBILES='"18210500000"'

# Crudely install eoskeeper in the absense of a package for now
RUN cp /eoskeeper/eoskeeper.py /usr/local/bin && \
    chmod +x /usr/local/bin/eoskeeper.py && \
    mkdir /etc/eoskeeper /data && \
    touch /data/eosio.log && \
    echo '[global]' > /etc/eoskeeper/config.ini && \
    echo ' ' >> /etc/eoskeeper/config.ini && \
    echo 'role = '$ROLE >> /etc/eoskeeper/config.ini && \
    echo 'block_producer_name = '$BLOCK_PRODUCER_NAME >> /etc/eoskeeper/config.ini && \
    echo 'eosio_log_file = '$EOSIO_LOG_FILE >> /etc/eoskeeper/config.ini && \
    echo 'eoskeeper_log_file = '$EOSKEEPER_LOG_FILE >> /etc/eoskeeper/config.ini && \
    echo 'infulxdb_url = '$INFLUXDB_URL >> /etc/eoskeeper/config.ini && \
    echo 'mobiles = '$MOBILES >> /etc/eoskeeper/config.ini && \
    chmod +x /start_eos.sh /start_eoskeeper.sh && \
    mv /supervisor_eos.conf /etc/supervisor/conf.d/ && \
    mv /supervisor_eoskeeper.conf /etc/supervisor/conf.d/

ENTRYPOINT ["/etc/init.d/supervisor" "start"]
