## Symbolic Analysis and Verification of Hybrid Post-Quantum TLS 1.2

The analysis of the original protocol can be found in [original-protocol](original-protocol).

The analysis of the improved protocol can be found in [improved-protocol](improved-protocol).


### Executing proof scores
Proof scores are executable (CafeOBJ code). 
For better performance, we recommend using CafeInMaude - the second major implementation of CafeOBJ in Maude - instead of the original CafeOBJ.
CafeInMaude is available inside IPSG (IPSG is implemented on top of CafeInMaude), which is available at https://github.com/duongtd23/IPSG-tool.
To install IPSG, we first need to intall Maude, which can be downloaded from here: http://maude.cs.illinois.edu/w/index.php/Maude_download_and_installation. Download and clone the two tools.
Once they are installed, 
you can try to run the proof score of `ssKeySe` (confidentiality of session keys) in case client authentication is not desired with CafeInMaude by the following commands:

```bash
$ maude -allow-files path-to-IPSG-folder/cafeinmaude3/cafeInMaude.maude
CafeInMaude> load original-protocol/primitives.cafe .
CafeInMaude> load original-protocol/protocol.cafe .
CafeInMaude> load original-protocol/no-client-auth/pqtls-noca.cafe .
CafeInMaude> load original-protocol/no-client-auth/properties.cafe .
CafeInMaude> load original-protocol/no-client-auth/classic-safe/config.cafe .
CafeInMaude> load original-protocol/no-client-auth/classic-safe/ssKeySe.cafe .
```

where the first command starts the CafeInMaude environment (`path-to-IPSG-folder` is the path of the IPSG folder).
Note that CafeInMaude may take up to half a minute to load all files.
Note also that you may need to either change the current working directory by `cd` command before running the `load` commands above or use the absolute paths instead.
If nothing is wrong, the result below will be returned, which says that `ssKeySe` is proven:
```bash
Result: true : Bool
CafeInMaude>
```

After that, you do not need to load the specification again, but can continue loading other proof scores, for example, the proof of `fwdSe` (forward secrecy property):

```bash
CafeInMaude> load original-protocol/no-client-auth/classic-safe/auth.cafe .
```

### Executing with CafeOBJ instead
If you want to try with CafeOBJ, visit https://cafeobj.org/ to first install the tool.
After that, you can try:

```bash
$ cafeobj\
original-protocol/primitives.cafe \
original-protocol/protocol.cafe \
original-protocol/no-client-auth/pqtls-noca.cafe \
original-protocol/no-client-auth/properties.cafe \
original-protocol/no-client-auth/classic-safe/config.cafe \
original-protocol/no-client-auth/classic-safe/ssKeySe.cafe \
```

CafeOBJ load the specification much faster than CafeInMaude, but usually slower than CafeInMaude in executing proofs (performing `red` commands).

### Re-generating proof scores
We provide scripts to replicate our proofs with IPSG (for example,
`original-protocol/no-client-auth/classic-safe/gen-proof.sh`).

If you want to replicate our formal proofs, first modify your paths to Maude and IPSG in the script properly.
Then, simply run the script and wait for a couple of minutes.

```bash
original-protocol/no-client-auth/classic-safe $ ./gen-proof.sh
```