module {
  gpu.module @test_module {
    func.func @gpu_index_ops() -> (index, index, index, index, index, index, index, index, index, index, index, index, index, index, index) {
      %thread_id_x = gpu.thread_id x
      %thread_id_y = gpu.thread_id y
      %thread_id_z = gpu.thread_id z
      %block_dim_x = gpu.block_dim x
      %block_dim_y = gpu.block_dim y
      %block_dim_z = gpu.block_dim z
      %block_id_x = gpu.block_id x
      %block_id_y = gpu.block_id y
      %block_id_z = gpu.block_id z
      %grid_dim_x = gpu.grid_dim x
      %grid_dim_y = gpu.grid_dim y
      %grid_dim_z = gpu.grid_dim z
      %0 = gpu.lane_id
      %1 = gpu.subgroup_size : index
      %2 = gpu.subgroup_size upper_bound 64 : index
      return %thread_id_x, %thread_id_y, %thread_id_z, %block_dim_x, %block_dim_y, %block_dim_z, %block_id_x, %block_id_y, %block_id_z, %grid_dim_x, %grid_dim_y, %grid_dim_z, %0, %1, %2 : index, index, index, index, index, index, index, index, index, index, index, index, index, index, index
    }
  }
}

// -----
module {
  gpu.module @test_module {
    gpu.func @gpu_index_ops_range(%arg0: memref<i32>) kernel attributes {known_block_size = array<i32: 8, 12, 16>, known_grid_size = array<i32: 20, 24, 28>} {
      %thread_id_x = gpu.thread_id x
      %thread_id_y = gpu.thread_id y
      %thread_id_z = gpu.thread_id z
      %block_id_x = gpu.block_id x
      %block_id_y = gpu.block_id y
      %block_id_z = gpu.block_id z
      %block_dim_x = gpu.block_dim x
      %block_dim_y = gpu.block_dim y
      %block_dim_z = gpu.block_dim z
      %grid_dim_x = gpu.grid_dim x
      %grid_dim_y = gpu.grid_dim y
      %grid_dim_z = gpu.grid_dim z
      %0 = arith.addi %thread_id_x, %thread_id_y : index
      %1 = arith.addi %0, %thread_id_z : index
      %2 = arith.addi %1, %block_id_x : index
      %3 = arith.addi %2, %block_id_y : index
      %4 = arith.addi %3, %block_id_z : index
      %5 = arith.addi %4, %block_dim_x : index
      %6 = arith.addi %5, %block_dim_y : index
      %7 = arith.addi %6, %block_dim_z : index
      %8 = arith.addi %7, %grid_dim_x : index
      %9 = arith.addi %8, %grid_dim_y : index
      %10 = arith.addi %9, %grid_dim_z : index
      %11 = arith.index_cast %10 : index to i32
      memref.store %11, %arg0[] : memref<i32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test_module {
    func.func @gpu_index_comp(%arg0: index) -> index {
      %0 = arith.addi %arg0, %arg0 : index
      return %0 : index
    }
  }
}

// -----
module {
  gpu.module @test_module {
    func.func @gpu_sqrt(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
      %0 = math.sqrt %arg0 : f16
      %1 = math.sqrt %arg1 : f32
      %2 = math.sqrt %arg2 : f64
      return %0, %1, %2 : f16, f32, f64
    }
  }
}

// -----
module {
  gpu.module @test_module {
    func.func @gpu_fabs(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
      %0 = math.absf %arg0 : f16
      %1 = math.absf %arg1 : f32
      %2 = math.absf %arg2 : f64
      return %0, %1, %2 : f16, f32, f64
    }
  }
}

// -----
module {
  gpu.module @test_module {
    func.func @gpu_exp(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
      %0 = math.exp %arg0 : f16
      %1 = math.exp %arg1 : f32
      %2 = math.exp %arg2 : f64
      return %0, %1, %2 : f16, f32, f64
    }
  }
}

// -----
module {
  gpu.module @test_module {
    func.func @gpu_log(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
      %0 = math.log %arg0 : f16
      %1 = math.log %arg1 : f32
      %2 = math.log %arg2 : f64
      return %0, %1, %2 : f16, f32, f64
    }
  }
}

// -----
module {
  gpu.module @test_module {
    func.func @gpu_cbrt(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
      %0 = math.cbrt %arg0 : f16
      %1 = math.cbrt %arg1 : f32
      %2 = math.cbrt %arg2 : f64
      return %0, %1, %2 : f16, f32, f64
    }
  }
}

// -----
module {
  gpu.module @test_module {
    func.func @gpu_ceil(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
      %0 = math.ceil %arg0 : f16
      %1 = math.ceil %arg1 : f32
      %2 = math.ceil %arg2 : f64
      return %0, %1, %2 : f16, f32, f64
    }
  }
}

// -----
module {
  gpu.module @test_module {
    func.func @gpu_floor(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
      %0 = math.floor %arg0 : f16
      %1 = math.floor %arg1 : f32
      %2 = math.floor %arg2 : f64
      return %0, %1, %2 : f16, f32, f64
    }
  }
}

// -----
module {
  gpu.module @test_module {
    func.func @gpu_cos(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
      %0 = math.cos %arg0 : f16
      %1 = math.cos %arg1 : f32
      %2 = math.cos %arg2 : f64
      return %0, %1, %2 : f16, f32, f64
    }
  }
}

// -----
module {
  gpu.module @test_module {
    func.func @gpu_exp2(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
      %0 = math.exp2 %arg0 : f16
      %1 = math.exp2 %arg1 : f32
      %2 = math.exp2 %1 : f32
      %3 = math.exp2 %arg2 : f64
      return %0, %2, %3 : f16, f32, f64
    }
  }
}

// -----
module {
  gpu.module @test_module {
    "test.symbol_scope"() ({
      func.func @gpu_sin(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
        %0 = math.sin %arg0 : f16
        %1 = math.sin %arg1 : f32
        %2 = math.sin %arg2 : f64
        return %0, %1, %2 : f16, f32, f64
      }
      "test.finish"() : () -> ()
    }) : () -> ()
  }
}

// -----
module {
  gpu.module @test_module {
    func.func @gpu_expm1(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
      %0 = math.expm1 %arg0 : f16
      %1 = math.expm1 %arg1 : f32
      %2 = math.expm1 %1 : f32
      %3 = math.expm1 %arg2 : f64
      return %0, %2, %3 : f16, f32, f64
    }
  }
}

// -----
module {
  gpu.module @test_module {
    func.func @gpu_log(%arg0: f16, %arg1: f64) -> (f16, f64) {
      %0 = math.log %arg0 : f16
      %1 = math.log %arg1 : f64
      return %0, %1 : f16, f64
    }
  }
}

// -----
module {
  gpu.module @test_module {
    func.func @gpu_log1p(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
      %0 = math.log1p %arg0 : f16
      %1 = math.log1p %arg1 : f32
      %2 = math.log1p %arg2 : f64
      return %0, %1, %2 : f16, f32, f64
    }
  }
}

// -----
module {
  gpu.module @test_module {
    func.func @gpu_log10(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
      %0 = math.log10 %arg0 : f16
      %1 = math.log10 %arg1 : f32
      %2 = math.log10 %arg2 : f64
      return %0, %1, %2 : f16, f32, f64
    }
  }
}

// -----
module {
  gpu.module @test_module {
    func.func @gpu_log2(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
      %0 = math.log2 %arg0 : f16
      %1 = math.log2 %arg1 : f32
      %2 = math.log2 %arg2 : f64
      return %0, %1, %2 : f16, f32, f64
    }
  }
}

// -----
module {
  gpu.module @test_module {
    func.func @gpu_rsqrt(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
      %0 = math.rsqrt %arg0 : f16
      %1 = math.rsqrt %arg1 : f32
      %2 = math.rsqrt %arg2 : f64
      return %0, %1, %2 : f16, f32, f64
    }
  }
}

// -----
module {
  gpu.module @test_module {
    func.func @gpu_tan(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
      %0 = math.tan %arg0 : f16
      %1 = math.tan %arg1 : f32
      %2 = math.tan %arg2 : f64
      return %0, %1, %2 : f16, f32, f64
    }
  }
}

// -----
module {
  gpu.module @test_module {
    func.func @gpu_tanh(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
      %0 = math.tanh %arg0 : f16
      %1 = math.tanh %arg1 : f32
      %2 = math.tanh %arg2 : f64
      return %0, %1, %2 : f16, f32, f64
    }
  }
}

// -----
module {
  gpu.module @test_module {
    func.func @gpu_atan(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
      %0 = math.atan %arg0 : f16
      %1 = math.atan %arg1 : f32
      %2 = math.atan %arg2 : f64
      return %0, %1, %2 : f16, f32, f64
    }
  }
}

// -----
module {
  gpu.module @test_module {
    func.func @gpu_atan2(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
      %0 = math.atan2 %arg0, %arg0 : f16
      %1 = math.atan2 %arg1, %arg1 : f32
      %2 = math.atan2 %arg2, %arg2 : f64
      return %0, %1, %2 : f16, f32, f64
    }
  }
}

// -----
module {
  gpu.module @test_module {
    func.func @gpu_pow(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
      %0 = math.powf %arg0, %arg0 : f16
      %1 = math.powf %arg1, %arg1 : f32
      %2 = math.powf %arg2, %arg2 : f64
      return %0, %1, %2 : f16, f32, f64
    }
  }
}

// -----
module {
  gpu.module @test_module {
    func.func @gpu_erf(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
      %0 = math.erf %arg0 : f16
      %1 = math.erf %arg1 : f32
      %2 = math.erf %arg2 : f64
      return %0, %1, %2 : f16, f32, f64
    }
  }
}

// -----
module {
  gpu.module @test_module {
    func.func @gpu_unroll(%arg0: vector<4xf32>) -> vector<4xf32> {
      %0 = math.sin %arg0 : vector<4xf32>
      return %0 : vector<4xf32>
    }
  }
}

// -----
module {
  gpu.module @test_module {
    func.func @bf16_id(%arg0: bf16) -> bf16 {
      return %arg0 : bf16
    }
    func.func @bf16x4_id(%arg0: vector<4xbf16>) -> vector<4xbf16> {
      return %arg0 : vector<4xbf16>
    }
  }
}

// -----
module {
  gpu.module @test_module {
    gpu.func @kernel_func() kernel {
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @module {
    spirv.func @spirv_sin(%arg0: vector<4xf32>) -> vector<4xf32> "None" {
      %0 = math.sin %arg0 : vector<4xf32>
      spirv.ReturnValue %0 : vector<4xf32>
    }
  }
}

// -----
module {
  gpu.module @test_module {
    gpu.func @gpu_all_reduce_op() {
      %cst = arith.constant 1.000000e+00 : f32
      %0 = gpu.all_reduce add %cst uniform {
      } : (f32) -> f32
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test_module {
    gpu.func @gpu_all_reduce_region() {
      %c1_i32 = arith.constant 1 : i32
      %0 = gpu.all_reduce  %c1_i32 uniform {
      ^bb0(%arg0: i32, %arg1: i32):
        %1 = arith.xori %arg0, %arg1 : i32
        gpu.yield %1 : i32
      } : (i32) -> i32
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test_module {
    func.func @gpu_fmod(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
      %0 = arith.remf %arg0, %arg0 : f16
      %1 = arith.remf %arg1, %arg1 : f32
      %2 = arith.remf %arg2, %arg2 : f64
      return %0, %1, %2 : f16, f32, f64
    }
  }
}

// -----
module {
  gpu.module @test_module {
    func.func @gpu_shuffle() -> (f32, f32, f32, f32) {
      %cst = arith.constant 1.000000e+00 : f32
      %c4_i32 = arith.constant 4 : i32
      %c23_i32 = arith.constant 23 : i32
      %shuffleResult, %valid = gpu.shuffle xor %cst, %c4_i32, %c23_i32 : f32
      %shuffleResult_0, %valid_1 = gpu.shuffle idx %cst, %c4_i32, %c23_i32 : f32
      %shuffleResult_2, %valid_3 = gpu.shuffle up %cst, %c4_i32, %c23_i32 : f32
      %shuffleResult_4, %valid_5 = gpu.shuffle down %cst, %c4_i32, %c23_i32 : f32
      return %shuffleResult, %shuffleResult_0, %shuffleResult_2, %shuffleResult_4 : f32, f32, f32, f32
    }
    func.func @gpu_shuffle_promote() -> (f32, f32, f32) {
      %cst = arith.constant 1.000000e+00 : f32
      %c4_i32 = arith.constant 4 : i32
      %c16_i32 = arith.constant 16 : i32
      %c32_i32 = arith.constant 32 : i32
      %c64_i32 = arith.constant 64 : i32
      %shuffleResult, %valid = gpu.shuffle xor %cst, %c4_i32, %c64_i32 : f32
      %shuffleResult_0, %valid_1 = gpu.shuffle xor %cst, %c16_i32, %c64_i32 : f32
      %shuffleResult_2, %valid_3 = gpu.shuffle xor %cst, %c32_i32, %c64_i32 : f32
      return %shuffleResult, %shuffleResult_0, %shuffleResult_2 : f32, f32, f32
    }
    func.func @gpu_shuffle_vec(%arg0: vector<4xf16>, %arg1: i32, %arg2: i32) -> vector<4xf16> {
      %shuffleResult, %valid = gpu.shuffle xor %arg0, %arg1, %arg2 : vector<4xf16>
      return %shuffleResult : vector<4xf16>
    }
  }
}

// -----
module {
  gpu.module @test_custom_data_layout attributes {llvm.data_layout = "e"} {
  }
}

// -----
module {
  gpu.module @test_module {
    func.func @gpu_dim_int_max_upper_bound() -> index {
      %block_dim_x = gpu.block_dim x upper_bound 2147483647
      return %block_dim_x : index
    }
  }
}

// -----
module {
  gpu.module @test_module {
    func.func @broadcast(%arg0: index, %arg1: i32) -> (index, index) {
      %0 = gpu.subgroup_broadcast %arg0, first_active_lane : index
      %1 = gpu.subgroup_broadcast %arg0, specific_lane %arg1 : index
      return %0, %1 : index, index
    }
    func.func @broadcast_i8(%arg0: i8, %arg1: i32) -> (i8, i8) {
      %0 = gpu.subgroup_broadcast %arg0, first_active_lane : i8
      %1 = gpu.subgroup_broadcast %arg0, specific_lane %arg1 : i8
      return %0, %1 : i8, i8
    }
    func.func @broadcast_4xi16(%arg0: vector<4xi16>) -> vector<4xi16> {
      %0 = gpu.subgroup_broadcast %arg0, first_active_lane : vector<4xi16>
      return %0 : vector<4xi16>
    }
    func.func @broadcast_2x2xi16(%arg0: vector<2x2xi16>) -> vector<2x2xi16> {
      %0 = gpu.subgroup_broadcast %arg0, first_active_lane : vector<2x2xi16>
      return %0 : vector<2x2xi16>
    }
    func.func @broadcast_memref(%arg0: memref<?xi32>) -> memref<?xi32> {
      %0 = gpu.subgroup_broadcast %arg0, first_active_lane : memref<?xi32>
      return %0 : memref<?xi32>
    }
    func.func @broadcast_i48(%arg0: i48) -> i48 {
      %0 = gpu.subgroup_broadcast %arg0, first_active_lane : i48
      return %0 : i48
    }
    func.func @broadcast_3xi16(%arg0: vector<3xi16>) -> vector<3xi16> {
      %0 = gpu.subgroup_broadcast %arg0, first_active_lane : vector<3xi16>
      return %0 : vector<3xi16>
    }
    func.func @ballot(%arg0: i1) -> (i32, i64) {
      %0 = gpu.ballot %arg0 : i32
      %1 = gpu.ballot %arg0 : i64
      return %0, %1 : i32, i64
    }
  }
}

