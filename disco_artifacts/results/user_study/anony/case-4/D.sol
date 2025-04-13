def storage:
  stor0 is address at storage 0

def deposit(uint256 _amount) payable: 
  require calldata.size - 4 >=′ 32
  require caller == stor0
  if call.value <= 0:
      revert with 0, '1'
  mem[96] = 2
  mem[128] = 0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c
  mem[160] = 0x55d398326f99059ff775485246999027b3197955
  if 10^18 > _amount + 10^18:
      revert with 0, 17
  mem[192] = 0xb6f9de9500000000000000000000000000000000000000000000000000000000
  mem[196] = _amount + 10^18
  mem[228] = 128
  mem[324] = 2
  idx = 0
  s = 128
  t = 356
  while idx < 2:
      mem[t] = mem[s + 12 len 20]
      idx = idx + 1
      s = s + 32
      t = t + 32
      continue 
  mem[260] = this.address
  mem[292] = block.timestamp
  require ext_code.size(0x10ed43c718714eb63d5aa57b78b54704e256024e)
  call 0x10ed43c718714eb63d5aa57b78b54704e256024e.swapExactETHForTokensSupportingFeeOnTransferTokens(uint256 amountOutMin, address[] path, address to, uint256 deadline) with:
     value call.value wei
       gas gas_remaining wei
      args _amount + 10^18, Array(len=2, data=mem[356 len 64]), address(this.address), block.timestamp
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  mem[196] = this.address
  static call 0x55d398326f99059ff775485246999027b3197955.balanceOf(address account) with:
          gas gas_remaining wei
         args this.address
  mem[192] = ext_call.return_data[0]
  require return_data.size >=′ 32
  require ext_code.size(0xc8b9817eb65b7d7e85325f23a60d5839d14f9ce4)
  call 0xc8b9817eb65b7d7e85325f23a60d5839d14f9ce4.bind(address _freeze) with:
       gas gas_remaining wei
      args 0x9f5d9a23c6ebfe232a3a957b6b6b802e1e62409c
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  if var46002 >= ext_call.return_data[0] / 1000 * 10^18:
      stop
  mem[ceil32(return_data.size) + 196] = 0xc8b9817eb65b7d7e85325f23a60d5839d14f9ce4
  mem[ceil32(return_data.size) + 228] = 1000 * 10^18
  call 0x55d398326f99059ff775485246999027b3197955.approve(address spender, uint256 amount) with:
       gas gas_remaining wei
      args 0xc8b9817eb65b7d7e85325f23a60d5839d14f9ce4, 1000 * 10^18
  mem[ceil32(return_data.size) + 192] = ext_call.return_data[0]
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  mem[64] = (2 * ceil32(return_data.size)) + 192
  require var52002 - var52001 >=′ 32
  require mem[var54002] == bool(mem[var54002])
  mem[(2 * ceil32(return_data.size)) + 192] = 0xb6b55f2500000000000000000000000000000000000000000000000000000000
  mem[(2 * ceil32(return_data.size)) + 196] = 1000 * 10^18
  require ext_code.size(0xc8b9817eb65b7d7e85325f23a60d5839d14f9ce4)
  call 0xc8b9817eb65b7d7e85325f23a60d5839d14f9ce4.mem[var60004 len 4] with:
       gas gas_remaining wei
      args mem[var60004 + 4 len var60005 - 4]
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  if var70002 >= ext_call.return_data[0] / 1000 * 10^18:
      stop
  call 0x55d398326f99059ff775485246999027b3197955.approve(address spender, uint256 amount) with:
       gas gas_remaining wei
      args 0xc8b9817eb65b7d7e85325f23a60d5839d14f9ce4, 1000 * 10^18
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  ...  # Decompilation aborted, sorry: ("decompilation didn't finish",)

