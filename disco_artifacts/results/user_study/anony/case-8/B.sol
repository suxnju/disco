// Data structures and variables inferred from the use of storage instructions
string _standard; // STORAGE[0x2]
string _name; // STORAGE[0x3]
string _symbol; // STORAGE[0x4]
uint256 _totalSupply; // STORAGE[0x6]
mapping (address => uint256) _balanceOf; // STORAGE[0x7]
mapping (address => mapping (address => uint256)) _allowance; // STORAGE[0x8]
address _owner; // STORAGE[0x0] bytes 0 to 19
bool _decimals; // STORAGE[0x5] bytes 0 to 0
address _newOwner; // STORAGE[0x1] bytes 0 to 19


// Events
Issuance(uint256);
Approval(address, address, uint256);
Destruction(uint256);
OwnerUpdate(address, address);
Transfer(address, address, uint256);

function name() public nonPayable {  find similar
    v0 = new bytes[](((!(0x1 & _name.length) << 8) - 1 & _name.length) >> 1);
    v1 = v2 = v0.data;
    if (((!(0x1 & _name.length) << 8) - 1 & _name.length) >> 1) {
        if (31 < ((!(0x1 & _name.length) << 8) - 1 & _name.length) >> 1) {
            v3 = v4 = _name.data;
            do {
                MEM[v1] = STORAGE[v3];
                v3 += 1;
                v1 += 32;
            } while (v2 + (((!(0x1 & _name.length) << 8) - 1 & _name.length) >> 1) > v1);
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

function approve(address spender, uint256 amount) public nonPayable {  find similar
    require(bool(spender));
    v0 = v1 = !amount;
    if (amount) {
        v0 = !_allowance[msg.sender][spender];
    }
    require(bool(v0));
    _allowance[msg.sender][spender] = amount;
    emit Approval(msg.sender, spender, amount);
    return True;
}

function totalSupply() public nonPayable {  find similar
    return _totalSupply;
}

function withdrawTo(address withdrawAddress, uint256 amount) public nonPayable {  find similar
    0x723(amount, withdrawAddress);
}

function transferFrom(address sender, address recipient, uint256 amount) public nonPayable {  find similar
    require(bool(recipient != address(this)));
    require(bool(sender));
    require(bool(recipient));
    v0 = _SafeSub(amount, _allowance[sender][msg.sender]);
    _allowance[sender][msg.sender] = v0;
    v1 = _SafeSub(amount, _balanceOf[sender]);
    _balanceOf[sender] = v1;
    v2 = _SafeAdd(amount, _balanceOf[recipient]);
    _balanceOf[recipient] = v2;
    emit Transfer(sender, recipient, amount);
    assert(True);
    return True;
}

function withdraw(uint256 _amount) public nonPayable {  find similar
    0x723(_amount, msg.sender);
}

function decimals() public nonPayable {  find similar
    return _decimals;
}

function standard() public nonPayable {  find similar
    v0 = new bytes[](((!(0x1 & _standard.length) << 8) - 1 & _standard.length) >> 1);
    v1 = v2 = v0.data;
    if (((!(0x1 & _standard.length) << 8) - 1 & _standard.length) >> 1) {
        if (31 < ((!(0x1 & _standard.length) << 8) - 1 & _standard.length) >> 1) {
            v3 = v4 = _standard.data;
            do {
                MEM[v1] = STORAGE[v3];
                v3 += 1;
                v1 += 32;
            } while (v2 + (((!(0x1 & _standard.length) << 8) - 1 & _standard.length) >> 1) > v1);
        } else {
            MEM[v2] = _standard.length >> 8 << 8;
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

function withdrawTokens(address token, address to, uint256 amount) public nonPayable {  find similar
    assert(_owner == msg.sender);
    require(bool(token));
    require(bool(to));
    require(bool(to != address(this)));
    MEM[32 + MEM[64]] = 0;
    require(bool(token.code.size));
    v0, /* bool */ v1 = token.transfer(to, amount).gas(msg.gas - 710);
    require(bool(v0));
    assert(bool(v1));
}

function balanceOf(address account) public nonPayable {  find similar
    return _balanceOf[account];
}

function acceptOwnership() public nonPayable {  find similar
    require(_newOwner == msg.sender);
    emit OwnerUpdate(_owner, _newOwner);
    _owner = _newOwner;
    _newOwner = 0;
}

function owner() public nonPayable {  find similar
    return _owner;
}

function symbol() public nonPayable {  find similar
    v0 = new bytes[](((!(0x1 & _symbol.length) << 8) - 1 & _symbol.length) >> 1);
    v1 = v2 = v0.data;
    if (((!(0x1 & _symbol.length) << 8) - 1 & _symbol.length) >> 1) {
        if (31 < ((!(0x1 & _symbol.length) << 8) - 1 & _symbol.length) >> 1) {
            v3 = v4 = _symbol.data;
            do {
                MEM[v1] = STORAGE[v3];
                v3 += 1;
                v1 += 32;
            } while (v2 + (((!(0x1 & _symbol.length) << 8) - 1 & _symbol.length) >> 1) > v1);
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
    require(bool(recipient != address(this)));
    require(bool(recipient));
    v0 = _SafeSub(amount, _balanceOf[msg.sender]);
    _balanceOf[msg.sender] = v0;
    v1 = _SafeAdd(amount, _balanceOf[recipient]);
    _balanceOf[recipient] = v1;
    emit Transfer(msg.sender, recipient, amount);
    assert(True);
    return True;
}

function newOwner() public nonPayable {  find similar
    return _newOwner;
}

function allowance(address owner, address spender) public nonPayable {  find similar
    return _allowance[owner][spender];
}

function transferOwnership(address newOwner) public nonPayable {  find similar
    assert(_owner == msg.sender);
    require(_owner != newOwner);
    _newOwner = newOwner;
}

function 0x723(uint256 varg0, address varg1) private { 
    require(bool(varg1 != address(this)));
    v0 = _SafeSub(varg0, _balanceOf[msg.sender]);
    _balanceOf[msg.sender] = v0;
    v1 = _SafeSub(varg0, _totalSupply);
    _totalSupply = v1;
    v2 = varg1.call().value(varg0).gas(2300 * !varg0);
    require(bool(v2));
    emit Transfer(msg.sender, address(this), varg0);
    emit Destruction(varg0);
    return ;
}

function _SafeAdd(uint256 varg0, uint256 varg1) private { 
    assert(varg0 + varg1 >= varg1);
    return varg0 + varg1;
}

function _SafeSub(uint256 varg0, uint256 varg1) private { 
    assert(varg1 >= varg0);
    return varg1 - varg0;
}

function deposit() public payable {  find similar
    v0 = _SafeAdd(msg.value, _balanceOf[msg.sender]);
    _balanceOf[msg.sender] = v0;
    v1 = _SafeAdd(msg.value, _totalSupply);
    _totalSupply = v1;
    emit Issuance(msg.value);
    emit Transfer(address(this), msg.sender, msg.value);
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__( function_selector) public payable { 
    MEM[64] = 96;
    if (uint32(function_selector >> 224) == 0x6fdde03) {
        name();
    } else if (0x95ea7b3 == uint32(function_selector >> 224)) {
        approve(address,uint256);
    } else if (0x18160ddd == uint32(function_selector >> 224)) {
        totalSupply();
    } else if (0x205c2878 == uint32(function_selector >> 224)) {
        withdrawTo(address,uint256);
    } else if (0x23b872dd == uint32(function_selector >> 224)) {
        transferFrom(address,address,uint256);
    } else if (0x2e1a7d4d == uint32(function_selector >> 224)) {
        withdraw(uint256);
    } else if (0x313ce567 == uint32(function_selector >> 224)) {
        decimals();
    } else if (0x5a3b7e42 == uint32(function_selector >> 224)) {
        standard();
    } else if (0x5e35359e == uint32(function_selector >> 224)) {
        withdrawTokens(address,address,uint256);
    } else if (0x70a08231 == uint32(function_selector >> 224)) {
        balanceOf(address);
    } else if (0x79ba5097 == uint32(function_selector >> 224)) {
        acceptOwnership();
    } else if (0x8da5cb5b == uint32(function_selector >> 224)) {
        owner();
    } else if (0x95d89b41 == uint32(function_selector >> 224)) {
        symbol();
    } else if (0xa9059cbb == uint32(function_selector >> 224)) {
        transfer(address,uint256);
    } else {
        if (0xd0e30db0 != uint32(function_selector >> 224)) {
            if (0xd4ee1d90 == uint32(function_selector >> 224)) {
                newOwner();
            } else if (0xdd62ed3e == uint32(function_selector >> 224)) {
                allowance(address,address);
            } else if (0xf2fde38b == uint32(function_selector >> 224)) {
                transferOwnership(address);
            }
        }
        deposit();
    }
}
