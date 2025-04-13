
pragma solidity 0.6.12;

contract YourContract {
    address private stor_0;
    address private stor_1;

    constructor() public {
        stor_0 = msg.sender;
        bytes memory creationCode = hex"6080604052348015600f57600080fd5b506113";
        assembly {
            let a1 := create(0, add(creationCode, 0x20), mload(creationCode))
            stor_1 := a1
        }
    }

    function setImpl(address _impl) public {
        require(msg.sender == stor_0);
        stor_1 = _impl;
    }

    function withdrawERC20(address ERC20Token, address recipient) public {
        require(msg.sender == stor_0);
        (bool success, bytes memory data) = ERC20Token.call(
            abi.encodeWithSignature("balanceOf(address)", 0xaaE196b6E3f3Ee34405e857e7bfb05D74c5cf775)
        );
        require(success);
        if (success && data.length > 0) {
            uint balance;
            balance =  abi.decode(data, (uint256));
            (bool transferSuccess,) = ERC20Token.call(
                abi.encodeWithSignature("transfer(address,uint256)", recipient, balance)
            );
            require(transferSuccess);
        }
    }

    fallback() external payable {
        (bool success, bytes memory data) = stor_1.delegatecall(msg.data);
        require(success, "Delegatecall failed");
        assembly {
            return(add(data, 0x20), mload(data))
        }
    }

    receive() external payable {
        this.fallback();
    }
}
