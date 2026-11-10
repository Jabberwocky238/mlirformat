module {
  memref.global "private" constant @__constant_4xi32 : memref<4xi32> = dense<[1, 2, 3, 4]> {alignment = 16 : i64}
  func.func @main(%arg0: i32) -> i32 {
    %0 = tensor.empty() : tensor<10xbf16>
    %1 = memref.get_global @__constant_4xi32 : memref<4xi32>
    return %arg0 : i32
  }
}

// -----
module @named_module_acceptable {
  func.func @main(%arg0: tensor<10xf32>) -> tensor<10xf32> {
    %0 = tensor.empty() : tensor<10xbf16>
    return %arg0 : tensor<10xf32>
  }
}

// -----
module @named_module_with_dead_args {
  func.func private @compute(%arg0: i32, %arg1: i32) -> i32 {
    return %arg0 : i32
  }
  func.func @main() -> i32 {
    %c1_i32 = arith.constant 1 : i32
    %c2_i32 = arith.constant 2 : i32
    %0 = call @compute(%c1_i32, %c2_i32) : (i32, i32) -> i32
    return %0 : i32
  }
}

// -----
module {
  func.func @acceptable_ir_has_cleanable_loop_of_conditional_and_branch_op(%arg0: i1) {
    %c0_i32 = arith.constant 0 : i32
    cf.br ^bb1(%c0_i32 : i32)
  ^bb1(%0: i32):  // 2 preds: ^bb0, ^bb2
    %c1_i32 = arith.constant 1 : i32
    cf.br ^bb2(%0, %c1_i32 : i32, i32)
  ^bb2(%1: i32, %2: i32):  // pred: ^bb1
    cf.cond_br %arg0, ^bb1(%1 : i32), ^bb3(%1 : i32)
  ^bb3(%3: i32):  // pred: ^bb2
    return
  }
}

