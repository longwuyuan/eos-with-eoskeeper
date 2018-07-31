FROM eoscanada/eos:v1.0.7

WORKDIR /

# eoskeeper is a python app and the eos image does not bundle python
RUN apt-get -y update && \
    apt-get -y install git python python-pip supervisor vim lsof && \
    pip install sh requests && \
    git clone https://github.com/eosstore/eoskeeper.git

ADD conf/* /

# Set/Expose env vars to create eoskeeper config file.
ENV ROLE='' BLOCK_PRODUCER_NAME='' INFLUXDB_URL='' MOBILES=''

# Crudely install eoskeeper in the absense of a package for now
RUN cp /eoskeeper/eoskeeper.py /usr/local/bin && \
    chmod +x /usr/local/bin/eoskeeper.py && \
    mkdir /etc/eoskeeper /data && \
    touch /data/eosio.log && \
    echo '[global]' > /etc/eoskeeper/config.ini && \
    echo ' ' >> /etc/eoskeeper/config.ini && \
    echo 'role = '$ROLE >> /etc/eoskeeper/config.ini && \
    echo 'block_producer_name = '$BLOCK_PRODUCER_NAME >> /etc/eoskeeper/config.ini && \
    echo 'eosio_log_file = /data/eosio.log' >> /etc/eoskeeper/config.ini && \
    echo 'eoskeeper_log_file = /data/eoskeeper.log' >> /etc/eoskeeper/config.ini && \
    echo 'infulxdb_url = '$INFLUXDB_URL >> /etc/eoskeeper/config.ini && \
    echo 'mobiles = '$MOBILES >> /etc/eoskeeper/config.ini && \
    chmod +x /start_eos.sh /start_eoskeeper.sh && \
    cat /supervisor_eoskeeper.conf >> /etc/supervisor/supervisord.conf && \
    cat /supervisor_eos.conf >> /etc/supervisor/supervisord.conf

EXPOSE 8888 9876

ENTRYPOINT ["/etc/init.d/supervisor", "start"]
