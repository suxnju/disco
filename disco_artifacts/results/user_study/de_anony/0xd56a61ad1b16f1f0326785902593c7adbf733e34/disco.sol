pragma solidity 0.6.12;

contract MyContract {
    bool public deposited;
    bool public initialized;
    address public owner;
    address public slasher;
    address public depositorsproxy;
    uint256 public releasetimestamp;
    mapping(address => uint256) public canwithdraw;
    uint256 private totalSupply;
    uint256 private last_completed_migration;
    uint256 private totalSupply1;
    bytes31 private addressOfBountyMembers;

    constructor() public payable {
        totalSupply = 0;
        owner = msg.sender;
    }

    function registerDepositor(address _address) public {
        require(depositorsproxy == msg.sender && !deposited && initialized && canwithdraw[_address] == 0);
        canwithdraw[_address] = 1;
        totalSupply += 1;
    }

    function slash(address _address) public {
        require(initialized && canwithdraw[_address] != 0 && slasher == msg.sender && !deposited);
        canwithdraw[_address] = canwithdraw[_address];
        (bool success, ) = address(0).call{value: last_completed_migration}("");
        require(success, "Transfer failed.");
    }

    function init(uint256 _time, address _slasher, address _proxy) public {
        require(owner == msg.sender && !initialized && _time > block.timestamp);
        releasetimestamp = _time;
        slasher = _slasher;
        depositorsproxy = _proxy;
        totalSupply1 = 0xffffffffffffffffffffffff0000000000000000000000000000000000000000 | 0x10000000000000000000000000000000000000000 | uint256(addressOfBountyMembers);
    }

    function withdraw() public {
        require(canwithdraw[msg.sender] != 0 && initialized && block.timestamp > releasetimestamp && !deposited);
        canwithdraw[msg.sender] = canwithdraw[msg.sender];
        (bool success, ) = msg.sender.call{value: last_completed_migration}("");
        require(success, "Transfer failed.");
    }

    function transferOwnership(address _newOwner) public {
        require(owner == msg.sender && _newOwner != address(0));
        owner = _newOwner;
    }

    function deposit(uint256 _value) public payable {
        require(depositorsproxy == msg.sender && totalSupply != 0 && _value == (_value * totalSupply) / totalSupply && totalSupply > 0 && !deposited && msg.value == (_value * totalSupply) && initialized && _value > 0);
        last_completed_migration = _value;
        deposited = true;
    }
}