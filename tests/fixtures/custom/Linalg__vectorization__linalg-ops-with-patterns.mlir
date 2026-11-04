module {
  func.func @contraction_dot(%arg0: memref<1584xf32>, %arg1: memref<1584xf32>, %arg2: memref<f32>) {
    linalg.dot ins(%arg0, %arg1 : memref<1584xf32>, memref<1584xf32>) outs(%arg2 : memref<f32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.dot"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @contraction_matvec(%arg0: memref<1584x1584xf32>, %arg1: memref<1584xf32>, %arg2: memref<1584xf32>) {
    linalg.matvec ins(%arg0, %arg1 : memref<1584x1584xf32>, memref<1584xf32>) outs(%arg2 : memref<1584xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matvec"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 {disable_multi_reduction_to_contract_patterns} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @contraction_matmul(%arg0: memref<1584x1584xf32>, %arg1: memref<1584x1584xf32>, %arg2: memref<1584x1584xf32>) {
    linalg.matmul ins(%arg0, %arg1 : memref<1584x1584xf32>, memref<1584x1584xf32>) outs(%arg2 : memref<1584x1584xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 {disable_multi_reduction_to_contract_patterns} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @float_mixed_precision_matmul(%arg0: memref<1584x1584xbf16>, %arg1: memref<1584x1584xbf16>, %arg2: memref<1584x1584xf32>) {
    linalg.matmul ins(%arg0, %arg1 : memref<1584x1584xbf16>, memref<1584x1584xbf16>) outs(%arg2 : memref<1584x1584xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 {fold_type_extensions_into_contract} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @vectorization_test_2(%arg0: memref<8x16xf32>, %arg1: memref<16x32xf32>, %arg2: memref<8x32xf32>) {
    linalg.matmul ins(%arg0, %arg1 : memref<8x16xf32>, memref<16x32xf32>) outs(%arg2 : memref<8x32xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 {disable_multi_reduction_to_contract_patterns} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @matmul_tensors(%arg0: tensor<8x4xf32>, %arg1: tensor<4x12xf32>, %arg2: tensor<8x12xf32>) -> tensor<8x12xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<8x4xf32>, tensor<4x12xf32>) outs(%arg2 : tensor<8x12xf32>) -> tensor<8x12xf32>
    return %0 : tensor<8x12xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 {disable_multi_reduction_to_contract_patterns, disable_transfer_permutation_map_lowering_patterns} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @contraction_batch_matmul(%arg0: memref<1584x1584x1584xf32>, %arg1: memref<1584x1584x1584xf32>, %arg2: memref<1584x1584x1584xf32>) {
    linalg.batch_matmul ins(%arg0, %arg1 : memref<1584x1584x1584xf32>, memref<1584x1584x1584xf32>) outs(%arg2 : memref<1584x1584x1584xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.batch_matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 {disable_multi_reduction_to_contract_patterns} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @matmul_as_contract(%arg0: tensor<24x12xf32>, %arg1: tensor<12x25xf32>, %arg2: tensor<24x25xf32>) -> tensor<24x25xf32> {
    %0 = linalg.contract indexing_maps = [#map, #map1, #map2] ins(%arg0, %arg1 : tensor<24x12xf32>, tensor<12x25xf32>) outs(%arg2 : tensor<24x25xf32>) -> tensor<24x25xf32>
    return %0 : tensor<24x25xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.contract"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @float_mixed_precision_matmul_as_contract(%arg0: tensor<24x12xbf16>, %arg1: tensor<12x25xbf16>, %arg2: tensor<24x25xf32>) -> tensor<24x25xf32> {
    %0 = linalg.contract indexing_maps = [#map, #map1, #map2] ins(%arg0, %arg1 : tensor<24x12xbf16>, tensor<12x25xbf16>) outs(%arg2 : tensor<24x25xf32>) -> tensor<24x25xf32>
    return %0 : tensor<24x25xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.contract"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 {fold_type_extensions_into_contract} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @test_vectorize_fill(%arg0: memref<8x16xf32>, %arg1: f32) {
    linalg.fill ins(%arg1 : f32) outs(%arg0 : memref<8x16xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.fill"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @test_vectorize_fill_0d(%arg0: memref<f32>, %arg1: f32) {
    linalg.fill ins(%arg1 : f32) outs(%arg0 : memref<f32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.fill"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pack_no_padding(%arg0: tensor<32x8x16xf32>, %arg1: tensor<4x1x32x16x2xf32>) -> tensor<4x1x32x16x2xf32> {
    %pack = linalg.pack %arg0 outer_dims_perm = [1, 2, 0] inner_dims_pos = [2, 1] inner_tiles = [16, 2] into %arg1 : tensor<32x8x16xf32> -> tensor<4x1x32x16x2xf32>
    return %pack : tensor<4x1x32x16x2xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pack_with_padding(%arg0: tensor<32x7x15xf32>, %arg1: tensor<32x4x1x16x2xf32>) -> tensor<32x4x1x16x2xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %pack = linalg.pack %arg0 padding_value(%cst : f32) inner_dims_pos = [2, 1] inner_tiles = [16, 2] into %arg1 : tensor<32x7x15xf32> -> tensor<32x4x1x16x2xf32>
    return %pack : tensor<32x4x1x16x2xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @vectorize_map(%arg0: memref<64xf32>, %arg1: memref<64xf32>, %arg2: memref<64xf32>) {
    linalg.map { arith.addf } ins(%arg0, %arg1 : memref<64xf32>, memref<64xf32>) outs(%arg2 : memref<64xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.map"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @vectorize_transpose(%arg0: memref<16x32x64xf32>, %arg1: memref<32x64x16xf32>) {
    linalg.transpose ins(%arg0 : memref<16x32x64xf32>) outs(%arg1 : memref<32x64x16xf32>) permutation = [1, 2, 0] 
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.transpose"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @vectorize_reduce(%arg0: memref<16x32x64xf32>, %arg1: memref<16x64xf32>) {
    linalg.reduce ins(%arg0 : memref<16x32x64xf32>) outs(%arg1 : memref<16x64xf32>) dimensions = [1] 
      (%in: f32, %init: f32) {
        %0 = arith.addf %in, %init : f32
        linalg.yield %0 : f32
      }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.reduce"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @vectorization_test(%arg0: memref<8x16xf32>, %arg1: memref<16x32xf32>, %arg2: memref<8x32xf32>) {
    linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : memref<8x16xf32>, memref<16x32xf32>) outs(%arg2 : memref<8x32xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %0 = arith.mulf %in, %in_0 : f32
      %1 = arith.addf %out, %0 : f32
      linalg.yield %1 : f32
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 {disable_multi_reduction_to_contract_patterns, disable_transfer_permutation_map_lowering_patterns} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<() -> ()>
module {
  func.func @generic_0d(%arg0: tensor<f32>, %arg1: tensor<f32>, %arg2: tensor<f32>) -> tensor<f32> {
    %0 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = []} ins(%arg0, %arg1 : tensor<f32>, tensor<f32>) outs(%arg2 : tensor<f32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<f32>
    return %0 : tensor<f32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 {disable_multi_reduction_to_contract_patterns, disable_transfer_permutation_map_lowering_patterns} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d0)>
module {
  func.func @generic_output_transpose(%arg0: memref<8x16xf32>, %arg1: memref<16x32xf32>, %arg2: memref<32x8xf32>) {
    linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : memref<8x16xf32>, memref<16x32xf32>) outs(%arg2 : memref<32x8xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %0 = arith.mulf %in, %in_0 : f32
      %1 = arith.addf %out, %0 : f32
      linalg.yield %1 : f32
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 {disable_multi_reduction_to_contract_patterns, disable_transfer_permutation_map_lowering_patterns} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d0, d2)>
module {
  func.func @generic_interchanged_transpose(%arg0: tensor<12x128x32xf32>) -> tensor<128x12x32xf32> {
    %0 = tensor.empty() : tensor<128x12x32xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0 : tensor<12x128x32xf32>) outs(%0 : tensor<128x12x32xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<128x12x32xf32>
    return %1 : tensor<128x12x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 {disable_multi_reduction_to_contract_patterns, disable_transfer_permutation_map_lowering_patterns} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @vectorization_test_integer(%arg0: memref<8x16xi32>, %arg1: memref<16x32xi32>, %arg2: memref<8x32xi32>) {
    linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : memref<8x16xi32>, memref<16x32xi32>) outs(%arg2 : memref<8x32xi32>) {
    ^bb0(%in: i32, %in_0: i32, %out: i32):
      %0 = arith.muli %in, %in_0 : i32
      %1 = arith.addi %out, %0 : i32
      linalg.yield %1 : i32
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 {disable_multi_reduction_to_contract_patterns, disable_transfer_permutation_map_lowering_patterns} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> ()>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @test_vectorize_scalar_input(%arg0: memref<8x16xf32>, %arg1: f32) {
    linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg1 : f32) outs(%arg0 : memref<8x16xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> ()>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @test_do_not_vectorize_unsupported_element_types(%arg0: memref<8x16xcomplex<f32>>, %arg1: complex<f32>) {
    linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg1 : complex<f32>) outs(%arg0 : memref<8x16xcomplex<f32>>) {
    ^bb0(%in: complex<f32>, %out: complex<f32>):
      linalg.yield %in : complex<f32>
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (123)>
#map2 = affine_map<(d0, d1) -> (d0 + d1)>
#map3 = affine_map<(d0)[s0] -> (d0 + s0)>
#map4 = affine_map<(d0) -> (d0 + 1)>
#map5 = affine_map<(d0, d1, d2) -> (d0 + d1 + d2)>
module {
  func.func @vectorize_affine_apply(%arg0: tensor<5xf32>, %arg1: index) -> tensor<5xi32> {
    %0 = tensor.empty() : tensor<5xi32>
    %1 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<5xf32>) outs(%0 : tensor<5xi32>) {
    ^bb0(%in: f32, %out: i32):
      %2 = linalg.index 0 : index
      %3 = affine.apply #map1()
      %4 = affine.apply #map2(%2, %3)
      %5 = affine.apply #map3(%4)[%arg1]
      %6 = affine.apply #map4(%5)
      %7 = affine.apply #map5(%5, %6, %4)
      %8 = arith.index_cast %7 : index to i32
      linalg.yield %8 : i32
    } -> tensor<5xi32>
    return %1 : tensor<5xi32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 {vectorize_nd_extract} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
module {
  func.func @test_vectorize_trailing_index(%arg0: memref<1x2x4x8xindex>) {
    linalg.generic {indexing_maps = [#map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} outs(%arg0 : memref<1x2x4x8xindex>) {
    ^bb0(%out: index):
      %0 = linalg.index 3 : index
      linalg.yield %0 : index
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
module {
  func.func @test_vectorize_inner_index(%arg0: memref<1x2x4x8xindex>) {
    linalg.generic {indexing_maps = [#map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} outs(%arg0 : memref<1x2x4x8xindex>) {
    ^bb0(%out: index):
      %0 = linalg.index 1 : index
      linalg.yield %0 : index
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
module {
  func.func @generic_vectorize(%arg0: memref<4x256xf32>, %arg1: memref<4x256xf32>, %arg2: memref<256xf32>, %arg3: f32) {
    %cst = arith.constant 1.000000e+00 : f32
    linalg.generic {indexing_maps = [#map, #map1, #map, #map, #map, #map, #map, #map, #map, #map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg1, %arg2 : memref<4x256xf32>, memref<256xf32>) outs(%arg0, %arg0, %arg0, %arg0, %arg0, %arg0, %arg0, %arg0, %arg0, %arg0 : memref<4x256xf32>, memref<4x256xf32>, memref<4x256xf32>, memref<4x256xf32>, memref<4x256xf32>, memref<4x256xf32>, memref<4x256xf32>, memref<4x256xf32>, memref<4x256xf32>, memref<4x256xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32, %out_1: f32, %out_2: f32, %out_3: f32, %out_4: f32, %out_5: f32, %out_6: f32, %out_7: f32, %out_8: f32, %out_9: f32):
      %0 = arith.addf %in_0, %out_1 : f32
      %1 = arith.cmpf ogt, %in, %out_1 : f32
      %cst_10 = arith.constant 2.000000e+00 : f32
      %2 = arith.divf %out, %arg3 : f32
      %3 = math.exp2 %out : f32
      %4 = arith.mulf %out, %cst_10 : f32
      %5 = math.rsqrt %out : f32
      %6 = arith.select %1, %out, %out_1 : f32
      %7 = arith.subf %out, %in_0 : f32
      %8 = math.tanh %out : f32
      linalg.yield %0, %cst_10, %cst, %2, %3, %4, %5, %6, %7, %8 : f32, f32, f32, f32, f32, f32, f32, f32, f32, f32
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 {disable_transfer_permutation_map_lowering_patterns} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
module {
  func.func @generic_vectorize_tensor(%arg0: tensor<4x256xf32>, %arg1: tensor<4x256xf32>, %arg2: tensor<256xf32>, %arg3: f32) -> (tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>) {
    %cst = arith.constant 1.000000e+00 : f32
    %0:10 = linalg.generic {indexing_maps = [#map, #map1, #map, #map, #map, #map, #map, #map, #map, #map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg1, %arg2 : tensor<4x256xf32>, tensor<256xf32>) outs(%arg0, %arg0, %arg0, %arg0, %arg0, %arg0, %arg0, %arg0, %arg0, %arg0 : tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32, %out_1: f32, %out_2: f32, %out_3: f32, %out_4: f32, %out_5: f32, %out_6: f32, %out_7: f32, %out_8: f32, %out_9: f32):
      %1 = arith.addf %in_0, %out_1 : f32
      %2 = arith.cmpf ogt, %in, %out_1 : f32
      %cst_10 = arith.constant 2.000000e+00 : f32
      %3 = arith.divf %out, %arg3 : f32
      %4 = math.exp2 %out : f32
      %5 = arith.mulf %out, %cst_10 : f32
      %6 = math.rsqrt %out : f32
      %7 = arith.select %2, %out, %out_1 : f32
      %8 = arith.subf %out, %in_0 : f32
      %9 = math.tanh %out : f32
      linalg.yield %1, %cst_10, %cst, %3, %4, %5, %6, %7, %8, %9 : f32, f32, f32, f32, f32, f32, f32, f32, f32, f32
    } -> (tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>)
    return %0#0, %0#1, %0#2, %0#3, %0#4, %0#5, %0#6, %0#7, %0#8, %0#9 : tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 {disable_transfer_permutation_map_lowering_patterns} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d2)>
#map3 = affine_map<(d0, d1, d2, d3) -> (d2, d0)>
#map4 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
module {
  func.func @generic_vectorize_broadcast_transpose(%arg0: memref<4xf32>, %arg1: memref<4x4xf32>, %arg2: memref<4x4x4x4xf32>) {
    linalg.generic {indexing_maps = [#map, #map1, #map2, #map3, #map4], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg1, %arg0, %arg0, %arg1 : memref<4x4xf32>, memref<4xf32>, memref<4xf32>, memref<4x4xf32>) outs(%arg2 : memref<4x4x4x4xf32>) {
    ^bb0(%in: f32, %in_0: f32, %in_1: f32, %in_2: f32, %out: f32):
      %0 = arith.subf %in, %in_0 : f32
      %1 = arith.addf %in_1, %0 : f32
      %2 = arith.addf %in_2, %1 : f32
      linalg.yield %2 : f32
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 {disable_transfer_permutation_map_lowering_patterns} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3, d1)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d3, d1, d0, d2)>
#map3 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
module {
  func.func @vectorization_transpose(%arg0: memref<14x7xf32>, %arg1: memref<16x14xf32>, %arg2: memref<16x14x7x8xf32>, %arg3: memref<7x14x8x16xf32>) {
    linalg.generic {indexing_maps = [#map, #map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0, %arg1, %arg2 : memref<14x7xf32>, memref<16x14xf32>, memref<16x14x7x8xf32>) outs(%arg3 : memref<7x14x8x16xf32>) {
    ^bb0(%in: f32, %in_0: f32, %in_1: f32, %out: f32):
      %0 = arith.addf %in, %in_0 : f32
      %1 = arith.addf %0, %in_1 : f32
      linalg.yield %1 : f32
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 {disable_transfer_permutation_map_lowering_patterns} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @sum_exp(%arg0: tensor<4x16x8xf32>, %arg1: tensor<4x16xf32>) -> tensor<4x16xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0 : tensor<4x16x8xf32>) outs(%arg1 : tensor<4x16xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = math.exp %in : f32
      %2 = arith.addf %1, %out : f32
      linalg.yield %2 : f32
    } -> tensor<4x16xf32>
    return %0 : tensor<4x16xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d3, d0)>
module {
  func.func @sum_exp_2(%arg0: tensor<3x2xf32>, %arg1: tensor<5x4xf32>, %arg2: tensor<5x2xf32>) -> tensor<5x2xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction", "reduction", "parallel"]} ins(%arg0, %arg1 : tensor<3x2xf32>, tensor<5x4xf32>) outs(%arg2 : tensor<5x2xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = math.exp %in : f32
      %2 = math.exp %in_0 : f32
      %3 = arith.addf %1, %2 : f32
      %4 = arith.addf %3, %out : f32
      linalg.yield %4 : f32
    } -> tensor<5x2xf32>
    return %0 : tensor<5x2xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 {disable_multi_reduction_to_contract_patterns, disable_transfer_permutation_map_lowering_patterns} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
module {
  func.func @red_maximumf_2d(%arg0: tensor<4x4xf32>) -> tensor<4xf32> {
    %cst = arith.constant -3.402820e+38 : f32
    %0 = tensor.empty() : tensor<4xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<4xf32>) -> tensor<4xf32>
    %2 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction"]} ins(%arg0 : tensor<4x4xf32>) outs(%1 : tensor<4xf32>) {
    ^bb0(%in: f32, %out: f32):
      %3 = arith.maximumf %in, %out : f32
      linalg.yield %3 : f32
    } -> tensor<4xf32>
    return %2 : tensor<4xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 {vectorize_padding} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
module {
  func.func @red_maxnumf_2d(%arg0: tensor<4x4xf32>) -> tensor<4xf32> {
    %cst = arith.constant -3.402820e+38 : f32
    %0 = tensor.empty() : tensor<4xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<4xf32>) -> tensor<4xf32>
    %2 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction"]} ins(%arg0 : tensor<4x4xf32>) outs(%1 : tensor<4xf32>) {
    ^bb0(%in: f32, %out: f32):
      %3 = arith.maxnumf %in, %out : f32
      linalg.yield %3 : f32
    } -> tensor<4xf32>
    return %2 : tensor<4xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 {vectorize_padding} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
module {
  func.func @red_minimumf_2d(%arg0: tensor<4x4xf32>) -> tensor<4xf32> {
    %cst = arith.constant 3.402820e+38 : f32
    %0 = tensor.empty() : tensor<4xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<4xf32>) -> tensor<4xf32>
    %2 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction"]} ins(%arg0 : tensor<4x4xf32>) outs(%1 : tensor<4xf32>) {
    ^bb0(%in: f32, %out: f32):
      %3 = arith.minimumf %out, %in : f32
      linalg.yield %3 : f32
    } -> tensor<4xf32>
    return %2 : tensor<4xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
module {
  func.func @red_minnumf_2d(%arg0: tensor<4x4xf32>) -> tensor<4xf32> {
    %cst = arith.constant 3.402820e+38 : f32
    %0 = tensor.empty() : tensor<4xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<4xf32>) -> tensor<4xf32>
    %2 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction"]} ins(%arg0 : tensor<4x4xf32>) outs(%1 : tensor<4xf32>) {
    ^bb0(%in: f32, %out: f32):
      %3 = arith.minnumf %out, %in : f32
      linalg.yield %3 : f32
    } -> tensor<4xf32>
    return %2 : tensor<4xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
module {
  func.func @red_mul_2d(%arg0: tensor<4x4xf32>) -> tensor<4xf32> {
    %cst = arith.constant 1.000000e+00 : f32
    %0 = tensor.empty() : tensor<4xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<4xf32>) -> tensor<4xf32>
    %2 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction"]} ins(%arg0 : tensor<4x4xf32>) outs(%1 : tensor<4xf32>) {
    ^bb0(%in: f32, %out: f32):
      %3 = arith.mulf %in, %out : f32
      linalg.yield %3 : f32
    } -> tensor<4xf32>
    return %2 : tensor<4xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
module {
  func.func @red_or_2d(%arg0: tensor<4x4xi1>) -> tensor<4xi1> {
    %false = arith.constant false
    %0 = tensor.empty() : tensor<4xi1>
    %1 = linalg.fill ins(%false : i1) outs(%0 : tensor<4xi1>) -> tensor<4xi1>
    %2 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction"]} ins(%arg0 : tensor<4x4xi1>) outs(%1 : tensor<4xi1>) {
    ^bb0(%in: i1, %out: i1):
      %3 = arith.ori %in, %out : i1
      linalg.yield %3 : i1
    } -> tensor<4xi1>
    return %2 : tensor<4xi1>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
module {
  func.func @red_and_2d(%arg0: tensor<4x4xi1>) -> tensor<4xi1> {
    %true = arith.constant true
    %0 = tensor.empty() : tensor<4xi1>
    %1 = linalg.fill ins(%true : i1) outs(%0 : tensor<4xi1>) -> tensor<4xi1>
    %2 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction"]} ins(%arg0 : tensor<4x4xi1>) outs(%1 : tensor<4xi1>) {
    ^bb0(%in: i1, %out: i1):
      %3 = arith.andi %in, %out : i1
      linalg.yield %3 : i1
    } -> tensor<4xi1>
    return %2 : tensor<4xi1>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
module {
  func.func @red_xor_2d(%arg0: tensor<4x4xi1>) -> tensor<4xi1> {
    %false = arith.constant false
    %0 = tensor.empty() : tensor<4xi1>
    %1 = linalg.fill ins(%false : i1) outs(%0 : tensor<4xi1>) -> tensor<4xi1>
    %2 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction"]} ins(%arg0 : tensor<4x4xi1>) outs(%1 : tensor<4xi1>) {
    ^bb0(%in: i1, %out: i1):
      %3 = arith.xori %in, %out : i1
      linalg.yield %3 : i1
    } -> tensor<4xi1>
    return %2 : tensor<4xi1>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0, 0)>
module {
  func.func @explicit_broadcast(%arg0: tensor<4x4xf32>, %arg1: tensor<4x1xf32>) -> tensor<4x4xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<4x4xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<4x4xf32>) -> tensor<4x4xf32>
    %2 = linalg.generic {indexing_maps = [#map, #map1, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<4x4xf32>, tensor<4x1xf32>) outs(%1 : tensor<4x4xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %3 = arith.subf %in, %in_0 : f32
      linalg.yield %3 : f32
    } -> tensor<4x4xf32>
    return %2 : tensor<4x4xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0, 0)>
#map2 = affine_map<(d0, d1) -> (d0)>
module {
  func.func @fused_broadcast_red_2d(%arg0: tensor<4x4xf32>, %arg1: tensor<4x1xf32>) -> tensor<4xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<4xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<4xf32>) -> tensor<4xf32>
    %2 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction"]} ins(%arg0, %arg1 : tensor<4x4xf32>, tensor<4x1xf32>) outs(%1 : tensor<4xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %3 = arith.subf %in, %in_0 : f32
      %4 = math.exp %3 : f32
      %5 = arith.addf %4, %out : f32
      linalg.yield %5 : f32
    } -> tensor<4xf32>
    return %2 : tensor<4xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.fill"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      %3 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %4 = transform.get_parent_op %3 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %5 = transform.structured.vectorize_children_and_apply_patterns %4 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
module {
  func.func @reduce_to_rank_0(%arg0: tensor<32xf32>) -> tensor<f32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<f32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<f32>) -> tensor<f32>
    %2 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["reduction"]} ins(%arg0 : tensor<32xf32>) outs(%1 : tensor<f32>) {
    ^bb0(%in: f32, %out: f32):
      %3 = arith.addf %in, %out : f32
      linalg.yield %3 : f32
    } -> tensor<f32>
    return %2 : tensor<f32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (0)>
module {
  func.func @reduce_to_rank_1(%arg0: tensor<32xf32>) -> tensor<1xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<1xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<1xf32>) -> tensor<1xf32>
    %2 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["reduction"]} ins(%arg0 : tensor<32xf32>) outs(%1 : tensor<1xf32>) {
    ^bb0(%in: f32, %out: f32):
      %3 = arith.addf %in, %out : f32
      linalg.yield %3 : f32
    } -> tensor<1xf32>
    return %2 : tensor<1xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0 + d2, d1 + d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
module {
  func.func @not_projected_permutation(%arg0: tensor<8x8xf32>) -> tensor<6x6x3x3xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<6x6x3x3xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<6x6x3x3xf32>) -> tensor<6x6x3x3xf32>
    %2 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : tensor<8x8xf32>) outs(%1 : tensor<6x6x3x3xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<6x6x3x3xf32>
    return %2 : tensor<6x6x3x3xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @mixed_parallel_reduced_results(%arg0: tensor<2x4x8xf32>, %arg1: tensor<2x4xf32>, %arg2: tensor<2x4x8xf32>, %arg3: tensor<2x4xf32>) -> (tensor<2x4x8xf32>, tensor<2x4xf32>) {
    %0:2 = linalg.generic {indexing_maps = [#map, #map1, #map, #map1], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<2x4x8xf32>, tensor<2x4xf32>) outs(%arg2, %arg3 : tensor<2x4x8xf32>, tensor<2x4xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32, %out_1: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %1, %out_1 : f32
      linalg.yield %1, %2 : f32, f32
    } -> (tensor<2x4x8xf32>, tensor<2x4xf32>)
    return %0#0, %0#1 : tensor<2x4x8xf32>, tensor<2x4xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 {disable_multi_reduction_to_contract_patterns, disable_transfer_permutation_map_lowering_patterns} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @not_vectorizable(%arg0: tensor<1x?xf32>, %arg1: index, %arg2: index, %arg3: index) -> tensor<1x128xf32> {
    %c0 = arith.constant 0 : index
    %0 = tensor.empty() : tensor<1x128xf32>
    %1 = scf.for %arg4 = %arg2 to %arg1 step %arg3 iter_args(%arg5 = %0) -> (tensor<1x128xf32>) {
      %extracted_slice = tensor.extract_slice %arg5[0, 0] [1, %arg1] [1, 1] : tensor<1x128xf32> to tensor<?xf32>
      %dim = tensor.dim %extracted_slice, %c0 : tensor<?xf32>
      %expanded = tensor.expand_shape %extracted_slice [[0, 1]] output_shape [1, %dim] : tensor<?xf32> into tensor<1x?xf32>
      %extracted_slice_0 = tensor.extract_slice %arg0[0, %arg3] [1, %arg2] [1, 1] : tensor<1x?xf32> to tensor<?xf32>
      %extracted_slice_1 = tensor.extract_slice %expanded[0, %arg3] [1, %arg2] [1, 1] : tensor<1x?xf32> to tensor<?xf32>
      %2 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%extracted_slice_0 : tensor<?xf32>) outs(%extracted_slice_1 : tensor<?xf32>) {
      ^bb0(%in: f32, %out: f32):
        %3 = arith.addf %in, %out : f32
        linalg.yield %3 : f32
      } -> tensor<?xf32>
      %inserted_slice = tensor.insert_slice %2 into %expanded[0, %arg3] [1, %arg2] [1, 1] : tensor<?xf32> into tensor<1x?xf32>
      %collapsed = tensor.collapse_shape %inserted_slice [[0, 1]] : tensor<1x?xf32> into tensor<?xf32>
      %inserted_slice_2 = tensor.insert_slice %collapsed into %arg5[0, 0] [1, %arg1] [1, 1] : tensor<?xf32> into tensor<1x128xf32>
      scf.yield %inserted_slice_2 : tensor<1x128xf32>
    }
    return %1 : tensor<1x128xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.vectorize_children_and_apply_patterns %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @wrong_reduction_detection(%arg0: tensor<120x64xf32>) -> tensor<120x64xf32> {
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %c64 = arith.constant 64 : index
    %cst = arith.constant 4.000000e+00 : f32
    %0 = scf.for %arg1 = %c0 to %c64 step %c4 iter_args(%arg2 = %arg0) -> (tensor<120x64xf32>) {
      %extracted_slice = tensor.extract_slice %arg2[%c0, %arg1] [1, 4] [1, 1] : tensor<120x64xf32> to tensor<1x4xf32>
      %1 = linalg.fill {__internal_linalg_transform__ = "1"} ins(%cst : f32) outs(%extracted_slice : tensor<1x4xf32>) -> tensor<1x4xf32>
      %2 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel", "parallel"]} outs(%1 : tensor<1x4xf32>) {
      ^bb0(%out: f32):
        %3 = linalg.index 0 : index
        %4 = arith.addi %arg1, %3 : index
        %5 = arith.index_cast %4 : index to i32
        %6 = arith.uitofp %5 : i32 to f32
        %7 = arith.mulf %out, %6 : f32
        linalg.yield %7 : f32
      } -> tensor<1x4xf32>
      %inserted_slice = tensor.insert_slice %2 into %arg2[%c0, %arg1] [1, 4] [1, 1] : tensor<1x4xf32> into tensor<120x64xf32>
      scf.yield %inserted_slice : tensor<120x64xf32>
    }
    return %0 : tensor<120x64xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
module {
  func.func @tensor_size0(%arg0: tensor<0xf32>, %arg1: tensor<f32>) -> tensor<f32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["reduction"]} ins(%arg0 : tensor<0xf32>) outs(%arg1 : tensor<f32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.addf %out, %in : f32
      linalg.yield %1 : f32
    } -> tensor<f32>
    return %0 : tensor<f32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<() -> ()>
module {
  func.func @zero_dim_tensor(%arg0: tensor<f32>, %arg1: tensor<f32>) -> tensor<f32> {
    %0 = linalg.generic {indexing_maps = [#map, #map], iterator_types = []} ins(%arg0 : tensor<f32>) outs(%arg1 : tensor<f32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.addf %in, %out : f32
      linalg.yield %1 : f32
    } -> tensor<f32>
    return %0 : tensor<f32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @multi_output_generic_different_perm_maps(%arg0: tensor<4x1xf32>, %arg1: tensor<4x1xf32>, %arg2: tensor<1x4xf32>) -> (tensor<4x1xf32>, tensor<1x4xf32>) {
    %0:2 = linalg.generic {indexing_maps = [#map, #map, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg0 : tensor<4x1xf32>) outs(%arg1, %arg2 : tensor<4x1xf32>, tensor<1x4xf32>) {
    ^bb0(%in: f32, %out: f32, %out_0: f32):
      %1 = arith.addf %in, %in : f32
      linalg.yield %1, %1 : f32, f32
    } -> (tensor<4x1xf32>, tensor<1x4xf32>)
    return %0#0, %0#1 : tensor<4x1xf32>, tensor<1x4xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, 0)>
module {
  func.func @generic_with_reduction_and_broadcast(%arg0: tensor<1x12x197x197xf32>) -> tensor<1x12x197x1xf32> {
    %0 = tensor.empty() : tensor<1x12x197x1xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel", "parallel", "reduction"]} ins(%arg0 : tensor<1x12x197x197xf32>) outs(%0 : tensor<1x12x197x1xf32>) {
    ^bb0(%in: f32, %out: f32):
      %2 = arith.addf %in, %out : f32
      linalg.yield %2 : f32
    } -> tensor<1x12x197x1xf32>
    return %1 : tensor<1x12x197x1xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @float_mixed_precision_matmul_as_generic(%arg0: memref<8x16xbf16>, %arg1: memref<16x32xbf16>, %arg2: memref<8x32xf32>) {
    linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : memref<8x16xbf16>, memref<16x32xbf16>) outs(%arg2 : memref<8x32xf32>) {
    ^bb0(%in: bf16, %in_0: bf16, %out: f32):
      %0 = arith.extf %in : bf16 to f32
      %1 = arith.extf %in_0 : bf16 to f32
      %2 = arith.mulf %0, %1 : f32
      %3 = arith.addf %out, %2 : f32
      linalg.yield %3 : f32
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 {fold_type_extensions_into_contract} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @integer_mixed_precision_matmul_as_generic(%arg0: memref<8x16xi8>, %arg1: memref<16x32xi8>, %arg2: memref<8x32xi32>) {
    linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : memref<8x16xi8>, memref<16x32xi8>) outs(%arg2 : memref<8x32xi32>) {
    ^bb0(%in: i8, %in_0: i8, %out: i32):
      %0 = arith.extsi %in : i8 to i32
      %1 = arith.extsi %in_0 : i8 to i32
      %2 = arith.muli %0, %1 : i32
      %3 = arith.addi %out, %2 : i32
      linalg.yield %3 : i32
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 {fold_type_extensions_into_contract} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @test_vectorize_copy(%arg0: memref<8x16xf32>, %arg1: memref<8x16xf32>) {
    memref.copy %arg0, %arg1 : memref<8x16xf32> to memref<8x16xf32>
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["memref.copy"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @test_vectorize_copy_0d(%arg0: memref<f32>, %arg1: memref<f32>) {
    memref.copy %arg0, %arg1 : memref<f32> to memref<f32>
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["memref.copy"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @test_vectorize_copy_complex(%arg0: memref<8x16xcomplex<f32>>, %arg1: memref<8x16xcomplex<f32>>) {
    memref.copy %arg0, %arg1 : memref<8x16xcomplex<f32>> to memref<8x16xcomplex<f32>>
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["memref.copy"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

