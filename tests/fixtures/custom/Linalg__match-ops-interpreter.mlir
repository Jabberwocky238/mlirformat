#map = affine_map<(d0, d1) -> (d0, d1)>
module attributes {transform.with_named_sequence} {
  transform.named_sequence @print_structured(%arg0: !transform.any_op {transform.readonly}) {
    transform.debug.emit_remark_at %arg0, "structured" : !transform.any_op
    transform.yield 
  }
  transform.named_sequence @match_structured_empty(%arg0: !transform.any_op {transform.readonly}) -> !transform.any_op {
    %0 = transform.match.structured %arg0 : (!transform.any_op) -> !transform.any_op {
    ^bb0(%arg1: !transform.any_op):
      transform.match.structured.yield %arg1 : !transform.any_op
    }
    transform.yield %0 : !transform.any_op
  }
  transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.consumed}) {
    %updated_root = transform.foreach_match in %arg0 
        @match_structured_empty -> @print_structured : (!transform.any_op) -> !transform.any_op
    transform.yield 
  }
  func.func @payload() attributes {transform.target_tag = "start_here"} {
    %0 = tensor.empty() : tensor<2x3xf32>
    %cst = arith.constant 1.000000e+00 : f32
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<2x3xf32>) -> tensor<2x3xf32>
    %cst_0 = arith.constant dense<1.000000e+00> : tensor<3x4xf32>
    %cst_1 = arith.constant dense<1.000000e+03> : tensor<2x4xf32>
    %2 = linalg.matmul ins(%1, %cst_0 : tensor<2x3xf32>, tensor<3x4xf32>) outs(%cst_1 : tensor<2x4xf32>) -> tensor<2x4xf32>
    %cst_2 = arith.constant dense<2.000000e+00> : tensor<2x4xf32>
    %3 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel"]} ins(%2 : tensor<2x4xf32>) outs(%cst_2 : tensor<2x4xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<2x4xf32>
    return
  }
}

