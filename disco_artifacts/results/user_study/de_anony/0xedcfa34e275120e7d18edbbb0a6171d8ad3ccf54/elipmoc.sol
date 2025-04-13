// Data structures and variables inferred from the use of storage instructions
address _test1; // STORAGE[0x0] bytes 0 to 19
address _test2; // STORAGE[0x3] bytes 0 to 19
address _test3; // STORAGE[0x4] bytes 0 to 19
address _withdraw; // STORAGE[0x5] bytes 0 to 19
address _test; // STORAGE[0x6] bytes 0 to 19



function test() public nonPayable {  find similar
    require(bool(_test.code.size));
    v0 = _test.flashLoan(0, 0x17b7883c06916600000, address(this), 12408).gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
}

function _SafeMul(uint256 varg0, uint256 varg1) private { 
    require(!varg0 | (varg1 == varg0 * varg1 / varg0), Panic(17)); // arithmetic overflow or underflow
    return varg0 * varg1;
}

function _SafeDiv(uint256 varg0, uint256 varg1) private { 
    require(varg1, Panic(18)); // division by zero
    return varg0 / varg1;
}

function receive() public payable {  find similar
}

function test3() public nonPayable {  find similar
    v0, /* uint256 */ v1 = _test3.balanceOf(_test1).gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    v2 = _SafeMul(v1, 1015);
    v3 = _SafeDiv(v2, 1000);
    require(bool(_test1.code.size));
    v4 = _test1.call(uint32(0xd9b6f615), v3, False, uint8(0)).gas(msg.gas);
    require(bool(v4), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
}

function withdraw() public nonPayable {  find similar
    require(msg.sender == _withdraw, Error(0x6572726f722c));
    v0 = _withdraw.call().value(this.balance).gas(!this.balance * 2300);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
}

function withdrawtoken(address robotaddr) public nonPayable {  find similar
    require(4 + (msg.data.length - 4) - 4 >= 32);
    require(msg.sender == _withdraw, Error('error'));
    v0, /* uint256 */ v1 = robotaddr.balanceOf(address(this)).gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    v2, /* bool */ v3 = robotaddr.transfer(_withdraw, v1).gas(msg.gas);
    require(bool(v2), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v3 == bool(v3));
}

function test2() public nonPayable {  find similar
    v0, /* uint256 */ v1 = _test2.balanceOf(_test1).gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    v2 = _SafeMul(v1, 1015);
    v3 = _SafeDiv(v2, 1000);
    require(bool(_test1.code.size));
    v4 = _test1.call(uint32(0xd9b6f615), v3, False, uint8(1)).gas(msg.gas);
    require(bool(v4), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
}

function test1() public nonPayable {  find similar
    require(bool(_test1.code.size));
    v0 = _test1.call(uint32(0x5fb3b5a3), 10 ** 21, 0, uint8(1), False).gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
}

function DPPFlashLoanCall(address sender, uint256 baseAmount, uint256 quoteAmount, bytes data) public nonPayable {  find similar
    require(4 + (msg.data.length - 4) - 4 >= 128);
    require(data <= uint64.max);
    require(4 + data + 31 < 4 + (msg.data.length - 4));
    require(data.length <= uint64.max);
    require(data.data + data.length <= 4 + (msg.data.length - 4));
    require(bool(_test1.code.size));
    v0 = _test1.call(uint32(0x5fb3b5a3), 10 ** 21, 0, uint8(1), False).gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(bool(_test1.code.size));
    v1 = _test1.call(uint32(0x5fb3b5a3), 10 ** 21, 0, uint8(1), False).gas(msg.gas);
    require(bool(v1), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(bool(_test1.code.size));
    v2 = _test1.call(uint32(0x5fb3b5a3), 10 ** 21, 0, uint8(1), False).gas(msg.gas);
    require(bool(v2), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(bool(_test1.code.size));
    v3 = _test1.call(uint32(0x5fb3b5a3), 10 ** 21, 0, uint8(1), False).gas(msg.gas);
    require(bool(v3), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(bool(_test1.code.size));
    v4 = _test1.call(uint32(0x5fb3b5a3), 10 ** 21, 0, uint8(1), False).gas(msg.gas);
    require(bool(v4), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(bool(_test1.code.size));
    v5 = _test1.call(uint32(0x5fb3b5a3), 10 ** 21, 0, uint8(1), False).gas(msg.gas);
    require(bool(v5), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(bool(_test1.code.size));
    v6 = _test1.call(uint32(0x5fb3b5a3), 10 ** 21, 0, uint8(1), False).gas(msg.gas);
    require(bool(v6), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    v7, /* uint256 */ v8 = _test2.balanceOf(_test1).gas(msg.gas);
    require(bool(v7), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    v9 = _SafeMul(v8, 1015);
    v10 = _SafeDiv(v9, 1000);
    require(bool(_test1.code.size));
    v11 = _test1.call(uint32(0xd9b6f615), v10, False, uint8(1)).gas(msg.gas);
    require(bool(v11), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    v12, /* uint256 */ v13 = _test3.balanceOf(_test1).gas(msg.gas);
    require(bool(v12), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    v14 = _SafeMul(v13, 1015);
    v15 = _SafeDiv(v14, 1000);
    require(bool(_test1.code.size));
    v16 = _test1.call(uint32(0xd9b6f615), v15, False, uint8(0)).gas(msg.gas);
    require(bool(v16), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    v17, /* bool */ v18 = _test2.transfer(_test, 0x17b7883c06916600000).gas(msg.gas);
    require(bool(v17), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v18 == bool(v18));
    v19, /* uint256 */ v20 = _test2.balanceOf(address(this)).gas(msg.gas);
    require(bool(v19), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    v21, /* bool */ v22 = _test2.transfer(address(0xe763da20e25103da8e6afa84b6297f87de557419), v20).gas(msg.gas);
    require(bool(v21), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v22 == bool(v22));
    v23, /* uint256 */ v24 = _test3.balanceOf(address(this)).gas(msg.gas);
    require(bool(v23), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    v25, /* bool */ v26 = _test3.transfer(address(0xe763da20e25103da8e6afa84b6297f87de557419), v24).gas(msg.gas);
    require(bool(v25), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v26 == bool(v26));
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__( function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length < 4) {
        if (!msg.data.length) {
            receive();
        }
    } else if (0x66e41cb7 > function_selector >> 224) {
        if (0xa8e8e01 == function_selector >> 224) {
            test3();
        } else if (0x3ccfd60b == function_selector >> 224) {
            withdraw();
        } else if (0x59e900c8 == function_selector >> 224) {
            withdrawtoken(address);
        }
    } else if (0x66e41cb7 == function_selector >> 224) {
        test2();
    } else if (0x6b59084d == function_selector >> 224) {
        test1();
    } else if (0x7ed1f1dd == function_selector >> 224) {
        DPPFlashLoanCall(address,uint256,uint256,bytes);
    } else if (0xf8a8fd6d == function_selector >> 224) {
        test();
    }
}
