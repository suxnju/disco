def storage:
  owner is address at storage 0
  newOwner is address at storage 1
  standard is array of uint256 at storage 2
  name is array of uint256 at storage 3
  symbol is array of uint256 at storage 4
  decimals is uint8 at storage 5
  totalSupply is uint256 at storage 6
  balanceOf is mapping of uint256 at storage 7
  allowance is mapping of uint256 at storage 8

def name(): # not payable
  return name[0 len name.length]

def totalSupply(): # not payable
  return totalSupply

def decimals(): # not payable
  return decimals

def standard(): # not payable
  return standard[0 len standard.length]

def balanceOf(address account): # not payable
  return balanceOf[account]

def owner(): # not payable
  return owner

def symbol(): # not payable
  return symbol[0 len symbol.length]

def newOwner(): # not payable
  return newOwner

def allowance(address owner, address spender): # not payable
  return allowance[owner][spender]

#
#  Regular functions
#

def transferOwnership(address newOwner): # not payable
  require owner == caller
  require owner != newOwner
  newOwner = newOwner

def acceptOwnership(): # not payable
  require newOwner == caller
  log OwnerUpdate(
        address _prevOwner=owner,
        address _newOwner=newOwner)
  owner = newOwner
  newOwner = 0

def deposit() payable: 
  require call.value + balanceOf[caller] >= balanceOf[caller]
  balanceOf[caller] += call.value
  require call.value + totalSupply >= totalSupply
  totalSupply += call.value
  log Issuance(uint256 _amount=call.value)
  log Transfer(
        address from=call.value,
        address to=this.address,
        uint256 value=caller)

def withdrawTokens(address _token, address _to, uint256 _amount): # not payable
  require owner == caller
  require _token
  require _to
  require _to != this.address
  require ext_code.size(_token)
  call _token.transfer(address recipient, uint256 amount) with:
       gas gas_remaining - 710 wei
      args address(_to), _amount
  require ext_call.success
  require ext_call.return_data[0]

def approve(address spender, uint256 amount): # not payable
  require spender
  if amount:
      require not allowance[caller][address(spender)]
  allowance[caller][address(spender)] = amount
  log Approval(
        address owner=amount,
        address spender=caller,
        uint256 value=spender)
  return 1

def _fallback(?) payable: # default function
  require call.value + balanceOf[caller] >= balanceOf[caller]
  balanceOf[caller] += call.value
  require call.value + totalSupply >= totalSupply
  totalSupply += call.value
  log Issuance(uint256 _amount=call.value)
  log Transfer(
        address from=call.value,
        address to=this.address,
        uint256 value=caller)

def withdraw(uint256 amount): # not payable
  require this.address != caller
  require balanceOf[caller] >= amount
  balanceOf[caller] -= amount
  require totalSupply >= amount
  totalSupply -= amount
  call caller with:
     value amount wei
       gas 2300 * is_zero(value) wei
  require ext_call.success
  log Transfer(
        address from=amount,
        address to=caller,
        uint256 value=this.address)
  log Destruction(uint256 _amount=amount)

def withdrawTo(address to, uint256 amount): # not payable
  require to != this.address
  require balanceOf[caller] >= amount
  balanceOf[caller] -= amount
  require totalSupply >= amount
  totalSupply -= amount
  call to with:
     value amount wei
       gas 2300 * is_zero(value) wei
  require ext_call.success
  log Transfer(
        address from=amount,
        address to=caller,
        uint256 value=this.address)
  log Destruction(uint256 _amount=amount)

def transfer(address recipient, uint256 amount): # not payable
  require recipient != this.address
  require recipient
  require balanceOf[caller] >= amount
  balanceOf[caller] -= amount
  require amount + balanceOf[recipient] >= balanceOf[recipient]
  balanceOf[address(recipient)] = amount + balanceOf[recipient]
  log Transfer(
        address from=amount,
        address to=caller,
        uint256 value=recipient)
  return 1

def transferFrom(address sender, address recipient, uint256 amount): # not payable
  require recipient != this.address
  require sender
  require recipient
  require allowance[address(sender)][caller] >= amount
  allowance[address(sender)][caller] -= amount
  require balanceOf[address(sender)] >= amount
  balanceOf[address(sender)] -= amount
  require amount + balanceOf[recipient] >= balanceOf[recipient]
  balanceOf[address(recipient)] = amount + balanceOf[recipient]
  log Transfer(
        address from=amount,
        address to=sender,
        uint256 value=recipient)
  return 1