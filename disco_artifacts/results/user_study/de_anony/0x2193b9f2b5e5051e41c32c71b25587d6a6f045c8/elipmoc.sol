// Data structures and variables inferred from the use of storage instructions
mapping (uint256 => [uint256]) _balanceOf; // STORAGE[0x0]
mapping (uint256 => [uint256]) _allowance; // STORAGE[0x1]
uint256[] _name; // STORAGE[0x3]
uint256[] _symbol; // STORAGE[0x5]
uint256[] _version; // STORAGE[0x6]
uint256 _unitsOneEthCanBuy; // STORAGE[0x7]
uint256 _totalEthInWei; // STORAGE[0x8]
uint256 _totalSupply; // STORAGE[0xa]
uint256 _decimals; // STORAGE[0x4] bytes 0 to 0
uint256 _fundsWallet; // STORAGE[0x9] bytes 0 to 19

// Events
Transfer(address, address, uint256);
Approval(address, address, uint256);

function name() public nonPayable {  find similar
    v0 = new bytes[]((_name.length & ~0 + (!(_name.length & 0x1) << 8)) >> 1);
    v1 = v2 = v0.data;
    if ((_name.length & ~0 + (!(_name.length & 0x1) << 8)) >> 1) {
        if (31 < (_name.length & ~0 + (!(_name.length & 0x1) << 8)) >> 1) {
            do {
                MEM[v1] = STORAGE[v3];
                v3 += 1;
                v1 += 32;
            } while (v2 + ((_name.length & ~0 + (!(_name.length & 0x1) << 8)) >> 1) <= v1);
        } else {
            MEM[v2] = _name.length >> 8 << 8;
        }
    }
    v4 = new array[](v0.length);
    v5 = v6 = 0;
    while (v5 < v0.length) {
        v4[v5] = v0[v5];
        v5 += 32;
    }
    v7 = v0.length + v4.data;
    if (0x1f & v0.length) {
        MEM[v7 - (0x1f & v0.length)] = ~(256 ** (32 - (0x1f & v0.length)) - 1) & MEM[v7 - (0x1f & v0.length)];
    }
    return v4;
}

function approve(address varg0, uint256 varg1) public nonPayable {  find similar
    _allowance[varg0] = varg1;
    emit Approval(msg.sender, varg0, varg1);
    return 1;
}

function totalSupply() public nonPayable {  find similar
    return _totalSupply;
}

function fundsWallet() public nonPayable {  find similar
    return _fundsWallet;
}

function transferFrom(address varg0, address varg1, uint256 varg2) public nonPayable {  find similar
    v0 = v1 = varg2 <= _balanceOf[varg0];
    if (varg2 <= _balanceOf[varg0]) {
        v0 = v2 = varg2 <= _allowance[msg.sender];
    }
    if (v0) {
        v0 = varg2 > 0;
    }
    if (!v0) {
        v3 = v4 = 0;
    } else {
        _balanceOf[varg1] += varg2;
        _balanceOf[varg0] = _balanceOf[varg0] - varg2;
        _balanceOf[msg.sender] = _balanceOf[msg.sender] - varg2;
        emit Transfer(varg0, varg1, varg2);
        v3 = v5 = 1;
    }
    return v3;
}

function decimals() public nonPayable {  find similar
    return _decimals;
}

function version() public nonPayable {  find similar
    v0 = new bytes[]((_version.length & ~0 + (!(_version.length & 0x1) << 8)) >> 1);
    v1 = v2 = v0.data;
    if ((_version.length & ~0 + (!(_version.length & 0x1) << 8)) >> 1) {
        if (31 < (_version.length & ~0 + (!(_version.length & 0x1) << 8)) >> 1) {
            do {
                MEM[v1] = STORAGE[v3];
                v3 += 1;
                v1 += 32;
            } while (v2 + ((_version.length & ~0 + (!(_version.length & 0x1) << 8)) >> 1) <= v1);
        } else {
            MEM[v2] = _version.length >> 8 << 8;
        }
    }
    v4 = new array[](v0.length);
    v5 = v6 = 0;
    while (v5 < v0.length) {
        v4[v5] = v0[v5];
        v5 += 32;
    }
    v7 = v0.length + v4.data;
    if (0x1f & v0.length) {
        MEM[v7 - (0x1f & v0.length)] = ~(256 ** (32 - (0x1f & v0.length)) - 1) & MEM[v7 - (0x1f & v0.length)];
    }
    return v4;
}

function unitsOneEthCanBuy() public nonPayable {  find similar
    return _unitsOneEthCanBuy;
}

function balanceOf(address varg0) public nonPayable {  find similar
    return _balanceOf[varg0];
}

function totalEthInWei() public nonPayable {  find similar
    return _totalEthInWei;
}

