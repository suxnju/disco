# time cost: 3.287337064743042
# Palkeoramix decompiler. 

def storage:
  stor0 is address at storage 0
  stor3 is address at storage 3
  stor4 is address at storage 4
  stor5 is address at storage 5
  stor6 is address at storage 6

def _fallback(?) payable: # default function
  stop

def test1(): # not payable
  require ext_code.size(stor0)
  call stor0.0x5fb3b5a3 with:
       gas gas_remaining wei
      args 0, 3735027712, 0, 1, 0
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]

def withdraw(): # not payable
  if stor5 != caller:
      revert with 0, 'error,'
  call stor5 with:
     value eth.balance(this.address) wei
       gas 2300 * is_zero(value) wei
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]

def test(): # not payable
  require ext_code.size(stor6)
  call stor6.flashLoan(uint256 baseAmount, uint256 quoteAmount, address assetTo, bytes data) with:
       gas gas_remaining wei
      args 0, 0, 7000 * 10^18, address(this.address), 128, 2, '0x'
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]

def test3(): # not payable
  static call stor4.balanceOf(address account) with:
          gas gas_remaining wei
         args stor0
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >=′ 32
  require ext_call.return_data[0] == ext_call.return_data[0]
  if ext_call.return_data[0] and 1015 * ext_call.return_data[0] / ext_call.return_data[0] != 1015:
      revert with Mask(32, 224, 0x4e487b7100000000000000000000000000000000000000000000000000000000) >> 224, 17
  require ext_code.size(stor0)
  call stor0.0xd9b6f615 with:
       gas gas_remaining wei
      args 1015 * ext_call.return_data[0] / 1000, 0, 0
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]

def test2(): # not payable
  static call stor3.balanceOf(address account) with:
          gas gas_remaining wei
         args stor0
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >=′ 32
  require ext_call.return_data[0] == ext_call.return_data[0]
  if ext_call.return_data[0] and 1015 * ext_call.return_data[0] / ext_call.return_data[0] != 1015:
      revert with Mask(32, 224, 0x4e487b7100000000000000000000000000000000000000000000000000000000) >> 224, 17
  require ext_code.size(stor0)
  call stor0.0xd9b6f615 with:
       gas gas_remaining wei
      args 1015 * ext_call.return_data[0] / 1000, 0, 1
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]

def unknown59e900c8(uint256 _param1): # not payable
  require calldata.size - 4 >=′ 32
  require _param1 == address(_param1)
  if stor5 != caller:
      revert with 0, 'error'
  static call address(_param1).balanceOf(address account) with:
          gas gas_remaining wei
         args this.address
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >=′ 32
  require ext_call.return_data[0] == ext_call.return_data[0]
  call address(_param1).transfer(address recipient, uint256 amount) with:
       gas gas_remaining wei
      args stor5, ext_call.return_data[0]
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >=′ 32
  require ext_call.return_data[0] == bool(ext_call.return_data[0])

def unknown7ed1f1dd(uint256 _param1, uint256 _param2, uint256 _param3, array _param4): # not payable
  require calldata.size - 4 >=′ 128
  require _param1 == address(_param1)
  require _param2 == _param2
  require _param3 == _param3
  require _param4 <= LOCK8605463013()
  require _param4 + 35 <′ calldata.size
  require _param4.length <= LOCK8605463013()
  require _param4 + _param4.length + 36 <= calldata.size
  require ext_code.size(stor0)
  call stor0.0x5fb3b5a3 with:
       gas gas_remaining wei
      args 0, 3735027712, 0, 1, 0
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require ext_code.size(stor0)
  call stor0.0x5fb3b5a3 with:
       gas gas_remaining wei
      args 0, 3735027712, 0, 1, 0
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require ext_code.size(stor0)
  call stor0.0x5fb3b5a3 with:
       gas gas_remaining wei
      args 0, 3735027712, 0, 1, 0
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require ext_code.size(stor0)
  call stor0.0x5fb3b5a3 with:
       gas gas_remaining wei
      args 0, 3735027712, 0, 1, 0
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require ext_code.size(stor0)
  call stor0.0x5fb3b5a3 with:
       gas gas_remaining wei
      args 0, 3735027712, 0, 1, 0
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require ext_code.size(stor0)
  call stor0.0x5fb3b5a3 with:
       gas gas_remaining wei
      args 0, 3735027712, 0, 1, 0
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require ext_code.size(stor0)
  call stor0.0x5fb3b5a3 with:
       gas gas_remaining wei
      args 0, 3735027712, 0, 1, 0
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  static call stor3.balanceOf(address account) with:
          gas gas_remaining wei
         args stor0
  require return_data.size >=′ 32
  require ext_call.return_data[0] == ext_call.return_data[0]
  if ext_call.return_data[0] and 1015 * ext_call.return_data[0] / ext_call.return_data[0] != 1015:
      revert with Mask(32, 224, 0x4e487b7100000000000000000000000000000000000000000000000000000000) >> 224, 17
  require ext_code.size(stor0)
  call stor0.0xd9b6f615 with:
       gas gas_remaining wei
      args 1015 * ext_call.return_data[0] / 1000, 0, 1
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  static call stor4.balanceOf(address account) with:
          gas gas_remaining wei
         args stor0
  require return_data.size >=′ 32
  require ext_call.return_data[0] == ext_call.return_data[0]
  if ext_call.return_data[0] and 1015 * ext_call.return_data[0] / ext_call.return_data[0] != 1015:
      revert with Mask(32, 224, 0x4e487b7100000000000000000000000000000000000000000000000000000000) >> 224, 17
  require ext_code.size(stor0)
  call stor0.0xd9b6f615 with:
       gas gas_remaining wei
      args 1015 * ext_call.return_data[0] / 1000, 0, 0
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  call stor3.transfer(address recipient, uint256 amount) with:
       gas gas_remaining wei
      args stor6, 7000 * 10^18
  require return_data.size >=′ 32
  require ext_call.return_data[0] == bool(ext_call.return_data[0])
  static call stor3.balanceOf(address account) with:
          gas gas_remaining wei
         args this.address
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >=′ 32
  require ext_call.return_data[0] == ext_call.return_data[0]
  call stor3.transfer(address recipient, uint256 amount) with:
       gas gas_remaining wei
      args 0xe763da20e25103da8e6afa84b6297f87de557419, ext_call.return_data[0]
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >=′ 32
  require ext_call.return_data[0] == bool(ext_call.return_data[0])
  static call stor4.balanceOf(address account) with:
          gas gas_remaining wei
         args this.address
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >=′ 32
  require ext_call.return_data[0] == ext_call.return_data[0]
  call stor4.transfer(address recipient, uint256 amount) with:
       gas gas_remaining wei
      args 0xe763da20e25103da8e6afa84b6297f87de557419, ext_call.return_data[0]
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >=′ 32
  require ext_call.return_data[0] == bool(ext_call.return_data[0])