def unknown1dbc4eeb(uint256 _param1): # not payable
  require calldata.size - 4 >=′ 32
  require caller == stor0
  require ext_code.size(0xc8b9817eb65b7d7e85325f23a60d5839d14f9ce4)
  call 0xc8b9817eb65b7d7e85325f23a60d5839d14f9ce4.withdraw() with:
       gas gas_remaining wei
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  mem[196] = _param1
  mem[228] = 0
  mem[260] = 128
  mem[292] = 32
  mem[324] = _param1
  mem[356] = 0
  require ext_code.size(0x36696169c63e42cd08ce11f5deebbcebae652050)
  call 0x36696169c63e42cd08ce11f5deebbcebae652050.flash(address recipient, uint256 amount0, uint256 amount1, bytes data) with:
       gas gas_remaining wei
      args address(this.address), _param1, 0, 128, 32, _param1
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  static call 0x55d398326f99059ff775485246999027b3197955.balanceOf(address account) with:
          gas gas_remaining wei
         args this.address
  require return_data.size >=′ 32
  if ext_call.return_data[0]:
      mem[ceil32(return_data.size) + 192] = 0x55d398326f99059ff775485246999027b3197955
      mem[ceil32(return_data.size) + 224] = 0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c
      mem[ceil32(return_data.size) + 256] = 0x18cbafe500000000000000000000000000000000000000000000000000000000
      mem[ceil32(return_data.size) + 260] = ext_call.return_data[0]
      mem[ceil32(return_data.size) + 292] = 0
      mem[ceil32(return_data.size) + 324] = 160
      mem[ceil32(return_data.size) + 420] = 2
      idx = 0
      s = ceil32(return_data.size) + 192
      t = ceil32(return_data.size) + 452
      while idx < 2:
          mem[t] = mem[s + 12 len 20]
          idx = idx + 1
          s = s + 32
          t = t + 32
          continue 
      mem[ceil32(return_data.size) + 356] = caller
      mem[ceil32(return_data.size) + 388] = block.timestamp
      call 0x10ed43c718714eb63d5aa57b78b54704e256024e.swapExactTokensForETH(uint256 amountIn, uint256 amountOutMin, address[] path, address to, uint256 deadline) with:
           gas gas_remaining wei
          args ext_call.return_data[0], 0, 160, caller, block.timestamp, 2, mem[ceil32(return_data.size) + 452 len 64]
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      mem[ceil32(return_data.size) + 256 len return_data.size] = ext_call.return_data[0 len return_data.size]
      mem[64] = (2 * ceil32(return_data.size)) + 256
      require return_data.size >=′ 32
      _45 = mem[ceil32(return_data.size) + 256 len 4], ext_call.return_data[0 len 28]
      require mem[ceil32(return_data.size) + 256 len 4], ext_call.return_data[0 len 28] <= LOCK8605463013()
      require ceil32(return_data.size) + return_data.size + 256 >′ ceil32(return_data.size) + mem[ceil32(return_data.size) + 256 len 4], ext_call.return_data[0 len 28] + 287
      _46 = mem[ceil32(return_data.size) + mem[ceil32(return_data.size) + 256 len 4], ext_call.return_data[0 len 28] + 256]
      if mem[ceil32(return_data.size) + mem[ceil32(return_data.size) + 256 len 4], ext_call.return_data[0 len 28] + 256] > LOCK8605463013():
          revert with 0, 65
      if (2 * ceil32(return_data.size)) + ceil32(32 * mem[ceil32(return_data.size) + mem[ceil32(return_data.size) + 256 len 4], ext_call.return_data[0 len 28] + 256]) + 257 > LOCK8605463013() or ceil32(32 * mem[ceil32(return_data.size) + mem[ceil32(return_data.size) + 256 len 4], ext_call.return_data[0 len 28] + 256]) + 1 < 0:
          revert with 0, 65
      mem[64] = (2 * ceil32(return_data.size)) + ceil32(32 * mem[ceil32(return_data.size) + mem[ceil32(return_data.size) + 256 len 4], ext_call.return_data[0 len 28] + 256]) + 257
      mem[(2 * ceil32(return_data.size)) + 256] = mem[ceil32(return_data.size) + mem[ceil32(return_data.size) + 256 len 4], ext_call.return_data[0 len 28] + 256]
      require _45 + (32 * _46) + 32 <= return_data.size
      s = (2 * ceil32(return_data.size)) + 288
      t = 32 * _46
      idx = ceil32(return_data.size) + _45 + 288
      while idx < ceil32(return_data.size) + _45 + (32 * _46) + 288:
          _49 = mem[idx]
          mem[s] = mem[idx]
          s = s + 32
          t = _49
          idx = idx + 32
          continue 

