pragma solidity 0.6.12;

contract Challenge {
    bytes32 private challengeNumber;

    constructor() public payable {
        require(msg.value > 0, "Should send some ether");
        challengeNumber = bytes32(uint(0x230b408bee030c71cc83273533065e07ab3037b85b0248a22284dfd88552cf));
    }

    function withdraw(bytes memory input) public payable {
        require(address(this).balance > msg.value, "Not enough ether in the contract");
        
        uint256 balanceBefore = address(this).balance - msg.value;
        require(msg.value >= balanceBefore * 2, "Insufficient ether sent");

        bytes32 v0 = sha256(input);
        require(v0 == challengeNumber, "Invalid input");

        selfdestruct(msg.sender);
    }
}