### Client authentication is not desired
We consider extended protocol (with hybrid signatures) in case client authentication is not desired.

In this folder, you can find:
1. `pqtls-noca.cafe`: The CafeOBJ specification of the full handshake (again, in case client authentication is not desired). Check the comments embedded in the specification.
2. `properties-full-hs.cafe`: Security properties with respect to the full handshake and the lemmas to prove them.
3. `properties-abbr-hs.cafe`: Security properties with respect to the abbreviated handshake and the lemmas to prove them.
4. `prove-3-properties.sh`: Script to execute the proofs of the three properties: `ssKeySe`, `fwdSe`, and `auth` (session key secrecy, forward secrecy, authentication, respectively) with respect to the full handshake.
5. `gen-proof.sh`: Script to replicate our proofs with IPSG.