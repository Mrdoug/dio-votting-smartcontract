// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract DioVotting {
    mapping (string => uint256) public votesReceived;
    string[] public candidateList;

    constructor (string[] memory candidateNames){
        candidateList = candidateNames;
    }

    function totalVotesFor(string memory candidate) view public returns (uint256){
        require(validCandidate(candidate));
        return votesReceived[candidate];
    }

    function voteForCandidate(string memory candidate) public {
        require(validCandidate(candidate));
        votesReceived[candidate] +=1;

    }

    function validCandidate(string memory candidate) view public returns (bool){
        for (uint i =0; i < candidateList.length; i++){
            if(keccak256(abi.encodePacked(candidateList[i]))==keccak256(abi.encodePacked(candidate))){ //abi -application bitecode
                return true;
            }
        }
        return false;
    }
}