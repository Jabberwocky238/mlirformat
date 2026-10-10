module {
  func.func @subgroupId(%arg0: index, %arg1: memref<index, 1>) {
    gpu.launch blocks(%arg2, %arg3, %arg4) in (%arg8 = %arg0, %arg9 = %arg0, %arg10 = %arg0) threads(%arg5, %arg6, %arg7) in (%arg11 = %arg0, %arg12 = %arg0, %arg13 = %arg0) {
      %0 = gpu.subgroup_id : index
      memref.store %0, %arg1[] : memref<index, 1>
      gpu.terminator
    }
    return
  }
}

