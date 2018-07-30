# EOS-with-eoskeeper

- This is a repo to autobuild https://hub.docker.com/r/longwuyuan/eos-with-eoskeeper/
- This image is related to the blockchain EOS https://www.eos.io
- It is based on the dockerhub image eoscanada/eos:v1.0.7
- This image is built FROM
    - https://hub.docker.com/r/eoscanada/eos/
- This image git pulls  https://github.com/eosstore/eoskeeper/
    (https://github.com/vchengsong/eoskeeper) is the original source of eoskeeper. Thanks )

# Container ENV vars to configure eoskeeper at runtime
Following variables are exposed. Configure their values at runtime by using --env with docker client or with K8s "env" spec for the image

Refer to https://github.com/eosstore/eoskeeper/blob/master/README-EN.md for authentic original description of these env vars .

- ROLE

- BLOCK_PRODUCER_NAME

- EOSIO_LOG_FILE

- EOSKEEPER_LOG_FILE

- INFLUXDB_URL

- MOBILES

The resulting /etc/eoskeeper/config.ini will end up looking somewhat like this ;

    ROLE='"F"'
    BLOCK_PRODUCER_NAME='"eosbp"'
    EOSIO_LOG_FILE='"/data/eosio.log"'
    EOSKEEPER_LOG_FILE='"/data/eoskeeper.log"'
    INFLUXDB_URL='"http://eoskeeperdb-influxdb:8086/write?db=eosdb"'
    MOBILES='"18210500000"

# Dependencies
- eoskeeper pushes timeseries data to $INFLUXDB_URL
- Install influxdb or use SaaS for influxdb
- Use Grafana to visualize the block-height and peer-to-peer connections
- Configure notifications in grafana to alert via pagerduty or slack etc.
