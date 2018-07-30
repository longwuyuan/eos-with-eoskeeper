# eos-with-eoskeeper

- This is a repo to autobuild https://hub.docker.com/r/longwuyuan/eos-with-eoskeeper/
- This image is related to the blockchain EOS eos.io
- It is based on the dockerhub image eoscanada/eos:v1.0.7
- This image is built FROM
    - https://hub.docker.com/r/eoscanada/eos/
- This image git pulls  https://github.com/eosstore/eoskeeper/ 
    (https://github.com/vchengsong/eoskeeper) is the original source of eoskeeper. Thanks )

# Configuration at runtime
## Following variables are exposed to be passed at runtime with --env or K8s env spec

    ```
    # Refer to https://github.com/eosstore/eoskeeper/blob/master/README-EN.md

    ROLE='"F"'
    BLOCK_PRODUCER_NAME='"eosbp"'
    EOSIO_LOG_FILE='"/data/eosio.log"'
    EOSKEEPER_LOG_FILE='"/data/eoskeeper.log"'
    INFLUXDB_URL='"http://eoskeeperdb-influxdb:8086/write?db=eosdb"'
    MOBILES='"18210500000"

    ```
