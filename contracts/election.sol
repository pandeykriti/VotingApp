pragma solidity ^0.5.16;
contract Election{
	//Model a Candidate
	struct Candidate{
		uint id;
		string name;
		uint voteCount;
	}
	//Store accouns that have voted
	mapping(address=>bool)public voters;
	//Store candidate
	//Fetch Candidates
	mapping(uint=>Candidate) public Candidates;
	//Store Candidates Count
	uint public candidatesCount;
	//voted event
   event votedEvent (
        uint indexed _candidateId
    );
	constructor() public{
    addCandidate("Candidate 1");
	addCandidate("Candidate 2");

	}
	function addCandidate(string memory name)private{
		candidatesCount++;
		Candidates[candidatesCount]=Candidate(candidatesCount,name,0);
	}
	function vote(uint _candidateId) public{
		//require that they haven't voted before
		require(!voters[msg.sender]);
		//require a valid candidate
		require(_candidateId>0 && _candidateId<=candidatesCount ); 
		//record voter has voted
		voters[msg.sender]=true;
		Candidates[_candidateId].voteCount++;
		// trigger voted event
        emit votedEvent(_candidateId);
	}
	}
