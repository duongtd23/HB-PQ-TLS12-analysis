## PQ primitives are unsafe, while classical primitives are safe (Client authentication is not desired)

We consider the extended protocol in case client authentication is not desired and PQ primitives are unsafe, while classical primitives are safe.

Be sure to check `no-client-auth/README.md` first.

In this folder, you can find:

#### 1. `properties-pqunsafe-fullhs.cafe`
Specification of some additional lemmas in this case wrt the full handshake.
Those lemmas are used to prove some properties and lemmas, which are defined in module `PROP-FULLHS`, wrt module `PROP-FULLHS-CLSAFE`.

#### 2. `properties-pqunsafe-abbrhs.cafe`
Specification of some additional lemmas in this case wrt the abbreviated handshake.
Those lemmas are used to prove some properties and lemmas, which are defined in module `PROP-ABBRHS`, wrt module `PROP-ABBRHS-CLSAFE`.

#### 3. `gen-proof.sh`
Script to replicate our proofs with IPSG.
Be sure to modify your paths to Maude and IPSG in the script properly.

#### 4. `full-hs`
The proofs wrt module `PROP-FULLHS-CLSAFE` of (a) lemmas defined in `properties-pqunsafe-fullhs.cafe` and 
(b) the properties and lemmas defined in module `PROP-FULLHS` and needed to be proven separately wrt module `PROP-FULLHS-PQSAFE` and wrt module `PROP-FULLHS-CLSAFE` (check `no-client-auth/README.md`).

#### 5. `abbr-hs`
The proofs wrt module `PROP-ABBRHS-CLSAFE` of (a) lemmas defined in `properties-pqunsafe-abbrhs.cafe` and 
(b) the properties and lemmas defined in module `PROP-ABBRHS` and needed to be proven separately wrt module `PROP-ABBRHS-PQSAFE` and wrt module `PROP-ABBRHS-CLSAFE` (check `no-client-auth/README.md`).


#### 6. `inputs`
Input files for IPSG to re-generate our proof scores in this case.
These files are used in script `gen-proof.sh`.