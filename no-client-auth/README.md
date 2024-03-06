## Client authentication is not desired
We consider the extended protocol (with hybrid signatures) in case client authentication is not desired.

In this folder, you can find:

#### 1. `pqtls-noca.cafe`
The CafeOBJ specification of the full handshake (again, in case client authentication is not desired). Check the comments embedded in the specification.

#### 2. `properties-full-hs.cafe`
Specification of security properties with respect to the full handshake and the lemmas to prove them. 

The properties taken into verification are as follows (check our paper for their descriptions):

| Property name                                          | CafeOBJ predicate |
| -----------                                            | -----------       |
| Session key secrecy                                    | `ssKeySe`         |
| Forward secrecy                                        | `fwdSe`           |
| Server authentication                                  | `auth`            |
| &nbsp; &nbsp; Server authentication - tight variant #1 | `auth-tight`      |
| &nbsp; &nbsp; Server authentication - tight variant #2 | `auth-tight2`     |
| Confidentiality of long-term private key               | `ltkSe`           |
| Confidentiality of ephemeral secret key                | `ephSe`           |


Predicates defined in module `PROP-FULLHS` are valid to both cases: (i) PQ primitives are safe (while classical primitives are unsafe) and (ii) classical primitives are safe (while PQ primitives are unsafe).
Whereas, predicates defined in module `PROP-FULLHS-PQSAFE` are valid only in case (i).
Most predicates in module `PROP-FULLHS` are proven with respect to (wrt) `PROP-FULLHS`, i.e., regardless of case (i) or (ii).
Some others are proven separately wrt module `PROP-FULLHS-PQSAFE` and wrt module `PROP-FULLHS-CLSAFE`, i.e., they are proven separately for case (i) (see folder `full-hs`) and case (ii) (see folder `pq-unsafe/full-hs`). 

The auxiliary lemmas defined can be divided into four subsets (check our paper for their descriptions):
- Secrecy helper lemmas.
- Authentication helper lemmas.
- Lemmas concerning the set of used secrets.
- Lemmas concerning the intruder knowledge.

#### 3. `properties-abbr-hs.cafe`
Specification of security properties with respect to the abbreviated handshake and the lemmas to prove them.

The properties taken into verification are as follows:

| Property name                         | CafeOBJ predicate |
| -----------                           | -----------       |
| Session key secrecy                   | `ssKeySe-abbr`    |
| Server authentication - tight variant | `auth-abbr-tight` |

Similar to `properties-full-hs.cafe`, 
predicates defined in module `PROP-ABBRHS` are valid to both cases: (i) PQ primitives are safe (while classical primitives are unsafe) and (ii) classical primitives are safe (while PQ primitives are unsafe).
Whereas, predicates defined in module `PROP-ABBRHS-PQSAFE` are valid only in case (i).
Most predicates in module `PROP-ABBRHS` are proven with respect to (wrt) `PROP-ABBRHS`, i.e., regardless of case (i) or (ii).
Some others are proven separately wrt module `PROP-ABBRHS-PQSAFE` and wrt module `PROP-ABBRHS-CLSAFE`, i.e., they are proven separately for case (i) (see folder `abbr-hs`) and case (ii) (see folder `pq-unsafe/abbr-hs`). 

#### 4. `prove-3-properties.sh` 
Script to execute the proofs of the three properties: `ssKeySe`, `fwdSe`, and `auth` (session key secrecy, forward secrecy, authentication, respectively) with respect to the full handshake.
To run this script, be sure to modify your paths to Maude and IPSG in that file properly.

#### 5. `gen-proof.sh`
Script to replicate our proofs with IPSG.

If you want to replicate our formal proofs, first modify your paths to Maude and IPSG in the script properly.
Then, simply run the script and wait for a couple of minutes.
```bash
$ ./gen-proof.sh
```

#### 6. `full-hs`
The proofs of properties and lemmas defined in `properties-full-hs.cafe`. 

As mentioned in Section 2 above, some predicates defined in module `PROP-FULLHS` are proven separately wrt module `PROP-FULLHS-PQSAFE` and wrt module `PROP-FULLHS-CLSAFE`.
This folder provides the proofs of such predicates wrt module `PROP-FULLHS-PQSAFE`
(and they are then proven again wrt module `PROP-FULLHS-CLSAFE` in folder `pq-unsafe/full-hs`, see Section 8 below).
In other words, in this folder, we consider only case (i): PQ primitives are safe (while classical primitives are unsafe).

For example, file `ssKeySe.cafe` saves the proof of `ssKeySe`.

There are four sub-folders:
- `auth-lm`: saves the proofs of "Authentication helper lemmas" (see Section 2 above).
- `knl-lm`: saves the proofs of "Lemmas concerning the intruder knowledge".
- `scrused-lm`: saves the proofs of "Lemmas concerning the set of used secrets".
- `se-lm`: saves the proofs of "Secrecy helper lemmas".


#### 7. `abbr-hs`
The proofs of properties and lemmas defined in `properties-abbr-hs.cafe`. 

#### 8. `pq-unsafe`
This folder deals with case (ii): classical primitives are safe (while PQ primitives are unsafe).
For those predicates defined in module `PROP-FULLHS` and proven separately wrt module `PROP-FULLHS-PQSAFE` and wrt module `PROP-FULLHS-CLSAFE` (mentioned in Section 2 above),
this folder provides their proofs wrt module `PROP-FULLHS-CLSAFE`.
We also define some addional lemmas for this case. Check README in the folder.

#### 9. `inputs`
Input files for IPSG to re-generate our proof scores.
These files are used in script `gen-proof.sh`.

#### 10. `others`
In file `exec.cafe`, we show that two parties can complete a session, obtaining the same handshake keys.
It implies that our model is executable and eliminates the suspicion that our verification results are achieved simply because the specification is not executed.