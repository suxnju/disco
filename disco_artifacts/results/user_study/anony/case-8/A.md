For the approve function, it has 2 arguments and the type of each argument is as follows: address, uint256.
- When the first argument is not 0:
  - When the second argument is 0:
    - the allowance from caller to the first argument will be updated to the second argument.
  - When the allowance from caller to the first argument is 0, and the second argument is not 0:
    - the allowance from caller to the first argument will be updated to the second argument.

For the payable fallback function.
- the balance of caller will be updated to (the ether just received (i.e., msg.value)+the balance of caller).
- the state variable totalsupply will be updated to (the ether just received (i.e., msg.value)+totalsupply).

For the acceptOwnership function.
- For newowner:
  - the state variable owner will be updated to newowner. Afterthat, 
    - the state variable newowner will be updated to 0.

For the withdrawTo function, it has 2 arguments and the type of each argument is as follows: address, uint256.
- When the first argument does not equal to the address of this contract:
  - the balance of caller will be updated to (the balance of caller-the second argument).
  - the state variable totalsupply will be updated to (totalsupply-the second argument).
  - it transfers ether valued the second argument to the first argument.

For the withdrawTokens function, it has 3 arguments and the type of each argument is as follows: address, address, uint256.
- When the second argument does not equal to the address of this contract, and for owner, and the second argument is not 0, and the first argument is not 0:
  - it calls an external function transfer of the first argument with the following argument list: the second argument, and the third argument.

For the withdraw function, it has one argument and its type is uint256.
- For users, except for the address of this contract:
  - the balance of caller will be updated to (the balance of caller-the first argument).
  - the state variable totalsupply will be updated to (totalsupply-the first argument).
  - it transfers ether valued the first argument to caller.

For the transferOwnership function, it has one argument and its type is address.
- When owner does not equal to the first argument, and for owner:
  - the state variable newowner will be updated to the first argument.

For the payable deposit function.
- the balance of caller will be updated to (the ether just received (i.e., msg.value)+the balance of caller).
- the state variable totalsupply will be updated to (the ether just received (i.e., msg.value)+totalsupply).

For the transferFrom function, it has 3 arguments and the type of each argument is as follows: address, address, uint256.
- When the second argument does not equal to the address of this contract, and the first argument is not 0, and the second argument is not 0:
  - the allowance from the first argument to caller will be updated to (the allowance from the first argument to caller-the third argument).
  - the balance of the first argument will be updated to (the balance of the first argument-the third argument).
  - the balance of the second argument will be updated to (the third argument+the balance of the second argument).

For the transfer function, it has 2 arguments and the type of each argument is as follows: address, uint256.
- When the first argument does not equal to the address of this contract, and the first argument is not 0:
  - the balance of caller will be updated to (the balance of caller-the second argument).
  - the balance of the first argument will be updated to (the second argument+the balance of the first argument).