def storage:
  balanceOf is mapping of uint256 at storage 0
  allowance is mapping of uint256 at storage 1
  name is array of uint256 at storage 3
  decimals is uint8 at storage 4
  symbol is array of uint256 at storage 5
  version is array of uint256 at storage 6
  unitsOneEthCanBuy is uint256 at storage 7
  totalEthInWei is uint256 at storage 8
  fundsWalletAddress is address at storage 9
  totalSupply is uint256 at storage 10

def name(): # not payable
  return name[0 len name.length]

def totalSupply(): # not payable
  return totalSupply

def fundsWallet(): # not payable
  return fundsWalletAddress

def decimals(): # not payable
  return decimals

def version(): # not payable
  return version[0 len version.length]

def unitsOneEthCanBuy(): # not payable
  return unitsOneEthCanBuy

def balanceOf(address account): # not payable
  return balanceOf[address(account)]

def totalEthInWei(): # not payable
  return totalEthInWei

def symbol(): # not payable
  return symbol[0 len symbol.length]

def allowance(address owner, address spender): # not payable
  return allowance[address(owner)][address(spender)]

#
#  Regular functions
#

def approve(address spender, uint256 amount): # not payable
  allowance[caller][address(spender)] = amount
  log Approval(
        address owner=amount,
        address spender=caller,
        uint256 value=spender)
  return 1

def transfer(address recipient, uint256 amount): # not payable
  if amount > balanceOf[caller]:
      return 0
  if amount <= 0:
      return 0
  balanceOf[caller] -= amount
  balanceOf[recipient] += amount
  log Transfer(
        address from=amount,
        address to=caller,
        uint256 value=recipient)
  return 1

def _fallback(?) payable: # default function
  totalEthInWei += call.value
  if unitsOneEthCanBuy <= balanceOf[stor9]:
      balanceOf[stor9] -= unitsOneEthCanBuy
      balanceOf[caller] += unitsOneEthCanBuy
      log Transfer(
            address from=unitsOneEthCanBuy,
            address to=fundsWalletAddress,
            uint256 value=caller)
      call fundsWalletAddress with:
         value call.value wei
           gas 2300 * is_zero(value) wei
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]

def transferFrom(address sender, address recipient, uint256 amount): # not payable
  if amount > balanceOf[address(sender)]:
      return 0
  if amount > allowance[address(sender)][caller]:
      return 0
  if amount <= 0:
      return 0
  balanceOf[address(recipient)] += amount
  balanceOf[sender] -= amount
  allowance[address(sender)][caller] -= amount
  log Transfer(
        address from=amount,
        address to=sender,
        uint256 value=recipient)
  return 1

def approveAndCall(address _spender, uint256 _value, bytes _extraData): # not payable
  mem[128 len _extraData.length] = _extraData[all]
  allowance[caller][address(_spender)] = _value
  log Approval(
        address owner=_value,
        address spender=caller,
        uint256 value=_spender)
  mem[ceil32(_extraData.length) + 128] = Mask(32, 224, sha3('receiveApproval(address,uint256,', 'address,bytes)'))
  mem[ceil32(_extraData.length) + 228 len ceil32(_extraData.length)] = _extraData[all], mem[_extraData.length + 128 len ceil32(_extraData.length) - _extraData.length]
  if not _extraData.length % 32:
      call _spender with:
         funct Mask(32, 224, sha3('receiveApproval(address,uint256,', 'address,bytes)')) >> 224
           gas gas_remaining wei
          args caller, _value, address(this.address), Mask(8 * _extraData.length, -(8 * _extraData.length) + 256, _extraData[all], mem[_extraData.length + 128 len ceil32(_extraData.length) - _extraData.length]) << (8 * _extraData.length) - 256
  else:
      mem[floor32(_extraData.length) + ceil32(_extraData.length) + 228] = mem[floor32(_extraData.length) + ceil32(_extraData.length) + -(_extraData.length % 32) + 260 len _extraData.length % 32]
      call _spender with:
         funct Mask(32, 224, sha3('receiveApproval(address,uint256,', 'address,bytes)')) >> 224
           gas gas_remaining wei
          args caller, _value, address(this.address), Mask(8 * ceil32(_extraData.length), -(8 * ceil32(_extraData.length)) + 256, _extraData[all], mem[_extraData.length + 128 len ceil32(_extraData.length) - _extraData.length]) << (8 * ceil32(_extraData.length)) - 256, mem[(2 * ceil32(_extraData.length)) + 228 len floor32(_extraData.length) + -ceil32(_extraData.length) + 32]
  require ext_call.success
  return 1