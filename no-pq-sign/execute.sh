#! /bin/bash

# Script to confirm the counterexample

# in the following two lines, configure your paths to Maude and IPSG folder properly
# MAUDE=/YOUR/PATH/TO/maude.darwin64
# IPSG_PATH=/YOUR/PATH/TO/IPSG-tool


DIR=$(pwd)
echo "Server authentication counterexample."
echo "Please wait since CafeInMaude may take up to 1 minute to load all specification."
echo ""

(
printf 'cd %s/../\n' $DIR;
printf 'erew run .\n';
printf 'load common.cafe .\n';
printf 'load no-pq-sign/protocol.cafe .\n'; 
printf 'load no-pq-sign/pqtls-nopqsign.cafe .\n';
printf 'load no-pq-sign/properties.cafe .\n'; 
printf 'load no-pq-sign/auth-counterexample.cafe .\n'; 
cat
) | $MAUDE -allow-files $IPSG_PATH/ipsg_without_run.maude