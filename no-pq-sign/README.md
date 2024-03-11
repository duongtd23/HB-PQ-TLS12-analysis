### Original protocol
We consider the original Hybrid Post-Quantum TLS 1.2.
In this folder, you can find:
1. `protocol.cafe`: The CafeOBJ specification of the abbreviated handshake and intruder capabilities. Check the comments embedded in the specification.
2. `pqtls-nopqsign.cafe`: The CafeOBJ specification of the full handshake.
3. `properties.cafe`: The server authentication property definition in CafeOBJ.
4. `auth-counterexample.cafe`: A counterexample of the server authentication property.

To confirm the counterexample, first configure your paths to Maude and IPSG folder in script `execute.sh` properly, and then run it:

```bash
$ ./execute.sh
```

CafeInMaude may take up to 1 minute to load all specification before executing the `red` command in file `auth-counterexample.cafe`.
The script is actually equivalent to the following command sequence:

```bash
$ maude -allow-files path-to-IPSG-folder/cafeinmaude3/cafeInMaude.maude
CafeInMaude> load common.cafe .
CafeInMaude> load no-pq-sign/protocol.cafe .
CafeInMaude> load no-pq-sign/pqtls-nopqsign.cafe .
CafeInMaude> load no-pq-sign/properties.cafe .
CafeInMaude> load no-pq-sign/auth-counterexample.cafe .
```

Note that, we actually use CafeInMaude, which is available inside IPSG (IPSG is implemented on top of CafeInMaude). 
For better performance, we recommend using CafeInMaude.
Note also that you may need to either change the current working directory by `cd` command before running the `load` commands above or use the absolute paths instead.

If there is no error, the result below will be outputted, which says that `auth` is false in state `s17`:
```bash
reduce auth(s17, a, b, a, pk, pk', k2, k2', r, r2, dl, cspk, sign, sign2, 0) .
Result: false : Bool
CafeInMaude>
```

If we enable the reduce command `red nw(s17)` in the open-close fragment, the outputted result will indicate that the following is the only ServerKeyExchange message existed in the network of state `s17`:

```
skexM(intru,b,a,ecPublic(k) || keygen(k') ||
  clsign(clSignPriK(b), h(r || r2 || ecPublic(k) || keygen(k'))), 0)
```

There does not exist any ServerKeyExchange message sent by `B`.