// -----
module attributes {transform.with_named_sequence} {
  transform.named_sequence @do_nothing(%arg0: !transform.any_op {transform.readonly}) {
    transform.yield 
  }
  transform.named_sequence @print_in_matcher(%arg0: !transform.any_op {transform.readonly}) -> !transform.any_op {
    transform.print %arg0 : !transform.any_op
    transform.yield %arg0 : !transform.any_op
  }
  transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.consumed}) {
    %updated_root = transform.foreach_match in %arg0 
        @print_in_matcher -> @do_nothing : (!transform.any_op) -> !transform.any_op
    transform.yield 
  }
  func.func @payload() attributes {transform.target_tag = "start_here"} {
    %0 = "test.print_me"() : () -> i1
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module attributes {transform.with_named_sequence} {
  transform.named_sequence @do_nothing(%arg0: !transform.any_op {transform.readonly}) {
    transform.yield 
  }
  transform.named_sequence @match_structured_suppress(%arg0: !transform.any_op {transform.readonly}) -> !transform.any_op {
    %0 = transform.match.structured failures(suppress) %arg0 : (!transform.any_op) -> !transform.any_op {
    ^bb0(%arg1: !transform.any_op):
      transform.match.structured.yield %arg1 : !transform.any_op
    }
    transform.debug.emit_remark_at %0, "structured" : !transform.any_op
    transform.debug.emit_remark_at %arg0, "other" : !transform.any_op
    transform.yield %0 : !transform.any_op
  }
  transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.consumed}) {
    %updated_root = transform.foreach_match restrict_root in %arg0 
        @match_structured_suppress -> @do_nothing : (!transform.any_op) -> !transform.any_op
    transform.yield 
  }
  func.func @payload() attributes {transform.target_tag = "start_here"} {
    %cst = arith.constant dense<1.000000e+00> : tensor<2x4xf32>
    %cst_0 = arith.constant dense<2.000000e+00> : tensor<2x4xf32>
    %0 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel"]} ins(%cst : tensor<2x4xf32>) outs(%cst_0 : tensor<2x4xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<2x4xf32>
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
module attributes {transform.with_named_sequence} {
  transform.named_sequence @print_passthrough(%arg0: !transform.any_op {transform.readonly}) {
    transform.debug.emit_remark_at %arg0, "passthrough" : !transform.any_op
    transform.yield 
  }
  transform.named_sequence @match_structured_body_passthrough(%arg0: !transform.any_op {transform.readonly}) -> !transform.any_op {
    %0 = transform.match.structured failures(propagate) %arg0 : (!transform.any_op) -> !transform.any_op {
    ^bb0(%arg1: !transform.any_op):
      transform.match.structured.body %arg1 {passthrough} : !transform.any_op
      transform.match.structured.yield %arg1 : !transform.any_op
    }
    transform.yield %0 : !transform.any_op
  }
  transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.consumed}) {
    %updated_root = transform.foreach_match in %arg0 
        @match_structured_body_passthrough -> @print_passthrough : (!transform.any_op) -> !transform.any_op
    transform.yield 
  }
  func.func @payload(%arg0: tensor<2xf32>, %arg1: tensor<2xf32>) attributes {transform.target_tag = "start_here"} {
    %0 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<2xf32>) outs(%arg1 : tensor<2xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<2xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<2xf32>) outs(%arg1 : tensor<2xf32>) {
    ^bb0(%in: f32, %out: f32):
      %3 = arith.mulf %in, %out : f32
      linalg.yield %3 : f32
    } -> tensor<2xf32>
    %2 = linalg.copy ins(%arg0 : tensor<2xf32>) outs(%arg1 : tensor<2xf32>) -> tensor<2xf32>
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
module attributes {transform.with_named_sequence} {
  transform.named_sequence @print_elementwise(%arg0: !transform.any_op {transform.readonly}) {
    transform.debug.emit_remark_at %arg0, "elementwise" : !transform.any_op
    transform.yield 
  }
  transform.named_sequence @match_structured_body_elementwise(%arg0: !transform.any_op {transform.readonly}) -> !transform.any_op {
    %0 = transform.match.structured failures(propagate) %arg0 : (!transform.any_op) -> !transform.any_op {
    ^bb0(%arg1: !transform.any_op):
      transform.match.structured.body %arg1 {elementwise} : !transform.any_op
      transform.match.structured.yield %arg1 : !transform.any_op
    }
    transform.yield %0 : !transform.any_op
  }
  transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.consumed}) {
    %updated_root = transform.foreach_match in %arg0 
        @match_structured_body_elementwise -> @print_elementwise : (!transform.any_op) -> !transform.any_op
    transform.yield 
  }
  func.func @payload(%arg0: tensor<2xf32>, %arg1: tensor<2xf32>, %arg2: tensor<2x3xf32>, %arg3: tensor<2xf32>, %arg4: tensor<2x3xf32>) -> (tensor<2xf32>, tensor<2x3xf32>, tensor<2x3xf32>) attributes {transform.target_tag = "start_here"} {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = linalg.fill ins(%cst : f32) outs(%arg3 : tensor<2xf32>) -> tensor<2xf32>
    %mapped = linalg.map { arith.addf } ins(%arg0, %arg1 : tensor<2xf32>, tensor<2xf32>) outs(%0 : tensor<2xf32>)
    %1 = linalg.generic {indexing_maps = [#map, #map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg2 : tensor<2xf32>, tensor<2x3xf32>) outs(%arg4 : tensor<2x3xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %3 = arith.addf %in, %in_0 : f32
      %dim = tensor.dim %mapped, %c0 : tensor<2xf32>
      %4 = arith.subi %dim, %c1 : index
      %extracted = tensor.extract %mapped[%4] : tensor<2xf32>
      %5 = arith.mulf %3, %extracted : f32
      linalg.yield %5 : f32
    } -> tensor<2x3xf32>
    %2 = linalg.generic {indexing_maps = [#map, #map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg2 : tensor<2xf32>, tensor<2x3xf32>) outs(%arg4 : tensor<2x3xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %3 = arith.addf %in, %in_0 : f32
      linalg.yield %3 : f32
    } -> tensor<2x3xf32>
    return %mapped, %2, %1 : tensor<2xf32>, tensor<2x3xf32>, tensor<2x3xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map3 = affine_map<(d0, d1) -> (d0, d1)>
module attributes {transform.with_named_sequence} {
  transform.named_sequence @print_reduction(%arg0: !transform.any_op {transform.readonly}) {
    transform.debug.emit_remark_at %arg0, "reduction" : !transform.any_op
    transform.yield 
  }
  transform.named_sequence @match_structured_body_reduction(%arg0: !transform.any_op {transform.readonly}) -> !transform.any_op {
    %0 = transform.match.structured failures(propagate) %arg0 : (!transform.any_op) -> !transform.any_op {
    ^bb0(%arg1: !transform.any_op):
      transform.match.structured.body %arg1 {reduction_position = 0 : i64} : !transform.any_op
      transform.match.structured.yield %arg1 : !transform.any_op
    }
    transform.yield %0 : !transform.any_op
  }
  transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.consumed}) {
    %updated_root = transform.foreach_match in %arg0 
        @match_structured_body_reduction -> @print_reduction : (!transform.any_op) -> !transform.any_op
    transform.yield 
  }
  func.func @payload(%arg0: tensor<2x4xf32>, %arg1: tensor<4x3xf32>, %arg2: tensor<2x3xf32>) attributes {transform.target_tag = "start_here"} {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<2x4xf32>, tensor<4x3xf32>) outs(%arg2 : tensor<2x3xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %6 = arith.mulf %in, %in_0 : f32
      %7 = arith.addf %6, %out : f32
      linalg.yield %7 : f32
    } -> tensor<2x3xf32>
    %1 = tensor.empty() : tensor<2x3xf32>
    %2:2 = linalg.generic {indexing_maps = [#map, #map1, #map2, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<2x4xf32>, tensor<4x3xf32>) outs(%arg2, %1 : tensor<2x3xf32>, tensor<2x3xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32, %out_1: f32):
      %6 = arith.mulf %in, %in_0 : f32
      %7 = arith.cmpf olt, %6, %out : f32
      %8 = arith.select %7, %6, %out : f32
      %9 = arith.select %7, %out_1, %6 : f32
      linalg.yield %8, %9 : f32, f32
    } -> (tensor<2x3xf32>, tensor<2x3xf32>)
    %3 = linalg.matmul ins(%arg0, %arg1 : tensor<2x4xf32>, tensor<4x3xf32>) outs(%arg2 : tensor<2x3xf32>) -> tensor<2x3xf32>
    %4 = tensor.empty() : tensor<2x4xf32>
    %5 = linalg.generic {indexing_maps = [#map3, #map3], iterator_types = ["parallel", "parallel"]} ins(%arg0 : tensor<2x4xf32>) outs(%4 : tensor<2x4xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<2x4xf32>
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module attributes {transform.with_named_sequence} {
  transform.named_sequence @do_nothing(%arg0: !transform.any_op {transform.readonly}) {
    transform.yield 
  }
  transform.named_sequence @print_dimension_size_match(%arg0: !transform.any_op {transform.readonly}) {
    transform.debug.emit_remark_at %arg0, "matched sizes" : !transform.any_op
    transform.yield 
  }
  transform.named_sequence @match_dimension_capture(%arg0: !transform.any_op {transform.readonly}) -> !transform.any_op {
    %0:9 = transform.match.structured failures(suppress) %arg0 : (!transform.any_op) -> (!transform.any_op, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>) {
    ^bb0(%arg1: !transform.any_op):
      %1 = transform.match.structured.dim %arg1[all] : (!transform.any_op) -> !transform.param<i64>
      %2 = transform.match.structured.dim %arg1[0] : (!transform.any_op) -> !transform.param<i64>
      %3 = transform.match.structured.dim %arg1[-1] : (!transform.any_op) -> !transform.param<i64>
      %4 = transform.match.structured.dim %arg1[0, 2] : (!transform.any_op) -> !transform.param<i64>
      %5 = transform.match.structured.dim %arg1[0, -1] : (!transform.any_op) -> !transform.param<i64>
      %6 = transform.match.structured.dim %arg1[except(-1)] : (!transform.any_op) -> !transform.param<i64>
      %7 = transform.match.structured.dim %arg1[except(0, -2)] : (!transform.any_op) -> !transform.param<i64>
      %8 = transform.match.structured.dim %arg1[0, -3] : (!transform.any_op) -> !transform.param<i64>
      transform.match.structured.yield %arg1, %1, %2, %3, %4, %5, %6, %7, %8 : !transform.any_op, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>
    }
    transform.debug.emit_param_as_remark %0#1, "dimensions all:" at %0#0 : !transform.param<i64>, !transform.any_op
    transform.debug.emit_param_as_remark %0#2, "dimension 0:" at %0#0 : !transform.param<i64>, !transform.any_op
    transform.debug.emit_param_as_remark %0#3, "dimension -1:" at %0#0 : !transform.param<i64>, !transform.any_op
    transform.debug.emit_param_as_remark %0#4, "dimensions 0, 2:" at %0#0 : !transform.param<i64>, !transform.any_op
    transform.debug.emit_param_as_remark %0#5, "dimensions 0, -1:" at %0#0 : !transform.param<i64>, !transform.any_op
    transform.debug.emit_param_as_remark %0#6, "dimensions except -1:" at %0#0 : !transform.param<i64>, !transform.any_op
    transform.debug.emit_param_as_remark %0#7, "dimensions except 0, -2:" at %0#0 : !transform.param<i64>, !transform.any_op
    transform.debug.emit_param_as_remark %0#8, "dimensions 0, -3:" at %0#0 : !transform.param<i64>, !transform.any_op
    transform.yield %0#0 : !transform.any_op
  }
  transform.named_sequence @match_dimension_sizes(%arg0: !transform.any_op {transform.readonly}) -> !transform.any_op {
    %0 = transform.match.structured failures(propagate) %arg0 : (!transform.any_op) -> !transform.any_op {
    ^bb0(%arg1: !transform.any_op):
      %1 = transform.match.structured.dim %arg1[all] : (!transform.any_op) -> !transform.param<i64>
      %2 = transform.param.constant 2 : i64 -> !transform.param<i64>
      %3 = transform.param.constant 3 : i64 -> !transform.param<i64>
      %4 = transform.param.constant 4 : i64 -> !transform.param<i64>
      %5 = transform.merge_handles %2, %3, %4 : !transform.param<i64>
      transform.match.param.cmpi eq %1, %5 : !transform.param<i64>
      transform.match.structured.yield %arg1 : !transform.any_op
    }
    transform.yield %0 : !transform.any_op
  }
  transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.consumed}) {
    %updated_root = transform.foreach_match in %arg0 
        @match_dimension_capture -> @do_nothing : (!transform.any_op) -> !transform.any_op
    %updated_root_0 = transform.foreach_match in %updated_root 
        @match_dimension_sizes -> @print_dimension_size_match : (!transform.any_op) -> !transform.any_op
    transform.yield 
  }
  func.func @payload(%arg0: tensor<2x4xf32>, %arg1: tensor<4x3xf32>, %arg2: tensor<2x3xf32>) attributes {transform.target_tag = "start_here"} {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<2x4xf32>, tensor<4x3xf32>) outs(%arg2 : tensor<2x3xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %1, %out : f32
      linalg.yield %2 : f32
    } -> tensor<2x3xf32>
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module attributes {transform.with_named_sequence} {
  transform.named_sequence @print_all_reduction(%arg0: !transform.any_op {transform.readonly}) {
    transform.debug.emit_remark_at %arg0, "all reduction" : !transform.any_op
    transform.yield 
  }
  transform.named_sequence @print_all_parallel(%arg0: !transform.any_op {transform.readonly}) {
    transform.debug.emit_remark_at %arg0, "all parallel" : !transform.any_op
    transform.yield 
  }
  transform.named_sequence @print_last_reduction(%arg0: !transform.any_op {transform.readonly}) {
    transform.debug.emit_remark_at %arg0, "last reduction" : !transform.any_op
    transform.yield 
  }
  transform.named_sequence @print_parallel_except_last(%arg0: !transform.any_op {transform.readonly}) {
    transform.debug.emit_remark_at %arg0, "parallel except last" : !transform.any_op
    transform.yield 
  }
  transform.named_sequence @match_all_reduction(%arg0: !transform.any_op {transform.readonly}) -> !transform.any_op {
    transform.match.structured failures(propagate) %arg0 : !transform.any_op {
    ^bb0(%arg1: !transform.any_op):
      transform.match.structured.dim %arg1[all] {reduction} : !transform.any_op
    }
    transform.yield %arg0 : !transform.any_op
  }
  transform.named_sequence @match_all_parallel(%arg0: !transform.any_op {transform.readonly}) -> !transform.any_op {
    transform.match.structured failures(propagate) %arg0 : !transform.any_op {
    ^bb0(%arg1: !transform.any_op):
      transform.match.structured.dim %arg1[all] {parallel} : !transform.any_op
    }
    transform.yield %arg0 : !transform.any_op
  }
  transform.named_sequence @match_last_reduction(%arg0: !transform.any_op {transform.readonly}) -> !transform.any_op {
    transform.match.structured failures(propagate) %arg0 : !transform.any_op {
    ^bb0(%arg1: !transform.any_op):
      transform.match.structured.dim %arg1[-1] {reduction} : !transform.any_op
    }
    transform.yield %arg0 : !transform.any_op
  }
  transform.named_sequence @match_parallel_except_last(%arg0: !transform.any_op {transform.readonly}) -> !transform.any_op {
    transform.match.structured failures(propagate) %arg0 : !transform.any_op {
    ^bb0(%arg1: !transform.any_op):
      transform.match.structured.dim %arg1[except(-1)] {parallel} : !transform.any_op
    }
    transform.yield %arg0 : !transform.any_op
  }
  transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.consumed}) {
    %updated_root = transform.foreach_match in %arg0 
        @match_all_reduction -> @print_all_reduction : (!transform.any_op) -> !transform.any_op
    %updated_root_0 = transform.foreach_match in %updated_root 
        @match_all_parallel -> @print_all_parallel : (!transform.any_op) -> !transform.any_op
    %updated_root_1 = transform.foreach_match in %updated_root_0 
        @match_last_reduction -> @print_last_reduction : (!transform.any_op) -> !transform.any_op
    %updated_root_2 = transform.foreach_match in %updated_root_1 
        @match_parallel_except_last -> @print_parallel_except_last : (!transform.any_op) -> !transform.any_op
    transform.yield 
  }
  func.func @payload(%arg0: tensor<2x4xf32>, %arg1: tensor<4x3xf32>, %arg2: tensor<2x3xf32>) attributes {transform.target_tag = "start_here"} {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<2x4xf32>, tensor<4x3xf32>) outs(%arg2 : tensor<2x3xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %3 = arith.mulf %in, %in_0 : f32
      %4 = arith.addf %3, %out : f32
      linalg.yield %4 : f32
    } -> tensor<2x3xf32>
    %1 = linalg.matmul ins(%arg0, %arg1 : tensor<2x4xf32>, tensor<4x3xf32>) outs(%arg2 : tensor<2x3xf32>) -> tensor<2x3xf32>
    %cst = arith.constant 1.000000e+00 : f32
    %2 = linalg.fill ins(%cst : f32) outs(%arg2 : tensor<2x3xf32>) -> tensor<2x3xf32>
    return
  }
}

// -----
module attributes {transform.with_named_sequence} {
  transform.named_sequence @match_bitwidth(%arg0: !transform.any_op {transform.readonly}) -> (!transform.any_op, !transform.param<i64>) {
    %0 = transform.match.structured failures(propagate) %arg0 : (!transform.any_op) -> !transform.param<i64> {
    ^bb0(%arg1: !transform.any_op):
      %1 = transform.match.structured.init %arg1[0] : (!transform.any_op) -> !transform.any_value
      %2 = transform.match.structured.elemental_bitwidth %1 : (!transform.any_value) -> !transform.param<i64>
      transform.match.structured.yield %2 : !transform.param<i64>
    }
    transform.yield %arg0, %0 : !transform.any_op, !transform.param<i64>
  }
  transform.named_sequence @print_bitwidth(%arg0: !transform.any_op {transform.readonly}, %arg1: !transform.param<i64> {transform.readonly}) {
    transform.debug.emit_param_as_remark %arg1, "bitwidth:" at %arg0 : !transform.param<i64>, !transform.any_op
    transform.yield 
  }
  transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.consumed}) {
    %updated_root = transform.foreach_match in %arg0 
        @match_bitwidth -> @print_bitwidth : (!transform.any_op) -> !transform.any_op
    transform.yield 
  }
  func.func @payload(%arg0: f32, %arg1: tensor<?xf32>, %arg2: index, %arg3: tensor<?xindex>) attributes {transform.target_tag = "start_here"} {
    %0 = linalg.fill ins(%arg0 : f32) outs(%arg1 : tensor<?xf32>) -> tensor<?xf32>
    %1 = linalg.fill ins(%arg2 : index) outs(%arg3 : tensor<?xindex>) -> tensor<?xindex>
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
module attributes {transform.with_named_sequence} {
  transform.named_sequence @match_init(%arg0: !transform.any_op {transform.readonly}) -> (!transform.any_op, !transform.any_value, !transform.any_value, !transform.any_op) {
    %0:3 = transform.match.structured failures(suppress) %arg0 : (!transform.any_op) -> (!transform.any_value, !transform.any_value, !transform.any_op) {
    ^bb0(%arg1: !transform.any_op):
      %1 = transform.match.structured.init %arg1[0] : (!transform.any_op) -> !transform.any_value
      %2 = transform.match.structured.init %arg1[all] : (!transform.any_op) -> !transform.any_value
      %3 = transform.match.structured.init %arg1[0] : (!transform.any_op) -> !transform.any_op
      transform.match.structured.yield %1, %2, %3 : !transform.any_value, !transform.any_value, !transform.any_op
    }
    transform.yield %arg0, %0#0, %0#1, %0#2 : !transform.any_op, !transform.any_value, !transform.any_value, !transform.any_op
  }
  transform.named_sequence @print_init(%arg0: !transform.any_op {transform.readonly}, %arg1: !transform.any_value {transform.readonly}, %arg2: !transform.any_value {transform.readonly}, %arg3: !transform.any_op {transform.readonly}) {
    transform.debug.emit_remark_at %arg1, "output 0" : !transform.any_value
    transform.debug.emit_remark_at %arg3, "output producer" : !transform.any_op
    transform.debug.emit_remark_at %arg2, "all output" : !transform.any_value
    transform.yield 
  }
  transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.consumed}) {
    %updated_root = transform.foreach_match in %arg0 
        @match_init -> @print_init : (!transform.any_op) -> !transform.any_op
    transform.yield 
  }
  func.func @payload(%arg0: f32, %arg1: tensor<?xf32>, %arg2: tensor<?xf32>) attributes {transform.target_tag = "start_here"} {
    %0 = linalg.fill ins(%arg0 : f32) outs(%arg1 : tensor<?xf32>) -> tensor<?xf32>
    %1:2 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg1 : tensor<?xf32>) outs(%0, %arg2 : tensor<?xf32>, tensor<?xf32>) {
    ^bb0(%in: f32, %out: f32, %out_0: f32):
      linalg.yield %in, %in : f32, f32
    } -> (tensor<?xf32>, tensor<?xf32>)
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d0 + d1)>
#map2 = affine_map<(d0, d1) -> (d1)>
#map3 = affine_map<(d0, d1) -> (d1, d0)>
module attributes {transform.with_named_sequence} {
  transform.named_sequence @match_init_0_permutation(%arg0: !transform.any_op {transform.readonly}) -> !transform.any_op {
    %0 = transform.match.structured failures(propagate) %arg0 : (!transform.any_op) -> !transform.any_op {
    ^bb0(%arg1: !transform.any_op):
      transform.match.structured.init %arg1[0] {permutation} : !transform.any_op
      transform.match.structured.yield %arg1 : !transform.any_op
    }
    transform.yield %0 : !transform.any_op
  }
  transform.named_sequence @match_init_1_permutation(%arg0: !transform.any_op {transform.readonly}) -> !transform.any_op {
    %0 = transform.match.structured failures(propagate) %arg0 : (!transform.any_op) -> !transform.any_op {
    ^bb0(%arg1: !transform.any_op):
      transform.match.structured.init %arg1[1] {permutation} : !transform.any_op
      transform.match.structured.yield %arg1 : !transform.any_op
    }
    transform.yield %0 : !transform.any_op
  }
  transform.named_sequence @match_init_2_projected_permutation(%arg0: !transform.any_op {transform.readonly}) -> !transform.any_op {
    %0 = transform.match.structured failures(propagate) %arg0 : (!transform.any_op) -> !transform.any_op {
    ^bb0(%arg1: !transform.any_op):
      transform.match.structured.init %arg1[2] {projected_permutation} : !transform.any_op
      transform.match.structured.yield %arg1 : !transform.any_op
    }
    transform.yield %0 : !transform.any_op
  }
  transform.named_sequence @print_init_0_permutation(%arg0: !transform.any_op {transform.readonly}) {
    transform.debug.emit_remark_at %arg0, "matched output 0 permutation" : !transform.any_op
    transform.yield 
  }
  transform.named_sequence @print_init_1_permutation(%arg0: !transform.any_op {transform.readonly}) {
    transform.debug.emit_remark_at %arg0, "matched output 1 permutation" : !transform.any_op
    transform.yield 
  }
  transform.named_sequence @print_init_2_projected_permutation(%arg0: !transform.any_op {transform.readonly}) {
    transform.debug.emit_remark_at %arg0, "matched output 2 projected permutation" : !transform.any_op
    transform.yield 
  }
  transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.consumed}) {
    %updated_root = transform.foreach_match in %arg0 
        @match_init_0_permutation -> @print_init_0_permutation : (!transform.any_op) -> !transform.any_op
    %updated_root_0 = transform.foreach_match in %updated_root 
        @match_init_1_permutation -> @print_init_1_permutation : (!transform.any_op) -> !transform.any_op
    %updated_root_1 = transform.foreach_match in %updated_root_0 
        @match_init_2_projected_permutation -> @print_init_2_projected_permutation : (!transform.any_op) -> !transform.any_op
    transform.yield 
  }
  func.func @payload(%arg0: f32, %arg1: tensor<?xf32>, %arg2: tensor<?xf32>, %arg3: tensor<?x?xf32>) attributes {transform.target_tag = "start_here"} {
    %0:3 = linalg.generic {indexing_maps = [#map, #map1, #map2, #map3], iterator_types = ["parallel", "parallel"]} ins(%arg1 : tensor<?xf32>) outs(%arg1, %arg2, %arg3 : tensor<?xf32>, tensor<?xf32>, tensor<?x?xf32>) {
    ^bb0(%in: f32, %out: f32, %out_0: f32, %out_1: f32):
      linalg.yield %in, %in, %in : f32, f32, f32
    } -> (tensor<?xf32>, tensor<?xf32>, tensor<?x?xf32>)
    %1:3 = linalg.generic {indexing_maps = [#map, #map1, #map3, #map2], iterator_types = ["parallel", "parallel"]} ins(%arg1 : tensor<?xf32>) outs(%arg1, %arg3, %arg2 : tensor<?xf32>, tensor<?x?xf32>, tensor<?xf32>) {
    ^bb0(%in: f32, %out: f32, %out_0: f32, %out_1: f32):
      linalg.yield %in, %in, %in : f32, f32, f32
    } -> (tensor<?xf32>, tensor<?x?xf32>, tensor<?xf32>)
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d0 + d1)>
#map2 = affine_map<(d0, d1) -> (d1)>
#map3 = affine_map<(d0, d1) -> (d1, d0)>
module attributes {transform.with_named_sequence} {
  transform.named_sequence @match_num_io(%arg0: !transform.any_op {transform.readonly}) -> (!transform.param<i64>, !transform.param<i64>, !transform.any_op) {
    %0:3 = transform.match.structured failures(propagate) %arg0 : (!transform.any_op) -> (!transform.param<i64>, !transform.param<i64>, !transform.any_op) {
    ^bb0(%arg1: !transform.any_op):
      %1 = transform.match.structured.num_inputs %arg1 : (!transform.any_op) -> !transform.param<i64>
      %2 = transform.match.structured.num_inits %arg1 : (!transform.any_op) -> !transform.param<i64>
      transform.match.structured.yield %1, %2, %arg1 : !transform.param<i64>, !transform.param<i64>, !transform.any_op
    }
    transform.yield %0#0, %0#1, %0#2 : !transform.param<i64>, !transform.param<i64>, !transform.any_op
  }
  transform.named_sequence @print_num_io(%arg0: !transform.param<i64> {transform.readonly}, %arg1: !transform.param<i64> {transform.readonly}, %arg2: !transform.any_op {transform.readonly}) {
    transform.debug.emit_param_as_remark %arg0, "inputs" at %arg2 : !transform.param<i64>, !transform.any_op
    transform.debug.emit_param_as_remark %arg1, "outputs" at %arg2 : !transform.param<i64>, !transform.any_op
    transform.yield 
  }
  transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.consumed}) {
    %updated_root = transform.foreach_match in %arg0 
        @match_num_io -> @print_num_io : (!transform.any_op) -> !transform.any_op
    transform.yield 
  }
  func.func @payload(%arg0: f32, %arg1: tensor<?xf32>, %arg2: tensor<?xf32>, %arg3: tensor<?x?xf32>) attributes {transform.target_tag = "start_here"} {
    %0:3 = linalg.generic {indexing_maps = [#map, #map1, #map2, #map3], iterator_types = ["parallel", "parallel"]} ins(%arg1 : tensor<?xf32>) outs(%arg1, %arg2, %arg3 : tensor<?xf32>, tensor<?xf32>, tensor<?x?xf32>) {
    ^bb0(%in: f32, %out: f32, %out_0: f32, %out_1: f32):
      linalg.yield %in, %in, %in : f32, f32, f32
    } -> (tensor<?xf32>, tensor<?xf32>, tensor<?x?xf32>)
    %1:2 = linalg.generic {indexing_maps = [#map, #map3, #map1, #map2], iterator_types = ["parallel", "parallel"]} ins(%arg1, %arg3 : tensor<?xf32>, tensor<?x?xf32>) outs(%arg1, %arg2 : tensor<?xf32>, tensor<?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32, %out_1: f32):
      linalg.yield %in, %in : f32, f32
    } -> (tensor<?xf32>, tensor<?xf32>)
    return
  }
}

// -----
module attributes {transform.with_named_sequence} {
  transform.named_sequence @match_rank(%arg0: !transform.any_op {transform.readonly}) -> (!transform.param<i64>, !transform.any_op) {
    %0:2 = transform.match.structured failures(propagate) %arg0 : (!transform.any_op) -> (!transform.param<i64>, !transform.any_op) {
    ^bb0(%arg1: !transform.any_op):
      %1 = transform.match.structured.rank %arg1 : (!transform.any_op) -> !transform.param<i64>
      transform.match.structured.yield %1, %arg1 : !transform.param<i64>, !transform.any_op
    }
    transform.yield %0#0, %0#1 : !transform.param<i64>, !transform.any_op
  }
  transform.named_sequence @print_rank(%arg0: !transform.param<i64> {transform.readonly}, %arg1: !transform.any_op {transform.readonly}) {
    transform.debug.emit_param_as_remark %arg0, "rank" at %arg1 : !transform.param<i64>, !transform.any_op
    transform.yield 
  }
  transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.consumed}) {
    %updated_root = transform.foreach_match in %arg0 
        @match_rank -> @print_rank : (!transform.any_op) -> !transform.any_op
    transform.yield 
  }
  func.func @payload(%arg0: f32, %arg1: tensor<42x42xf32>) attributes {transform.target_tag = "start_here"} {
    %0 = tensor.empty() : tensor<42x42xf32>
    %1 = linalg.fill ins(%arg0 : f32) outs(%0 : tensor<42x42xf32>) -> tensor<42x42xf32>
    %2 = linalg.matmul ins(%arg1, %arg1 : tensor<42x42xf32>, tensor<42x42xf32>) outs(%1 : tensor<42x42xf32>) -> tensor<42x42xf32>
    return
  }
}

