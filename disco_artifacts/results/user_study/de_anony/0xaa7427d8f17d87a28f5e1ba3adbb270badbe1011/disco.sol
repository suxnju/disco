pragma solidity 0.6.12;

contract YourContract {
    uint256 public totalsupply;
    address payable public owner;
    address public transfer_proxy_vefx;
    address public transfer_proxy_v2;
    mapping(address => bool) public issigner;
    string public name;
    string public symbol;
    uint256 public decimals;
    address public originaltoken;
    mapping(address => uint256) public depositlock;
    mapping(address => uint256) public balanceof;

    constructor() public payable {
        owner = msg.sender;
        transfer_proxy_vefx = 0x7e03D2B8edc3585eCd8A5807661fff0830a0b603;
        transfer_proxy_v2 = 0x2240Dab907db71e64d3E0dbA4800c83B5C502d4E;
        originaltoken = address(0);
    }

    function isValidSignature(bytes32 hash, uint8 v, bytes32 r, bytes32 s) public pure returns (bool) {
        return ecrecover(keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", hash)), v, r, s) != address(0);
    }

    function withdraw(uint256 _amount, uint8 v, bytes32 r, bytes32 s, uint256 _blockNumber) public {
        require(balanceof[msg.sender] >= _amount);
        balanceof[msg.sender] -= _amount;
        totalsupply -= msg.value;
        msg.sender.transfer(_amount);
        depositlock[msg.sender] = 0;
        if (_blockNumber > block.number) {
            address signer = ecrecover(keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", keccak256(abi.encodePacked(msg.sender, this, _blockNumber)))), v, r, s);
            require(issigner[signer]);
            balanceof[msg.sender] -= _amount;
        }
    }

    function transferFrom(address _from, address _to, uint256 _value) public {
        require(issigner[_to] || issigner[_from]);
        require(balanceof[_from] >= _value);
        balanceof[_from] -= _value;
        balanceof[_to] += _value;
        if (depositlock[_to] <= block.timestamp) {
            depositlock[_to] = block.timestamp + 3600;
        }
    }

    function addSigner(address _signer) public {
        require(issigner[msg.sender]);
        issigner[_signer] = true;
    }

    function transferOwnership(address newOwner) public {
        require(msg.sender == owner && newOwner != address(0));
        owner = newOwner;
    }

    function deposit(uint256 _value, uint256 _lockTime) public payable {
        require(_lockTime >= 1 && (_lockTime*3600 + block.timestamp) >= depositlock[msg.sender]);
        balanceof[msg.sender] += msg.value;
        totalsupply += msg.value;
        depositlock[msg.sender] = _lockTime*3600 + block.timestamp;
    }

    function withdrawDifferentToken(address _token, bool _max) public {
        require(msg.sender == owner);
        uint256 _balance = ERC20(_token).balanceOf(address(this));
        require(_balance > 0);
        if (_max) {
            ERC20(_token).transfer(msg.sender, _balance);
        } else {
            ERC20(_token).transfer(msg.sender, _balance/2);
        }
    }
}