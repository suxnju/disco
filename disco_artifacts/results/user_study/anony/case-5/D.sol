const transfer(address recipient, uint256 amount) = 0

def storage:
  totalSupply is uint256 at storage 1
  owner is address at storage 2
  TRANSFER_PROXY_VEFXAddress is address at storage 3
  TRANSFER_PROXY_V2Address is address at storage 4
  stor5 is mapping of uint8 at storage 5
  name is array of uint256 at storage 6
  symbol is array of uint256 at storage 7
  decimals is uint256 at storage 8
  originalTokenAddress is address at storage 9
  depositLock is mapping of uint256 at storage 10
  balances is mapping of uint256 at storage 11

def name(): # not payable
  return name[0 len name.length]

def originalToken(): # not payable
  return originalTokenAddress

def totalSupply(): # not payable
  return totalSupply

def balances(address _param1): # not payable
  return balances[_param1]

def decimals(): # not payable
  return decimals

def TRANSFER_PROXY_VEFX(): # not payable
  return TRANSFER_PROXY_VEFXAddress

def balanceOf(address account): # not payable
  return balances[address(account)]

def isSigner(address account): # not payable
  return bool(stor5[account])

def isValidSignature(bytes32 hash, uint8 v, bytes32 r, bytes32 s): # not payable
  signer = erecover(sha3(Mask(224, 32, '\x19Ethereum Signed Message:\n32') >> 32, hash), v << 248, r, s) # precompiled
  if not erecover.result:
      revert with ext_call.return_data[0 len return_data.size]
  return bool(stor5[address(signer)])

def owner(): # not payable
  return owner

def symbol(): # not payable
  return symbol[0 len symbol.length]

def TRANSFER_PROXY_V2(): # not payable
  return TRANSFER_PROXY_V2Address

def depositLock(address _param1): # not payable
  return depositLock[_param1]

#
#  Regular functions
#

def _fallback(?) payable: # default function
  revert

def keccak(address _sender, address _wrapper, uint256 _validTill): # not payable
  return sha3(_sender, _wrapper, _validTill)

def addSigner(address account): # not payable
  require stor5[caller]
  stor5[address(account)] = 1

def allowance(address owner, address spender): # not payable
  if TRANSFER_PROXY_VEFXAddress != spender:
      if TRANSFER_PROXY_V2Address != spender:
          return 0
  return -1

def transferOwnership(address newOwner): # not payable
  require caller == owner
  require newOwner
  log OwnershipTransferred(
        address previousOwner=owner,
        address newOwner=newOwner)
  owner = newOwner

def deposit(uint256 _pid, uint256 _amount) payable: 
  require _amount >= 1
  require (3600 * _amount) + block.timestamp >= depositLock[caller]
  require call.value + balances[caller] >= balances[caller]
  balances[caller] += call.value
  require call.value + totalSupply >= totalSupply
  totalSupply += call.value
  depositLock[caller] = (3600 * _amount) + block.timestamp
  return 1

def withdrawDifferentToken(address _differentToken, bool _erc20old): # not payable
  require caller == owner
  require ext_code.size(_differentToken)
  call _differentToken.balanceOf(address account) with:
       gas gas_remaining wei
      args this.address
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32
  require ext_call.return_data[0] > 0
  require ext_code.size(_differentToken)
  call _differentToken.balanceOf(address account) with:
       gas gas_remaining wei
      args this.address
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32
  require ext_code.size(_differentToken)
  call _differentToken.transfer(address recipient, uint256 amount) with:
       gas gas_remaining wei
      args caller, ext_call.return_data[0]
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  if _erc20old:
  else:
      require return_data.size >= 32
  return 1

def transferFrom(address sender, address recipient, uint256 amount): # not payable
  if not stor5[address(recipient)]:
      require stor5[address(sender)]
  if TRANSFER_PROXY_VEFXAddress != caller:
      require caller == TRANSFER_PROXY_V2Address
  require amount + balances[address(recipient)] >= balances[address(recipient)]
  balances[address(recipient)] += amount
  if block.timestamp >= depositLock[address(recipient)]:
      depositLock[address(recipient)] = block.timestamp + 3600
  require amount <= balances[address(sender)]
  balances[address(sender)] -= amount
  log Transfer(
        address from=amount,
        address to=sender,
        uint256 value=recipient)

def withdraw(uint256 _value, uint8 v, bytes32 r, bytes32 s, uint256 signatureValidUntilBlock): # not payable
  require balances[caller] >= _value
  if block.timestamp > depositLock[caller]:
      require _value <= balances[caller]
      balances[caller] -= _value
      require call.value <= totalSupply
      totalSupply -= call.value
  else:
      require signatureValidUntilBlock > block.number
      signer = erecover(sha3(Mask(224, 32, '\x19Ethereum Signed Message:\n32') >> 32, sha3(caller, this.address, signatureValidUntilBlock)), v << 248, r, s) # precompiled
      if not erecover.result:
          revert with ext_call.return_data[0 len return_data.size]
      require stor5[address(signer)]
      require _value <= balances[caller]
      balances[caller] -= _value
      require call.value <= totalSupply
      totalSupply -= call.value
      depositLock[caller] = 0
  call caller with:
     value _value wei
       gas 2300 * is_zero(value) wei
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  return 1