## Original protocol with Client authentication

In this folder, you can find:

#### 1. `pqtls-ca.cafe`
The CafeOBJ specification of the full handshake in case client authentication is desired. Check the comments embedded in the specification.

#### 2. `properties.cafe`
Specification of security properties and the lemmas to prove them. 

The properties taken into verification are as follows (check our paper for their descriptions):

| Property name                                          | CafeOBJ predicate      |
| -----------                                            | -----------            |
| Confidentiality and Forward secrecy of Session keys    |`ssKeySe` and `ssKeySe2`|
| Confidentiality and Forward secrecy of Session keys w.r.t. abbriviated handshakes   |`ssKeySe-abbr` and `ssKeySe-abbr2`|
| Confidentiality of long-term private keys              | `ltkSe`                |
| Confidentiality of ephemeral secret keys               | `ephSe` and `ephSe2`   |
| Server authentication                                  | `auth`                 |


#### 8. `classic-safe`
The classical setting.

#### 9. `pq-safe`
The quantum setting.