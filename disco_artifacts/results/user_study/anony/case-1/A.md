For the payable constructor function.
- the state variable challengeNumber will be updated to 0x230b408bee030c71cc83273533065e07ab3037b85b0248a22284dfd88552cf.

For the payable withdraw function, it has one argument and its type is bytes.
- When the ether just received (i.e., msg.value) >= ((the balance of the address of this contract-the ether just received (i.e., msg.value))*2):
  - it calls a built-in function sha256 with the first argument, and gets the returned value as v0.
  - When v0 == challengeNumber:
    - the contract will be destroyed and its balance will be sent to caller.