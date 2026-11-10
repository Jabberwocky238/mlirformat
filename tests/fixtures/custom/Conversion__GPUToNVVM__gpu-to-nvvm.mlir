module {
  gpu.module @test_module_0 {
    func.func @gpu_index_ops() -> (index, index, index, index, index, index, index, index, index, index, index, index, index) {
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
      return %thread_id_x, %thread_id_y, %thread_id_z, %block_dim_x, %block_dim_y, %block_dim_z, %block_id_x, %block_id_y, %block_id_z, %grid_dim_x, %grid_dim_y, %grid_dim_z, %0 : index, index, index, index, index, index, index, index, index, index, index, index, index
    }
  }
  gpu.module @test_module_1 {
    func.func @gpu_index_comp(%arg0: index) -> index {
      %0 = arith.addi %arg0, %arg0 : index
      return %0 : index
    }
  }
  gpu.module @test_module_2 {
    gpu.func @gpu_all_reduce_op() {
      %cst = arith.constant 1.000000e+00 : f32
      %0 = gpu.all_reduce add %cst uniform {
      } : (f32) -> f32
      gpu.return
    }
  }
  gpu.module @test_module_3 {
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
  gpu.module @test_module_4 {
    func.func @gpu_shuffle() -> (f32, f32, f32, f32, i1, i1, i1, i1) {
      %cst = arith.constant 1.000000e+00 : f32
      %c4_i32 = arith.constant 4 : i32
      %c23_i32 = arith.constant 23 : i32
      %shuffleResult, %valid = gpu.shuffle xor %cst, %c4_i32, %c23_i32 : f32
      %shuffleResult_0, %valid_1 = gpu.shuffle up %cst, %c4_i32, %c23_i32 : f32
      %shuffleResult_2, %valid_3 = gpu.shuffle down %cst, %c4_i32, %c23_i32 : f32
      %shuffleResult_4, %valid_5 = gpu.shuffle idx %cst, %c4_i32, %c23_i32 : f32
      return %shuffleResult, %shuffleResult_0, %shuffleResult_2, %shuffleResult_4, %valid, %valid_1, %valid_3, %valid_5 : f32, f32, f32, f32, i1, i1, i1, i1
    }
    func.func @gpu_shuffle_unused_pred() -> (f32, f32, f32, f32) {
      %cst = arith.constant 1.000000e+00 : f32
      %c4_i32 = arith.constant 4 : i32
      %c23_i32 = arith.constant 23 : i32
      %shuffleResult, %valid = gpu.shuffle xor %cst, %c4_i32, %c23_i32 : f32
      %shuffleResult_0, %valid_1 = gpu.shuffle up %cst, %c4_i32, %c23_i32 : f32
      %shuffleResult_2, %valid_3 = gpu.shuffle down %cst, %c4_i32, %c23_i32 : f32
      %shuffleResult_4, %valid_5 = gpu.shuffle idx %cst, %c4_i32, %c23_i32 : f32
      return %shuffleResult, %shuffleResult_0, %shuffleResult_2, %shuffleResult_4 : f32, f32, f32, f32
    }
  }
  gpu.module @test_module_5 {
    func.func @gpu_sync() {
      gpu.barrier
      return
    }
    func.func @gpu_sync_subgroup() {
      gpu.barrier scope <subgroup>
      return
    }
    func.func @gpu_named_barriers(%arg0: i32) {
      %0 = gpu.initialize_named_barrier %arg0 : i32 -> !gpu.named_barrier
      %c2_i32 = arith.constant 2 : i32
      %1 = gpu.initialize_named_barrier %c2_i32 : i32 -> !gpu.named_barrier
      gpu.barrier named(%0 : !gpu.named_barrier)
      gpu.barrier named(%1 : !gpu.named_barrier)
      return
    }
    func.func @gpu_named_barrier_arg(%arg0: !gpu.named_barrier) {
      gpu.barrier named(%arg0 : !gpu.named_barrier)
      return
    }
  }
  gpu.module @test_module_6 {
    func.func @gpu_fabs(%arg0: f32, %arg1: f64) -> (f32, f64) {
      %0 = math.absf %arg0 : f32
      %1 = math.absf %arg1 : f64
      return %0, %1 : f32, f64
    }
  }
  gpu.module @test_module_7 {
    func.func @gpu_cbrt(%arg0: f32, %arg1: f64) -> (f32, f64) {
      %0 = math.cbrt %arg0 : f32
      %1 = math.cbrt %arg1 : f64
      return %0, %1 : f32, f64
    }
  }
  gpu.module @test_module_8 {
    func.func @gpu_ceil(%arg0: f32, %arg1: f64) -> (f32, f64) {
      %0 = math.ceil %arg0 : f32
      %1 = math.ceil %arg1 : f64
      return %0, %1 : f32, f64
    }
  }
  gpu.module @test_module_9 {
    func.func @gpu_floor(%arg0: f32, %arg1: f64) -> (f32, f64) {
      %0 = math.floor %arg0 : f32
      %1 = math.floor %arg1 : f64
      return %0, %1 : f32, f64
    }
  }
  gpu.module @test_module_10 {
    func.func @gpu_cos(%arg0: f32, %arg1: f64) -> (f32, f64, f32) {
      %0 = math.cos %arg0 : f32
      %1 = math.cos %arg1 : f64
      %2 = math.cos %arg0 fastmath<afn> : f32
      return %0, %1, %2 : f32, f64, f32
    }
  }
  gpu.module @test_module_11 {
    func.func @gpu_exp(%arg0: f32, %arg1: f64) -> (f32, f64, f32) {
      %0 = math.exp %arg0 : f32
      %1 = math.exp %arg1 : f64
      %2 = math.exp %arg0 fastmath<fast> : f32
      return %0, %1, %2 : f32, f64, f32
    }
  }
  gpu.module @test_module_12 {
    func.func @gpu_exp2(%arg0: f32, %arg1: f64) -> (f32, f64) {
      %0 = math.exp2 %arg0 : f32
      %1 = math.exp2 %arg1 : f64
      return %0, %1 : f32, f64
    }
  }
  gpu.module @test_module_13 {
    func.func @gpu_log(%arg0: f32, %arg1: f64) -> (f32, f64, f32) {
      %0 = math.log %arg0 : f32
      %1 = math.log %arg1 : f64
      %2 = math.log %arg0 fastmath<afn> : f32
      return %0, %1, %2 : f32, f64, f32
    }
  }
  gpu.module @test_module_14 {
    func.func @gpu_log10(%arg0: f32, %arg1: f64) -> (f32, f64, f32) {
      %0 = math.log10 %arg0 : f32
      %1 = math.log10 %arg1 : f64
      %2 = math.log10 %arg0 fastmath<afn> : f32
      return %0, %1, %2 : f32, f64, f32
    }
  }
  gpu.module @test_module_15 {
    func.func @gpu_log1p(%arg0: f32, %arg1: f64) -> (f32, f64) {
      %0 = math.log1p %arg0 : f32
      %1 = math.log1p %arg1 : f64
      return %0, %1 : f32, f64
    }
  }
  gpu.module @test_module_16 {
    func.func @gpu_log2(%arg0: f32, %arg1: f64) -> (f32, f64, f32) {
      %0 = math.log2 %arg0 : f32
      %1 = math.log2 %arg1 : f64
      %2 = math.log2 %arg0 fastmath<fast> : f32
      return %0, %1, %2 : f32, f64, f32
    }
  }
  gpu.module @test_module_17 {
    func.func @gpu_sin(%arg0: f32, %arg1: f64) -> (f32, f64, f32) {
      %0 = math.sin %arg0 : f32
      %1 = math.sin %arg1 : f64
      %2 = math.sin %arg0 fastmath<fast> : f32
      return %0, %1, %2 : f32, f64, f32
    }
  }
  gpu.module @test_module_18 {
    func.func @gpu_tan(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64, f32) {
      %0 = math.tan %arg0 : f16
      %1 = math.tan %arg1 : f32
      %2 = math.tan %arg2 : f64
      %3 = math.tan %arg1 fastmath<fast> : f32
      return %0, %1, %2, %3 : f16, f32, f64, f32
    }
  }
  gpu.module @test_module_19 {
    func.func @gpu_tanh(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
      %0 = math.tanh %arg0 : f16
      %1 = math.tanh %arg1 : f32
      %2 = math.tanh %arg2 : f64
      return %0, %1, %2 : f16, f32, f64
    }
  }
  gpu.module @test_module_20 {
    func.func @gpu_rsqrt(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
      %0 = math.rsqrt %arg0 : f16
      %1 = math.rsqrt %arg1 : f32
      %2 = math.rsqrt %arg2 : f64
      return %0, %1, %2 : f16, f32, f64
    }
  }
  gpu.module @test_module_21 {
    func.func @gpu_sqrt(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
      %0 = math.sqrt %arg0 : f16
      %1 = math.sqrt %arg1 : f32
      %2 = math.sqrt %arg2 : f64
      return %0, %1, %2 : f16, f32, f64
    }
  }
  gpu.module @test_module_22 {
    func.func @gpu_atan(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
      %0 = math.atan %arg0 : f16
      %1 = math.atan %arg1 : f32
      %2 = math.atan %arg2 : f64
      return %0, %1, %2 : f16, f32, f64
    }
  }
  gpu.module @test_module_23 {
    func.func @gpu_atan2(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
      %0 = math.atan2 %arg0, %arg0 : f16
      %1 = math.atan2 %arg1, %arg1 : f32
      %2 = math.atan2 %arg2, %arg2 : f64
      return %0, %1, %2 : f16, f32, f64
    }
  }
  gpu.module @test_module_24 {
    "test.symbol_scope"() ({
      func.func @gpu_exp(%arg0: f32, %arg1: f64) -> (f32, f64, f32) {
        %0 = math.exp %arg0 : f32
        %1 = math.exp %arg1 : f64
        %2 = math.exp %arg0 fastmath<afn> : f32
        return %0, %1, %2 : f32, f64, f32
      }
      "test.finish"() : () -> ()
    }) : () -> ()
  }
  gpu.module @test_module_25 {
    func.func @gpu_expm1(%arg0: f32, %arg1: f64) -> (f32, f64) {
      %0 = math.expm1 %arg0 : f32
      %1 = math.expm1 %arg1 : f64
      return %0, %1 : f32, f64
    }
  }
  gpu.module @test_module_26 {
    func.func @gpu_pow(%arg0: f32, %arg1: f64) -> (f32, f64, f32) {
      %0 = math.powf %arg0, %arg0 : f32
      %1 = math.powf %arg1, %arg1 : f64
      %2 = math.powf %arg0, %arg0 fastmath<fast> : f32
      return %0, %1, %2 : f32, f64, f32
    }
  }
  gpu.module @test_module_27 {
    func.func @gpu_unroll(%arg0: vector<4xf32>) -> vector<4xf32> {
      %0 = math.exp %arg0 : vector<4xf32>
      return %0 : vector<4xf32>
    }
  }
  gpu.module @test_module_28 {
    gpu.func @kernel_func() kernel {
      gpu.return
    }
  }
  gpu.module @test_module_29 {
    gpu.func @test_const_printf() {
      gpu.printf "Hello, world\0A"
      gpu.printf "Hello, world\0A"
      gpu.return
    }
    gpu.func @test_printf(%arg0: i32, %arg1: f32) {
      gpu.printf "Hello: %d\0A", %arg0, %arg1 : i32, f32
      gpu.return
    }
  }
  gpu.module @test_module_30 {
    gpu.func @subgroup_reduce_add(%arg0: i32, %arg1: memref<i32>) {
      %0 = gpu.subgroup_reduce add %arg0 uniform : (i32) -> i32
      memref.store %0, %arg1[] : memref<i32>
      gpu.return
    }
    gpu.func @subgroup_reduce_minsi(%arg0: i32, %arg1: memref<i32>) {
      %0 = gpu.subgroup_reduce minsi %arg0 uniform : (i32) -> i32
      memref.store %0, %arg1[] : memref<i32>
      gpu.return
    }
    gpu.func @subgroup_reduce_maxsi(%arg0: i32, %arg1: memref<i32>) {
      %0 = gpu.subgroup_reduce maxsi %arg0 uniform : (i32) -> i32
      memref.store %0, %arg1[] : memref<i32>
      gpu.return
    }
    gpu.func @subgroup_reduce_and(%arg0: i32, %arg1: memref<i32>) {
      %0 = gpu.subgroup_reduce and %arg0 uniform : (i32) -> i32
      memref.store %0, %arg1[] : memref<i32>
      gpu.return
    }
    gpu.func @subgroup_reduce_or(%arg0: i32, %arg1: memref<i32>) {
      %0 = gpu.subgroup_reduce or %arg0 uniform : (i32) -> i32
      memref.store %0, %arg1[] : memref<i32>
      gpu.return
    }
    gpu.func @subgroup_reduce_xor(%arg0: i32, %arg1: memref<i32>) {
      %0 = gpu.subgroup_reduce xor %arg0 uniform : (i32) -> i32
      memref.store %0, %arg1[] : memref<i32>
      gpu.return
    }
  }
  gpu.module @test_module_31 {
    func.func @gpu_fmod(%arg0: f32, %arg1: f64) -> (f32, f64) {
      %0 = arith.remf %arg0, %arg0 : f32
      %1 = arith.remf %arg1, %arg1 : f64
      return %0, %1 : f32, f64
    }
  }
  gpu.module @test_module_32 {
    func.func @gpu_erf(%arg0: f32, %arg1: f64) -> (f32, f64) {
      %0 = math.erf %arg0 : f32
      %1 = math.erf %arg1 : f64
      return %0, %1 : f32, f64
    }
  }
  gpu.module @test_module_33 {
    gpu.func @kernel_with_block_size(%arg0: !llvm.ptr) kernel attributes {known_block_size = array<i32: 32, 4, 2>} {
      %thread_id_x = gpu.thread_id x
      %thread_id_y = gpu.thread_id y
      %thread_id_z = gpu.thread_id z
      %0 = arith.addi %thread_id_x, %thread_id_y : index
      %1 = arith.addi %0, %thread_id_z : index
      %2 = arith.index_cast %1 : index to i64
      llvm.store %2, %arg0 : i64, !llvm.ptr
      gpu.return
    }
  }
  gpu.module @test_module_34 {
    gpu.func @memref_signature(%arg0: memref<2xf32>, %arg1: f32) -> (memref<2xf32>, f32) {
      gpu.return %arg0, %arg1 : memref<2xf32>, f32
    }
  }
  gpu.module @test_module_35 {
    func.func @gpu_acos(%arg0: f32, %arg1: f64) -> (f32, f64) {
      %0 = math.acos %arg0 : f32
      %1 = math.acos %arg1 : f64
      return %0, %1 : f32, f64
    }
  }
  gpu.module @test_module_36 {
    func.func @gpu_acosh(%arg0: f32, %arg1: f64) -> (f32, f64) {
      %0 = math.acosh %arg0 : f32
      %1 = math.acosh %arg1 : f64
      return %0, %1 : f32, f64
    }
  }
  gpu.module @test_module_37 {
    func.func @gpu_asin(%arg0: f32, %arg1: f64) -> (f32, f64) {
      %0 = math.asin %arg0 : f32
      %1 = math.asin %arg1 : f64
      return %0, %1 : f32, f64
    }
  }
  gpu.module @test_module_38 {
    func.func @gpu_asinh(%arg0: f32, %arg1: f64) -> (f32, f64) {
      %0 = math.asinh %arg0 : f32
      %1 = math.asinh %arg1 : f64
      return %0, %1 : f32, f64
    }
  }
  gpu.module @test_module_39 {
    func.func @gpu_atanh(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
      %0 = math.atanh %arg0 : f16
      %1 = math.atanh %arg1 : f32
      %2 = math.atanh %arg2 : f64
      return %0, %1, %2 : f16, f32, f64
    }
  }
  gpu.module @test_module_40 {
    func.func @gpu_copysign(%arg0: f32, %arg1: f64) -> (f32, f64) {
      %0 = math.copysign %arg0, %arg0 : f32
      %1 = math.copysign %arg1, %arg1 : f64
      return %0, %1 : f32, f64
    }
  }
  gpu.module @test_module_41 {
    func.func @gpu_cosh(%arg0: f32, %arg1: f64) -> (f32, f64) {
      %0 = math.cosh %arg0 : f32
      %1 = math.cosh %arg1 : f64
      return %0, %1 : f32, f64
    }
  }
  gpu.module @test_module_42 {
    func.func @gpu_fma(%arg0: f32, %arg1: f64) -> (f32, f64) {
      %0 = math.fma %arg0, %arg0, %arg0 : f32
      %1 = math.fma %arg1, %arg1, %arg1 : f64
      return %0, %1 : f32, f64
    }
  }
  gpu.module @test_module_43 {
    func.func @gpu_round(%arg0: f32, %arg1: f64) -> (f32, f64) {
      %0 = math.round %arg0 : f32
      %1 = math.round %arg1 : f64
      return %0, %1 : f32, f64
    }
  }
  gpu.module @test_module_44 {
    func.func @gpu_roundeven(%arg0: f32, %arg1: f64) -> (f32, f64) {
      %0 = math.roundeven %arg0 : f32
      %1 = math.roundeven %arg1 : f64
      return %0, %1 : f32, f64
    }
  }
  gpu.module @test_module_45 {
    func.func @gpu_sinh(%arg0: f32, %arg1: f64) -> (f32, f64) {
      %0 = math.sinh %arg0 : f32
      %1 = math.sinh %arg1 : f64
      return %0, %1 : f32, f64
    }
  }
  gpu.module @test_module_46 {
    func.func @gpu_cosh_with_fastmath(%arg0: f32, %arg1: f64) -> (f32, f64) {
      %0 = math.cosh %arg0 fastmath<fast> : f32
      %1 = math.cosh %arg1 fastmath<afn> : f64
      return %0, %1 : f32, f64
    }
  }
  gpu.module @test_module_47 {
    func.func @gpu_sinh_with_fastmath(%arg0: f32, %arg1: f64) -> (f32, f64) {
      %0 = math.sinh %arg0 fastmath<contract> : f32
      %1 = math.sinh %arg1 : f64
      return %0, %1 : f32, f64
    }
  }
  gpu.module @test_module_48 {
    func.func @gpu_exp_with_fastmath(%arg0: f32, %arg1: f64) -> (f32, f64, f32) {
      %0 = math.exp %arg0 fastmath<reassoc> : f32
      %1 = math.exp %arg1 fastmath<contract> : f64
      %2 = math.exp %arg0 fastmath<ninf> : f32
      return %0, %1, %2 : f32, f64, f32
    }
  }
  gpu.module @test_module_49 {
    func.func @explicit_id_bounds() -> (index, index, index) {
      %thread_id_x = gpu.thread_id x upper_bound 32
      %block_dim_x = gpu.block_dim x upper_bound 32
      %0 = gpu.lane_id upper_bound 16
      return %thread_id_x, %block_dim_x, %0 : index, index, index
    }
  }
  gpu.module @test_module_50 {
    gpu.func @kernel_with_grid_size(%arg0: !llvm.ptr) kernel attributes {known_grid_size = array<i32: 32, 4, 2>} {
      %block_id_x = gpu.block_id x
      %block_id_y = gpu.block_id y
      %block_id_z = gpu.block_id z
      %0 = arith.addi %block_id_x, %block_id_y : index
      %1 = arith.addi %0, %block_id_z : index
      %2 = arith.index_cast %1 : index to i64
      llvm.store %2, %arg0 : i64, !llvm.ptr
      gpu.return
    }
  }
  gpu.module @test_module_51 {
    gpu.func @test_assert(%arg0: i1) kernel {
      cf.assert %arg0, "assert message"
      gpu.return
    }
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["gpu.module"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.gpu.gpu_rewrite_patterns
      } : !transform.any_op
      transform.apply_conversion_patterns to %0 {
        transform.apply_conversion_patterns.dialect_to_llvm "arith"
        transform.apply_conversion_patterns.dialect_to_llvm "cf"
        transform.apply_conversion_patterns.vector.vector_to_llvm
        transform.apply_conversion_patterns.func.func_to_llvm
        transform.apply_conversion_patterns.dialect_to_llvm "memref"
        transform.apply_conversion_patterns.gpu.gpu_to_nvvm {benefit = 10 : i16}
        transform.apply_conversion_patterns.gpu.gpu_wmma_to_nvvm
        transform.apply_conversion_patterns.gpu.gpu_subgroup_reduce_to_nvvm
        transform.apply_conversion_patterns.nvgpu.nvgpu_to_nvvm
      } with type_converter {
        transform.apply_conversion_patterns.memref.memref_to_llvm_type_converter
      } {illegal_dialects = ["gpu"], illegal_ops = ["llvm.copysign", "llvm.cos", "llvm.exp", "llvm.exp2", "llvm.fabs", "llvm.fceil", "llvm.ffloor", "llvm.frem", "llvm.log", "llvm.log10", "llvm.log2", "llvm.pow", "llvm.roundeven", "llvm.round", "llvm.sin", "llvm.sqrt"], legal_dialects = ["llvm", "memref", "nvvm", "test"], legal_ops = ["gpu.module", "gpu.yield"], partial_conversion} : !transform.any_op
      transform.yield 
    }
  }
  gpu.module @test_module_52 {
    func.func @gpu_abs(%arg0: i32) -> i32 {
      %0 = math.absi %arg0 : i32
      return %0 : i32
    }
  }
  gpu.module @test_module_53 {
    func.func @gpu_powi(%arg0: f32, %arg1: f64, %arg2: i32) -> (f32, f64) {
      %0 = math.fpowi %arg0, %arg2 : f32, i32
      %1 = math.fpowi %arg1, %arg2 : f64, i32
      return %0, %1 : f32, f64
    }
  }
  gpu.module @test_module_54 {
    func.func @fpclassify(%arg0: f32, %arg1: f64) -> (i1, i1, i1, i1, i1, i1) {
      %0 = math.isinf %arg0 : f32
      %1 = math.isinf %arg1 : f64
      %2 = math.isnan %arg0 : f32
      %3 = math.isnan %arg1 : f64
      %4 = math.isfinite %arg0 : f32
      %5 = math.isfinite %arg1 : f64
      return %0, %1, %2, %3, %4, %5 : i1, i1, i1, i1, i1, i1
    }
  }
  gpu.module @test_module_55 {
    func.func @gpu_erfc(%arg0: f32, %arg1: f64) -> (f32, f64) {
      %0 = math.erfc %arg0 : f32
      %1 = math.erfc %arg1 : f64
      return %0, %1 : f32, f64
    }
  }
  gpu.module @test_module_56 {
    func.func @gpu_sincos(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f16, f32, f32, f64, f64) {
      %sin, %cos = math.sincos %arg0 : f16
      %sin_0, %cos_1 = math.sincos %arg1 : f32
      %sin_2, %cos_3 = math.sincos %arg2 : f64
      return %sin, %cos, %sin_0, %cos_1, %sin_2, %cos_3 : f16, f16, f32, f32, f64, f64
    }
    func.func @gpu_sincos_fastmath(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f16, f32, f32, f64, f64) {
      %sin, %cos = math.sincos %arg0 fastmath<afn> : f16
      %sin_0, %cos_1 = math.sincos %arg1 fastmath<afn> : f32
      %sin_2, %cos_3 = math.sincos %arg2 fastmath<afn> : f64
      return %sin, %cos, %sin_0, %cos_1, %sin_2, %cos_3 : f16, f16, f32, f32, f64, f64
    }
  }
}

