const depositEther = 1

def storage:
  commissionGetterAddress is address at storage 0
  minimumEtherCommission is uint256 at storage 1
  minimumTokenCommission is uint256 at storage 2
  owner is address at storage 3
  name is array of uint256 at storage 4
  symbol is array of uint256 at storage 5
  decimals is uint8 at storage 6
  totalSupply is uint256 at storage 7
  balanceOf is mapping of uint256 at storage 8
  allowance is mapping of uint256 at storage 9
  buyPrice is uint256 at storage 10
  sellPrice is uint256 at storage 11
  closeSell is uint8 at storage 12
  stor13 is mapping of uint8 at storage 13

def name(): # not payable
  return name[0 len name.length]

def minimumTokenCommission(): # not payable
  return minimumTokenCommission

def totalSupply(): # not payable
  return totalSupply

def decimals(): # not payable
  return decimals

def commissionGetter(): # not payable
  return commissionGetterAddress

def sellPrice(): # not payable
  return sellPrice

def balanceOf(address account): # not payable
  return balanceOf[account]

def buyPrice(): # not payable
  return buyPrice

def owner(): # not payable
  return owner

def symbol(): # not payable
  return symbol[0 len symbol.length]

def minimumEtherCommission(): # not payable
  return minimumEtherCommission

def frozenAccount(address _param1): # not payable
  return bool(stor13[_param1])

def closeSell(): # not payable
  return bool(closeSell)

def allowance(address owner, address spender): # not payable
  return allowance[owner][spender]

#
#  Regular functions
#

def transferOwnership(address newOwner): # not payable
  require caller == owner
  owner = newOwner

def setStatus(bool _status): # not payable
  require caller == owner
  closeSell = uint8(_status)

def transferCommissionGetter(address newCommissionGetter): # not payable
  require caller == commissionGetterAddress
  commissionGetterAddress = newCommissionGetter

def setPrices(uint256 newSellPrice, uint256 newBuyPrice): # not payable
  require caller == owner
  sellPrice = newSellPrice
  buyPrice = newBuyPrice

def approve(address spender, uint256 amount): # not payable
  allowance[caller][address(spender)] = amount
  return 1

def changeMinimumCommission(uint256 newMinEtherCommission, uint256 newMinTokenCommission): # not payable
  require caller == commissionGetterAddress
  minimumEtherCommission = newMinEtherCommission
  minimumTokenCommission = newMinTokenCommission

def freezeAccount(address target, bool freeze): # not payable
  require caller == owner
  stor13[address(target)] = uint8(freeze)
  log FrozenFunds(
        address target=address(target),
        bool frozen=freeze)

def withdrawEther(uint256 amount): # not payable
  require caller == owner
  require amount <= eth.balance(this.address)
  log Withdrawal(
        address src=caller,
        uint256 wad=amount)
  call owner with:
     value amount wei
       gas 2300 * is_zero(value) wei
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]

def mintToken(uint256 numberOfTokens): # not payable
  require caller == owner
  balanceOf[stor3] += numberOfTokens
  totalSupply += numberOfTokens
  log Transfer(
        address from=numberOfTokens,
        address to=0,
        uint256 value=this.address)
  log Transfer(
        address from=numberOfTokens,
        address to=this.address,
        uint256 value=owner)

def refillTokens(uint256 _value): # not payable
  require caller == owner
  require this.address
  require not stor13[caller]
  require not stor13[address(this.address)]
  require _value <= balanceOf[caller]
  require balanceOf[address(this.address)] + _value > balanceOf[address(this.address)]
  balanceOf[caller] -= _value
  balanceOf[address(this.address)] += _value
  log Transfer(
        address from=_value,
        address to=caller,
        uint256 value=this.address)
  require balanceOf[address(this.address)] + balanceOf[caller] == balanceOf[caller] + balanceOf[address(this.address)]