def unknowna1d48336(): # not payable
  require calldata.size - 4 >=′ 96
  require cd[68] <= LOCK8605463013()
  require calldata.size >′ cd[68] + 35
  require ('cd', 68).length <= LOCK8605463013()
  require cd[68] + ('cd', 68).length + 36 <= calldata.size
  if caller != 0x36696169c63e42cd08ce11f5deebbcebae652050:
      revert with 0, 'invalid caller'
  require ('cd', 68).length >=′ 32
  call 0x55d398326f99059ff775485246999027b3197955.approve(address spender, uint256 amount) with:
       gas gas_remaining wei
      args 0x10ed43c718714eb63d5aa57b78b54704e256024e, -1
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >=′ 32
  require ext_call.return_data[0] == bool(ext_call.return_data[0])
  mem[ceil32(return_data.size) + 100] = 0x10ed43c718714eb63d5aa57b78b54704e256024e
  mem[ceil32(return_data.size) + 132] = -1
  call 0xc10e0319337c7f83342424df72e73a70a29579b2.approve(address spender, uint256 amount) with:
       gas gas_remaining wei
      args 0x10ed43c718714eb63d5aa57b78b54704e256024e, -1
  mem[ceil32(return_data.size) + 96] = ext_call.return_data[0]
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >=′ 32
  require ext_call.return_data[0] == bool(ext_call.return_data[0])
  mem[(2 * ceil32(return_data.size)) + 100] = 0x10ed43c718714eb63d5aa57b78b54704e256024e
  mem[(2 * ceil32(return_data.size)) + 132] = -1
  call 0x5ffec8523a42be78b1ad1244fa526f14b64ba47a.approve(address spender, uint256 amount) with:
       gas gas_remaining wei
      args 0x10ed43c718714eb63d5aa57b78b54704e256024e, -1
  mem[(2 * ceil32(return_data.size)) + 96] = ext_call.return_data[0]
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >=′ 32
  require ext_call.return_data[0] == bool(ext_call.return_data[0])
  mem[(4 * ceil32(return_data.size)) + 128] = 0x55d398326f99059ff775485246999027b3197955
  mem[(4 * ceil32(return_data.size)) + 160] = 0xc10e0319337c7f83342424df72e73a70a29579b2
  mem[(4 * ceil32(return_data.size)) + 192] = 0x5c11d79500000000000000000000000000000000000000000000000000000000
  mem[(4 * ceil32(return_data.size)) + 196] = ('cd', 68)[0]
  mem[(4 * ceil32(return_data.size)) + 228] = 0
  mem[(4 * ceil32(return_data.size)) + 260] = 160
  mem[(4 * ceil32(return_data.size)) + 356] = 2
  idx = 0
  s = (4 * ceil32(return_data.size)) + 128
  t = (4 * ceil32(return_data.size)) + 388
  while idx < 2:
      mem[t] = mem[s + 12 len 20]
      idx = idx + 1
      s = s + 32
      t = t + 32
      continue 
  mem[(4 * ceil32(return_data.size)) + 292] = 0xc8b9817eb65b7d7e85325f23a60d5839d14f9ce4
  mem[(4 * ceil32(return_data.size)) + 324] = block.timestamp
  require ext_code.size(0x10ed43c718714eb63d5aa57b78b54704e256024e)
  call 0x10ed43c718714eb63d5aa57b78b54704e256024e.swapExactTokensForTokensSupportingFeeOnTransferTokens(uint256 amountIn, uint256 amountOutMin, address[] path, address to, uint256 deadline) with:
       gas gas_remaining wei
      args ('cd', 68)[0], 0, 160, 0xc8b9817eb65b7d7e85325f23a60d5839d14f9ce4, block.timestamp, 2, mem[(4 * ceil32(return_data.size)) + 388 len 64]
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  mem[(4 * ceil32(return_data.size)) + 196] = 0x5ffec8523a42be78b1ad1244fa526f14b64ba47a
  static call 0xc10e0319337c7f83342424df72e73a70a29579b2.balanceOf(address account) with:
          gas gas_remaining wei
         args 0x5ffec8523a42be78b1ad1244fa526f14b64ba47a
  require return_data.size >=′ 32
  static call 0xc10e0319337c7f83342424df72e73a70a29579b2.balanceOf(address account) with:
          gas gas_remaining wei
         args this.address
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >=′ 32
  if ext_call.return_data[0] <= ext_call.return_data[0]:
      revert with 0, '1'
  mem[(7 * ceil32(return_data.size)) + 228] = 10^17
  call 0x55d398326f99059ff775485246999027b3197955.transfer(address recipient, uint256 amount) with:
       gas gas_remaining wei
      args 0x5ffec8523a42be78b1ad1244fa526f14b64ba47a, 10^17
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >=′ 32
  require ext_call.return_data[0] == bool(ext_call.return_data[0])
  if ext_call.return_data[0] - 1 > ext_call.return_data[0]:
      revert with 0, 17
  mem[(8 * ceil32(return_data.size)) + 196] = 0x5ffec8523a42be78b1ad1244fa526f14b64ba47a
  mem[(8 * ceil32(return_data.size)) + 228] = ext_call.return_data[0] - 1
  call 0xc10e0319337c7f83342424df72e73a70a29579b2.transfer(address recipient, uint256 amount) with:
       gas gas_remaining wei
      args 0x5ffec8523a42be78b1ad1244fa526f14b64ba47a, ext_call.return_data[0] - 1
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >=′ 32
  require ext_call.return_data[0] == bool(ext_call.return_data[0])
  require ext_code.size(0x5ffec8523a42be78b1ad1244fa526f14b64ba47a)
  call 0x5ffec8523a42be78b1ad1244fa526f14b64ba47a.skim(address to) with:
       gas gas_remaining wei
      args this.address
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require ext_code.size(0x5ffec8523a42be78b1ad1244fa526f14b64ba47a)
  call 0x5ffec8523a42be78b1ad1244fa526f14b64ba47a.sync() with:
       gas gas_remaining wei
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  mem[(10 * ceil32(return_data.size)) + 228] = -1
  call 0xc10e0319337c7f83342424df72e73a70a29579b2.approve(address spender, uint256 amount) with:
       gas gas_remaining wei
      args 0x10ed43c718714eb63d5aa57b78b54704e256024e, -1
  require return_data.size >=′ 32
  require ext_call.return_data[0] == bool(ext_call.return_data[0])
  static call 0xc10e0319337c7f83342424df72e73a70a29579b2.balanceOf(address account) with:
          gas gas_remaining wei
         args this.address
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >=′ 32
  mem[(12 * ceil32(return_data.size)) + 224] = 0xc10e0319337c7f83342424df72e73a70a29579b2
  mem[(12 * ceil32(return_data.size)) + 256] = 0x55d398326f99059ff775485246999027b3197955
  mem[(12 * ceil32(return_data.size)) + 288] = 0x5c11d79500000000000000000000000000000000000000000000000000000000
  mem[(12 * ceil32(return_data.size)) + 292] = ext_call.return_data[0]
  idx = 0
  s = (12 * ceil32(return_data.size)) + 224
  t = (12 * ceil32(return_data.size)) + 484
  while idx < 2:
      mem[t] = mem[s + 12 len 20]
      idx = idx + 1
      s = s + 32
      t = t + 32
      continue 
  require ext_code.size(0x10ed43c718714eb63d5aa57b78b54704e256024e)
  call 0x10ed43c718714eb63d5aa57b78b54704e256024e.swapExactTokensForTokensSupportingFeeOnTransferTokens(uint256 amountIn, uint256 amountOutMin, address[] path, address to, uint256 deadline) with:
       gas gas_remaining wei
      args ext_call.return_data[0], 0, 160, address(this.address), block.timestamp, 2, mem[(12 * ceil32(return_data.size)) + 484 len 64]
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  if ('cd', 68)[0] > cd[4] + ('cd', 68)[0]:
      revert with 0, 17
  call 0x55d398326f99059ff775485246999027b3197955.transfer(address recipient, uint256 amount) with:
       gas gas_remaining wei
      args caller, cd[4] + ('cd', 68)[0]
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >=′ 32
  require ext_call.return_data[0] == bool(ext_call.return_data[0])

