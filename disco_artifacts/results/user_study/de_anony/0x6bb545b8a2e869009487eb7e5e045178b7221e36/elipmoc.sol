// Data structures and variables inferred from the use of storage instructions
uint256 _fallback; // STORAGE[0x1]
uint256 stor_2; // STORAGE[0x2]
uint256[] array_4; // STORAGE[0x4]
uint256[] array_5; // STORAGE[0x5]
uint256 stor_7; // STORAGE[0x7]
mapping (uint256 => uint256) owner_8; // STORAGE[0x8]
mapping (uint256 => mapping (uint256 => uint256)) owner_9; // STORAGE[0x9]
uint256 stor_a; // STORAGE[0xa]
uint256 stor_b; // STORAGE[0xb]
mapping (uint256 => uint256) owner_d; // STORAGE[0xd]
uint256 owner_0_0_19; // STORAGE[0x0] bytes 0 to 19
uint256 ___function_selector__; // STORAGE[0x6] bytes 0 to 0
uint256 stor_c_0_0; // STORAGE[0xc] bytes 0 to 0
uint256 owner_3_0_19; // STORAGE[0x3] bytes 0 to 19


// Events
Withdrawal(address, uint256);
Deposit(address, uint256);
Transfer(address, address, uint256);
FrozenFunds(address, bool);

