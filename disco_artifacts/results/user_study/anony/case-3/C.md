For the function withdraw()
- it is required that (caller == stor_5)
  - it transfers address(this).balance wei to stor_5
  - it is required that the 1st external call succeeds

For the function withdrawtoken(address param0)
- it is required that (caller == stor_5)
  - it triggers the 1st external call of param0.balanceOf(address account), and parameters 0xeDcfA34E275120E7D18EDbbb0A6171d8ad3CCF54.
  - it is required that the 1st external call succeeds
    - it triggers the 2nd external call of param0.transfer(address recipient, uint256 amount), and parameters 0x625169Ec47068682EFC1738915F834a90Bf8b805, the 1st return data of the the 1st external call.
    - it is required that the 2nd external call succeeds

For the payable fallback function

For the payable constructor function
- it updates the state variable stor_0 to 0xd8791F0C10B831B605C5D48959EB763B266940B9
- it updates the state variable stor_1 to 0x10ED43C718714eb63d5aA57B78B54704E256024E
- it updates the state variable stor_2 to 0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c
- it updates the state variable stor_3 to 0x55d398326f99059fF775485246999027B3197955
- it updates the state variable stor_4 to 0x8AC76a51cc950d9822D68b83fE1Ad97B32Cd580d
- it updates the state variable stor_6 to 0x6098A5638d8D7e9Ed2f952d35B2b67c34EC6B476
- it creates a new smart contract with creation code 0x608060405273d8791f0c10b831b605c5d48959 and gets a new address a1
- it triggers the 1st external call of the new address a1.test()