// -----
module {
  gpu.module @test_module_cluster_size {
    gpu.func @kernel_with_cluster_size() kernel attributes {known_cluster_size = array<i32: 8, 2, 4>} {
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test_module_cluster_block_ops {
    gpu.func @kernel_with_cluster_size(%arg0: !llvm.ptr) kernel attributes {known_cluster_size = array<i32: 8, 4, 2>} {
      %cluster_block_id_x = gpu.cluster_block_id x
      %cluster_block_id_y = gpu.cluster_block_id y
      %cluster_block_id_z = gpu.cluster_block_id z
      %cluster_dim_blocks_x = gpu.cluster_dim_blocks x
      %cluster_dim_blocks_y = gpu.cluster_dim_blocks y
      %cluster_dim_blocks_z = gpu.cluster_dim_blocks z
      %0 = arith.addi %cluster_block_id_x, %cluster_block_id_y : index
      %1 = arith.addi %0, %cluster_block_id_z : index
      %2 = arith.addi %1, %cluster_dim_blocks_x : index
      %3 = arith.addi %2, %cluster_dim_blocks_y : index
      %4 = arith.addi %3, %cluster_dim_blocks_z : index
      %5 = arith.index_cast %4 : index to i64
      llvm.store %5, %arg0 : i64, !llvm.ptr
      gpu.return
    }
  }
}

// -----
module attributes {gpu.container_module} {
  gpu.module @kernels {
    gpu.func @gpu_ballot(%arg0: i1) -> (i32, i64) {
      %0 = gpu.ballot %arg0 : i32
      %1 = gpu.ballot %arg0 : i64
      gpu.return %0, %1 : i32, i64
    }
  }
}

