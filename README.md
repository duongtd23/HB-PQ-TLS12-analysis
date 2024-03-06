## HB-PQ-TLS12-analysis
Symbolic Analysis and Verification of Hybrid Post-Quantum TLS 1.2

In this repository, you can find:

1. `appendix.pdf`: Appendices of our paper.

2. `common.cafe`: The formal specifications of cryptographic primitives and messages exchanged in the protocol.

3. `protocol.cafe`: The specification of the abbreviated handshake and intruder capabilities. We separately consider the case when client authentication is not desired (folder `no-client-auth`) and when it is desired (folder `with-client-auth`). With both cases, the specification of the abbreviated handshake and the intruder are same. Therefore, these two common parts are written in this `protocol.cafe` file. Note that this file requires the preloading file `common.cafe`.

4. `no-pq-sign`: The formal specification of the original protocol without a post-quantum (PQ) digital signature algorithm, and the counterexample showing that server authentication is not met. Check README in that folder.

5. `no-client-auth`: When client authentication is not desired. Check README in that folder.

6. `with-client-auth`: When client authentication is desired. Check README in that folder.


## Executing proof scores
Proof scores are executable (CafeOBJ code). To install CafeOBJ, please isit https://cafeobj.org/.
You can try to run the proof score of `safety2` of the Shared counter program by the following commands:
```bash
$ cafeobj common.cafe shared-counter/sc-hp.cafe shared-counter/properties.cafe shared-counter/safety2.cafe 
```

Note that some proofs are run slowly with CafeOBJ, and usually run faster with CafeInMaude:

```bash
$ maude -allow-files path-to-CafeInMaude/src/cafeInMaude.maude
IPSG> load common.cafe .
IPSG> load shared-counter/sc-hp.cafe .
IPSG> load shared-counter/properties.cafe .
IPSG> load shared-counter/safety2.cafe .
```

CafeInMaude  can be downloaded from here: https://github.com/ariesco/CafeInMaude.
To install CafeInMaude, we first need to intall Maude, which we can download its version 3.2 from here: http://maude.cs.illinois.edu/w/index.php/Maude_download_and_installation.
Both installations are simple, with Maude, you just need to download the binary file (and perhaps add the tool to the PATH environment variable to execute the tool from everywhere), while with CafeInMaude, you just need to clone its repo.

## Re-generating proof scores
To re-generate the proof scores again, first, modify paths to Maude and IPSG in file `shared-counter/gen-sc.sh` and then run it.
Please check IPSG's repository as well: https://github.com/duongtd23/IPSG-tool.