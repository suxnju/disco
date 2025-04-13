For the payable constructor function.
- the state variable transfer_proxy_vefx will be updated to 0x7e03D2B8edc3585eCd8A5807661fff0830a0b603.
- the state variable transfer_proxy_v2 will be updated to 0x2240Dab907db71e64d3E0dbA4800c83B5C502d4E.
- the state variable originaltoken will be updated to 0.

For the isValidSignature function, it has 4 arguments and the type of each argument is as follows: bytes32, uint8, bytes32, bytes32.
- it calls a built-in function ecrecover with the following argument list: SHA3(0x19457468657265756d205369676e6564204d6573736167653a0a3332,the first argument), the second argument, the third argument, and the fourth argument.

For the withdraw function, it has 5 arguments and the type of each argument is as follows: uint256, uint8, bytes32, bytes32, uint256.
- When the balance of caller is not smaller than the first argument:
  - After the depositlock of caller:
    - the balance of caller will be updated to (the balance of caller-the first argument).
  - the state variable totalsupply will be updated to (totalsupply-the ether just received (i.e., msg.value)).
  - it transfers ether valued the first argument to caller.
  - the depositlock of caller will be updated to 0.
  - When the fifth argument is greater than the current block's number, and before the depositlock of caller:
    - it calls a built-in function ecrecover with the following argument list: SHA3(0x19457468657265756d205369676e6564204d6573736167653a0a3332,SHA3((caller),(the address of this contract*0x1000000000000000000000000),the fifth argument, the second argument, the third argument, and the fourth argument, and gets the returned value as v0.
    - When the issigner of v0 is not 0, and the call or transfer succeeds:
      - the balance of caller will be updated to (the balance of caller-the first argument).

For the transferFrom function, it has 3 arguments and the type of each argument is as follows: address, address, uint256.
- When the issigner of the second argument is not 0:
  - the balance of the second argument will be updated to (the third argument+the balance of the second argument).
  - the balance of the first argument will be updated to (the balance of the first argument-the third argument).
  - After the depositlock of the second argument:
    - the depositlock of the second argument will be updated to (3600+current time).
  - Before the depositlock of the second argument:
    - the depositlock of the second argument will be updated to the depositlock of the second argument.
- When the issigner of the second argument is 0, and the issigner of the first argument is not 0:
  - the balance of the second argument will be updated to (the third argument+the balance of the second argument).
  - the balance of the first argument will be updated to (the balance of the first argument-the third argument).
  - After the depositlock of the second argument:
    - the depositlock of the second argument will be updated to (3600+current time).
  - Before the depositlock of the second argument:
    - the depositlock of the second argument will be updated to the depositlock of the second argument.

For the addSigner function, it has one argument and its type is address.
- When the issigner of caller is not 0:
  - the issigner of the first argument will be updated to 1.

For the transferOwnership function, it has one argument and its type is address.
- For owner, and the first argument is not 0:
  - the state variable owner will be updated to the first argument.

For the payable deposit function, it has 2 arguments and the type of each argument is as follows: uint256, uint256.
- When the second argument is not smaller than 1, and ((the second argument*3600)+current time) is not smaller than the depositlock of caller:
  - the balance of caller will be updated to (the ether just received (i.e., msg.value)+the balance of caller).
  - the state variable totalsupply will be updated to (the ether just received (i.e., msg.value)+totalsupply).
  - the depositlock of caller will be updated to ((the second argument*3600)+current time).

For the withdrawDifferentToken function, it has 2 arguments and the type of each argument is as follows: address, bool.
- For owner:
  - it calls an external function balanceOf of the first argument with the address of this contract as the argument, and gets the returned value as v2.
  - When v0 is greater than 0, and the call or transfer succeeds:
    - When the second argument is not 0:
      - it calls an external function balanceOf of the first argument with the address of this contract as the argument, and gets the returned value as v2.
      - it calls an external function transfer of the first argument with the following argument list: caller, and v1.
    - When the second argument is 0:
      - it calls an external function balanceOf of the first argument with the address of this contract as the argument, and gets the returned value as v2. Afterthat, 
        - it calls an external function transfer of the first argument with the following argument list: caller, and v2.