function function_selector() public payable { 
    assert(bool(stor_a));
    v0 = v1 = msg.value / stor_a * stor_a / 100;
    if (v1 < _fallback) {
        v0 = v2 = _fallback;
    }
    require(v0 <= this.balance);
    v3 = owner_0_0_19.call().value(v0).gas(2300 * !v0);
    require(bool(v3), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    0xbb0(msg.value / stor_a, msg.sender, this);
}

function 0x5df() private { 
    v0 = new bytes[]((array_4.length & ~0 + (!(array_4.length & 0x1) << 8)) >> 1);
    v1 = v2 = v0.data;
    if (!((array_4.length & ~0 + (!(array_4.length & 0x1) << 8)) >> 1)) {
        return v0, v3;
    } else if (31 < (array_4.length & ~0 + (!(array_4.length & 0x1) << 8)) >> 1) {
        v4 = array_4.data;
        do {
            MEM[v1] = STORAGE[v4];
            v4 += 1;
            v1 += 32;
        } while (v2 + ((array_4.length & ~0 + (!(array_4.length & 0x1) << 8)) >> 1) <= v1);
        return v0, v3;
    } else {
        MEM[v2] = array_4.length >> 8 << 8;
        return v0, v3;
    }
}

function 0x878() private { 
    v0 = new bytes[]((array_5.length & ~0 + (!(array_5.length & 0x1) << 8)) >> 1);
    v1 = v2 = v0.data;
    if (!((array_5.length & ~0 + (!(array_5.length & 0x1) << 8)) >> 1)) {
        return v0, v3;
    } else if (31 < (array_5.length & ~0 + (!(array_5.length & 0x1) << 8)) >> 1) {
        v4 = array_5.data;
        do {
            MEM[v1] = STORAGE[v4];
            v4 += 1;
            v1 += 32;
        } while (v2 + ((array_5.length & ~0 + (!(array_5.length & 0x1) << 8)) >> 1) <= v1);
        return v0, v3;
    } else {
        MEM[v2] = array_5.length >> 8 << 8;
        return v0, v3;
    }
}

function 0xbb0(uint256 varg0, address varg1, address varg2) private { 
    require(bool(address(varg1)));
    require(!uint8(owner_d[address(varg2)]));
    require(!uint8(owner_d[address(varg1)]));
    require(varg0 <= owner_8[varg2]);
    require(owner_8[varg1] + varg0 > owner_8[varg1]);
    v0 = varg1;
    owner_8[varg2] = owner_8[varg2] - varg0;
    owner_8[v0] += varg0;
    emit Transfer(varg2, v0, varg0);
    assert(owner_8[v0] + owner_8[varg2] == owner_8[varg2] + owner_8[varg1]);
    return ;
}

function 0xcfd(uint256 varg0) private { 
    assert(bool(stor_b));
    v0 = v1 = varg0 * stor_b / 100 / stor_b;
    if (v1 < stor_2) {
        v0 = v2 = stor_2;
    }
    0xbb0(v0, owner_0_0_19, this);
    return ;
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function function_selector(bytes4 function_selector, uint256 varg1, uint256 varg2, uint256 varg3) public payable { 
    MEM[64] = 128;
    if (msg.data.length >= 4) {
        v0 = uint32(function_selector >> 224);
        if (v0 == 0x5fefda7) {
            require(!msg.value);
            require(msg.sender == owner_3_0_19);
            stor_b = varg1;
            stor_a = varg2;
            exit;
        } else {
            if (0x6fdde03 == v0) {
                require(!msg.value);
                v1 = v2, v3 = 0x5df();
            } else if (0x95ea7b3 == v0) {
                require(!msg.value);
                owner_9[msg.sender][address(varg1)] = varg2;
                return True;
            } else if (0xfc1c83d == v0) {
                require(!msg.value);
                return stor_2;
            } else if (0x18160ddd == v0) {
                require(!msg.value);
                return stor_7;
            } else if (0x23b872dd == v0) {
                require(!msg.value);
                require(varg3 <= owner_9[address(varg1)][msg.sender]);
                0xcfd(varg3);
                owner_9[address(varg1)][msg.sender] = owner_9[address(varg1)][msg.sender] - varg3;
                0xbb0(varg3, address(varg2), address(varg1));
                return True;
            } else if (0x313ce567 == v0) {
                require(!msg.value);
                return ___function_selector__;
            } else if (0x3651b401 == v0) {
                require(!msg.value);
                return owner_0_0_19;
            } else if (0x3bed33ce == v0) {
                require(!msg.value);
                require(msg.sender == owner_3_0_19);
                require(varg1 <= this.balance);
                emit Withdrawal(msg.sender, varg1);
                v4 = owner_3_0_19.call().value(varg1).gas(2300 * !varg1);
                require(bool(v4), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
                exit;
            } else if (0x4b750334 == v0) {
                require(!msg.value);
                return stor_b;
            } else if (0x5c40f6f4 == v0) {
                require(!msg.value);
                require(msg.sender == owner_3_0_19);
                stor_c_0_0 = varg1;
                stor_c_0_0 = varg1;
                exit;
            } else if (0x635875d9 == v0) {
                require(!msg.value);
                require(msg.sender == owner_0_0_19);
                _fallback = varg1;
                stor_2 = varg2;
                exit;
            } else if (0x70a08231 == v0) {
                require(!msg.value);
                return owner_8[address(varg1)];
            } else if (0x7ef5b6ea == v0) {
                require(!msg.value);
                require(msg.sender == owner_3_0_19);
                0xbb0(varg1, this, msg.sender);
                exit;
            } else if (0x8620410b == v0) {
                require(!msg.value);
                return stor_a;
            } else if (0x8da5cb5b == v0) {
                require(!msg.value);
                return owner_3_0_19;
            } else if (0x95d89b41 == v0) {
                require(!msg.value);
                v1 = v5, v6 = 0x878();
            } else if (0x98ea5fca == v0) {
                require(msg.value + this.balance > this.balance);
                emit Deposit(msg.sender, msg.value);
                return True;
            } else if (0xa9059cbb == v0) {
                require(!msg.value);
                0xcfd(varg2);
                0xbb0(varg2, address(varg1), msg.sender);
                exit;
            } else if (0xaf2885b2 == v0) {
                require(!msg.value);
                return _fallback;
            } else if (0xb414d4b6 == v0) {
                require(!msg.value);
                return bool(owner_d[address(varg1)]);
            } else if (0xba83c970 == v0) {
                require(!msg.value);
                return stor_c_0_0;
            } else if (0xc634d032 == v0) {
                require(!msg.value);
                require(msg.sender == owner_3_0_19);
                owner_8[owner_3_0_19] += varg1;
                stor_7 += varg1;
                emit Transfer(0, this, varg1);
                emit Transfer(this, owner_3_0_19, varg1);
                exit;
            } else if (0xdd62ed3e == v0) {
                require(!msg.value);
                return owner_9[address(varg1)][address(varg2)];
            } else if (0xe4849b32 == v0) {
                require(!msg.value);
                require(!stor_c_0_0);
                0xcfd(varg1);
                0xbb0(varg1, this, msg.sender);
                require(varg1 * stor_b <= this.balance);
                v7 = msg.sender.call().value(varg1 * stor_b).gas(2300 * !(varg1 * stor_b));
                require(bool(v7), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
                exit;
            } else if (0xe724529c == v0) {
                require(!msg.value);
                require(msg.sender == owner_3_0_19);
                owner_d[address(varg1)] = bool(varg2) | bytes31(owner_d[address(address(varg1))]);
                emit FrozenFunds(address(varg1), bool(varg2));
                exit;
            } else if (0xed9d7dd3 == v0) {
                require(!msg.value);
                require(msg.sender == owner_0_0_19);
                owner_0_0_19 = address(varg1);
                exit;
            } else if (0xf2fde38b == v0) {
                require(!msg.value);
                require(msg.sender == owner_3_0_19);
                owner_3_0_19 = address(varg1);
                exit;
            }
            v8 = new uint256[](MEM[v1]);
            v9 = v10 = 0;
            while (v9 < MEM[v1]) {
                MEM[v9 + v8.data] = MEM[v9 + (v1 + 32)];
                v9 += 32;
            }
            v11 = v12 = MEM[v1] + v8.data;
            if (0x1f & MEM[v1]) {
                MEM[v12 - (0x1f & MEM[v1])] = ~(256 ** (32 - (0x1f & MEM[v1])) - 1) & MEM[v12 - (0x1f & MEM[v1])];
            }
            return v8;
        }
    }
    fallback();
}