// -----
module attributes {transform.with_named_sequence} {
  transform.named_sequence @match_single_result(%arg0: !transform.any_op {transform.readonly}) -> (!transform.any_op, !transform.any_op) {
    %0:2 = transform.match.structured failures(propagate) %arg0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op) {
    ^bb0(%arg1: !transform.any_op):
      %1 = transform.match.structured.result %arg1[0] single : (!transform.any_op) -> !transform.any_op
      transform.match.structured.yield %1, %arg1 : !transform.any_op, !transform.any_op
    }
    transform.yield %0#0, %0#1 : !transform.any_op, !transform.any_op
  }
  transform.named_sequence @match_result_value(%arg0: !transform.any_op {transform.readonly}) -> (!transform.any_value, !transform.any_op) {
    %0:2 = transform.match.structured failures(propagate) %arg0 : (!transform.any_op) -> (!transform.any_value, !transform.any_op) {
    ^bb0(%arg1: !transform.any_op):
      %1 = transform.match.structured.result %arg1[0] : (!transform.any_op) -> !transform.any_value
      transform.match.structured.yield %1, %arg1 : !transform.any_value, !transform.any_op
    }
    transform.yield %0#0, %0#1 : !transform.any_value, !transform.any_op
  }
  transform.named_sequence @match_any_result(%arg0: !transform.any_op {transform.readonly}) -> !transform.any_op {
    %0 = transform.match.structured failures(propagate) %arg0 : (!transform.any_op) -> !transform.any_op {
    ^bb0(%arg1: !transform.any_op):
      %1 = transform.match.structured.result %arg1[-1] any : (!transform.any_op) -> !transform.any_op
      transform.match.structured.yield %arg1 : !transform.any_op
    }
    transform.yield %0 : !transform.any_op
  }
  transform.named_sequence @print_single_result(%arg0: !transform.any_op {transform.readonly}, %arg1: !transform.any_op {transform.readonly}) {
    transform.debug.emit_remark_at %arg1, "matched single result" : !transform.any_op
    transform.debug.emit_remark_at %arg0, "single user" : !transform.any_op
    transform.yield 
  }
  transform.named_sequence @print_result_value(%arg0: !transform.any_value {transform.readonly}, %arg1: !transform.any_op {transform.readonly}) {
    transform.debug.emit_remark_at %arg1, "matched result value" : !transform.any_op
    transform.debug.emit_remark_at %arg0, "op result" : !transform.any_value
    transform.yield 
  }
  transform.named_sequence @print_any_result(%arg0: !transform.any_op {transform.readonly}) {
    transform.debug.emit_remark_at %arg0, "matched any result" : !transform.any_op
    transform.yield 
  }
  transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.consumed}) {
    %updated_root = transform.foreach_match in %arg0 
        @match_single_result -> @print_single_result : (!transform.any_op) -> !transform.any_op
    %updated_root_0 = transform.foreach_match in %updated_root 
        @match_result_value -> @print_result_value : (!transform.any_op) -> !transform.any_op
    %updated_root_1 = transform.foreach_match in %updated_root_0 
        @match_any_result -> @print_any_result : (!transform.any_op) -> !transform.any_op
    transform.yield 
  }
  func.func @payload(%arg0: f32, %arg1: f32, %arg2: f32, %arg3: tensor<42x42xf32>) attributes {transform.target_tag = "start_here"} {
    %0 = tensor.empty() : tensor<42x42xf32>
    %1 = linalg.fill ins(%arg0 : f32) outs(%0 : tensor<42x42xf32>) -> tensor<42x42xf32>
    %2 = linalg.fill ins(%arg1 : f32) outs(%0 : tensor<42x42xf32>) -> tensor<42x42xf32>
    %3 = linalg.fill ins(%arg2 : f32) outs(%0 : tensor<42x42xf32>) -> tensor<42x42xf32>
    %4 = linalg.negf ins(%2 : tensor<42x42xf32>) outs(%0 : tensor<42x42xf32>) -> tensor<42x42xf32>
    %5 = linalg.exp ins(%3 : tensor<42x42xf32>) outs(%0 : tensor<42x42xf32>) -> tensor<42x42xf32>
    %6 = linalg.exp ins(%3 : tensor<42x42xf32>) outs(%0 : tensor<42x42xf32>) -> tensor<42x42xf32>
    return
  }
}

