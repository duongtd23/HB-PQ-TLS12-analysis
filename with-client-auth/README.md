## Client authentication is desired
We consider the extended protocol (with hybrid signatures) in case when client authentication **is** desired.

Be sure to check `no-client-auth/README.md` first.

In this folder, you can find:

#### 1. `pqtls-ca.cafe`
The CafeOBJ specification of the full handshake (again, in case client authentication is desired). Check the comments embedded in the specification.

#### 2. `properties-fullhs.cafe` and `properties-abbrhs.cafe`
Specification of security properties from a client point of view and the lemmas to prove them.

These are simiar to `no-client-auth/properties-full-hs.cafe` and `no-client-auth/properties-abbr-hs.cafe`. 
Check `no-client-auth/README.md`.

#### 3. `properties-ca-fullhs.cafe`
Specification of additional security properties from a server point of view with respect to the full handshake and the lemmas to prove them.

These additional properties are as follows (all are stated from a server point of view):

| Property name                                          | CafeOBJ predicate |
| -----------                                            | -----------       |
| Session key secrecy                                    | `ssKeySe2`        |
| Forward secrecy                                        | `fwdSe2`          |
| Server authentication                                  | `auth2`           |
| &nbsp; &nbsp; Server authentication - tight variant #1 | `auth2-tight`     |
| &nbsp; &nbsp; Server authentication - tight variant #2 | `auth2-tight2`    |
| Confidentiality of ephemeral secret key                | `ephSe2`          |

`ssKeySe2` is the counterpart of `ssKeySe` defined in `properties-fullhs.cafe`.
The former states the secrecy of handshake keys established in a full handshake from a **client** point of view.
The latter states the secrecy of handshake keys established in a full handshake from a **server** point of view.
Precisely, `ssKeySe2` says that if honest server `B` has sent to honest client `A` a `Finished` message indicating that `B` has completed their phase of key negotiation, and `A`’s long-term private key is not revealed, then the intruder cannot learn the negotiated handshake keys. 

#### 4. `properties-ca-abbrhs.cafe`
Specification of additional security properties from a server point of view with respect to the abbreviated handshake and the lemmas to prove them.

| Property name                         | CafeOBJ predicate  |
| -----------                           | -----------        |
| Session key secrecy                   | `ssKeySe2-abbr`    |
| Server authentication - tight variant | `auth2-abbr-tight` |


#### 5. `gen-proof.sh`
Script to replicate our proofs in this case with IPSG.

If you want to replicate our formal proofs, first modify your paths to Maude and IPSG in the script properly.
Then, simply run the script and wait for a couple of minutes.
```bash
$ ./gen-proof.sh
```

#### 6. `full-hs` and `abbr-hs`
The proofs of properties and lemmas defined in `properties-fullhs.cafe` and `properties-abbrhs.cafe`.

This is simiar to `no-client-auth/full-hs.cafe` and `no-client-auth/abbr-hs.cafe`. 
Check `no-client-auth/README.md`.

#### 7. `ca-fullhs` and `ca-abbrhs`
The proofs of properties and lemmas defined in `properties-ca-fullhs.cafe` and `properties-ca-abbrhs.cafe`, respectively.

#### 8. `pq-unsafe`
This folder deals with case (ii): classical primitives are safe (while PQ primitives are unsafe).
Check README in the folder.

#### 9. `inputs`
Input files for IPSG to re-generate our proof scores.
These files are used in script `gen-proof.sh`.

#### 10. `others`
In file `exec.cafe`, we show that two parties can complete a session, obtaining the same handshake keys.
It implies that our model is executable and eliminates the suspicion that our verification results are achieved simply because the specification is not executed.