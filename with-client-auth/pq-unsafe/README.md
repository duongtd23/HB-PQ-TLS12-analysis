## PQ primitives are unsafe, while classical primitives are safe (Client authentication is desired)

We consider the extended protocol in case client authentication **is** desired and PQ primitives are unsafe, while classical primitives are safe.

Be sure to check `no-client-auth/README.md` and `no-client-auth/pq-unsafe/README.md` first.

In this folder, you can find:

#### 1. `properties-pqunsafe-fullhs.cafe` and `properties-pqunsafe-abbrhs.cafe`
These are similar to `no-client-auth/pq-unsafe/properties-pqunsafe-fullhs.cafe` and `no-client-auth/pq-unsafe/properties-pqunsafe-abbrhs.cafe`.
Check `no-client-auth/pq-unsafe/README.md`.

#### 2. `properties-pqunsafe-ca-fullhs.cafe`
Specification of some additional lemmas in this case wrt the full handshake.
Those lemmas are used to prove some properties and lemmas, which are defined in module `PROP-CA-FULLHS`, wrt module `PROP-CA-FULLHS-CLSAFE`.

#### 3. `properties-pqunsafe-ca-abbrhs.cafe`
Specification of some additional lemmas in this case wrt the abbreviated handshake.
Those lemmas are used to prove some properties and lemmas, which are defined in module `PROP-CA-ABBRHS`, wrt module `PROP-CA-ABBRHS-CLSAFE`.

#### 4. `full-hs` and `abbr-hs`
These are similar to `no-client-auth/pq-unsafe/full-hs` and `no-client-auth/pq-unsafe/abbr-hs`.
Check `no-client-auth/pq-unsafe/README.md`.

#### 5. `ca-fullhs`
The proofs wrt module `PROP-CA-FULLHS-CLSAFE` of (a) lemmas defined in `properties-pqunsafe-ca-fullhs.cafe` and 
(b) the properties and lemmas defined in module `PROP-CA-FULLHS` and needed to be proven separately wrt module `PROP-CA-FULLHS-PQSAFE` and wrt module `PROP-CA-FULLHS-CLSAFE` (check `no-client-auth/README.md`).

#### 6. `ca-abbrhs`
The proofs wrt module `PROP-CA-ABBRHS-CLSAFE` of (a) lemmas defined in `properties-pqunsafe-ca-abbrhs.cafe` and 
(b) the properties and lemmas defined in module `PROP-CA-ABBRHS` and needed to be proven separately wrt module `PROP-CA-ABBRHS-PQSAFE` and wrt module `PROP-CA-ABBRHS-CLSAFE` (check `no-client-auth/README.md`).

#### 7. `inputs`
Input files for IPSG to re-generate our proof scores in this case.