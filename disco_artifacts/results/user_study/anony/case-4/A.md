For the function setImpl(address _impl)
- it is required that (caller == stor_0)
  - it updates the state variable stor_1 to _impl

For the function withdrawERC20(address ERC20Token, address recipient)
- it is required that (caller == stor_0)
  - it triggers the 1st external call of ERC20Token.balanceOf(address account), and parameters 0xaaE196b6E3f3Ee34405e857e7bfb05D74c5cf775.
  - it is required that the 1st external call succeeds
    - it triggers the 2nd external call of ERC20Token.transfer(address recipient, uint256 amount), and parameters 0x3779d396E77Bc798378784691247E76BD83bBf17, the 1st return data of the the 1st external call.
    - it is required that the 2nd external call succeeds

For the payable fallback function
- it delegates a call to stor_1 with all parameters
- it is required that the latest delegate_1. call succeeds
  - it returns ext_call_1.return_data[0 len return_data_1.size]

For the constructor function
- it updates the state variable stor_0 to caller
- it creates a new smart contract with creation code 0x6080604052348015600f57600080fd5b506113... and gets a new address a1
- it updates the state variable stor_1 to the new address a1
