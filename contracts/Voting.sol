// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// structs are like classes in object-oriented programming.
struct Voter {
    bool isRegistered;
    bool hasVoted;
    uint vote;  //index of the proposal voted for.
}

struct Proposal {
    string name;
    uint voteCount;
}

// In Solidity:
// contracts are like classes in object-oriented programming.
// the first statement in a contract is executed before any other statements, and it can only be a declaration.
contract Voting {

    // The chairperson is the deployer of the contract who has special permissions.
    address public chairperson; 

    // A mapping is like a dictionary (key-value pairs) in object-oriented programming, and it's used to store on-chain data.
    mapping(address => Voter) public voters; // Maps voter addresses to their voter information.

    // Dynamic array to store all proposals.
    Proposal[] public proposals; 

    // The constructor is a special function that is executed only once when the contract is deployed.
    constructor(string[] memory proposalNames) {
    // proposalNames is a dynamic array stored in memory, as opposed to storage. Storage is used for variables that need to persist on-chain.

        // msg.sender is a global variable that contains the address of the account that called the function.
        chairperson = msg.sender; // Sets the contract deployer as the chairperson.
        
        voters[chairperson].isRegistered = true; // Sets the chairperson as a registered voter.

        // Loops through the proposalNames array and creates a new proposal for each name.
        for (uint i = 0; i < proposalNames.length; i++) {
            proposals.push(Proposal({
                name: proposalNames[i],
                voteCount: 0
            }));
        }
    }
}