// -----
module attributes {transform.with_named_sequence} {
  transform.named_sequence @match_input_indexing_map(%arg0: !transform.any_op {transform.readonly}) -> (!transform.affine_map, !transform.any_op) {
    %0 = transform.match.structured failures(propagate) %arg0 : (!transform.any_op) -> !transform.affine_map {
    ^bb0(%arg1: !transform.any_op):
      %1 = transform.match.structured.input %arg1[0] : (!transform.any_op) -> !transform.affine_map
      transform.match.structured.yield %1 : !transform.affine_map
    }
    transform.yield %0, %arg0 : !transform.affine_map, !transform.any_op
  }
  transform.named_sequence @match_init_indexing_map(%arg0: !transform.any_op {transform.readonly}) -> (!transform.affine_map, !transform.any_op) {
    %0 = transform.match.structured failures(propagate) %arg0 : (!transform.any_op) -> !transform.affine_map {
    ^bb0(%arg1: !transform.any_op):
      %1 = transform.match.structured.init %arg1[0] : (!transform.any_op) -> !transform.affine_map
      transform.match.structured.yield %1 : !transform.affine_map
    }
    transform.yield %0, %arg0 : !transform.affine_map, !transform.any_op
  }
  transform.named_sequence @print_indexing_map_1(%arg0: !transform.affine_map {transform.readonly}, %arg1: !transform.any_op {transform.readonly}) {
    transform.debug.emit_param_as_remark %arg0, "indexing map 1" at %arg1 : !transform.affine_map, !transform.any_op
    transform.yield 
  }
  transform.named_sequence @print_indexing_map_2(%arg0: !transform.affine_map {transform.readonly}, %arg1: !transform.any_op {transform.readonly}) {
    transform.debug.emit_param_as_remark %arg0, "indexing map 2" at %arg1 : !transform.affine_map, !transform.any_op
    transform.yield 
  }
  transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.consumed}) {
    %updated_root = transform.foreach_match in %arg0 
        @match_input_indexing_map -> @print_indexing_map_1 : (!transform.any_op) -> !transform.any_op
    %updated_root_0 = transform.foreach_match in %updated_root 
        @match_init_indexing_map -> @print_indexing_map_2 : (!transform.any_op) -> !transform.any_op
    transform.yield 
  }
  func.func @payload(%arg0: tensor<32x32xf32>, %arg1: tensor<32x32xf32>) attributes {transform.target_tag = "start_here"} {
    %0 = tensor.empty() : tensor<32x32xf32>
    %cst = arith.constant 1.000000e+00 : f32
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<32x32xf32>) -> tensor<32x32xf32>
    %2 = linalg.matmul ins(%arg0, %arg1 : tensor<32x32xf32>, tensor<32x32xf32>) outs(%1 : tensor<32x32xf32>) -> tensor<32x32xf32>
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2, d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d4, d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2, d3)>
#map3 = affine_map<(d0, d1, d2, d3) -> (d0, d1 * 2 + d3 * 2, d2)>
#map4 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map5 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
#map6 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map7 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map8 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @match_contraction(%arg0: !transform.any_op {transform.readonly}) -> (!transform.any_op, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>) {
      %0:4 = transform.match.structured %arg0 : (!transform.any_op) -> (!transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>) {
      ^bb0(%arg1: !transform.any_op):
        transform.match.structured.body %arg1 {contraction = ["arith.mulf", "arith.addf"]} : !transform.any_op
        %batch, %m, %n, %k = transform.match.structured.classify_contraction_dims %arg1 : (!transform.any_op) -> (!transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>)
        transform.match.structured.yield %batch, %m, %n, %k : !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>
      }
      transform.yield %arg0, %0#0, %0#1, %0#2, %0#3 : !transform.any_op, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>
    }
    transform.named_sequence @print_contraction(%arg0: !transform.any_op {transform.readonly}, %arg1: !transform.param<i64> {transform.readonly}, %arg2: !transform.param<i64> {transform.readonly}, %arg3: !transform.param<i64> {transform.readonly}, %arg4: !transform.param<i64> {transform.readonly}) {
      transform.debug.emit_remark_at %arg0, "contraction" : !transform.any_op
      transform.debug.emit_param_as_remark %arg1, "batch dims" at %arg0 : !transform.param<i64>, !transform.any_op
      transform.debug.emit_param_as_remark %arg2, "m dims" at %arg0 : !transform.param<i64>, !transform.any_op
      transform.debug.emit_param_as_remark %arg3, "n dims" at %arg0 : !transform.param<i64>, !transform.any_op
      transform.debug.emit_param_as_remark %arg4, "k dims" at %arg0 : !transform.param<i64>, !transform.any_op
      transform.yield 
    }
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.consumed}) {
      %updated_root = transform.foreach_match in %arg0 
          @match_contraction -> @print_contraction : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
  module attributes {transform.target_tag = "start_here"} {
    func.func @matmul_simple(%arg0: tensor<10x20xf32>, %arg1: tensor<20x15xf32>) -> tensor<10x15xf64> {
      %cst = arith.constant 0.000000e+00 : f64
      %0 = tensor.empty() : tensor<10x15xf64>
      %1 = linalg.fill ins(%cst : f64) outs(%0 : tensor<10x15xf64>) -> tensor<10x15xf64>
      %2 = linalg.matmul ins(%arg0, %arg1 : tensor<10x20xf32>, tensor<20x15xf32>) outs(%1 : tensor<10x15xf64>) -> tensor<10x15xf64>
      return %2 : tensor<10x15xf64>
    }
    func.func @vecmat_simple(%arg0: tensor<20xf32>, %arg1: tensor<20x15xf32>) -> tensor<15xf64> {
      %cst = arith.constant 0.000000e+00 : f64
      %0 = tensor.empty() : tensor<15xf64>
      %1 = linalg.fill ins(%cst : f64) outs(%0 : tensor<15xf64>) -> tensor<15xf64>
      %2 = linalg.vecmat ins(%arg0, %arg1 : tensor<20xf32>, tensor<20x15xf32>) outs(%1 : tensor<15xf64>) -> tensor<15xf64>
      return %2 : tensor<15xf64>
    }
    func.func @double_batch(%arg0: tensor<40x10x50x20xf32>, %arg1: tensor<40x20x50x15xf32>) -> tensor<40x10x50x15xf32> {
      %cst = arith.constant 0.000000e+00 : f32
      %0 = tensor.empty() : tensor<40x10x50x15xf32>
      %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<40x10x50x15xf32>) -> tensor<40x10x50x15xf32>
      %2 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<40x10x50x20xf32>, tensor<40x20x50x15xf32>) outs(%1 : tensor<40x10x50x15xf32>) {
      ^bb0(%in: f32, %in_0: f32, %out: f32):
        %3 = arith.mulf %in, %in_0 : f32
        %4 = arith.addf %out, %3 : f32
        linalg.yield %4 : f32
      } -> tensor<40x10x50x15xf32>
      return %2 : tensor<40x10x50x15xf32>
    }
    func.func @generic_min(%arg0: tensor<1x7x4xf32>, %arg1: tensor<4xf32>, %arg2: tensor<1x1x4xf32>) {
      %0 = linalg.generic {indexing_maps = [#map3, #map4, #map5], iterator_types = ["parallel", "parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<1x7x4xf32>, tensor<4xf32>) outs(%arg2 : tensor<1x1x4xf32>) {
      ^bb0(%in: f32, %in_0: f32, %out: f32):
        %1 = arith.minimumf %out, %in : f32
        linalg.yield %1 : f32
      } -> tensor<1x1x4xf32>
      return
    }
    func.func @generic_none(%arg0: tensor<128x128xi32>, %arg1: tensor<128x128xi32>, %arg2: tensor<128x128xi32>) {
      %0 = linalg.generic {indexing_maps = [#map6, #map7, #map8], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<128x128xi32>, tensor<128x128xi32>) outs(%arg2 : tensor<128x128xi32>) {
      ^bb0(%in: i32, %in_0: i32, %out: i32):
        linalg.yield %out : i32
      } -> tensor<128x128xi32>
      return
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d4, d1 + d5, d2 * 2 + d6, d7)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d4, d5, d6, d7, d3)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3)>
module {
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @match_convolution(%arg0: !transform.any_op {transform.readonly}) -> (!transform.any_op, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>) {
      %0:8 = transform.match.structured %arg0 : (!transform.any_op) -> (!transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>) {
      ^bb0(%arg1: !transform.any_op):
        transform.match.structured.body %arg1 {contraction = ["arith.mulf", "arith.addf"]} : !transform.any_op
        %batch, %output_image, %output_channel, %filter_loop, %input_channel, %depth, %strides, %dilations = transform.match.structured.classify_convolution_dims %arg1 : (!transform.any_op) -> (!transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>)
        transform.match.structured.yield %batch, %output_image, %output_channel, %filter_loop, %input_channel, %depth, %strides, %dilations : !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>
      }
      transform.yield %arg0, %0#0, %0#1, %0#2, %0#3, %0#4, %0#5, %0#6, %0#7 : !transform.any_op, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>
    }
    transform.named_sequence @print_convolution(%arg0: !transform.any_op {transform.readonly}, %arg1: !transform.param<i64> {transform.readonly}, %arg2: !transform.param<i64> {transform.readonly}, %arg3: !transform.param<i64> {transform.readonly}, %arg4: !transform.param<i64> {transform.readonly}, %arg5: !transform.param<i64> {transform.readonly}, %arg6: !transform.param<i64> {transform.readonly}, %arg7: !transform.param<i64> {transform.readonly}, %arg8: !transform.param<i64> {transform.readonly}) {
      transform.debug.emit_remark_at %arg0, "convolution" : !transform.any_op
      transform.debug.emit_param_as_remark %arg1, "batch dims" at %arg0 : !transform.param<i64>, !transform.any_op
      transform.debug.emit_param_as_remark %arg2, "output image dims" at %arg0 : !transform.param<i64>, !transform.any_op
      transform.debug.emit_param_as_remark %arg3, "output channel dims" at %arg0 : !transform.param<i64>, !transform.any_op
      transform.debug.emit_param_as_remark %arg4, "filter loop dims" at %arg0 : !transform.param<i64>, !transform.any_op
      transform.debug.emit_param_as_remark %arg5, "input channel dims" at %arg0 : !transform.param<i64>, !transform.any_op
      transform.debug.emit_param_as_remark %arg6, "depth dims" at %arg0 : !transform.param<i64>, !transform.any_op
      transform.debug.emit_param_as_remark %arg7, "strides" at %arg0 : !transform.param<i64>, !transform.any_op
      transform.debug.emit_param_as_remark %arg8, "dilations" at %arg0 : !transform.param<i64>, !transform.any_op
      transform.yield 
    }
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.consumed}) {
      %updated_root = transform.foreach_match in %arg0 
          @match_convolution -> @print_convolution : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
  module attributes {transform.target_tag = "start_here"} {
    func.func @convolution_simple(%arg0: tensor<10x20x30xf32>, %arg1: tensor<3x30x15xf32>) -> tensor<10x18x15xf64> {
      %cst = arith.constant 0.000000e+00 : f64
      %0 = tensor.empty() : tensor<10x18x15xf64>
      %1 = linalg.fill ins(%cst : f64) outs(%0 : tensor<10x18x15xf64>) -> tensor<10x18x15xf64>
      %2 = linalg.conv_1d_nwc_wcf {dilations = dense<1> : tensor<1xi64>, strides = dense<1> : tensor<1xi64>} ins(%arg0, %arg1 : tensor<10x20x30xf32>, tensor<3x30x15xf32>) outs(%1 : tensor<10x18x15xf64>) -> tensor<10x18x15xf64>
      return %2 : tensor<10x18x15xf64>
    }
    func.func @convolution_depthwise(%arg0: tensor<1x10x196x48xf32>, %arg1: tensor<1x4x48xf32>) -> tensor<1x10x191x48xf32> {
      %cst = arith.constant 0.000000e+00 : f32
      %0 = tensor.empty() : tensor<1x10x191x48xf32>
      %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<1x10x191x48xf32>) -> tensor<1x10x191x48xf32>
      %2 = linalg.depthwise_conv_2d_nhwc_hwc {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<1x10x196x48xf32>, tensor<1x4x48xf32>) outs(%1 : tensor<1x10x191x48xf32>) -> tensor<1x10x191x48xf32>
      return %2 : tensor<1x10x191x48xf32>
    }
    func.func @convolution_multi_channel(%arg0: tensor<2x34x68x16xf32>, %arg1: tensor<8x2x3x5x16x16xf32>) -> tensor<8x32x32x16xf32> {
      %cst = arith.constant 0.000000e+00 : f32
      %0 = tensor.empty() : tensor<8x32x32x16xf32>
      %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<8x32x32x16xf32>) -> tensor<8x32x32x16xf32>
      %2 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "parallel", "parallel", "reduction", "reduction", "reduction", "reduction"]} ins(%arg0, %arg1 : tensor<2x34x68x16xf32>, tensor<8x2x3x5x16x16xf32>) outs(%1 : tensor<8x32x32x16xf32>) {
      ^bb0(%in: f32, %in_0: f32, %out: f32):
        %3 = arith.mulf %in, %in_0 : f32
        %4 = arith.addf %3, %out : f32
        linalg.yield %4 : f32
      } -> tensor<8x32x32x16xf32>
      return %2 : tensor<8x32x32x16xf32>
    }
  }
}