// -----
module {
  func.func @cleanable_loop_iter_args_value(%arg0: index) -> index {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    %c0_0 = arith.constant 0 : index
    %0:2 = scf.for %arg1 = %c0 to %c10 step %c1 iter_args(%arg2 = %arg0, %arg3 = %c0_0) -> (index, index) {
      %1 = arith.addi %arg2, %arg1 : index
      scf.yield %1, %arg3 : index, index
    }
    return %0#0 : index
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
module {
  func.func @dead_linalg_generic() {
    %cst = arith.constant dense<54> : tensor<1x25x13xi32>
    %cst_0 = arith.constant dense<11> : tensor<1x25x13xi32>
    %0 = tensor.empty() : tensor<1x25x13xi32>
    %1 = linalg.generic {indexing_maps = [#map, #map, #map1], iterator_types = ["parallel", "parallel", "parallel"]} ins(%cst, %cst_0 : tensor<1x25x13xi32>, tensor<1x25x13xi32>) outs(%0 : tensor<1x25x13xi32>) {
    ^bb0(%in: i32, %in_1: i32, %out: i32):
      %2 = arith.xori %in, %in_1 : i32
      linalg.yield %2 : i32
    } -> tensor<1x25x13xi32>
    return
  }
}

// -----
module {
  func.func private @clean_func_op_remove_argument_and_return_value(%arg0: i32) -> i32 {
    return %arg0 : i32
  }
  func.func @main(%arg0: i32) {
    %0 = call @clean_func_op_remove_argument_and_return_value(%arg0) : (i32) -> i32
    return
  }
}

// -----
module {
  func.func private @clean_func_op_remove_side_effecting_op(%arg0: i32) -> i32 {
    vector.print %arg0 : i32
    return %arg0 : i32
  }
}

// -----
module {
  func.func private @clean_func_op_remove_arguments(%arg0: memref<i32>, %arg1: i32) -> (i32, i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.addi %arg1, %arg1 : i32
    return %c0_i32, %arg1 : i32, i32
  }
  func.func @main(%arg0: memref<i32>, %arg1: i32, %arg2: i32) -> (i32, memref<i32>) {
    %0:2 = test.call_on_device @clean_func_op_remove_arguments(%arg0, %arg1), %arg2 : (memref<i32>, i32, i32) -> (i32, i32)
    return %0#0, %arg0 : i32, memref<i32>
  }
}

// -----
module {
  func.func private @clean_func_op_remove_return_values(%arg0: memref<i32>) -> (i32, i32) {
    %c0_i32 = arith.constant 0 : i32
    memref.store %c0_i32, %arg0[] : memref<i32>
    return %c0_i32, %c0_i32 : i32, i32
  }
  func.func @main(%arg0: memref<i32>) -> i32 {
    %0:2 = call @clean_func_op_remove_return_values(%arg0) : (memref<i32>) -> (i32, i32)
    %1:2 = call @clean_func_op_remove_return_values(%arg0) : (memref<i32>) -> (i32, i32)
    return %0#0 : i32
  }
}

// -----
module {
  func.func private @clean_func_op_dont_remove_return_values() -> (i32, i32) {
    %c0_i32 = arith.constant 0 : i32
    return %c0_i32, %c0_i32 : i32, i32
  }
  func.func @main() -> (i32, i32) {
    %0:2 = call @clean_func_op_dont_remove_return_values() : () -> (i32, i32)
    %1:2 = call @clean_func_op_dont_remove_return_values() : () -> (i32, i32)
    return %0#0, %1#1 : i32, i32
  }
}

// -----
module {
  func.func @clean_region_branch_op_dont_remove_first_2_results_but_remove_first_operand(%arg0: i1, %arg1: i32, %arg2: i32) -> i32 {
    %0:3 = scf.while (%arg3 = %arg1, %arg4 = %arg2) : (i32, i32) -> (i32, i32, i32) {
      %1 = arith.addi %arg4, %arg4 : i32
      %2 = arith.addi %arg3, %arg3 : i32
      scf.condition(%arg0) %1, %arg4, %2 : i32, i32, i32
    } do {
    ^bb0(%arg3: i32, %arg4: i32, %arg5: i32):
      %1 = arith.addi %arg4, %arg4 : i32
      scf.yield %arg5, %1 : i32, i32
    }
    return %0#0 : i32
  }
}

// -----
module {
  func.func @clean_region_branch_op_remove_last_2_results_last_2_arguments_and_last_operand(%arg0: i1) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    %c2_i32 = arith.constant 2 : i32
    %0:4 = scf.while (%arg1 = %c0_i32, %arg2 = %c1_i32, %arg3 = %c2_i32) : (i32, i32, i32) -> (i32, i32, i32, i32) {
      %1 = arith.addi %arg3, %arg3 : i32
      %2 = func.call @identity(%arg3) : (i32) -> i32
      scf.condition(%arg0) %arg2, %arg1, %1, %2 : i32, i32, i32, i32
    } do {
    ^bb0(%arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32):
      %1 = arith.addi %arg3, %arg4 : i32
      scf.yield %arg1, %arg2, %1 : i32, i32, i32
    }
    return %0#0 : i32
  }
  func.func private @identity(%arg0: i32) -> i32 {
    return %arg0 : i32
  }
}

// -----
module {
  func.func @clean_region_branch_op_remove_result(%arg0: index, %arg1: memref<i32>) {
    %0 = scf.index_switch %arg0 -> i32 
    case 1 {
      %c10_i32 = arith.constant 10 : i32
      memref.store %c10_i32, %arg1[] : memref<i32>
      scf.yield %c10_i32 : i32
    }
    default {
      %c11_i32 = arith.constant 11 : i32
      scf.yield %c11_i32 : i32
    }
    return
  }
}

// -----
module {
  func.func private @clean_simple_ops(%arg0: i32, %arg1: memref<i32>, %arg2: i32) -> (i32, i32, i32, i32) {
    %0 = arith.addi %arg0, %arg0 : i32
    %c2_i32 = arith.constant 2 : i32
    %1 = arith.muli %0, %c2_i32 : i32
    %2 = arith.addi %1, %0 : i32
    %c7_i32 = arith.constant 7 : i32
    %3 = arith.subi %arg0, %2 : i32
    %c3_i32 = arith.constant 3 : i32
    %4 = arith.addi %arg0, %c3_i32 : i32
    memref.store %4, %arg1[] : memref<i32>
    return %1, %2, %c7_i32, %3 : i32, i32, i32, i32
  }
  func.func @main(%arg0: i32, %arg1: memref<i32>, %arg2: i32) -> i32 {
    %0:4 = call @clean_simple_ops(%arg0, %arg1, %arg2) : (i32, memref<i32>, i32) -> (i32, i32, i32, i32)
    return %0#0 : i32
  }
}

// -----
module {
  func.func private @clean_region_branch_op_erase_it(%arg0: i32, %arg1: i1) -> i32 {
    %0 = scf.while (%arg2 = %arg0) : (i32) -> i32 {
      scf.condition(%arg1) %arg2 : i32
    } do {
    ^bb0(%arg2: i32):
      scf.yield %arg2 : i32
    }
    return %0 : i32
  }
  func.func @main(%arg0: i32, %arg1: i1) {
    %0 = call @clean_region_branch_op_erase_it(%arg0, %arg1) : (i32, i1) -> i32
    return
  }
}

// -----
module {
  func.func @clean_region_branch_op_with_empty_region(%arg0: i1, %arg1: memref<f32>) {
    %cst = arith.constant 1.000000e+00 : f32
    scf.if %arg0 {
      memref.store %cst, %arg1[] : memref<f32>
    }
    return
  }
}

// -----
#map = affine_map<(d0)[s0, s1] -> (d0 * s0 + s1)>
module {
  func.func @kernel(%arg0: memref<18xf32>) {
    %c1 = arith.constant 1 : index
    %c18 = arith.constant 18 : index
    gpu.launch blocks(%arg1, %arg2, %arg3) in (%arg7 = %c18, %arg8 = %c18, %arg9 = %c18) threads(%arg4, %arg5, %arg6) in (%arg10 = %c1, %arg11 = %c1, %arg12 = %c1) {
      %c1_0 = arith.constant 1 : index
      %c0 = arith.constant 0 : index
      %cst = arith.constant 25.4669495 : f32
      %0 = affine.apply #map(%arg1)[%c1_0, %c0]
      memref.store %cst, %arg0[%0] : memref<18xf32>
      gpu.terminator
    } {SCFToGPU_visited}
    return
  }
}

// -----
module {
  module @llvm_unreachable {
    func.func private @fn_with_llvm_unreachable(%arg0: tensor<4x4xf32>) -> tensor<4x4xi1> {
      llvm.unreachable
    }
    func.func private @main(%arg0: tensor<4x4xf32>) {
      %0 = call @fn_with_llvm_unreachable(%arg0) : (tensor<4x4xf32>) -> tensor<4x4xi1>
      llvm.return
    }
  }
  func.func private @no_block_func_declaration()
}

// -----
module {
  llvm.func @no_block_external_func() attributes {sym_visibility = "private"}
}

// -----
module {
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
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (0)>
module {
  func.func @linalg_red_add(%arg0: tensor<?xf32>, %arg1: tensor<1xf32>) -> tensor<1xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["reduction"]} ins(%arg0 : tensor<?xf32>) outs(%arg1 : tensor<1xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.addf %in, %out : f32
      %2 = arith.subf %1, %out : f32
      linalg.yield %1 : f32
    } -> tensor<1xf32>
    return %0 : tensor<1xf32>
  }
}

// -----
module {
  func.func @test_zero_operands(%arg0: memref<10xindex>, %arg1: memref<10xf32>) {
    %c0 = arith.constant 0 : index
    %0 = memref.alloca_scope  -> (index) {
      %1 = arith.addi %c0, %c0 : index
      memref.store %1, %arg0[%c0] : memref<10xindex>
      memref.alloca_scope.return %1 : index
    }
    return
  }
}

// -----
module {
  func.func @test_atomic_yield(%arg0: memref<10xf32>, %arg1: index) {
    %0 = memref.generic_atomic_rmw %arg0[%arg1] : memref<10xf32> {
    ^bb0(%arg2: f32):
      %cst = arith.constant 1.000000e+00 : f32
      memref.atomic_yield %cst : f32
    }
    return
  }
}

// -----
module @return_void_with_unused_argument {
  func.func private @fn_return_void_with_unused_argument(%arg0: i32, %arg1: memref<4xi32>) {
    %0 = arith.addi %arg0, %arg0 : i32
    %c0 = arith.constant 0 : index
    %alloc = memref.alloc() : memref<1xi32>
    memref.store %0, %alloc[%c0] : memref<1xi32>
    return
  }
  func.func @main(%arg0: i32) -> memref<4xi32> {
    %alloc = memref.alloc() : memref<4xi32>
    call @fn_return_void_with_unused_argument(%arg0, %alloc) : (i32, memref<4xi32>) -> ()
    return %alloc : memref<4xi32>
  }
}

// -----
module {
  func.func private @keep_region_branch_operands_valid(%arg0: memref<f64>) {
    %false = arith.constant false
    %cst = arith.constant 2.000000e+00 : f64
    %0 = memref.load %arg0[] {name = "caller"} : memref<f64>
    memref.store %cst, %arg0[] {name = "callee"} : memref<f64>
    %1 = scf.if %false -> (memref<f64>) {
      scf.yield %arg0 : memref<f64>
    } else {
      %2 = bufferization.clone %arg0 : memref<f64> to memref<f64>
      scf.yield %2 : memref<f64>
    }
    %true = arith.constant true
    %base_buffer, %offset = memref.extract_strided_metadata %arg0 : memref<f64> -> memref<f64>, index
    %base_buffer_0, %offset_1 = memref.extract_strided_metadata %1 : memref<f64> -> memref<f64>, index
    bufferization.dealloc (%base_buffer, %base_buffer_0 : memref<f64>, memref<f64>) if (%false, %true)
    return
  }
}

// -----
module {
  module @dynamically_unreachable {
    func.func @dynamically_unreachable() {
      %c0_i64 = arith.constant 0 : i64
      %false = arith.constant false
      cf.cond_br %false, ^bb1, ^bb2
    ^bb1:  // 2 preds: ^bb0, ^bb1
      %0 = arith.cmpi eq, %c0_i64, %c0_i64 : i64
      cf.br ^bb1
    ^bb2:  // pred: ^bb0
      return
    }
  }
  module @last_block_not_exit {
    func.func private @terminated_with_condbr(%arg0: i1, %arg1: i1) -> i1 {
      %true = arith.constant true
      %false = arith.constant false
      cf.cond_br %arg0, ^bb1(%false : i1), ^bb2
    ^bb1(%0: i1):  // 3 preds: ^bb0, ^bb2, ^bb2
      return %0 : i1
    ^bb2:  // pred: ^bb0
      cf.cond_br %arg1, ^bb1(%false : i1), ^bb1(%true : i1)
    }
    func.func public @call_private_but_not_use() {
      %false = arith.constant false
      %true = arith.constant true
      %0 = call @terminated_with_condbr(%false, %true) : (i1, i1) -> i1
      return
    }
  }
}

// -----
module {
  func.func private @single_parameter(%arg0: index) {
    return
  }
  func.func private @mutl_parameter(%arg0: index, %arg1: index, %arg2: index) -> index {
    return %arg1 : index
  }
  func.func private @eliminate_parameter(%arg0: index, %arg1: index) {
    call @single_parameter(%arg0) : (index) -> ()
    return
  }
  func.func @callee(%arg0: index, %arg1: index, %arg2: index) -> index {
    call @eliminate_parameter(%arg0, %arg1) : (index, index) -> ()
    %0 = call @mutl_parameter(%arg0, %arg1, %arg2) : (index, index, index) -> index
    return %0 : index
  }
}

// -----
module {
  func.func @dead_value_loop_ivs_has_result(%arg0: index, %arg1: index, %arg2: index, %arg3: i1) -> i1 {
    %0 = scf.for %arg4 = %arg0 to %arg1 step %arg2 iter_args(%arg5 = %arg3) -> (i1) {
      cf.assert %arg3, "loop not dead"
      scf.yield %arg3 : i1
    }
    return %0 : i1
  }
}

// -----
module {
  func.func @dead_value_loop_ivs_no_result(%arg0: index, %arg1: index, %arg2: index, %arg3: memref<?xf32>, %arg4: f32, %arg5: index) {
    scf.for %arg6 = %arg0 to %arg1 step %arg2 {
      memref.store %arg4, %arg3[%arg5] : memref<?xf32>
    }
    return
  }
}

// -----
module {
  func.func @op_block_have_dead_arg(%arg0: index, %arg1: index, %arg2: i1) {
    scf.execute_region {
      cf.cond_br %arg2, ^bb1(%arg0 : index), ^bb1(%arg1 : index)
    ^bb1(%0: index):  // 2 preds: ^bb0, ^bb0
      scf.yield
    }
    return
  }
}

// -----
module {
  func.func private @remove_dead_branch_op(%arg0: i1, %arg1: i64, %arg2: i64) -> i64 {
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    return %arg1 : i64
  ^bb2:  // pred: ^bb0
    return %arg2 : i64
  }
}

// -----
module {
  func.func @affine_loop_no_use_iv_has_side_effect_op() {
    %c1 = arith.constant 1 : index
    %alloc = memref.alloc() : memref<10xindex>
    affine.for %arg0 = 0 to 79 {
      memref.store %c1, %alloc[%c1] : memref<10xindex>
    }
    return
  }
}

// -----
module {
  func.func @scf_while_dead_iter_args() -> i32 {
    %c5_i32 = arith.constant 5 : i32
    %0:2 = scf.while (%arg0 = %c5_i32) : (i32) -> (i32, i32) {
      vector.print %arg0 : i32
      %1 = arith.cmpi slt, %arg0, %c5_i32 : i32
      scf.condition(%1) %arg0, %arg0 : i32, i32
    } do {
    ^bb0(%arg0: i32, %arg1: i32):
      %1 = scf.execute_region -> i32 {
        scf.yield %arg1 : i32
      }
      scf.yield %1 : i32
    }
    return %0#0 : i32
  }
}

// -----
module {
  func.func @replace_dead_operation_results_with_poison(%arg0: vector<1xindex>) -> vector<1xindex> {
    %0 = scf.while (%arg1 = %arg0) : (vector<1xindex>) -> vector<1xindex> {
      %true = arith.constant true
      scf.condition(%true) %arg1 : vector<1xindex>
    } do {
    ^bb0(%arg1: vector<1xindex>):
      scf.yield %arg1 : vector<1xindex>
    }
    %1 = scf.while (%arg1 = %0) : (vector<1xindex>) -> vector<1xindex> {
      %2:3 = "test.three"(%0) : (vector<1xindex>) -> (i1, i32, vector<1xindex>)
      scf.condition(%2#0) %2#2 : vector<1xindex>
    } do {
    ^bb0(%arg1: vector<1xindex>):
      scf.yield %arg1 : vector<1xindex>
    }
    return %1 : vector<1xindex>
  }
}

// -----
module @func_with_non_call_users {
  func.func private @callee(%arg0: i32, %arg1: i32) {
    return
  }
  func.func @main_func() {
    %0 = llvm.mlir.constant(1 : i32) : i32
    call @callee(%0, %0) : (i32, i32) -> ()
    return
  }
  spirv.EntryPoint "GLCompute" @callee
}