function symbol() public nonPayable {  find similar
    v0 = new bytes[]((_symbol.length & ~0 + (!(_symbol.length & 0x1) << 8)) >> 1);
    v1 = v2 = v0.data;
    if ((_symbol.length & ~0 + (!(_symbol.length & 0x1) << 8)) >> 1) {
        if (31 < (_symbol.length & ~0 + (!(_symbol.length & 0x1) << 8)) >> 1) {
            do {
                MEM[v1] = STORAGE[v3];
                v3 += 1;
                v1 += 32;
            } while (v2 + ((_symbol.length & ~0 + (!(_symbol.length & 0x1) << 8)) >> 1) <= v1);
        } else {
            MEM[v2] = _symbol.length >> 8 << 8;
        }
    }
    v4 = new array[](v0.length);
    v5 = v6 = 0;
    while (v5 < v0.length) {
        v4[v5] = v0[v5];
        v5 += 32;
    }
    v7 = v0.length + v4.data;
    if (0x1f & v0.length) {
        MEM[v7 - (0x1f & v0.length)] = ~(256 ** (32 - (0x1f & v0.length)) - 1) & MEM[v7 - (0x1f & v0.length)];
    }
    return v4;
}

function transfer(address varg0, uint256 varg1) public nonPayable {  find similar
    v0 = v1 = varg1 <= _balanceOf[msg.sender];
    if (varg1 <= _balanceOf[msg.sender]) {
        v0 = varg1 > 0;
    }
    if (!v0) {
        v2 = v3 = 0;
        goto 0x5240x710B0x38d;
    } else {
        _balanceOf[msg.sender] = _balanceOf[msg.sender] - varg1;
        _balanceOf[varg0] += varg1;
        emit Transfer(msg.sender, varg0, varg1);
        v2 = v4 = 1;
    }
    return v2;
}

function approveAndCall(address varg0, uint256 varg1, bytes varg2) public nonPayable {  find similar
    v0 = new bytes[](varg2.length);
    v1 = msg.data.length;
    CALLDATACOPY(v0.data, 36 + varg2, varg2.length);
    _allowance[varg0] = varg1;
    emit Approval(msg.sender, varg0, varg1);
    v2 = v3 = 0;
    while (v2 < v0.length) {
        MEM[v2 + (100 + MEM[64])] = v0[v2];
        v2 += 32;
    }
    v4 = v5 = v0.length + (100 + MEM[64]);
    if (0x1f & v0.length) {
        MEM[v5 - (0x1f & v0.length)] = ~(256 ** (32 - (0x1f & v0.length)) - 1) & MEM[v5 - (0x1f & v0.length)];
    }
    v6 = varg0.wipeBlockchain_EkJWPe(msg.sender, varg1, address(this)).gas(msg.gas);
    require(v6);
    return 1;
}

function allowance(address varg0, address varg1) public nonPayable {  find similar
    return _allowance[varg1];
}

function () public payable { 
    _totalEthInWei += msg.value;
    if (msg.value + _unitsOneEthCanBuy - msg.value <= _balanceOf[_fundsWallet]) {
        _balanceOf[_fundsWallet] = _balanceOf[_fundsWallet] - (msg.value + _unitsOneEthCanBuy - msg.value);
        _balanceOf[msg.sender] += msg.value + _unitsOneEthCanBuy - msg.value;
        emit Transfer(_fundsWallet, msg.sender, msg.value + _unitsOneEthCanBuy - msg.value);
        v0 = _fundsWallet.call().value(msg.value).gas(2300 * !msg.value);
        require(v0); // checks call status, propagates error data on error
    }
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__(bytes4 function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length >= 4) {
        if (uint32(function_selector >> 224) == 0x6fdde03) {
            name();
        } else if (0x95ea7b3 == uint32(function_selector >> 224)) {
            approve(address,uint256);
        } else if (0x18160ddd == uint32(function_selector >> 224)) {
            totalSupply();
        } else if (0x2194f3a2 == uint32(function_selector >> 224)) {
            fundsWallet();
        } else if (0x23b872dd == uint32(function_selector >> 224)) {
            transferFrom(address,address,uint256);
        } else if (0x313ce567 == uint32(function_selector >> 224)) {
            decimals();
        } else if (0x54fd4d50 == uint32(function_selector >> 224)) {
            version();
        } else if (0x65f2bc2e == uint32(function_selector >> 224)) {
            unitsOneEthCanBuy();
        } else if (0x70a08231 == uint32(function_selector >> 224)) {
            balanceOf(address);
        } else if (0x933ba413 == uint32(function_selector >> 224)) {
            totalEthInWei();
        } else if (0x95d89b41 == uint32(function_selector >> 224)) {
            symbol();
        } else if (0xa9059cbb == uint32(function_selector >> 224)) {
            transfer(address,uint256);
        } else if (0xcae9ca51 == uint32(function_selector >> 224)) {
            approveAndCall(address,uint256,bytes);
        } else if (0xdd62ed3e == uint32(function_selector >> 224)) {
            allowance(address,address);
        }
    }
    ();
}
