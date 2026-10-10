module {
  func.func @loop_outline_op(%arg0: index, %arg1: index, %arg2: index) {
    scf.for %arg3 = %arg0 to %arg1 step %arg2 {
      scf.for %arg4 = %arg0 to %arg1 step %arg2 {
        %0 = arith.addi %arg3, %arg4 : index
      }
    }
    scf.for %arg3 = %arg0 to %arg1 step %arg2 {
      %0 = arith.addi %arg3, %arg3 : index
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["arith.addi"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {op_name = "scf.for"} : (!transform.any_op) -> !transform.op<"scf.for">
      %function, %call = transform.loop.outline %1 {func_name = "foo"} : (!transform.op<"scf.for">) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @loop_peel_op() {
    %c0 = arith.constant 0 : index
    %c41 = arith.constant 41 : index
    %c5 = arith.constant 5 : index
    scf.for %arg0 = %c0 to %c41 step %c5 {
      %0 = arith.addi %arg0, %arg0 : index
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["arith.addi"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {op_name = "scf.for"} : (!transform.any_op) -> !transform.op<"scf.for">
      %peeled_loop, %remainder_loop = transform.loop.peel %1 : (!transform.op<"scf.for">) -> (!transform.op<"scf.for">, !transform.op<"scf.for">)
      transform.debug.emit_remark_at %peeled_loop, "main loop" : !transform.op<"scf.for">
      transform.debug.emit_remark_at %remainder_loop, "remainder loop" : !transform.op<"scf.for">
      transform.yield 
    }
  }
}

// -----
module {
  func.func @loop_peel_first_iter_op() {
    %c0 = arith.constant 0 : index
    %c41 = arith.constant 41 : index
    %c5 = arith.constant 5 : index
    scf.for %arg0 = %c0 to %c41 step %c5 {
      %0 = arith.addi %arg0, %arg0 : index
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["arith.addi"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {op_name = "scf.for"} : (!transform.any_op) -> !transform.op<"scf.for">
      %peeled_loop, %remainder_loop = transform.loop.peel %1 {peel_front = true} : (!transform.op<"scf.for">) -> (!transform.op<"scf.for">, !transform.op<"scf.for">)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @loop_pipeline_op(%arg0: memref<?xf32>, %arg1: memref<?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant 1.000000e+00 : f32
    scf.for %arg2 = %c0 to %c4 step %c1 {
      %0 = memref.load %arg0[%arg2] : memref<?xf32>
      %1 = arith.addf %0, %cst : f32
      memref.store %1, %arg1[%arg2] : memref<?xf32>
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["arith.addf"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {op_name = "scf.for"} : (!transform.any_op) -> !transform.op<"scf.for">
      %2 = transform.loop.pipeline %1 : (!transform.op<"scf.for">) -> !transform.any_op
      transform.debug.emit_remark_at %2, "transformed" : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @loop_unroll_op() {
    %c0 = arith.constant 0 : index
    %c42 = arith.constant 42 : index
    %c5 = arith.constant 5 : index
    scf.for %arg0 = %c0 to %c42 step %c5 {
      %0 = arith.addi %arg0, %arg0 : index
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["arith.addi"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {op_name = "scf.for"} : (!transform.any_op) -> !transform.op<"scf.for">
      transform.loop.unroll %1 {factor = 4 : i64} : !transform.op<"scf.for">
      transform.yield 
    }
  }
}

// -----
module {
  func.func @loop_unroll_and_jam_op() {
    %c0 = arith.constant 0 : index
    %c40 = arith.constant 40 : index
    %c2 = arith.constant 2 : index
    scf.for %arg0 = %c0 to %c40 step %c2 {
      %0 = arith.addi %arg0, %arg0 : index
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["arith.addi"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {op_name = "scf.for"} : (!transform.any_op) -> !transform.op<"scf.for">
      transform.loop.unroll_and_jam %1 {factor = 4 : i64} : !transform.op<"scf.for">
      transform.yield 
    }
  }
}

// -----
module {
  func.func private @loop_unroll_and_jam_op(%arg0: memref<96x128xi8, 3>, %arg1: memref<128xi8, 3>) {
    %c96 = arith.constant 96 : index
    %c1 = arith.constant 1 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg2 = %c0 to %c128 step %c1 {
      %0 = memref.load %arg1[%arg2] : memref<128xi8, 3>
      %1 = scf.for %arg3 = %c0 to %c96 step %c1 iter_args(%arg4 = %0) -> (i8) {
        %2 = memref.load %arg0[%arg3, %arg2] : memref<96x128xi8, 3>
        %3 = arith.addi %2, %0 : i8
        scf.yield %3 : i8
      }
      memref.store %1, %arg1[%arg2] : memref<128xi8, 3>
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["memref.store"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {op_name = "scf.for"} : (!transform.any_op) -> !transform.op<"scf.for">
      transform.loop.unroll_and_jam %1 {factor = 4 : i64} : !transform.op<"scf.for">
      transform.yield 
    }
  }
}

// -----
module {
  func.func @loop_unroll_and_jam_op() {
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %c2 = arith.constant 2 : index
    scf.for %arg0 = %c0 to %c4 step %c2 {
      %0 = arith.addi %arg0, %arg0 : index
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["arith.addi"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {op_name = "scf.for"} : (!transform.any_op) -> !transform.op<"scf.for">
      transform.loop.unroll_and_jam %1 {factor = 4 : i64} : !transform.op<"scf.for">
      transform.yield 
    }
  }
}

// -----
module {
  func.func @loop_unroll_and_jam_op() {
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %c2 = arith.constant 2 : index
    scf.for %arg0 = %c0 to %c4 step %c2 {
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["arith.addi"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {op_name = "scf.for"} : (!transform.any_op) -> !transform.op<"scf.for">
      transform.loop.unroll_and_jam %1 {factor = 2 : i64} : !transform.op<"scf.for">
      transform.yield 
    }
  }
}

// -----
module {
  func.func @loop_unroll_and_jam_op(%arg0: memref<21x30xf32, 1>, %arg1: f32, %arg2: f32) {
    %0 = affine.for %arg3 = 0 to 21 iter_args(%arg4 = %arg1) -> (f32) {
      %1 = affine.for %arg5 = 0 to 30 iter_args(%arg6 = %arg2) -> (f32) {
        %3 = affine.load %arg0[%arg3, %arg5] : memref<21x30xf32, 1>
        %4 = arith.addf %arg6, %3 : f32
        affine.yield %4 : f32
      }
      %2 = arith.mulf %arg4, %1 : f32
      affine.yield %2 : f32
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["arith.addf"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {op_name = "affine.for"} : (!transform.any_op) -> !transform.op<"affine.for">
      %2 = transform.get_parent_op %1 {op_name = "affine.for"} : (!transform.op<"affine.for">) -> !transform.op<"affine.for">
      transform.loop.unroll_and_jam %2 {factor = 2 : i64} : !transform.op<"affine.for">
      transform.yield 
    }
  }
}

// -----
module {
  func.func @loop_unroll_op() {
    %c0 = arith.constant 0 : index
    %c42 = arith.constant 42 : index
    %c5 = arith.constant 5 : index
    affine.for %arg0 = %c0 to %c42 {
      %0 = arith.addi %arg0, %arg0 : index
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["arith.addi"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {op_name = "affine.for"} : (!transform.any_op) -> !transform.op<"affine.for">
      transform.debug.emit_remark_at %1, "affine for loop" : !transform.op<"affine.for">
      transform.loop.unroll %1 {affine = true, factor = 4 : i64} : !transform.op<"affine.for">
      transform.yield 
    }
  }
}

// -----
module {
  func.func @test_mixed_loops() {
    %c0 = arith.constant 0 : index
    %c42 = arith.constant 42 : index
    %c5 = arith.constant 5 : index
    scf.for %arg0 = %c0 to %c42 step %c5 {
      affine.for %arg1 = %c0 to %c42 {
        %0 = arith.addi %arg1, %arg1 : index
      }
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["arith.addi"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {op_name = "affine.for"} : (!transform.any_op) -> !transform.op<"affine.for">
      transform.debug.emit_remark_at %1, "affine for loop" : !transform.op<"affine.for">
      transform.loop.unroll %1 {factor = 4 : i64} : !transform.op<"affine.for">
      transform.yield 
    }
  }
}

// -----
module {
  func.func @test_promote_if_one_iteration(%arg0: index) -> index {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = scf.for %arg1 = %c0 to %c1 step %c1 iter_args(%arg2 = %arg0) -> (index) {
      %1 = "test.foo"(%arg0) : (index) -> index
      scf.yield %1 : index
    }
    return %0 : index
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["scf.for"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.loop.promote_if_one_iteration %0 : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @test_structural_conversion_patterns(%arg0: tensor<f32>) -> tensor<f32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    %0 = scf.for %arg1 = %c0 to %c10 step %c1 iter_args(%arg2 = %arg0) -> (tensor<f32>) {
      %1 = "test.foo"(%arg2) : (tensor<f32>) -> tensor<f32>
      scf.yield %1 : tensor<f32>
    }
    return %0 : tensor<f32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_conversion_patterns to %0 {
        transform.apply_conversion_patterns.scf.structural_conversions
      } with type_converter {
        transform.apply_conversion_patterns.transform.test_type_converter
      } {partial_conversion} : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @coalesce_i32_loops() {
    %c0_i32 = arith.constant 0 : i32
    %c128_i32 = arith.constant 128 : i32
    %c2_i32 = arith.constant 2 : i32
    %c64_i32 = arith.constant 64 : i32
    scf.for %arg0 = %c0_i32 to %c128_i32 step %c2_i32  : i32 {
      scf.for %arg1 = %c0_i32 to %c64_i32 step %c2_i32  : i32 {
        %0 = arith.addi %arg0, %arg1 : i32
      }
    } {coalesce}
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["scf.for"]} attributes {coalesce} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.cast %0 : !transform.any_op to !transform.op<"scf.for">
      %2 = transform.loop.coalesce %1 : (!transform.op<"scf.for">) -> !transform.op<"scf.for">
      transform.yield 
    }
  }
}

// -----
module {
  func.func @loop_pipeline(%arg0: memref<4x16xf32>, %arg1: vector<16xf32>) -> vector<16xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0.000000e+00 : f32
    %c3 = arith.constant 3 : index
    %0 = scf.for %arg2 = %c0 to %c3 step %c1 iter_args(%arg3 = %arg1) -> (vector<16xf32>) {
      %1 = vector.transfer_read %arg0[%arg2, %c0], %cst {in_bounds = [true]} : memref<4x16xf32>, vector<16xf32>
      %2 = arith.addf %1, %arg3 : vector<16xf32>
      scf.yield %2 : vector<16xf32>
    }
    return %0 : vector<16xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["scf.for"]} in %arg0 : (!transform.any_op) -> !transform.op<"scf.for">
      %1 = transform.loop.pipeline %0 {read_latency = 5 : i64, scheduling_type = "full-loops"} : (!transform.op<"scf.for">) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @loop_pipeline_lb_gt_0(%arg0: memref<4x16xf32>, %arg1: vector<16xf32>) -> vector<16xf32> {
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0.000000e+00 : f32
    %c3 = arith.constant 3 : index
    %0 = scf.for %arg2 = %c1 to %c3 step %c1 iter_args(%arg3 = %arg1) -> (vector<16xf32>) {
      %1 = vector.transfer_read %arg0[%arg2, %c1], %cst {in_bounds = [true]} : memref<4x16xf32>, vector<16xf32>
      %2 = arith.addf %1, %arg3 : vector<16xf32>
      scf.yield %2 : vector<16xf32>
    }
    return %0 : vector<16xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["scf.for"]} in %arg0 : (!transform.any_op) -> !transform.op<"scf.for">
      %1 = transform.loop.pipeline %0 {read_latency = 5 : i64, scheduling_type = "full-loops"} : (!transform.op<"scf.for">) -> !transform.any_op
      transform.yield 
    }
  }
}

