#! /bin/bash

# in the following two lines, configure your paths to Maude and IPSG folder properly
# MAUDE=/YOUR/PATH/TO/maude.darwin64
# IPSG_PATH=/YOUR/PATH/TO/IPSG-tool

DIR=$(pwd)
echo "Re-generating proof scores."
echo "Please wait since it may take up to 1 minute for CafeInMaude to load the specification."
echo ""


$MAUDE -allow-files $IPSG_PATH/ipsg_interface.maude <<EOF
cd $DIR/../../../
erew run .
load original-protocol/primitives.cafe .
load original-protocol/protocol.cafe .
load original-protocol/no-client-auth/pqtls-noca.cafe .
load original-protocol/no-client-auth/properties.cafe .
load original-protocol/no-client-auth/pq-safe/config.cafe .
load original-protocol/no-client-auth/pq-safe/inputs/input-knl-lm.cafe .
load original-protocol/no-client-auth/pq-safe/inputs/input-scrused-lm.cafe .
load original-protocol/no-client-auth/pq-safe/inputs/input-se-lm.cafe .
q
q
EOF
echo "Finished!"