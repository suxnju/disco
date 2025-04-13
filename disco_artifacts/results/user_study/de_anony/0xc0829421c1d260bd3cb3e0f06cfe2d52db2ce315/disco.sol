pragma solidity 0.6.12;

contract YourContract {
    address public owner;
    address public newowner;
    string public standard;
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalsupply;
    mapping (address => uint256) public balanceof;
    mapping (address => mapping (address => uint256)) public allowance;
    
    constructor() public {
        owner = msg.sender;
    }
    
    function approve(address _spender, uint256 _value) public returns (bool success) {
        require(_spender != address(0));
        allowance[msg.sender][_spender] = _value;
        return true;
    }
    
    fallback() external payable {
        balanceof[msg.sender] += msg.value;
        totalsupply += msg.value;
    }
    
    function acceptOwnership() public {
        require(msg.sender == newowner);
        owner = newowner;
        newowner = address(0);
    }
    
    function withdrawTo(address _to, uint256 _value) public {
        require(_to != address(this));
        balanceof[msg.sender] -= _value;
        totalsupply -= _value;
        payable(_to).call.value(_value)("");
    }
    
    function withdrawTokens(address _tokenContract, address _to, uint256 _value) public {
        require(_to != address(this) && owner == msg.sender && _to != address(0) && _tokenContract != address(0));
        ERC20(_tokenContract).transfer(_to, _value);
    }
    
    function withdraw(uint256 _value) public {
        require(msg.sender != address(this));
        balanceof[msg.sender] -= _value;
        totalsupply -= _value;
        payable(msg.sender).call.value(_value)("");
    }
    
    function transferOwnership(address _newowner) public {
        require(owner != _newowner && msg.sender == owner);
        newowner = _newowner;
    }
    
    function deposit() public payable {
        balanceof[msg.sender] += msg.value;
        totalsupply += msg.value;
    }
    
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_to != address(this) && _from != address(0) && _to != address(0));
        allowance[_from][msg.sender] -= _value;
        balanceof[_from] -= _value;
        balanceof[_to] += _value;
        return true;
    }
    
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(_to != address(this) && _to != address(0));
        balanceof[msg.sender] -= _value;
        balanceof[_to] += _value;
        return true;
    }
}

interface ERC20 {
    function transfer(address _to, uint256 _value) external returns (bool success);
}