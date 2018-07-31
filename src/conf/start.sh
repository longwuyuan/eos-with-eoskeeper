if [ -f /opt/eosio/bin/data-dir/blocks/blocks.index ]; then exec /opt/eosio/bin/nodeos --data-dir=/opt/eosio/bin/data-dir --config-dir=/etc/nodeos ; else exec /opt/eosio/bin/nodeos --data-dir=/opt/eosio/bin/data-dir --config-dir=/etc/nodeos --genesis-json=/etc/nodeos-genesis/genesis.json; fi
exec /usr/local/bin/eoskeeper.py &