def _fallback(?) payable: # default function
  if calldata.size < 4:
      require not calldata.size
  else:
      if 498880235 == uint32(call.func_hash) >> 224:
          require not call.value
          require calldata.size - 4 >=′ 32
          require caller == stor0
          require ext_code.size(0xc8b9817eb65b7d7e85325f23a60d5839d14f9ce4)
          call 0xc8b9817eb65b7d7e85325f23a60d5839d14f9ce4.withdraw() with:
               gas gas_remaining wei
          if not ext_call.success:
              revert with ext_call.return_data[0 len return_data.size]
          mem[160] = cd[4]
          mem[128] = 32
          mem[228] = cd[4]
          mem[260] = 0
          mem[292] = 128
          mem[324] = 32
          mem[356] = cd[4]
          mem[388] = 0
          require ext_code.size(0x36696169c63e42cd08ce11f5deebbcebae652050)
          call 0x36696169c63e42cd08ce11f5deebbcebae652050.flash(address recipient, uint256 amount0, uint256 amount1, bytes data) with:
               gas gas_remaining wei
              args address(this.address), cd[4], 0, 128, 32, cd[4]
          if not ext_call.success:
              revert with ext_call.return_data[0 len return_data.size]
          mem[196] = this.address
          static call 0x55d398326f99059ff775485246999027b3197955.balanceOf(address account) with:
                  gas gas_remaining wei
                 args this.address
          mem[192] = ext_call.return_data[0]
          require return_data.size >=′ 32
          if ext_call.return_data[0]:
              mem[ceil32(return_data.size) + 224] = 0x55d398326f99059ff775485246999027b3197955
              mem[ceil32(return_data.size) + 256] = 0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c
              mem[ceil32(return_data.size) + 288] = 0x18cbafe500000000000000000000000000000000000000000000000000000000
              mem[ceil32(return_data.size) + 292] = ext_call.return_data[0]
              mem[ceil32(return_data.size) + 324] = 0
              mem[ceil32(return_data.size) + 356] = 160
              mem[ceil32(return_data.size) + 452] = 2
              idx = 0
              s = ceil32(return_data.size) + 224
              t = ceil32(return_data.size) + 484
              while idx < 2:
                  mem[t] = mem[s + 12 len 20]
                  idx = idx + 1
                  s = s + 32
                  t = t + 32
                  continue 
              mem[ceil32(return_data.size) + 388] = caller
              mem[ceil32(return_data.size) + 420] = block.timestamp
              call 0x10ed43c718714eb63d5aa57b78b54704e256024e.swapExactTokensForETH(uint256 amountIn, uint256 amountOutMin, address[] path, address to, uint256 deadline) with:
                   gas gas_remaining wei
                  args ext_call.return_data[0], 0, 160, caller, block.timestamp, 2, mem[ceil32(return_data.size) + 484 len 64]
              if not ext_call.success:
                  revert with ext_call.return_data[0 len return_data.size]
              mem[ceil32(return_data.size) + 288 len return_data.size] = ext_call.return_data[0 len return_data.size]
              mem[64] = (2 * ceil32(return_data.size)) + 288
              require return_data.size >=′ 32
              _190 = mem[ceil32(return_data.size) + 288 len 4], ext_call.return_data[0 len 28]
              require mem[ceil32(return_data.size) + 288 len 4], ext_call.return_data[0 len 28] <= LOCK8605463013()
              require ceil32(return_data.size) + return_data.size + 288 >′ ceil32(return_data.size) + mem[ceil32(return_data.size) + 288 len 4], ext_call.return_data[0 len 28] + 319
              _192 = mem[ceil32(return_data.size) + mem[ceil32(return_data.size) + 288 len 4], ext_call.return_data[0 len 28] + 288]
              if mem[ceil32(return_data.size) + mem[ceil32(return_data.size) + 288 len 4], ext_call.return_data[0 len 28] + 288] > LOCK8605463013():
                  revert with 0, 65
              if (2 * ceil32(return_data.size)) + ceil32(32 * mem[ceil32(return_data.size) + mem[ceil32(return_data.size) + 288 len 4], ext_call.return_data[0 len 28] + 288]) + 289 > LOCK8605463013() or ceil32(32 * mem[ceil32(return_data.size) + mem[ceil32(return_data.size) + 288 len 4], ext_call.return_data[0 len 28] + 288]) + 1 < 0:
                  revert with 0, 65
              mem[(2 * ceil32(return_data.size)) + 288] = mem[ceil32(return_data.size) + mem[ceil32(return_data.size) + 288 len 4], ext_call.return_data[0 len 28] + 288]
              require _190 + (32 * _192) + 32 <= return_data.size
              s = (2 * ceil32(return_data.size)) + 320
              t = 32 * _192
              idx = ceil32(return_data.size) + _190 + 320
              while idx < ceil32(return_data.size) + _190 + (32 * _192) + 320:
                  _201 = mem[idx]
                  mem[s] = mem[idx]
                  s = s + 32
                  t = _201
                  idx = idx + 32
                  continue 
      else:
          if uint32(call.func_hash) >> 224 != 2715058998:
              require deposit(uint256 _amount) == uint32(call.func_hash) >> 224
              require calldata.size - 4 >=′ 32
              require caller == stor0
              if call.value <= 0:
                  revert with 0, '1'
              mem[128] = 2
              mem[160] = 0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c
              mem[192] = 0x55d398326f99059ff775485246999027b3197955
              if 10^18 > cd[4] + 10^18:
                  revert with 0, 17
              mem[224] = 0xb6f9de9500000000000000000000000000000000000000000000000000000000
              mem[228] = cd[4] + 10^18
              mem[260] = 128
              mem[356] = 2
              idx = 0
              s = 160
              t = 388
              while idx < 2:
                  mem[t] = mem[s + 12 len 20]
                  idx = idx + 1
                  s = s + 32
                  t = t + 32
                  continue 
              mem[292] = this.address
              mem[324] = block.timestamp
              require ext_code.size(0x10ed43c718714eb63d5aa57b78b54704e256024e)
              call 0x10ed43c718714eb63d5aa57b78b54704e256024e.swapExactETHForTokensSupportingFeeOnTransferTokens(uint256 amountOutMin, address[] path, address to, uint256 deadline) with:
                 value call.value wei
                   gas gas_remaining wei
                  args cd[4] + 10^18, Array(len=2, data=mem[388 len 64]), address(this.address), block.timestamp
              if not ext_call.success:
                  revert with ext_call.return_data[0 len return_data.size]
              mem[228] = this.address
              static call 0x55d398326f99059ff775485246999027b3197955.balanceOf(address account) with:
                      gas gas_remaining wei
                     args this.address
              mem[224] = ext_call.return_data[0]
              require return_data.size >=′ 32
              require ext_code.size(0xc8b9817eb65b7d7e85325f23a60d5839d14f9ce4)
              call 0xc8b9817eb65b7d7e85325f23a60d5839d14f9ce4.bind(address _freeze) with:
                   gas gas_remaining wei
                  args 0x9f5d9a23c6ebfe232a3a957b6b6b802e1e62409c
              if not ext_call.success:
                  revert with ext_call.return_data[0 len return_data.size]
              if var50002 >= ext_call.return_data[0] / 1000 * 10^18:
                  stop
              mem[ceil32(return_data.size) + 228] = 0xc8b9817eb65b7d7e85325f23a60d5839d14f9ce4
              mem[ceil32(return_data.size) + 260] = 1000 * 10^18
              call 0x55d398326f99059ff775485246999027b3197955.approve(address spender, uint256 amount) with:
                   gas gas_remaining wei
                  args 0xc8b9817eb65b7d7e85325f23a60d5839d14f9ce4, 1000 * 10^18
              mem[ceil32(return_data.size) + 224] = ext_call.return_data[0]
              if not ext_call.success:
                  revert with ext_call.return_data[0 len return_data.size]
              mem[64] = (2 * ceil32(return_data.size)) + 224
              require var56002 - var56001 >=′ 32
              require mem[var58002] == bool(mem[var58002])
              mem[(2 * ceil32(return_data.size)) + 224] = 0xb6b55f2500000000000000000000000000000000000000000000000000000000
              mem[(2 * ceil32(return_data.size)) + 228] = 1000 * 10^18
              require ext_code.size(0xc8b9817eb65b7d7e85325f23a60d5839d14f9ce4)
              call 0xc8b9817eb65b7d7e85325f23a60d5839d14f9ce4.mem[var64004 len 4] with:
                   gas gas_remaining wei
                  args mem[var64004 + 4 len var64005 - 4]
              if not ext_call.success:
                  revert with ext_call.return_data[0 len return_data.size]
              if var74002 >= ext_call.return_data[0] / 1000 * 10^18:
                  stop
              call 0x55d398326f99059ff775485246999027b3197955.approve(address spender, uint256 amount) with:
                   gas gas_remaining wei
                  args 0xc8b9817eb65b7d7e85325f23a60d5839d14f9ce4, 1000 * 10^18
              if not ext_call.success:
                  revert with ext_call.return_data[0 len return_data.size]
              ...  # Decompilation aborted, sorry: ("decompilation didn't finish",)
          require not call.value
          require calldata.size - 4 >=′ 96
          require cd[68] <= LOCK8605463013()
          require calldata.size >′ cd[68] + 35
          require ('cd', 68).length <= LOCK8605463013()
          require cd[68] + ('cd', 68).length + 36 <= calldata.size
          if caller != 0x36696169c63e42cd08ce11f5deebbcebae652050:
              revert with 0, 'invalid caller'
          require ('cd', 68).length >=′ 32
          call 0x55d398326f99059ff775485246999027b3197955.approve(address spender, uint256 amount) with:
               gas gas_remaining wei
              args 0x10ed43c718714eb63d5aa57b78b54704e256024e, -1
          if not ext_call.success:
              revert with ext_call.return_data[0 len return_data.size]
          require return_data.size >=′ 32
          require ext_call.return_data[0] == bool(ext_call.return_data[0])
          mem[ceil32(return_data.size) + 132] = 0x10ed43c718714eb63d5aa57b78b54704e256024e
          mem[ceil32(return_data.size) + 164] = -1
          call 0xc10e0319337c7f83342424df72e73a70a29579b2.approve(address spender, uint256 amount) with:
               gas gas_remaining wei
              args 0x10ed43c718714eb63d5aa57b78b54704e256024e, -1
          mem[ceil32(return_data.size) + 128] = ext_call.return_data[0]
          if not ext_call.success:
              revert with ext_call.return_data[0 len return_data.size]
          require return_data.size >=′ 32
          require ext_call.return_data[0] == bool(ext_call.return_data[0])
          mem[(2 * ceil32(return_data.size)) + 132] = 0x10ed43c718714eb63d5aa57b78b54704e256024e
          mem[(2 * ceil32(return_data.size)) + 164] = -1
          call 0x5ffec8523a42be78b1ad1244fa526f14b64ba47a.approve(address spender, uint256 amount) with:
               gas gas_remaining wei
              args 0x10ed43c718714eb63d5aa57b78b54704e256024e, -1
          mem[(2 * ceil32(return_data.size)) + 128] = ext_call.return_data[0]
          if not ext_call.success:
              revert with ext_call.return_data[0 len return_data.size]
          require return_data.size >=′ 32
          require ext_call.return_data[0] == bool(ext_call.return_data[0])
          mem[(4 * ceil32(return_data.size)) + 160] = 0x55d398326f99059ff775485246999027b3197955
          mem[(4 * ceil32(return_data.size)) + 192] = 0xc10e0319337c7f83342424df72e73a70a29579b2
          mem[(4 * ceil32(return_data.size)) + 224] = 0x5c11d79500000000000000000000000000000000000000000000000000000000
          mem[(4 * ceil32(return_data.size)) + 228] = ('cd', 68)[0]
          mem[(4 * ceil32(return_data.size)) + 260] = 0
          mem[(4 * ceil32(return_data.size)) + 292] = 160
          mem[(4 * ceil32(return_data.size)) + 388] = 2
          idx = 0
          s = (4 * ceil32(return_data.size)) + 160
          t = (4 * ceil32(return_data.size)) + 420
          while idx < 2:
              mem[t] = mem[s + 12 len 20]
              idx = idx + 1
              s = s + 32
              t = t + 32
              continue 
          mem[(4 * ceil32(return_data.size)) + 324] = 0xc8b9817eb65b7d7e85325f23a60d5839d14f9ce4
          mem[(4 * ceil32(return_data.size)) + 356] = block.timestamp
          require ext_code.size(0x10ed43c718714eb63d5aa57b78b54704e256024e)
          call 0x10ed43c718714eb63d5aa57b78b54704e256024e.swapExactTokensForTokensSupportingFeeOnTransferTokens(uint256 amountIn, uint256 amountOutMin, address[] path, address to, uint256 deadline) with:
               gas gas_remaining wei
              args ('cd', 68)[0], 0, 160, 0xc8b9817eb65b7d7e85325f23a60d5839d14f9ce4, block.timestamp, 2, mem[(4 * ceil32(return_data.size)) + 420 len 64]
          if not ext_call.success:
              revert with ext_call.return_data[0 len return_data.size]
          mem[(4 * ceil32(return_data.size)) + 228] = 0x5ffec8523a42be78b1ad1244fa526f14b64ba47a
          static call 0xc10e0319337c7f83342424df72e73a70a29579b2.balanceOf(address account) with:
                  gas gas_remaining wei
                 args 0x5ffec8523a42be78b1ad1244fa526f14b64ba47a
          require return_data.size >=′ 32
          static call 0xc10e0319337c7f83342424df72e73a70a29579b2.balanceOf(address account) with:
                  gas gas_remaining wei
                 args this.address
          if not ext_call.success:
              revert with ext_call.return_data[0 len return_data.size]
          require return_data.size >=′ 32
          if ext_call.return_data[0] <= ext_call.return_data[0]:
              revert with 0, '1'
          mem[(7 * ceil32(return_data.size)) + 260] = 10^17
          call 0x55d398326f99059ff775485246999027b3197955.transfer(address recipient, uint256 amount) with:
               gas gas_remaining wei
              args 0x5ffec8523a42be78b1ad1244fa526f14b64ba47a, 10^17
          if not ext_call.success:
              revert with ext_call.return_data[0 len return_data.size]
          require return_data.size >=′ 32
          require ext_call.return_data[0] == bool(ext_call.return_data[0])
          if ext_call.return_data[0] - 1 > ext_call.return_data[0]:
              revert with 0, 17
          mem[(8 * ceil32(return_data.size)) + 228] = 0x5ffec8523a42be78b1ad1244fa526f14b64ba47a
          mem[(8 * ceil32(return_data.size)) + 260] = ext_call.return_data[0] - 1
          call 0xc10e0319337c7f83342424df72e73a70a29579b2.transfer(address recipient, uint256 amount) with:
               gas gas_remaining wei
              args 0x5ffec8523a42be78b1ad1244fa526f14b64ba47a, ext_call.return_data[0] - 1
          if not ext_call.success:
              revert with ext_call.return_data[0 len return_data.size]
          require return_data.size >=′ 32
          require ext_call.return_data[0] == bool(ext_call.return_data[0])
          require ext_code.size(0x5ffec8523a42be78b1ad1244fa526f14b64ba47a)
          call 0x5ffec8523a42be78b1ad1244fa526f14b64ba47a.skim(address to) with:
               gas gas_remaining wei
              args this.address
          if not ext_call.success:
              revert with ext_call.return_data[0 len return_data.size]
          require ext_code.size(0x5ffec8523a42be78b1ad1244fa526f14b64ba47a)
          call 0x5ffec8523a42be78b1ad1244fa526f14b64ba47a.sync() with:
               gas gas_remaining wei
          if not ext_call.success:
              revert with ext_call.return_data[0 len return_data.size]
          mem[(10 * ceil32(return_data.size)) + 260] = -1
          call 0xc10e0319337c7f83342424df72e73a70a29579b2.approve(address spender, uint256 amount) with:
               gas gas_remaining wei
              args 0x10ed43c718714eb63d5aa57b78b54704e256024e, -1
          require return_data.size >=′ 32
          require ext_call.return_data[0] == bool(ext_call.return_data[0])
          static call 0xc10e0319337c7f83342424df72e73a70a29579b2.balanceOf(address account) with:
                  gas gas_remaining wei
                 args this.address
          if not ext_call.success:
              revert with ext_call.return_data[0 len return_data.size]
          require return_data.size >=′ 32
          mem[(12 * ceil32(return_data.size)) + 256] = 0xc10e0319337c7f83342424df72e73a70a29579b2
          mem[(12 * ceil32(return_data.size)) + 288] = 0x55d398326f99059ff775485246999027b3197955
          mem[(12 * ceil32(return_data.size)) + 320] = 0x5c11d79500000000000000000000000000000000000000000000000000000000
          mem[(12 * ceil32(return_data.size)) + 324] = ext_call.return_data[0]
          idx = 0
          s = (12 * ceil32(return_data.size)) + 256
          t = (12 * ceil32(return_data.size)) + 516
          while idx < 2:
              mem[t] = mem[s + 12 len 20]
              idx = idx + 1
              s = s + 32
              t = t + 32
              continue 
          require ext_code.size(0x10ed43c718714eb63d5aa57b78b54704e256024e)
          call 0x10ed43c718714eb63d5aa57b78b54704e256024e.swapExactTokensForTokensSupportingFeeOnTransferTokens(uint256 amountIn, uint256 amountOutMin, address[] path, address to, uint256 deadline) with:
               gas gas_remaining wei
              args ext_call.return_data[0], 0, 160, address(this.address), block.timestamp, 2, mem[(12 * ceil32(return_data.size)) + 516 len 64]
          if not ext_call.success:
              revert with ext_call.return_data[0 len return_data.size]
          if ('cd', 68)[0] > cd[4] + ('cd', 68)[0]:
              revert with 0, 17
          call 0x55d398326f99059ff775485246999027b3197955.transfer(address recipient, uint256 amount) with:
               gas gas_remaining wei
              args caller, cd[4] + ('cd', 68)[0]
          if not ext_call.success:
              revert with ext_call.return_data[0 len return_data.size]
          require return_data.size >=′ 32
          require ext_call.return_data[0] == bool(ext_call.return_data[0])


