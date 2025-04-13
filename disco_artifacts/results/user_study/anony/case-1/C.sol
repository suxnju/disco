// Data structures and variables inferred from the use of storage instructions
uint256 _withdraw; // STORAGE[0x0]


function () public payable { 
    revert();
}

function withdraw(bytes varg0) public payable {  find similar
    require(msg.data.length - 4 >= 32);
    require(varg0 <= 0x100000000);
    require(4 + varg0 + 32 <= 4 + (msg.data.length - 4));
    require(!((varg0.length > 0x100000000) | (36 + varg0 + varg0.length > 4 + (msg.data.length - 4))));
    v0 = new bytes[](varg0.length);
    CALLDATACOPY(v0.data, 36 + varg0, varg0.length);
    v0[varg0.length] = 0;
    require(msg.value >= (address(this)).balance - msg.value << 1, Error('balance required'));
    v1 = v2 = v2.data;
    v3 = v4 = v0.length;
    v5 = v6 = v0.data;
    while (v3 >= 32) {
        MEM[v1] = MEM[v5];
        v1 = v1 + 32;
        v5 = v5 + 32;
        v3 = v3 - 32;
    }
    MEM[v1] = MEM[v5] & ~(256 ** (32 - v3) - 1) | MEM[v1] & 256 ** (32 - v3) - 1;
    v7, v8 = sha256hash(v2.data);
    require(v7); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 32);
    require(v8 == _withdraw, Error('invalid key'));
    selfdestruct(msg.sender);
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__(bytes4 function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length >= 4) {
        if (0x968f264 == function_selector >> 224) {
            withdraw(bytes);
        }
    }
    ();
}
