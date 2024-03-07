#! /bin/bash

# in the following two lines, configure your paths to Maude and IPSG folder properly
# MAUDE=/YOUR/PATH/TO/maude.darwin64
# IPSG_PATH=/YOUR/PATH/TO/IPSG-tool


DIR=$(pwd)
echo "Re-generating proof scores."
echo "Please wait since it may take up to 1 minute for CafeInMaude to load the specification."
echo ""


$MAUDE -allow-files $IPSG_PATH/ipsg_without_run.maude <<EOF
cd $DIR/../
erew run .
load common.cafe .
load protocol.cafe .
load with-client-auth/pqtls-ca.cafe .
load with-client-auth/properties-fullhs.cafe .
load with-client-auth/inputs/full-hs/input-auth-lm.cafe .
load with-client-auth/inputs/full-hs/input-knl-lm.cafe .
load with-client-auth/inputs/full-hs/input-scrused-lm.cafe .
load with-client-auth/inputs/full-hs/input-se-lm.cafe .
load with-client-auth/properties-abbrhs.cafe .
load with-client-auth/inputs/abbr-hs/input.cafe .
load with-client-auth/properties-ca-fullhs.cafe .
load with-client-auth/inputs/ca-fullhs/input-auth2-lm.cafe .
load with-client-auth/inputs/ca-fullhs/input-knl2-lm.cafe .
load with-client-auth/inputs/ca-fullhs/input-scrused2-lm.cafe .
load with-client-auth/inputs/ca-fullhs/input-se2-lm.cafe .
load with-client-auth/properties-ca-abbrhs.cafe .
load with-client-auth/inputs/ca-abbrhs/input.cafe .
q
q
EOF
echo "Finished!"