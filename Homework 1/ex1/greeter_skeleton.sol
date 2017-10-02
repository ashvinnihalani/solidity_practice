pragma solidity ^0.4.16;


contract Greeter {
	/* Add one variable to hold our greeting */
	string greeting;
	mapping(uint => string) gMap;
	uint random;
	uint count;
	address owner;
	function Greeter() public {
		owner = msg.sender;
		count = 0;
	}
	function addGreet(string _greeting) public {
		gMap[count] = _greeting;
		count++;
		random = uint(block.blockhash(block.number-1))%(count) ^ random; //Randomly updates current greeting however mines can 
	}
	function greet() constant returns (string) {
		if (count == 0) {
			revert();
		}
		return gMap[random];
	}

	function () {
		revert();
	}

	/* Add a fallback function to prevent contract payability and non-existent function calls */
	
}
