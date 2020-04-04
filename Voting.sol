pragma solidity ^0.5.0;

contract Voting {
    bytes32 eligibleVotersMerkleRoot;
    mapping(address => bool) voted;
    uint256 yesVotes;
    uint256 noVotes;

    constructor(bytes32 eligibleVotersMerkleRoot_) public {
        eligibleVotersMerkleRoot = eligibleVotersMerkleRoot_ ;
    }

    function leafHash(address leaf) private pure returns(bytes32) {
        return keccak256(abi.encodePacked(uint8(0x00), leaf));
    }

    function nodeHash(bytes32 left, bytes32 right) private pure returns(bytes32) {
        return keccak256(abi.encodePacked(uint8(0x01), left, right));
    }

    function vote(uint256 path, bytes32[] memory witnesses, bool myVote) public {
        require(!voted[msg.sender], "already voted");
        voted[msg.sender] = true;

        if (myVote) yesVotes++;
        else noVotes++;

        // EDIT ME: validate the proof!
          bytes32 nLeafHash;
        nLeafHash = leafHash(msg.sender);
        for(uint32 i=0; i< witnesses.length; i++) {
            if((path & 1)==1) {
                nLeafHash = nodeHash(witnesses[i], nLeafHash);
            }
            else {
                nLeafHash = nodeHash(nLeafHash, witnesses[i]);
            }

            path = path >>1;
        }

        require(eligibleVotersMerkleRoot == nLeafHash, "Its a no match!!!");

    }
}
