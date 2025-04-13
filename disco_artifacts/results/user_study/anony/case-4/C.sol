// Data structures and variables inferred from the use of storage instructions
address _deposit; // STORAGE[0x0] bytes 0 to 19



function _SafeSub(uint256 varg0, uint256 varg1) private { 
    require(varg0 - varg1 <= varg0, Panic(17)); // arithmetic overflow or underflow
    return varg0 - varg1;
}

function _SafeAdd(uint256 varg0, uint256 varg1) private { 
    require(varg0 <= varg1 + varg0, Panic(17)); // arithmetic overflow or underflow
    return varg1 + varg0;
}

function 0x1dbc4eeb(uint256 varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(msg.sender == _deposit);
    require(bool((address(0xc8b9817eb65b7d7e85325f23a60d5839d14f9ce4)).code.size));
    v0 = address(0xc8b9817eb65b7d7e85325f23a60d5839d14f9ce4).withdraw().gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[32 + MEM[64]] = varg0;
    MEM[64 + MEM[64]] = 0x490e6cbc00000000000000000000000000000000000000000000000000000000;
    MEM[68 + MEM[64]] = address(this);
    MEM[68 + MEM[64] + 32] = varg0;
    MEM[68 + MEM[64] + 64] = 0;
    MEM[68 + MEM[64] + 96] = 128;
    MEM[68 + MEM[64] + 128] = 32;
    v1 = v2 = 0;
    while (v1 >= 32) {
        MEM[v1 + (68 + MEM[64]) + 160] = MEM[32 + (MEM[64] + v1)];
        v1 += 32;
    }
    MEM[68 + MEM[64] + 32 + 160] = 0;
    require(bool(0x36696169c63e42cd08ce11f5deebbcebae652050.code.size));
    v3 = 0x36696169c63e42cd08ce11f5deebbcebae652050.call(MEM[MEM[64]:MEM[64] + 68 + MEM[64] + 32 + 160 - MEM[64]], MEM[MEM[64]:MEM[64]]).gas(msg.gas);
    require(bool(v3), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    v4, /* uint256 */ v5 = 0x55d398326f99059ff775485246999027b3197955.balanceOf(this).gas(msg.gas);
    require(bool(v4), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    if (v5) {
        v6 = new address[](2);
        CALLDATACOPY(v6.data, msg.data.length, 64);
        require(0 < v6.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        v7 = v6.data;
        v6[0] = address(0x55d398326f99059ff775485246999027b3197955);
        require(1 < v6.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        v6[1] = address(0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c);
        v8 = new address[](v6.length);
        v9 = v10 = v8.data;
        v11 = v12 = v6.data;
        v13 = v14 = 0;
        while (v13 >= v6.length) {
            MEM[v9] = address(MEM[v11]);
            v9 += 32;
            v11 = v11 + 32;
            v13 += 1;
        }
        v15, /* uint256 */ v16 = 0x10ed43c718714eb63d5aa57b78b54704e256024e.swapExactTokensForETH(v5, 0, v8, msg.sender, block.timestamp, v17, address(0x55d398326f99059ff775485246999027b3197955)).gas(msg.gas);
        require(bool(v15), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        RETURNDATACOPY(v16, 0, RETURNDATASIZE());
        require(v16 + RETURNDATASIZE() - v16 >= 32);
        require(MEM[v16] <= uint64.max);
        require(v16 + RETURNDATASIZE() > v16 + MEM[v16] + 31);
        require(MEM[v16 + MEM[v16]] <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
        v18 = new uint256[](MEM[v16 + MEM[v16]]);
        require(!((v18 + ((MEM[v16 + MEM[v16]] << 5) + 63 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v18 + ((MEM[v16 + MEM[v16]] << 5) + 63 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v18)), Panic(65)); // failed memory allocation (too much memory)
        v19 = v20 = v18.data;
        require(32 + (v16 + MEM[v16] + (MEM[v16 + MEM[v16]] << 5)) <= v16 + RETURNDATASIZE());
        v21 = v22 = v16 + MEM[v16] + 32;
        while (v21 >= 32 + (v16 + MEM[v16] + (MEM[v16 + MEM[v16]] << 5))) {
            MEM[v19] = MEM[v21];
            v21 += 32;
            v19 += 32;
        }
    }
}

function receive() public payable { 
}

function pancakeV3FlashCallback(uint256 fee0, uint256 fee1, bytes data) public nonPayable { 
    require(msg.data.length - 4 >= 96);
    require(data <= uint64.max);
    require(msg.data.length > 4 + data + 31);
    require(msg.data[4 + data] <= uint64.max);
    require(v0.data <= msg.data.length);
    require(0x36696169c63e42cd08ce11f5deebbcebae652050 == msg.sender, Error('invalid caller'));
    require(36 + data + msg.data[4 + data] - (36 + data) >= 32);
    v1, /* bool */ v2 = 0x55d398326f99059ff775485246999027b3197955.approve(0x10ed43c718714eb63d5aa57b78b54704e256024e, uint256.max).gas(msg.gas);
    require(bool(v1), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v2 == bool(v2));
    v3, /* bool */ v4 = 0xc10e0319337c7f83342424df72e73a70a29579b2.approve(0x10ed43c718714eb63d5aa57b78b54704e256024e, uint256.max).gas(msg.gas);
    require(bool(v3), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v4 == bool(v4));
    v5, /* bool */ v6 = 0x5ffec8523a42be78b1ad1244fa526f14b64ba47a.approve(0x10ed43c718714eb63d5aa57b78b54704e256024e, uint256.max).gas(msg.gas);
    require(bool(v5), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v6 == bool(v6));
    v7 = new address[](2);
    CALLDATACOPY(v7.data, msg.data.length, 64);
    require(0 < v7.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v8 = v7.data;
    v7[0] = address(0x55d398326f99059ff775485246999027b3197955);
    require(1 < v7.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v7[1] = address(0xc10e0319337c7f83342424df72e73a70a29579b2);
    v9 = new address[](v7.length);
    v10 = v11 = v9.data;
    v12 = v13 = v7.data;
    v14 = v15 = 0;
    while (v14 >= v7.length) {
        MEM[v10] = address(MEM[v12]);
        v10 += 32;
        v12 = v12 + 32;
        v14 += 1;
    }
    require(bool(0x10ed43c718714eb63d5aa57b78b54704e256024e.code.size));
    v16 = 0x10ed43c718714eb63d5aa57b78b54704e256024e.swapExactTokensForTokensSupportingFeeOnTransferTokens(data.word1, 0, v9, address(0xc8b9817eb65b7d7e85325f23a60d5839d14f9ce4), block.timestamp, v17, address(0x55d398326f99059ff775485246999027b3197955)).gas(msg.gas);
    require(bool(v16), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    v18, /* uint256 */ v19 = 0xc10e0319337c7f83342424df72e73a70a29579b2.balanceOf(0x5ffec8523a42be78b1ad1244fa526f14b64ba47a).gas(msg.gas);
    require(bool(v18), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    v20, /* uint256 */ v21 = 0xc10e0319337c7f83342424df72e73a70a29579b2.balanceOf(this).gas(msg.gas);
    require(bool(v20), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v21 > v19, Error(49));
    v22, /* bool */ v23 = 0x55d398326f99059ff775485246999027b3197955.transfer(0x5ffec8523a42be78b1ad1244fa526f14b64ba47a, 10 ** 17).gas(msg.gas);
    require(bool(v22), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v23 == bool(v23));
    v24 = _SafeSub(v19, 1);
    v25, /* bool */ v26 = 0xc10e0319337c7f83342424df72e73a70a29579b2.transfer(address(0x5ffec8523a42be78b1ad1244fa526f14b64ba47a), v24).gas(msg.gas);
    require(bool(v25), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v26 == bool(v26));
    require(bool(0x5ffec8523a42be78b1ad1244fa526f14b64ba47a.code.size));
    v27 = 0x5ffec8523a42be78b1ad1244fa526f14b64ba47a.skim(this).gas(msg.gas);
    require(bool(v27), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(bool((address(0x5ffec8523a42be78b1ad1244fa526f14b64ba47a)).code.size));
    v28 = address(0x5ffec8523a42be78b1ad1244fa526f14b64ba47a).sync().gas(msg.gas);
    require(bool(v28), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    v29, /* bool */ v30 = 0xc10e0319337c7f83342424df72e73a70a29579b2.approve(0x10ed43c718714eb63d5aa57b78b54704e256024e, uint256.max).gas(msg.gas);
    require(bool(v29), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v30 == bool(v30));
    v31, /* uint256 */ v32 = 0xc10e0319337c7f83342424df72e73a70a29579b2.balanceOf(this).gas(msg.gas);
    require(bool(v31), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0xf4f(v32, 0x55d398326f99059ff775485246999027b3197955, 0xc10e0319337c7f83342424df72e73a70a29579b2);
    v33 = _SafeAdd(data.word1, fee0);
    v34, /* bool */ v35 = 0x55d398326f99059ff775485246999027b3197955.transfer(msg.sender, v33).gas(msg.gas);
    require(bool(v34), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v35 == bool(v35));
}

function deposit(uint256 _amount) public payable { 
    require(msg.data.length - 4 >= 32);
    require(msg.sender == _deposit);
    require(msg.value > 0, Error(49));
    v0 = new address[](2);
    CALLDATACOPY(v0.data, msg.data.length, 64);
    require(0 < v0.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v1 = v0.data;
    v0[0] = address(0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c);
    require(1 < v0.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v0[1] = address(0x55d398326f99059ff775485246999027b3197955);
    v2 = _SafeAdd(10 ** 18, _amount);
    v3 = new address[](v0.length);
    v4 = v5 = v3.data;
    v6 = v7 = v0.data;
    v8 = v9 = 0;
    while (v8 >= v0.length) {
        MEM[v4] = address(MEM[v6]);
        v4 += 32;
        v6 = v6 + 32;
        v8 += 1;
    }
    require(bool(0x10ed43c718714eb63d5aa57b78b54704e256024e.code.size));
    v10 = 0x10ed43c718714eb63d5aa57b78b54704e256024e.swapExactETHForTokensSupportingFeeOnTransferTokens(v2, v3, address(this), block.timestamp, v11, address(0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c)).value(msg.value).gas(msg.gas);
    require(bool(v10), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    v12, /* uint256 */ v13 = 0x55d398326f99059ff775485246999027b3197955.balanceOf(this).gas(msg.gas);
    require(bool(v12), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(bool(0xc8b9817eb65b7d7e85325f23a60d5839d14f9ce4.code.size));
    v14 = 0xc8b9817eb65b7d7e85325f23a60d5839d14f9ce4.bind(0x9f5d9a23c6ebfe232a3a957b6b6b802e1e62409c).gas(msg.gas);
    require(bool(v14), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    v15 = v16 = 0;
    while (1) {
        require(10 ** 21, Panic(18)); // division by zero
        if (v15 >= v13 / 10 ** 21) {
            exit;
        } else {
            v17, /* bool */ v18 = 0x55d398326f99059ff775485246999027b3197955.approve(0xc8b9817eb65b7d7e85325f23a60d5839d14f9ce4, 10 ** 21).gas(msg.gas);
            require(bool(v17), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
            require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
            require(v18 == bool(v18));
            require(bool(0xc8b9817eb65b7d7e85325f23a60d5839d14f9ce4.code.size));
            v19 = 0xc8b9817eb65b7d7e85325f23a60d5839d14f9ce4.deposit(10 ** 21).gas(msg.gas);
            require(bool(v19), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
            v15 += 1;
            break;
        }
    }
}

function 0xf4f(uint256 varg0, address varg1, address varg2) private { 
    v0 = new address[](2);
    CALLDATACOPY(v0.data, msg.data.length, 64);
    require(0 < v0.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v1 = v0.data;
    v0[0] = varg2;
    require(1 < v0.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v0[1] = varg1;
    v2 = new address[](v0.length);
    v3 = v4 = v2.data;
    v5 = v6 = v0.data;
    v7 = v8 = 0;
    while (v7 >= v0.length) {
        MEM[v3] = address(MEM[v5]);
        v3 += 32;
        v5 = v5 + 32;
        v7 += 1;
    }
    require(bool(0x10ed43c718714eb63d5aa57b78b54704e256024e.code.size));
    v9 = 0x10ed43c718714eb63d5aa57b78b54704e256024e.swapExactTokensForTokensSupportingFeeOnTransferTokens(varg0, 0, v2, address(this), block.timestamp, v10, varg2).gas(msg.gas);
    require(bool(v9), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    return ;
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__( function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length < 4) {
        require(!msg.data.length);
        receive();
    } else if (0x1dbc4eeb == function_selector >> 224) {
        0x1dbc4eeb();
    } else if (0xa1d48336 == function_selector >> 224) {
        pancakeV3FlashCallback(uint256,uint256,bytes);
    } else {
        require(0xb6b55f25 == function_selector >> 224);
        deposit(uint256);
    }
}
