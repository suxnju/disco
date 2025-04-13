// Data structures and variables inferred from the use of storage instructions
uint256 _releaseTimestamp; // STORAGE[0x3]
mapping (address => bool) _canWithdraw; // STORAGE[0x4]
uint256 stor_5; // STORAGE[0x5]
uint256 stor_6; // STORAGE[0x6]
address _owner; // STORAGE[0x0] bytes 0 to 19
address _slasher; // STORAGE[0x1] bytes 0 to 19
address _depositorsProxy; // STORAGE[0x2] bytes 0 to 19
bool _initialized; // STORAGE[0x0] bytes 20 to 20
bool _deposited; // STORAGE[0x0] bytes 21 to 21


// Events
DepositorRegistered(address, uint256);
Withdraw(address, uint256);
Deposit(uint256, uint256, uint256);
Slash(address, uint256);

function canWithdraw(address member) public nonPayable {  find similar
    require(msg.data.length - 4 >= 32);
    return _canWithdraw[member];
}

function registerDepositor(address _depositor) public nonPayable {  find similar
    require(msg.data.length - 4 >= 32);
    require(_initialized, Error('The contract was not initialized.'));
    require(!_deposited, Error('already deposited'));
    require(msg.sender == _depositorsProxy, Error('Only the depositorsProxy can call this function.'));
    require(!_canWithdraw[_depositor], Error('can only register Depositor once'));
    _canWithdraw[_depositor] = 1;
    stor_5 += 1;
    emit DepositorRegistered(_depositor, 1 + stor_5);
}

function withdraw() public nonPayable {  find similar
    require(_initialized, Error('The contract was not initialized.'));
    require(_deposited, Error('no deposits yet'));
    require(block.timestamp >= _releaseTimestamp, Error('The deposit cannot be withdrawn yet.'));
    require(_canWithdraw[msg.sender], Error('cannot withdraw from sender'));
    _canWithdraw[msg.sender] = 0;
    v0 = msg.sender.call().value(stor_6).gas(2300 * !stor_6);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    emit Withdraw(msg.sender, stor_6);
}

function init(uint256 _id, address varg1, address _config) public nonPayable {  find similar
    require(msg.data.length - 4 >= 96);
    require(msg.sender == _owner, Error('The function can only be called by the owner'));
    require(!_initialized, Error('The contract is already initialised.'));
    require(_id > block.timestamp, Error('The release timestamp must be in the future'));
    _releaseTimestamp = _id;
    _slasher = varg1;
    _depositorsProxy = _config;
    _owner = 0;
    _initialized = 1;
}

function owner() public nonPayable {  find similar
    return _owner;
}

function slasher() public nonPayable {  find similar
    return _slasher;
}

function deposit(uint256 _amount) public payable {  find similar
    require(msg.data.length - 4 >= 32);
    require(_initialized, Error('The contract was not initialized.'));
    require(!_deposited, Error('already deposited'));
    require(msg.sender == _depositorsProxy, Error('Only the depositorsProxy can call this function.'));
    require(stor_5 > 0, Error('no depositors'));
    require(_amount > 0, Error('_valuePerDepositor must be positive'));
    assert(stor_5);
    require(_amount == _amount * stor_5 / stor_5, Error('Overflow in depositAmount calculation'));
    require(msg.value == _amount * stor_5, Error('the deposit does not match the required value'));
    stor_6 = _amount;
    _deposited = 1;
    emit Deposit(msg.value, _amount, stor_5);
}

function slash(address _staker) public nonPayable {  find similar
    require(msg.data.length - 4 >= 32);
    require(_initialized, Error('The contract was not initialized.'));
    require(_deposited, Error('no deposits yet'));
    require(msg.sender == _slasher, Error('Only the slasher can call this function.'));
    require(_canWithdraw[_staker], Error('cannot slash address'));
    _canWithdraw[_staker] = 0;
    v0 = 0x0.call().value(stor_6).gas(2300 * !stor_6);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    emit Slash(_staker, stor_6);
}

function depositorsProxy() public nonPayable {  find similar
    return _depositorsProxy;
}

function deposited() public nonPayable {  find similar
    return _deposited;
}

function transferOwnership(address newOwner) public nonPayable {  find similar
    require(msg.data.length - 4 >= 32);
    require(msg.sender == _owner, Error('The function can only be called by the owner'));
    if (newOwner) {
        _owner = newOwner;
    }
}

function fallback() public nonPayable {  find similar
}

function releaseTimestamp() public nonPayable {  find similar
    return _releaseTimestamp;
}

function initialized() public nonPayable {  find similar
    return _initialized;
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__( function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length >= 4) {
        if (0x8da5cb5b > function_selector >> 224) {
            if (0xa3f013f == function_selector >> 224) {
                releaseTimestamp();
            } else if (0x158ef93e == function_selector >> 224) {
                initialized();
            } else if (0x19262d30 == function_selector >> 224) {
                canWithdraw(address);
            } else if (0x38c56be1 == function_selector >> 224) {
                registerDepositor(address);
            } else if (0x3ccfd60b == function_selector >> 224) {
                withdraw();
            } else if (0x4557b4bb == function_selector >> 224) {
                init(uint256,address,address);
            }
        } else if (0x8da5cb5b == function_selector >> 224) {
            owner();
        } else if (0xb1344271 == function_selector >> 224) {
            slasher();
        } else if (0xb6b55f25 == function_selector >> 224) {
            deposit(uint256);
        } else if (0xc96be4cb == function_selector >> 224) {
            slash(address);
        } else if (0xe8823af1 == function_selector >> 224) {
            depositorsProxy();
        } else if (0xeef49ee3 == function_selector >> 224) {
            deposited();
        } else if (0xf2fde38b == function_selector >> 224) {
            transferOwnership(address);
        }
    }
    fallback();
}
