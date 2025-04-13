def storage:
  stor0 is uint8 at storage 0 offset 160
  stor0 is uint8 at storage 0 offset 168
  stor0 is uint128 at storage 0 offset 160
  owner is address at storage 0
  slasherAddress is address at storage 1
  depositorsProxyAddress is address at storage 2
  releaseTimestamp is uint256 at storage 3
  stor4 is mapping of uint8 at storage 4
  stor5 is uint256 at storage 5
  stor6 is uint256 at storage 6

def releaseTimestamp(): # not payable
  return releaseTimestamp

def initialized(): # not payable
  return bool(uint8(stor0.field_160))

def canWithdraw(address _addy): # not payable
  require calldata.size - 4 >= 32
  return bool(stor4[_addy])

def owner(): # not payable
  return owner

def slasher(): # not payable
  return slasherAddress

def depositorsProxy(): # not payable
  return depositorsProxyAddress

def deposited(): # not payable
  return bool(uint8(stor0.field_168))

#
#  Regular functions
#

def _fallback(?): # not payable, default function
  stop

def transferOwnership(address newOwner): # not payable
  require calldata.size - 4 >= 32
  if owner != caller:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                  32,
                  44,
                  0x2e5468652066756e6374696f6e2063616e206f6e6c792062652063616c6c656420627920746865206f776e65,
                  mem[208 len 20]
  if newOwner:
      owner = newOwner

def withdraw(): # not payable
  if not uint8(stor0.field_160):
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                  32,
                  33,
                  0xfe54686520636f6e747261637420776173206e6f7420696e697469616c697a6564,
                  mem[197 len 31]
  if not uint8(stor0.field_168):
      revert with 0, 'no deposits yet'
  if block.timestamp < releaseTimestamp:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                  32,
                  36,
                  0x2e546865206465706f7369742063616e6e6f742062652077697468647261776e20796574,
                  mem[200 len 28]
  if not stor4[caller]:
      revert with 0, 'cannot withdraw from sender'
  stor4[caller] = 0
  call caller with:
     value stor6 wei
       gas 2300 * is_zero(value) wei
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  log Withdraw(
        address user=caller,
        uint256 amount=stor6)

def registerDepositor(address _depositor): # not payable
  require calldata.size - 4 >= 32
  if not uint8(stor0.field_160):
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                  32,
                  33,
                  0xfe54686520636f6e747261637420776173206e6f7420696e697469616c697a6564,
                  mem[197 len 31]
  if uint8(stor0.field_168):
      revert with 0, 'already deposited'
  if depositorsProxyAddress != caller:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                  32,
                  48,
                  0x6e4f6e6c7920746865206465706f7369746f727350726f78792063616e2063616c6c20746869732066756e6374696f6e,
                  mem[212 len 16]
  if stor4[address(_depositor)]:
      revert with 0, 'can only register Depositor once'
  stor4[address(_depositor)] = 1
  stor5++
  log DepositorRegistered(
        address depositorAddress=address(_depositor),
        uint256 numberOfDepositors=stor5 + 1)

def slash(address user): # not payable
  require calldata.size - 4 >= 32
  if not uint8(stor0.field_160):
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                  32,
                  33,
                  0xfe54686520636f6e747261637420776173206e6f7420696e697469616c697a6564,
                  mem[197 len 31]
  if not uint8(stor0.field_168):
      revert with 0, 'no deposits yet'
  if slasherAddress != caller:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                  32,
                  40,
                  0x2e4f6e6c792074686520736c61736865722063616e2063616c6c20746869732066756e6374696f6e,
                  mem[204 len 24]
  if not stor4[address(user)]:
      revert with 0, 'cannot slash address'
  stor4[address(user)] = 0
  call 0x0 with:
     value stor6 wei
       gas 2300 * is_zero(value) wei
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  log Slash(
        address slashedDepositor=address(user),
        uint256 slashedValue=stor6)

def init(uint256 _releaseTimestamp, address _slasher, address _depositorsProxy): # not payable
  require calldata.size - 4 >= 96
  if owner != caller:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                  32,
                  44,
                  0x2e5468652066756e6374696f6e2063616e206f6e6c792062652063616c6c656420627920746865206f776e65,
                  mem[208 len 20]
  if uint8(stor0.field_160):
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                  32,
                  36,
                  0x2e54686520636f6e747261637420697320616c726561647920696e697469616c69736564,
                  mem[200 len 28]
  if _releaseTimestamp <= block.timestamp:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                  32,
                  43,
                  0x655468652072656c656173652074696d657374616d70206d75737420626520696e20746865206675747572,
                  mem[207 len 21]
  releaseTimestamp = _releaseTimestamp
  slasherAddress = _slasher
  depositorsProxyAddress = _depositorsProxy
  owner = 0
  uint8(stor0.field_160) = 1
  Mask(96, 0, stor0.field_160) = 0

def deposit(uint256 _amount) payable: 
  require calldata.size - 4 >= 32
  if not uint8(stor0.field_160):
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                  32,
                  33,
                  0xfe54686520636f6e747261637420776173206e6f7420696e697469616c697a6564,
                  mem[197 len 31]
  if uint8(stor0.field_168):
      revert with 0, 'already deposited'
  if depositorsProxyAddress != caller:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                  32,
                  48,
                  0x6e4f6e6c7920746865206465706f7369746f727350726f78792063616e2063616c6c20746869732066756e6374696f6e,
                  mem[212 len 16]
  if stor5 <= 0:
      revert with 0, 'no depositors'
  if _amount <= 0:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                  32,
                  35,
                  0x2e5f76616c75655065724465706f7369746f72206d75737420626520706f7369746976,
                  mem[199 len 29]
  require stor5
  if _amount != _amount * stor5 / stor5:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                  32,
                  37,
                  0x654f766572666c6f7720696e206465706f736974416d6f756e742063616c63756c6174696f,
                  mem[201 len 27]
  if _amount * stor5 != call.value:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                  32,
                  45,
                  0x72746865206465706f73697420646f6573206e6f74206d61746368207468652072657175697265642076616c75,
                  mem[209 len 19]
  stor6 = _amount
  uint8(stor0.field_168) = 1
  log Deposit(
        uint256 totalRewards=call.value,
        uint256 startTime=_amount,
        uint256 endTime=stor5)
