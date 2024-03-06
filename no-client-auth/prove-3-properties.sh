#! /bin/bash

# in the following two lines, configure your paths to Maude and IPSG folder properly
# MAUDE=/YOUR/PATH/TO/maude.darwin64
# IPSG_PATH=/YOUR/PATH/TO/IPSG-tool


DIR=$(pwd)
echo "Proving 3 properties: ssKeySe, fwdSe, and auth"
echo "Please wait since it may take up to 1 minute for CafeInMaude to load the specification."
echo ""

(
printf 'cd %s/../\n' $DIR;
printf 'erew run .\n';
printf 'load common.cafe .\n';
printf 'load protocol.cafe .\n'; 
printf 'load no-client-auth/pqtls-noca.cafe .\n';
printf 'load no-client-auth/properties-full-hs.cafe .\n'; 
printf 'load no-client-auth/full-hs/ssKeySe.cafe .\n'; 
printf 'load no-client-auth/full-hs/fwdSe.cafe .\n'; 
printf 'load no-client-auth/full-hs/auth.cafe .\n'; 
cat
) | $MAUDE -allow-files $IPSG_PATH/cafeinmaude3/cafeInMaude_without_run.maude