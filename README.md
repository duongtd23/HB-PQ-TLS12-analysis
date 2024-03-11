## HB-PQ-TLS12-analysis
Symbolic Analysis and Verification of Hybrid Post-Quantum TLS 1.2

In this repository, you can find:

1. `appendix.pdf`: Appendices of our paper.

2. `common.cafe`: The formal specifications of cryptographic primitives and messages exchanged in the protocol.

3. `protocol.cafe`: The specification of the abbreviated handshake and intruder capabilities. We separately consider the case when client authentication is not desired (folder `no-client-auth`) and when it is desired (folder `with-client-auth`). With both cases, the specification of the abbreviated handshake and the intruder are same. Therefore, these two common parts are written in this `protocol.cafe` file. Note that this file requires the preloading file `common.cafe`.

4. `no-pq-sign`: The formal specification of the original protocol without a post-quantum (PQ) digital signature algorithm, and the counterexample showing that server authentication is not met. Check README in the folder.

5. `no-client-auth`: When client authentication is not desired. Check README in the folder.

6. `with-client-auth`: When client authentication is desired. Check README in the folder.


## Executing proof scores
Proof scores are executable (CafeOBJ code). 
For better performance, we recommend using CafeInMaude - the second major implementation of CafeOBJ in Maude - instead of the original CafeOBJ.
CafeInMaude is available inside IPSG (IPSG is implemented on top of CafeInMaude) - https://github.com/duongtd23/IPSG-tool.
To install IPSG, we first need to intall Maude - a high performance language, which can be downloaded from here: http://maude.cs.illinois.edu/w/index.php/Maude_download_and_installation. Download and clone the two tools.
Once install them, 
you can try to run the proof score of `ssKeySe` (session key secrecy property) in case client authentication is not desired with CafeInMaude by the following commands:

```bash
$ maude -allow-files path-to-IPSG-folder/cafeinmaude3/cafeInMaude.maude
CafeInMaude> load common.cafe .
CafeInMaude> load protocol.cafe .
CafeInMaude> load no-client-auth/pqtls-noca.cafe .
CafeInMaude> load no-client-auth/properties-full-hs.cafe .
CafeInMaude> load no-client-auth/full-hs/ssKeySe.cafe .
```

where the first command starts the CafeInMaude environment (`path-to-IPSG-folder` is the path of the IPSG folder)
Note that CafeInMaude may take up to half a minute to load file `protocol.cafe`.
Note also that you may need to either change the current working directory by `cd` command before running the `load` commands above or use the absolute paths instead.
If nothing is wrong, the result below will be returned, which says that `ssKeySe` is proven:
```bash
Result: true : Bool
CafeInMaude>
```

After that, you do not need to load the specification again, but can continue loading other proof scores, for example, the proof of `fwdSe` (forward secrecy property):

```bash
CafeInMaude> load no-client-auth/full-hs/fwdSe.cafe .
```

### Using script instead
We provide a script to replace the command sequence above.
You can first configure your paths to Maude and IPSG folder in script `no-client-auth/prove-3-properties.sh` properly, and then run it to prove the three properties in case client authentication is not desired: `ssKeySe`, `fwdSe`, and `auth`.

```bash
$ ./prove-3-properties.sh
```

### Executing with CafeOBJ instead
If you want to try with CafeOBJ, visit https://cafeobj.org/ to first install the tool.
After that, you can try:

```bash
$ cafeobj common.cafe protocol.cafe no-client-auth/pqtls-noca.cafe no-client-auth/properties-full-hs.cafe no-client-auth/full-hs/ssKeySe.cafe 
```

CafeOBJ load the specification much faster than CafeInMaude, but usually slower than CafeInMaude in executing proofs (performing `red` commands).

## Re-generating proof scores
Check the folder `no-client-auth` for the guidelines.