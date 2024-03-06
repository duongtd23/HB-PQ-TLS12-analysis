#! /bin/bash

# in the following two lines, configure your paths to Maude and IPSG folder properly
# MAUDE=/YOUR/PATH/TO/maude.darwin64
# IPSG_PATH=/YOUR/PATH/TO/IPSG-tool


DIR=$(pwd)
echo "Re-generating proof scores."
echo "Please wait since it may take up to 1 minute for CafeInMaude to load the specification."
echo ""


$MAUDE -allow-files $IPSG_PATH/ipsg_without_run.maude <<EOF
cd $DIR/../../
erew run .
load common.cafe .
load protocol.cafe .
load no-client-auth/pqtls-noca.cafe .
load no-client-auth/properties-full-hs.cafe .
load no-client-auth/pq-unsafe/properties-pqunsafe-fullhs.cafe .
load no-client-auth/pq-unsafe/inputs/full-hs/input.cafe .
load no-client-auth/properties-abbr-hs.cafe .
load no-client-auth/pq-unsafe/properties-pqunsafe-abbrhs.cafe .
load no-client-auth/pq-unsafe/inputs/abbr-hs/input.cafe .
q
q
EOF
echo "Finished!"