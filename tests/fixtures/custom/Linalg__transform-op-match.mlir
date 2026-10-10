module {
  func.func @bar() {
    %c0_i32 = arith.constant {my_attr} 0 : i32
    %c1_i32 = arith.constant 1 : i32
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["arith.constant"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.debug.emit_remark_at %0, "matched op name" : !transform.any_op
      transform.test_consume_operand %0 : !transform.any_op
      %1 = transform.structured.match ops{["arith.constant"]} attributes {my_attr} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.debug.emit_remark_at %1, "matched attr name" : !transform.any_op
      transform.test_consume_operand %1 : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @by_type() {
    %c0_i32 = arith.constant 0 : i32
    %cst = arith.constant 1.000000e+00 : f32
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["arith.constant"]} filter_result_type = f32 in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.debug.emit_remark_at %0, "matched op name" : !transform.any_op
      transform.test_consume_operand %0 : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @by_operand_type() {
    %cst = arith.constant 2.000000e+00 : f32
    %c8_i32 = arith.constant 8 : i32
    %0 = math.fpowi %cst, %c8_i32 : f32, i32
    %1 = arith.addf %cst, %cst : f32
    %2 = arith.fptoui %1 : f32 to i32
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["arith.fptoui"]} filter_operand_types = [f32] in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.debug.emit_remark_at %0, "matched op name" : !transform.any_op
      transform.test_consume_operand %0 : !transform.any_op
      %1 = transform.structured.match ops{["arith.addf"]} filter_operand_types = [f32] in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.debug.emit_remark_at %1, "matched op name" : !transform.any_op
      transform.test_consume_operand %1 : !transform.any_op
      %2 = transform.structured.match ops{["arith.fptoui"]} filter_operand_types = [i32] in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.debug.emit_remark_at %2, "should not match" : !transform.any_op
      transform.test_consume_operand %2 : !transform.any_op
      %3 = transform.structured.match ops{["math.fpowi"]} filter_operand_types = [f32] in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.debug.emit_remark_at %3, "should not match" : !transform.any_op
      transform.test_consume_operand %3 : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @foo(%arg0: tensor<4x4xf32>, %arg1: tensor<4x4xf32>, %arg2: tensor<4x4xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = linalg.fill ins(%cst : f32) outs(%arg2 : tensor<4x4xf32>) -> tensor<4x4xf32>
    %1 = linalg.matmul ins(%arg0, %arg1 : tensor<4x4xf32>, tensor<4x4xf32>) outs(%0 : tensor<4x4xf32>) -> tensor<4x4xf32>
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match interface{TilingInterface} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.debug.emit_remark_at %0, "tileable" : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d0, d2)>
module {
  func.func @match_complex_attribute(%arg0: tensor<12x128x32xf32>) -> tensor<128x12x32xf32> {
    %0 = tensor.empty() : tensor<128x12x32xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0 : tensor<12x128x32xf32>) outs(%0 : tensor<128x12x32xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<128x12x32xf32>
    return %1 : tensor<128x12x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} attributes {iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.debug.emit_remark_at %0, "matched complex attr" : !transform.any_op
      transform.test_consume_operand %0 : !transform.any_op
      %1 = transform.structured.match attributes {iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %2 = transform.num_associations %1 : (!transform.any_op) -> !transform.param<i64>
      transform.debug.emit_param_as_remark %2 : !transform.param<i64>
      transform.yield 
    }
  }
}

// -----
module {
  func.func private @callee()
  func.func @foo(%arg0: index, %arg1: index, %arg2: index) {
    scf.for %arg3 = %arg0 to %arg1 step %arg2 {
      func.call @callee() : () -> ()
    }
    scf.parallel (%arg3) = (%arg0) to (%arg1) step (%arg2) {
      func.call @callee() : () -> ()
      scf.reduce 
    }
    scf.forall (%arg3) in (%arg1) {
      func.call @callee() : () -> ()
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match interface{LoopLikeInterface} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.debug.emit_remark_at %0, "loop-like" : !transform.any_op
      transform.yield 
    }
  }
}

