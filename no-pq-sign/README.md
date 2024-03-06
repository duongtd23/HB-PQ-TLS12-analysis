### Original protocol
We consider the original Hybrid Post-Quantum TLS 1.2.
In this folder, you can find:
1. `protocol.cafe`: The CafeOBJ specification of the abbreviated handshake and intruder capabilities. Check the comments embedded in the specification.
2. `pqtls-nopqsign.cafe`: The CafeOBJ specification of the full handshake.
3. `properties.cafe`: The server authentication property definition in CafeOBJ.
4. `auth-counterexample.cafe`: A counterexample of the server authentication property.

To confirm the counterexample, run the following commands:

```bash
$ maude -allow-files path-to-CafeInMaude/src/cafeInMaude.maude
IPSG> load no-pq-sign/auth-counterexample.cafe .
```