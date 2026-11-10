module {
  func.func @subgroupId(%arg0: index, %arg1: memref<index, 1>) {
    gpu.launch blocks(%arg2, %arg3, %arg4) in (%arg8 = %arg0, %arg9 = %arg0, %arg10 = %arg0) threads(%arg5, %arg6, %arg7) in (%arg11 = %arg0, %arg12 = %arg0, %arg13 = %arg0) {
      %0 = gpu.subgroup_id : index
      memref.store %0, %arg1[] : memref<index, 1>
      gpu.terminator
    }
    return
  }
  func.func @subgroupIdConsts(%arg0: index, %arg1: memref<index, 1>) {
    %c32 = arith.constant 32 : index
    %c4 = arith.constant 4 : index
    %c2 = arith.constant 2 : index
    gpu.launch blocks(%arg2, %arg3, %arg4) in (%arg8 = %arg0, %arg9 = %arg0, %arg10 = %arg0) threads(%arg5, %arg6, %arg7) in (%arg11 = %c32, %arg12 = %c4, %arg13 = %c2) {
      %0 = gpu.subgroup_id : index
      memref.store %0, %arg1[] : memref<index, 1>
      gpu.terminator
    }
    return
  }
}

