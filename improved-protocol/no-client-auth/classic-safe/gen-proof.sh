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
load improved-protocol/primitives.cafe .
load improved-protocol/protocol.cafe .
load improved-protocol/no-client-auth/pqtls-noca.cafe .
load improved-protocol/no-client-auth/properties.cafe .
load improved-protocol/no-client-auth/classic-safe/config.cafe .
load improved-protocol/no-client-auth/classic-safe/inputs/input-auth-lm.cafe .
load improved-protocol/no-client-auth/classic-safe/inputs/input-knl-lm.cafe .
load improved-protocol/no-client-auth/classic-safe/inputs/input-se-lm.cafe .
load improved-protocol/no-client-auth/classic-safe/inputs/input-scrused-lm.cafe .
q
q
EOF
echo "Finished!"