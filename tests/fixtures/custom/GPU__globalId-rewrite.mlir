module {
  func.func @globalId(%arg0: index, %arg1: memref<index, 1>) {
    gpu.launch blocks(%arg2, %arg3, %arg4) in (%arg8 = %arg0, %arg9 = %arg0, %arg10 = %arg0) threads(%arg5, %arg6, %arg7) in (%arg11 = %arg0, %arg12 = %arg0, %arg13 = %arg0) {
      %global_id_x = gpu.global_id  x
      memref.store %global_id_x, %arg1[] : memref<index, 1>
      %global_id_y = gpu.global_id  y
      memref.store %global_id_y, %arg1[] : memref<index, 1>
      %global_id_z = gpu.global_id  z
      memref.store %global_id_z, %arg1[] : memref<index, 1>
      gpu.terminator
    }
    return
  }
}

