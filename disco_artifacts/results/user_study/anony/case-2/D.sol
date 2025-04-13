pragma solidity ^0.6.12;

contract TokenContract {
    using SafeMath for uint256;

    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;
    string public name;
    uint8 public decimals;
    string public symbol;
    string public version;
    uint256 public unitsOneEthCanBuy;
    uint256 public totalEthInWei;
    address payable public fundsWallet;
    uint256 public totalSupply;

    constructor() public payable {
        balanceOf[msg.sender] = 0x204fce5e3e25026110000000;
        totalSupply = 0x204fce5e3e25026110000000;
        decimals = 18;
        unitsOneEthCanBuy = 0x3635c9adc5dea00000;
        fundsWallet = msg.sender;
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value && _value > 0);
        balanceOf[msg.sender] = balanceOf[msg.sender].sub(_value);
        balanceOf[_to] = balanceOf[_to].add(_value);
        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        return true;
    }

    function approveAndCall(address _spender, uint256 _value, bytes memory _extraData) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        (bool success, ) = _spender.call(abi.encodeWithSignature("receiveApproval(address,uint256,address,bytes)", msg.sender, _value, this, _extraData));
        require(success);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= allowance[_from][msg.sender] && _value <= balanceOf[_from]);
        balanceOf[_from] = balanceOf[_from].sub(_value);
        balanceOf[_to] = balanceOf[_to].add(_value);
        allowance[_from][msg.sender] = allowance[_from][msg.sender].sub(_value);
        return true;
    }

    receive() external payable {
        totalEthInWei = totalEthInWei.add(msg.value);
        uint256 amount = msg.value.mul(unitsOneEthCanBuy);
        require(balanceOf[fundsWallet] >= amount);

        balanceOf[fundsWallet] = balanceOf[fundsWallet].sub(amount);
        balanceOf[msg.sender] = balanceOf[msg.sender].add(amount);

        fundsWallet.transfer(msg.value);
    }
}

library SafeMath {
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }
}