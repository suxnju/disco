def storage:
  stor0 is uint256 at storage 0

def withdraw(bytes data) payable: 
  require calldata.size - 4 >= 32
  require data <= unknown10000000()
  require data + 36 <= calldata.size
  require data.length <= unknown10000000() and data + data.length + 36 <= calldata.size
  mem[128 len data.length] = data[all]
  mem[data.length + 128] = 0
  if call.value < 2 * eth.balance(this.address) - call.value:
      revert with 0, 'balance required'
  mem[ceil32(data.length) + 128 len floor32(data.length)] = call.data[data + 36 len floor32(data.length)]
  mem[ceil32(data.length) + floor32(data.length) + -(data.length % 32) + 160 len data.length % 32] = mem[floor32(data.length) + -(data.length % 32) + 160 len data.length % 32]
  hash = sha256hash(call.data[data + 36 len floor32(data.length)], mem[ceil32(data.length) + floor32(data.length) + 128 len data.length % 32]) # precompiled
  if not sha256hash.result:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32
  if hash != stor0:
      revert with 0, 'invalid key'
  selfdestruct(caller)

def _fallback(?) payable: # default function
  revert