#!/bin/bash

/opt/couchbase/bin/couchbase-cli node-init --cluster localhost:8091 --username admin --password password --node-init-data-path /opt/couchbase/var/lib/couchbase/data --node-init-index-path /opt/couchbase/var/lib/couchbase/data --node-init-hostname 127.0.0.1

/opt/couchbase/bin/couchbase-cli cluster-init --cluster localhost:8091 --cluster-username admin --cluster-password password --cluster-ramsize 1024 --cluster-fts-ramsize 256 --cluster-index-ramsize 512 --index-storage-setting default --services data,index,query,fts --update-notifications 0

/opt/couchbase/bin/couchbase-cli user-manage --cluster localhost:8091 --username admin --password password --set --rbac-username user --rbac-password password --roles admin --auth-domain local

/opt/couchbase/bin/couchbase-cli bucket-create --cluster localhost:8091 --username admin --password password --bucket testBucket --bucket-type couchbase --bucket-ramsize 100

# ERROR 100 : N1QL: No N1QL service found on this cluster
# Path to history file for the shell : /root/.cbq_history
# ERROR 107 : Not connected to any cluster. Use \CONNECT command
# /opt/couchbase/bin/cbq -e localhost:8091 --user admin --password password -script="CREATE PRIMARY INDEX ON \`testBucket\`";

# /opt/couchbase/bin/cbq -e localhost:8091 --user admin --password password -script="CREATE PRIMARY INDEX ON \`testBucket\`.`postscope`.`postcollection`";

# /opt/couchbase/bin/couchbase-cli collection-manage --cluster http://localhost:8091 --username admin --password password --bucket testBucket --create-scope testScope

# /opt/couchbase/bin/couchbase-cli collection-manage --cluster http://localhost:8091 --username admin --password password --bucket testBucket --create-collection testScope.testCollection

# It is not required to create primary indexes for Couchbase
# https://forums.couchbase.com/t/json-data-modeling/30759
# https://blog.couchbase.com/primary-uses-for-couchbase-primary-index/
