# Lab 2: Voting

Modify the Voting.sol file to properly check the provided merkle tree proof. Your submission should be only your modified Voting.sol file. Do not submit .zip files or anything else, or you will receive 0 (but you can re-submit).

In this lab, we will implement a smart contract that allows certain addresses to vote yes or no on some proposal. We don't want to copy/paste the list of addresses allowed to vote into the smart contract because it may be very large. Instead, we will encode this list as a merkle tree, and voters will need to submit a merkle proof of their eligibility in order to vote.

- Download the voter-tree.js and addresses.txt files.

- Open up the remix solidity IDE, copy your account address, and add it somewhere to the addresses.txt file you downloaded.

`e.g. 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c`

- Generate the merkle root for the addresses.txt file by running the following command:
`node voter-tree.js root addresses.txt`

`e.g. root: 0xcf63af79043aeabfb03ee8791efb37d1af6e37a6c193115c09345981c5e2176b`

- Copy this root and use it as the constructor argument to deploy the Voting.sol file in remix.

- Generate a proof for your address by running the following command (replace the address with your own):

`node voter-tree.js proof addresses.txt 0xca35b7d915458ef540ade6068dfe2f44e8fa733c`

`path: 127
witnesses: ["0x1781de267980837148cb3438f1093188e30b7e9ea6998614b04aed45f006ef13","0xe3e303ee1a484777971a7a0a6e3a211f232b861585c4bb7bd8b910e248d8d324","0x490566d5e086f8709352bfefd8666872c43a4f4232d0e37e9d56c59dbdd1424f","0xda959f12f58af7697902a7e1974e0964c2b4af54462d6283a97c3daea5c55af3","0x1d40ac613d4754161f86eca22ea8ace1edd52e6c0336c4d6d5ae588b136d933a","0xbe2d12956a5300e9a9e36571ed8fd9b55ae2587418e6c7b5969cd8e56ac7ab1a","0x30bbca10b26d589a49af0ed983cf0923d0d6d3307d99ec21ad310d0fb4179e3a"]
`

- Use the proof as input to the vote() function in your solidity program.
