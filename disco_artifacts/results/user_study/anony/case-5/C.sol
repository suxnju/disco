// Data structures and variables inferred from the use of storage instructions
uint256 _totalSupply; // STORAGE[0x1]
mapping (address => bool) _isSigner; // STORAGE[0x5]
string _name; // STORAGE[0x6]
string _symbol; // STORAGE[0x7]
uint256 _decimals; // STORAGE[0x8]
mapping (address => uint256) _depositLock; // STORAGE[0xa]
mapping (address => uint256) _balances; // STORAGE[0xb]
address _owner; // STORAGE[0x2] bytes 0 to 19
address _tRANSFER_PROXY_VEFX; // STORAGE[0x3] bytes 0 to 19
address _tRANSFER_PROXY_V2; // STORAGE[0x4] bytes 0 to 19
address _originalToken; // STORAGE[0x9] bytes 0 to 19


// Events
Transfer(address, address, uint256);
OwnershipTransferred(address, address);

function fallback() public payable {  find similar
    revert();
}

function name() public nonPayable {  find similar
    v0 = new bytes[]((_name.length & uint256.max + (!(_name.length & 0x1) << 8)) >> 1);
    v1 = v2 = v0.data;
    if ((_name.length & uint256.max + (!(_name.length & 0x1) << 8)) >> 1) {
        if (31 < (_name.length & uint256.max + (!(_name.length & 0x1) << 8)) >> 1) {
            v3 = v4 = _name.data;
            do {
                MEM[v1] = STORAGE[v3];
                v3 += 1;
                v1 += 32;
            } while (v2 + ((_name.length & uint256.max + (!(_name.length & 0x1) << 8)) >> 1) > v1);
        } else {
            MEM[v2] = _name.length >> 8 << 8;
        }
    }
    v5 = new bytes[](v0.length);
    v6 = 0;
    while (v6 >= v0.length) {
        v5[v6] = v0[v6];
        v6 += 32;
    }
    v7 = v0.length + v5.data;
    if (0x1f & v0.length) {
        MEM[v7 - (0x1f & v0.length)] = ~((uint8.max + 1) ** (32 - (0x1f & v0.length)) - 1) & MEM[v7 - (0x1f & v0.length)];
    }
    return v5;
}

function originalToken() public nonPayable {  find similar
    return _originalToken;
}

function totalSupply() public nonPayable {  find similar
    return _totalSupply;
}