def buy() payable: 
  require buyPrice
  if call.value / buyPrice * buyPrice / 100 >= minimumEtherCommission:
      require call.value / buyPrice * buyPrice / 100 <= eth.balance(this.address)
      call commissionGetterAddress with:
         value call.value / buyPrice * buyPrice / 100 wei
           gas 2300 * is_zero(value) wei
  else:
      require minimumEtherCommission <= eth.balance(this.address)
      call commissionGetterAddress with:
         value minimumEtherCommission wei
           gas 2300 * is_zero(value) wei
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require caller
  require not stor13[address(this.address)]
  require not stor13[caller]
  require call.value / buyPrice <= balanceOf[address(this.address)]
  require balanceOf[caller] + (call.value / buyPrice) > balanceOf[caller]
  balanceOf[this.address] -= call.value / buyPrice
  balanceOf[caller] += call.value / buyPrice
  log Transfer(
        address from=(call.value / buyPrice),
        address to=this.address,
        uint256 value=caller)
  require balanceOf[caller] + balanceOf[this.address] == balanceOf[this.address] + balanceOf[caller]

def _fallback(?) payable: # default function
  require buyPrice
  if call.value / buyPrice * buyPrice / 100 >= minimumEtherCommission:
      require call.value / buyPrice * buyPrice / 100 <= eth.balance(this.address)
      call commissionGetterAddress with:
         value call.value / buyPrice * buyPrice / 100 wei
           gas 2300 * is_zero(value) wei
  else:
      require minimumEtherCommission <= eth.balance(this.address)
      call commissionGetterAddress with:
         value minimumEtherCommission wei
           gas 2300 * is_zero(value) wei
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require caller
  require not stor13[address(this.address)]
  require not stor13[caller]
  require call.value / buyPrice <= balanceOf[address(this.address)]
  require balanceOf[caller] + (call.value / buyPrice) > balanceOf[caller]
  balanceOf[this.address] -= call.value / buyPrice
  balanceOf[caller] += call.value / buyPrice
  log Transfer(
        address from=(call.value / buyPrice),
        address to=this.address,
        uint256 value=caller)
  require balanceOf[caller] + balanceOf[this.address] == balanceOf[this.address] + balanceOf[caller]

def transfer(address recipient, uint256 amount): # not payable
  require sellPrice
  require commissionGetterAddress
  require not stor13[address(this.address)]
  require not stor13[stor0]
  if amount * sellPrice / 100 / sellPrice >= minimumTokenCommission:
      require amount * sellPrice / 100 / sellPrice <= balanceOf[address(this.address)]
      require balanceOf[stor0] + (amount * sellPrice / 100 / sellPrice) > balanceOf[stor0]
      balanceOf[this.address] -= amount * sellPrice / 100 / sellPrice
      balanceOf[stor0] += amount * sellPrice / 100 / sellPrice
      log Transfer(
            address from=(amount * sellPrice / 100 / sellPrice),
            address to=this.address,
            uint256 value=commissionGetterAddress)
  else:
      require minimumTokenCommission <= balanceOf[address(this.address)]
      require balanceOf[stor0] + minimumTokenCommission > balanceOf[stor0]
      balanceOf[this.address] -= minimumTokenCommission
      balanceOf[stor0] += minimumTokenCommission
      log Transfer(
            address from=minimumTokenCommission,
            address to=this.address,
            uint256 value=commissionGetterAddress)
  require balanceOf[stor0] + balanceOf[this.address] == balanceOf[this.address] + balanceOf[stor0]
  require recipient
  require not stor13[caller]
  require not stor13[address(recipient)]
  require amount <= balanceOf[caller]
  require balanceOf[address(recipient)] + amount > balanceOf[address(recipient)]
  balanceOf[caller] -= amount
  balanceOf[address(recipient)] += amount
  log Transfer(
        address from=amount,
        address to=caller,
        uint256 value=recipient)
  require balanceOf[address(recipient)] + balanceOf[caller] == balanceOf[caller] + balanceOf[address(recipient)]

