module {
  func.func @cse_across_acc_set(%arg0: memref<10xf32>, %arg1: index) -> (f32, f32) {
    %0 = memref.load %arg0[%arg1] : memref<10xf32>
    %c42_i32 = arith.constant 42 : i32
    acc.set device_num(%c42_i32 : i32)
    %1 = memref.load %arg0[%arg1] : memref<10xf32>
    return %0, %1 : f32, f32
  }
}

// -----
module {
  func.func @cse_gpu_shared_memory_not_merged() -> (memref<8xf32, #gpu.address_space<workgroup>>, memref<8xf32, #gpu.address_space<workgroup>>) {
    %0 = acc.gpu_shared_memory {num_copies = 1 : i64, static_upper_bound_bytes = 256 : i64} : () -> memref<8xf32, #gpu.address_space<workgroup>>
    %1 = acc.gpu_shared_memory {num_copies = 1 : i64, static_upper_bound_bytes = 256 : i64} : () -> memref<8xf32, #gpu.address_space<workgroup>>
    return %0, %1 : memref<8xf32, #gpu.address_space<workgroup>>, memref<8xf32, #gpu.address_space<workgroup>>
  }
}

