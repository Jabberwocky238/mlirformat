module {
  func.func @fold_add_on_two_matmuls(%arg0: tensor<2048x2048xf32>, %arg1: tensor<2048x2048xf32>) -> tensor<2048x2048xf32> {
    %cst = arith.constant dense<1.11111104> : tensor<2048x2048xf32>
    %cst_0 = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<2048x2048xf32>
    %1 = linalg.fill ins(%cst_0 : f32) outs(%0 : tensor<2048x2048xf32>) -> tensor<2048x2048xf32>
    %2 = linalg.matmul ins(%arg0, %cst : tensor<2048x2048xf32>, tensor<2048x2048xf32>) outs(%1 : tensor<2048x2048xf32>) -> tensor<2048x2048xf32>
    %3 = tensor.empty() : tensor<2048x2048xf32>
    %4 = linalg.fill ins(%cst_0 : f32) outs(%0 : tensor<2048x2048xf32>) -> tensor<2048x2048xf32>
    %5 = linalg.matmul ins(%arg1, %cst : tensor<2048x2048xf32>, tensor<2048x2048xf32>) outs(%4 : tensor<2048x2048xf32>) -> tensor<2048x2048xf32>
    %6 = linalg.add ins(%2, %5 : tensor<2048x2048xf32>, tensor<2048x2048xf32>) outs(%0 : tensor<2048x2048xf32>) -> tensor<2048x2048xf32>
    return %6 : tensor<2048x2048xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.linalg.fold_add_into_dest
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @expect_no_fold_of_add_as_orig_dest_not_additive_zero(%arg0: tensor<2048x2048xf32>, %arg1: tensor<2048x2048xf32>) -> tensor<2048x2048xf32> {
    %cst = arith.constant dense<1.11111104> : tensor<2048x2048xf32>
    %cst_0 = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<2048x2048xf32>
    %1 = linalg.fill ins(%cst_0 : f32) outs(%0 : tensor<2048x2048xf32>) -> tensor<2048x2048xf32>
    %2 = linalg.matmul ins(%arg0, %cst : tensor<2048x2048xf32>, tensor<2048x2048xf32>) outs(%1 : tensor<2048x2048xf32>) -> tensor<2048x2048xf32>
    %3 = linalg.matmul ins(%arg1, %cst : tensor<2048x2048xf32>, tensor<2048x2048xf32>) outs(%cst : tensor<2048x2048xf32>) -> tensor<2048x2048xf32>
    %4 = linalg.add ins(%2, %3 : tensor<2048x2048xf32>, tensor<2048x2048xf32>) outs(%0 : tensor<2048x2048xf32>) -> tensor<2048x2048xf32>
    return %4 : tensor<2048x2048xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.linalg.fold_add_into_dest
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @expect_no_fold_of_add_as_contraction_result_has_multiple_users(%arg0: tensor<2048x2048xf32>, %arg1: tensor<2048x2048xf32>) -> (tensor<2048x2048xf32>, tensor<2048x2048xf32>) {
    %cst = arith.constant dense<1.11111104> : tensor<2048x2048xf32>
    %cst_0 = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<2048x2048xf32>
    %1 = linalg.fill ins(%cst_0 : f32) outs(%0 : tensor<2048x2048xf32>) -> tensor<2048x2048xf32>
    %2 = linalg.matmul ins(%arg0, %cst : tensor<2048x2048xf32>, tensor<2048x2048xf32>) outs(%1 : tensor<2048x2048xf32>) -> tensor<2048x2048xf32>
    %3 = linalg.matmul ins(%arg1, %cst : tensor<2048x2048xf32>, tensor<2048x2048xf32>) outs(%cst : tensor<2048x2048xf32>) -> tensor<2048x2048xf32>
    %4 = linalg.add ins(%2, %3 : tensor<2048x2048xf32>, tensor<2048x2048xf32>) outs(%0 : tensor<2048x2048xf32>) -> tensor<2048x2048xf32>
    %5 = linalg.mul ins(%3, %arg0 : tensor<2048x2048xf32>, tensor<2048x2048xf32>) outs(%0 : tensor<2048x2048xf32>) -> tensor<2048x2048xf32>
    return %4, %5 : tensor<2048x2048xf32>, tensor<2048x2048xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.linalg.fold_add_into_dest
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @fold_add_on_matmul_and_func_arg(%arg0: tensor<2048x2048xf32>, %arg1: tensor<2048x2048xf32>) -> tensor<2048x2048xf32> {
    %cst = arith.constant dense<1.11111104> : tensor<2048x2048xf32>
    %cst_0 = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<2048x2048xf32>
    %1 = linalg.fill ins(%cst_0 : f32) outs(%0 : tensor<2048x2048xf32>) -> tensor<2048x2048xf32>
    %2 = linalg.matmul ins(%arg0, %cst : tensor<2048x2048xf32>, tensor<2048x2048xf32>) outs(%1 : tensor<2048x2048xf32>) -> tensor<2048x2048xf32>
    %3 = linalg.add ins(%2, %arg1 : tensor<2048x2048xf32>, tensor<2048x2048xf32>) outs(%0 : tensor<2048x2048xf32>) -> tensor<2048x2048xf32>
    return %3 : tensor<2048x2048xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.linalg.fold_add_into_dest
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @expect_no_fold_of_add_as_operands_do_not_dominate_each_other(%arg0: tensor<2048x2048xf32>, %arg1: tensor<2048x2048xf32>) -> tensor<2048x2048xf32> {
    %cst = arith.constant dense<1.11111104> : tensor<2048x2048xf32>
    %cst_0 = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<2048x2048xf32>
    %1 = linalg.fill ins(%cst_0 : f32) outs(%0 : tensor<2048x2048xf32>) -> tensor<2048x2048xf32>
    %2 = linalg.matmul ins(%arg0, %cst : tensor<2048x2048xf32>, tensor<2048x2048xf32>) outs(%1 : tensor<2048x2048xf32>) -> tensor<2048x2048xf32>
    %3 = linalg.add ins(%2, %2 : tensor<2048x2048xf32>, tensor<2048x2048xf32>) outs(%0 : tensor<2048x2048xf32>) -> tensor<2048x2048xf32>
    return %3 : tensor<2048x2048xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.linalg.fold_add_into_dest
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @expect_no_fold_of_add_as_dominated_op_is_not_a_contraction(%arg0: tensor<2048x2048xf32>, %arg1: tensor<2048x2048xf32>) -> tensor<2048x2048xf32> {
    %cst = arith.constant dense<1.11111104> : tensor<2048x2048xf32>
    %cst_0 = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<2048x2048xf32>
    %1 = linalg.fill ins(%cst_0 : f32) outs(%0 : tensor<2048x2048xf32>) -> tensor<2048x2048xf32>
    %2 = linalg.matmul ins(%arg0, %cst : tensor<2048x2048xf32>, tensor<2048x2048xf32>) outs(%1 : tensor<2048x2048xf32>) -> tensor<2048x2048xf32>
    %3 = linalg.sub ins(%arg1, %cst : tensor<2048x2048xf32>, tensor<2048x2048xf32>) outs(%1 : tensor<2048x2048xf32>) -> tensor<2048x2048xf32>
    %4 = linalg.add ins(%2, %3 : tensor<2048x2048xf32>, tensor<2048x2048xf32>) outs(%0 : tensor<2048x2048xf32>) -> tensor<2048x2048xf32>
    return %4 : tensor<2048x2048xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.linalg.fold_add_into_dest
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d0)>
module {
  func.func @expect_no_fold_of_add_as_dest_accumulation_is_not_identity_mapped(%arg0: tensor<2048x2048xf32>, %arg1: tensor<2048x2048xf32>) -> tensor<2048x2048xf32> {
    %cst = arith.constant dense<1.11111104> : tensor<2048x2048xf32>
    %cst_0 = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<2048x2048xf32>
    %1 = linalg.fill ins(%cst_0 : f32) outs(%0 : tensor<2048x2048xf32>) -> tensor<2048x2048xf32>
    %2 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %cst : tensor<2048x2048xf32>, tensor<2048x2048xf32>) outs(%1 : tensor<2048x2048xf32>) {
    ^bb0(%in: f32, %in_1: f32, %out: f32):
      %4 = arith.mulf %in, %in_1 : f32
      %5 = arith.addf %out, %4 : f32
      linalg.yield %5 : f32
    } -> tensor<2048x2048xf32>
    %3 = linalg.add ins(%2, %arg1 : tensor<2048x2048xf32>, tensor<2048x2048xf32>) outs(%0 : tensor<2048x2048xf32>) -> tensor<2048x2048xf32>
    return %3 : tensor<2048x2048xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.linalg.fold_add_into_dest
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @fold_add_on_a_generic_and_an_argument(%arg0: tensor<2048x2048xf32>, %arg1: tensor<2048x2048xf32>) -> tensor<2048x2048xf32> {
    %cst = arith.constant dense<1.11111104> : tensor<2048x2048xf32>
    %cst_0 = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<2048x2048xf32>
    %1 = linalg.fill ins(%cst_0 : f32) outs(%0 : tensor<2048x2048xf32>) -> tensor<2048x2048xf32>
    %2 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %cst : tensor<2048x2048xf32>, tensor<2048x2048xf32>) outs(%1 : tensor<2048x2048xf32>) {
    ^bb0(%in: f32, %in_1: f32, %out: f32):
      %4 = arith.mulf %in, %in_1 : f32
      %5 = arith.addf %out, %4 : f32
      linalg.yield %5 : f32
    } -> tensor<2048x2048xf32>
    %3 = linalg.add ins(%2, %arg1 : tensor<2048x2048xf32>, tensor<2048x2048xf32>) outs(%0 : tensor<2048x2048xf32>) -> tensor<2048x2048xf32>
    return %3 : tensor<2048x2048xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.linalg.fold_add_into_dest
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  memref.global "private" constant @big_const : memref<2048x2048xf32> = dense<1.11111104> {alignment = 64 : i64}
  func.func @expect_no_fold_due_to_no_memref_support(%arg0: memref<2048x2048xf32>, %arg1: memref<2048x2048xf32>) -> memref<2048x2048xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = memref.get_global @big_const : memref<2048x2048xf32>
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<2048x2048xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<2048x2048xf32>
    linalg.fill ins(%cst : f32) outs(%alloc_0 : memref<2048x2048xf32>)
    linalg.matmul ins(%arg0, %0 : memref<2048x2048xf32>, memref<2048x2048xf32>) outs(%alloc_0 : memref<2048x2048xf32>)
    linalg.fill ins(%cst : f32) outs(%alloc : memref<2048x2048xf32>)
    linalg.matmul ins(%arg1, %0 : memref<2048x2048xf32>, memref<2048x2048xf32>) outs(%alloc : memref<2048x2048xf32>)
    linalg.add ins(%alloc_0, %alloc : memref<2048x2048xf32>, memref<2048x2048xf32>) outs(%alloc : memref<2048x2048xf32>)
    memref.dealloc %alloc_0 : memref<2048x2048xf32>
    return %alloc : memref<2048x2048xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.linalg.fold_add_into_dest
      } : !transform.any_op
      transform.yield 
    }
  }
}