def sell(uint256 amount): # not payable
  require not closeSell
  require sellPrice
  require commissionGetterAddress
  require not stor13[address(this.address)]
  require not stor13[stor0]
  if amount * sellPrice / 100 / sellPrice >= minimumTokenCommission:
      require amount * sellPrice / 100 / sellPrice <= balanceOf[address(this.address)]
      require balanceOf[stor0] + (amount * sellPrice / 100 / sellPrice) > balanceOf[stor0]
      balanceOf[this.address] -= amount * sellPrice / 100 / sellPrice
      balanceOf[stor0] += amount * sellPrice / 100 / sellPrice
      log Transfer(
            address from=(amount * sellPrice / 100 / sellPrice),
            address to=this.address,
            uint256 value=commissionGetterAddress)
  else:
      require minimumTokenCommission <= balanceOf[address(this.address)]
      require balanceOf[stor0] + minimumTokenCommission > balanceOf[stor0]
      balanceOf[this.address] -= minimumTokenCommission
      balanceOf[stor0] += minimumTokenCommission
      log Transfer(
            address from=minimumTokenCommission,
            address to=this.address,
            uint256 value=commissionGetterAddress)
  require balanceOf[stor0] + balanceOf[this.address] == balanceOf[this.address] + balanceOf[stor0]
  require this.address
  require not stor13[caller]
  require not stor13[address(this.address)]
  require amount <= balanceOf[caller]
  require balanceOf[address(this.address)] + amount > balanceOf[address(this.address)]
  balanceOf[caller] -= amount
  balanceOf[address(this.address)] += amount
  log Transfer(
        address from=amount,
        address to=caller,
        uint256 value=this.address)
  require balanceOf[address(this.address)] + balanceOf[caller] == balanceOf[caller] + balanceOf[address(this.address)]
  require amount * sellPrice <= eth.balance(this.address)
  call caller with:
     value amount * sellPrice wei
       gas 2300 * is_zero(value) wei
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]

def transferFrom(address sender, address recipient, uint256 amount): # not payable
  require amount <= allowance[address(sender)][caller]
  require sellPrice
  require commissionGetterAddress
  require not stor13[address(this.address)]
  require not stor13[stor0]
  if amount * sellPrice / 100 / sellPrice >= minimumTokenCommission:
      require amount * sellPrice / 100 / sellPrice <= balanceOf[address(this.address)]
      require balanceOf[stor0] + (amount * sellPrice / 100 / sellPrice) > balanceOf[stor0]
      balanceOf[this.address] -= amount * sellPrice / 100 / sellPrice
      balanceOf[stor0] += amount * sellPrice / 100 / sellPrice
      log Transfer(
            address from=(amount * sellPrice / 100 / sellPrice),
            address to=this.address,
            uint256 value=commissionGetterAddress)
  else:
      require minimumTokenCommission <= balanceOf[address(this.address)]
      require balanceOf[stor0] + minimumTokenCommission > balanceOf[stor0]
      balanceOf[this.address] -= minimumTokenCommission
      balanceOf[stor0] += minimumTokenCommission
      log Transfer(
            address from=minimumTokenCommission,
            address to=this.address,
            uint256 value=commissionGetterAddress)
  require balanceOf[stor0] + balanceOf[this.address] == balanceOf[this.address] + balanceOf[stor0]
  allowance[address(sender)][caller] -= amount
  require recipient
  require not stor13[address(sender)]
  require not stor13[address(recipient)]
  require amount <= balanceOf[address(sender)]
  require balanceOf[address(recipient)] + amount > balanceOf[address(recipient)]
  balanceOf[sender] -= amount
  balanceOf[address(recipient)] += amount
  log Transfer(
        address from=amount,
        address to=sender,
        uint256 value=recipient)
  require balanceOf[address(recipient)] + balanceOf[sender] == balanceOf[sender] + balanceOf[address(recipient)]
  return 1