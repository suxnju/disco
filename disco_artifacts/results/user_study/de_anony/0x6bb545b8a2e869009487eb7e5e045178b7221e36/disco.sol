pragma solidity 0.6.12;

contract YourContract {
    address public commissiongetter;
    uint256 public minimumethercommission;
    uint256 public minimumtokencommission;
    address public owner;
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalsupply;
    mapping (address => uint256) public balanceof;
    mapping (address => mapping (address => uint256)) public allowance;
    uint256 public buyprice;
    uint256 public sellprice;
    uint8 public closesell;
    mapping (address => bool) public frozenaccount;

    constructor() public payable {
        decimals = 0;
        buyprice = 0x60a24181e4000;
        sellprice = 0x5543df729c000;
        closesell = 0;
        owner = msg.sender;
    }

    function setPrices(uint256 newSellPrice, uint256 newBuyPrice) public {
        require(msg.sender == owner);
        sellprice = newSellPrice;
        buyprice = newBuyPrice;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        return true;
    }

    fallback() external payable {
        uint amount = msg.value / buyprice;
        require(balanceof[address(this)] >= amount);
        balanceof[msg.sender] += amount;
        balanceof[address(this)] -= amount;
    }

    function setStatus(bool status) public {
        require(msg.sender == owner);
        closesell = status ? 1 : 0;
    }

    function withdrawEther(uint256 amount) public {
        require(msg.sender == owner);
        require(amount <= address(this).balance);
        msg.sender.transfer(amount);
    }
    
    function changeMinimumCommission(uint256 newMinimumEtherCommission, uint256 newMinimumTokenCommission) public {
        require(msg.sender == commissiongetter);
        minimumethercommission = newMinimumEtherCommission;
        minimumtokencommission = newMinimumTokenCommission;
    }

    // Rest of the functions...
}