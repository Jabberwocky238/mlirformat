module {
  gpu.module @builtins {
    func.func @gpu_block_id() -> (index, index, index) {
      %block_id_x = gpu.block_id x
      %block_id_y = gpu.block_id y
      %block_id_z = gpu.block_id z
      return %block_id_x, %block_id_y, %block_id_z : index, index, index
    }
    func.func @gpu_global_id() -> (index, index, index) {
      %global_id_x = gpu.global_id x
      %global_id_y = gpu.global_id y
      %global_id_z = gpu.global_id z
      return %global_id_x, %global_id_y, %global_id_z : index, index, index
    }
    func.func @gpu_block_dim() -> (index, index, index) {
      %block_dim_x = gpu.block_dim x
      %block_dim_y = gpu.block_dim y
      %block_dim_z = gpu.block_dim z
      return %block_dim_x, %block_dim_y, %block_dim_z : index, index, index
    }
    func.func @gpu_thread_id() -> (index, index, index) {
      %thread_id_x = gpu.thread_id x
      %thread_id_y = gpu.thread_id y
      %thread_id_z = gpu.thread_id z
      return %thread_id_x, %thread_id_y, %thread_id_z : index, index, index
    }
    func.func @gpu_grid_dim() -> (index, index, index) {
      %grid_dim_x = gpu.grid_dim x
      %grid_dim_y = gpu.grid_dim y
      %grid_dim_z = gpu.grid_dim z
      return %grid_dim_x, %grid_dim_y, %grid_dim_z : index, index, index
    }
  }
}

// -----
module {
  gpu.module @barriers {
    func.func @gpu_barrier() {
      gpu.barrier
      gpu.barrier memfence [#gpu.address_space<global>, #gpu.address_space<workgroup>]
      gpu.barrier memfence [#gpu.address_space<workgroup>]
      gpu.barrier memfence [#gpu.address_space<global>]
      gpu.barrier memfence []
      gpu.barrier memfence [#gpu.address_space<private>]
      gpu.barrier memfence [#gpu.address_space<constant>]
      return
    }
  }
}

// -----
module {
  gpu.module @shuffles {
    llvm.func @gpu_shuffles(%arg0: i8, %arg1: i16, %arg2: i32, %arg3: i64, %arg4: f16, %arg5: f32, %arg6: f64, %arg7: bf16, %arg8: i1, %arg9: i32) attributes {intel_reqd_sub_group_size = 16 : i32} {
      %c16_i32 = arith.constant 16 : i32
      %shuffleResult, %valid = gpu.shuffle idx %arg0, %arg9, %c16_i32 : i8
      %shuffleResult_0, %valid_1 = gpu.shuffle xor %arg1, %arg9, %c16_i32 : i16
      %shuffleResult_2, %valid_3 = gpu.shuffle idx %arg2, %arg9, %c16_i32 : i32
      %shuffleResult_4, %valid_5 = gpu.shuffle xor %arg3, %arg9, %c16_i32 : i64
      %shuffleResult_6, %valid_7 = gpu.shuffle up %arg4, %arg9, %c16_i32 : f16
      %shuffleResult_8, %valid_9 = gpu.shuffle up %arg5, %arg9, %c16_i32 : f32
      %shuffleResult_10, %valid_11 = gpu.shuffle down %arg6, %arg9, %c16_i32 : f64
      %shuffleResult_12, %valid_13 = gpu.shuffle down %arg7, %arg9, %c16_i32 : bf16
      %shuffleResult_14, %valid_15 = gpu.shuffle xor %arg8, %arg9, %c16_i32 : i1
      llvm.return
    }
  }
}

// -----
module {
  gpu.module @shuffles_without_intel_reqd_sub_group_size_attribute {
    llvm.func @gpu_shuffles(%arg0: i32, %arg1: i32) {
      %c16_i32 = arith.constant 16 : i32
      %shuffleResult, %valid = gpu.shuffle idx %arg0, %arg1, %c16_i32 : i32
      llvm.return
    }
  }
}

// -----
module {
  gpu.module @kernels {
    gpu.func @no_kernel() {
      gpu.return
    }
    gpu.func @kernel_no_arg() kernel {
      gpu.return
    }
    gpu.func @kernel_with_args(%arg0: f32, %arg1: i64) kernel {
      gpu.return
    }
    gpu.func @kernel_with_conv_args(%arg0: index, %arg1: memref<index>) kernel {
      gpu.return
    }
    gpu.func @kernel_with_sized_memref(%arg0: memref<1xindex>) kernel {
      gpu.return
    }
    gpu.func @kernel_with_ND_memref(%arg0: memref<128x128x128xindex>) kernel {
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @kernels {
    gpu.func @kernel_with_private_attributions() private(%arg0 : memref<32xf32, #gpu.address_space<private>>, %arg1 : memref<16xi16, #gpu.address_space<private>>) kernel {
      gpu.return
    }
    gpu.func @kernel_with_workgoup_attributions() workgroup(%arg0 : memref<32xf32, #gpu.address_space<workgroup>>, %arg1 : memref<16xi16, #gpu.address_space<workgroup>>) kernel {
      gpu.return
    }
    gpu.func @kernel_with_both_attributions() workgroup(%arg0 : memref<8xf32, #gpu.address_space<workgroup>>, %arg1 : memref<16xindex, #gpu.address_space<workgroup>>) private(%arg2 : memref<32xi32, #gpu.address_space<private>>, %arg3 : memref<32xindex, #gpu.address_space<private>>) kernel {
      gpu.return
    }
    gpu.func @kernel_known_block_size() kernel attributes {known_block_size = array<i32: 128, 128, 256>} {
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @kernels {
    gpu.func @address_spaces(%arg0: memref<f32, #gpu.address_space<global>>, %arg1: memref<f32, #gpu.address_space<workgroup>>, %arg2: memref<f32, #gpu.address_space<private>>) {
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @kernels {
    gpu.func @no_address_spaces(%arg0: memref<f32>, %arg1: memref<f32, #gpu.address_space<global>>, %arg2: memref<f32>) {
      gpu.return
    }
    gpu.func @no_address_spaces_complex(%arg0: memref<2x2xf32>, %arg1: memref<4xf32>) kernel {
      func.call @no_address_spaces_callee(%arg0, %arg1) : (memref<2x2xf32>, memref<4xf32>) -> ()
      gpu.return
    }
    func.func @no_address_spaces_callee(%arg0: memref<2x2xf32>, %arg1: memref<4xf32>) {
      %block_id_x = gpu.block_id x
      %0 = memref.load %arg0[%block_id_x, %block_id_x] : memref<2x2xf32>
      memref.store %0, %arg1[%block_id_x] : memref<4xf32>
      return
    }
  }
}

// -----
module {
  gpu.module @subgroup_operations {
    func.func @gpu_subgroup() {
      %0 = gpu.subgroup_id : index
      %1 = gpu.lane_id
      %2 = gpu.num_subgroups : index
      %3 = gpu.subgroup_size : index
      return
    }
  }
}