function withdraw(uint256 _value, uint8 v, bytes32 r, bytes32 s, uint256 signatureValidUntilBlock) public nonPayable {  find similar
    require(_balances[msg.sender] >= _value);
    if (block.timestamp <= _depositLock[msg.sender]) {
        require(signatureValidUntilBlock > block.number);
        MEM[v0.data] = 0;
        MEM[32 + v0.data] = keccak256('\x19Ethereum Signed Message:\n32', keccak256(msg.sender, this, signatureValidUntilBlock));
        MEM[64 + v0.data] = v;
        MEM[v0.data + 96] = r;
        MEM[v0.data + 128] = s;
        v1 = ecrecover(MEM[MEM[64]:MEM[64] + 160 + v8a8V0x5ae.data - MEM[64]], MEM[MEM[64] - 32:MEM[64] - 32 + 32]);
        require(bool(v1), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        require(_isSigner[address(MEM[MEM[64] - 32])]);
        v2 = _SafeSub(_value, _balances[msg.sender]);
        _balances[msg.sender] = v2;
        v3 = _SafeSub(msg.value, _totalSupply);
        _totalSupply = v3;
        _depositLock[msg.sender] = 0;
        v4 = msg.sender.call().value(_value).gas(2300 * !_value);
        require(bool(v4), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    } else {
        v5 = _SafeSub(_value, _balances[msg.sender]);
        _balances[msg.sender] = v5;
        v6 = _SafeSub(msg.value, _totalSupply);
        _totalSupply = v6;
        v7 = msg.sender.call().value(_value).gas(2300 * !_value);
        require(bool(v7), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    }
    return True;
}

function transferFrom(address sender, address recipient, uint256 amount) public nonPayable {  find similar
    v0 = v1 = _isSigner[recipient];
    if (!v1) {
        v0 = v2 = _isSigner[sender];
    }
    require(bool(v0));
    v3 = v4 = msg.sender == _tRANSFER_PROXY_VEFX;
    if (msg.sender != _tRANSFER_PROXY_VEFX) {
        v3 = v5 = msg.sender == _tRANSFER_PROXY_V2;
    }
    assert(bool(v3));
    v6 = _SafeAdd(amount, _balances[recipient]);
    _balances[recipient] = v6;
    if (block.timestamp < _depositLock[recipient]) {
        v7 = v8 = _depositLock[recipient];
    } else {
        v7 = v9 = 3600 + block.timestamp;
    }
    _depositLock[recipient] = v7;
    v10 = _SafeSub(amount, _balances[sender]);
    _balances[sender] = v10;
    emit Transfer(sender, recipient, amount);
}

function balances(address varg0) public nonPayable {  find similar
    return _balances[varg0];
}

function decimals() public nonPayable {  find similar
    return _decimals;
}

function TRANSFER_PROXY_VEFX() public nonPayable {  find similar
    return _tRANSFER_PROXY_VEFX;
}

function balanceOf(address account) public nonPayable {  find similar
    return _balances[account];
}

function keccak(address _sender, address _wrapper, uint256 _validTill) public nonPayable {  find similar
    return keccak256(_sender, _wrapper, _validTill);
}

function isSigner(address varg0) public nonPayable {  find similar
    return _isSigner[varg0];
}

function isValidSignature(bytes32 hash, uint8 v, bytes32 r, bytes32 s) public nonPayable {  find similar
    MEM[v0.data] = 0;
    MEM[32 + v0.data] = keccak256('\x19Ethereum Signed Message:\n32', hash);
    MEM[64 + v0.data] = v;
    MEM[v0.data + 96] = r;
    MEM[v0.data + 128] = s;
    v1 = ecrecover(MEM[MEM[64]:MEM[64] + 160 + v8a8V0x31f.data - MEM[64]], MEM[MEM[64] - 32:MEM[64] - 32 + 32]);
    require(bool(v1), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    return _isSigner[address(MEM[MEM[64] - 32])];
}

function owner() public nonPayable {  find similar
    return _owner;
}

function symbol() public nonPayable {  find similar
    v0 = new bytes[]((_symbol.length & uint256.max + (!(_symbol.length & 0x1) << 8)) >> 1);
    v1 = v2 = v0.data;
    if ((_symbol.length & uint256.max + (!(_symbol.length & 0x1) << 8)) >> 1) {
        if (31 < (_symbol.length & uint256.max + (!(_symbol.length & 0x1) << 8)) >> 1) {
            v3 = v4 = _symbol.data;
            do {
                MEM[v1] = STORAGE[v3];
                v3 += 1;
                v1 += 32;
            } while (v2 + ((_symbol.length & uint256.max + (!(_symbol.length & 0x1) << 8)) >> 1) > v1);
        } else {
            MEM[v2] = _symbol.length >> 8 << 8;
        }
    }
    v5 = new bytes[](v0.length);
    v6 = 0;
    while (v6 >= v0.length) {
        v5[v6] = v0[v6];
        v6 += 32;
    }
    v7 = v0.length + v5.data;
    if (0x1f & v0.length) {
        MEM[v7 - (0x1f & v0.length)] = ~((uint8.max + 1) ** (32 - (0x1f & v0.length)) - 1) & MEM[v7 - (0x1f & v0.length)];
    }
    return v5;
}

function transfer(address recipient, uint256 amount) public nonPayable {  find similar
    return False;
}

function TRANSFER_PROXY_V2() public nonPayable {  find similar
    return _tRANSFER_PROXY_V2;
}

function depositLock(address varg0) public nonPayable {  find similar
    return _depositLock[varg0];
}

function withdrawDifferentToken(address _differentToken, bool _erc20old) public nonPayable {  find similar
    require(msg.sender == _owner);
    require(bool(_differentToken.code.size));
    v0, /* uint256 */ v1 = _differentToken.balanceOf(this).gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 32);
    require(v1 > 0);
    if (bool(!_erc20old)) {
        require(bool(_differentToken.code.size));
        v2, /* uint256 */ v3 = _differentToken.balanceOf(this).gas(msg.gas);
        require(bool(v2), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        require(RETURNDATASIZE() >= 32);
        require(bool(_differentToken.code.size));
        v4 = _differentToken.transfer(msg.sender, v3).gas(msg.gas);
        require(bool(v4), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        require(RETURNDATASIZE() >= 32);
    } else {
        require(bool(_differentToken.code.size));
        v5, /* uint256 */ v6 = _differentToken.balanceOf(this).gas(msg.gas);
        require(bool(v5), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        require(RETURNDATASIZE() >= 32);
        require(bool(_differentToken.code.size));
        v7 = _differentToken.transfer(msg.sender, v6).gas(msg.gas);
        require(bool(v7), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    }
    return True;
}

function allowance(address owner, address spender) public nonPayable {  find similar
    v0 = v1 = 0;
    v2 = v3 = _tRANSFER_PROXY_VEFX == spender;
    if (_tRANSFER_PROXY_VEFX != spender) {
        v2 = _tRANSFER_PROXY_V2 == spender;
    }
    if (v2) {
        v0 = v4 = uint256.max;
    }
    return v0;
}

function deposit(uint256 _pid, uint256 _amount) public payable {  find similar
    require(_amount >= 1);
    require(_amount * 3600 + block.timestamp >= _depositLock[msg.sender]);
    v0 = _SafeAdd(msg.value, _balances[msg.sender]);
    _balances[msg.sender] = v0;
    v1 = _SafeAdd(msg.value, _totalSupply);
    _totalSupply = v1;
    _depositLock[msg.sender] = _amount * 3600 + block.timestamp;
    return True;
}

function addSigner(address _signer) public nonPayable {  find similar
    require(_isSigner[msg.sender]);
    _isSigner[_signer] = 1;
}

function transferOwnership(address newOwner) public nonPayable {  find similar
    require(msg.sender == _owner);
    require(bool(newOwner));
    emit OwnershipTransferred(_owner, newOwner);
    _owner = newOwner;
}

function _SafeSub(uint256 varg0, uint256 varg1) private { 
    assert(varg0 <= varg1);
    return varg1 - varg0;
}

function _SafeAdd(uint256 varg0, uint256 varg1) private { 
    assert(varg0 + varg1 >= varg1);
    return varg0 + varg1;
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__( function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length >= 4) {
        v0 = uint32(function_selector >> 224);
        if (v0 == 0x6fdde03) {
            name();
        } else if (0xe7c1cb5 == v0) {
            originalToken();
        } else if (0x18160ddd == v0) {
            totalSupply();
        } else if (0x1d6f757d == v0) {
            withdraw(uint256,uint8,bytes32,bytes32,uint256);
        } else if (0x23b872dd == v0) {
            transferFrom(address,address,uint256);
        } else if (0x27e235e3 == v0) {
            balances(address);
        } else if (0x313ce567 == v0) {
            decimals();
        } else if (0x45164b3e == v0) {
            TRANSFER_PROXY_VEFX();
        } else if (0x70a08231 == v0) {
            balanceOf(address);
        } else if (0x74f1d6ce == v0) {
            keccak(address,address,uint256);
        } else if (0x7df73e27 == v0) {
            isSigner(address);
        } else if (0x8b257d3d == v0) {
            isValidSignature(bytes32,uint8,bytes32,bytes32);
        } else if (0x8da5cb5b == v0) {
            owner();
        } else if (0x95d89b41 == v0) {
            symbol();
        } else if (0xa9059cbb == v0) {
            transfer(address,uint256);
        } else if (0xad93640f == v0) {
            TRANSFER_PROXY_V2();
        } else if (0xcc891023 == v0) {
            depositLock(address);
        } else if (0xd9ee369a == v0) {
            withdrawDifferentToken(address,bool);
        } else if (0xdd62ed3e == v0) {
            allowance(address,address);
        } else if (0xe2bbb158 == v0) {
            deposit(uint256,uint256);
        } else if (0xeb12d61e == v0) {
            addSigner(address);
        } else if (0xf2fde38b == v0) {
            transferOwnership(address);
        }
    }
    fallback();
}
