module {
  func.func @vectorize_matmul(%arg0: tensor<24x12xf32>, %arg1: tensor<12x25xf32>, %arg2: tensor<24x25xf32>) -> tensor<24x25xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<24x12xf32>, tensor<12x25xf32>) outs(%arg2 : tensor<24x25xf32>) -> tensor<24x25xf32>
    return %0 : tensor<24x25xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @vectorize_matmul_memref(%arg0: memref<24x12xf32>, %arg1: memref<12x25xf32>, %arg2: memref<24x25xf32>) {
    linalg.matmul ins(%arg0, %arg1 : memref<24x12xf32>, memref<12x25xf32>) outs(%arg2 : memref<24x25xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @vectorize_copy_memref(%arg0: memref<100x100xf32>, %arg1: memref<100x100xf32>) {
    linalg.copy ins(%arg0 : memref<100x100xf32>) outs(%arg1 : memref<100x100xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.copy"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<()[s0] -> (-s0 + 12, 7)>
#map1 = affine_map<()[s0] -> (-s0 + 7)>
module {
  func.func @vectorize_keep_pad(%arg0: tensor<24x12xf32>, %arg1: tensor<12x25xf32>, %arg2: tensor<24x25xf32>, %arg3: index, %arg4: index, %arg5: index) -> tensor<24x25xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = affine.min #map()[%arg5]
    %extracted_slice = tensor.extract_slice %arg0[%arg3, %arg5] [4, %0] [1, 1] : tensor<24x12xf32> to tensor<4x?xf32>
    %extracted_slice_0 = tensor.extract_slice %arg1[%arg5, %arg4] [%0, 5] [1, 1] : tensor<12x25xf32> to tensor<?x5xf32>
    %extracted_slice_1 = tensor.extract_slice %arg2[%arg3, %arg4] [4, 5] [1, 1] : tensor<24x25xf32> to tensor<4x5xf32>
    %1 = affine.apply #map1()[%0]
    %padded = tensor.pad %extracted_slice nofold low[%c0, %c0] high[%c0, %1] {
    ^bb0(%arg6: index, %arg7: index):
      tensor.yield %cst : f32
    } : tensor<4x?xf32> to tensor<4x7xf32>
    %2 = affine.apply #map1()[%0]
    %padded_2 = tensor.pad %extracted_slice_0 nofold low[%c0, %c0] high[%2, %c0] {
    ^bb0(%arg6: index, %arg7: index):
      tensor.yield %cst : f32
    } : tensor<?x5xf32> to tensor<7x5xf32>
    %3 = linalg.matmul ins(%padded, %padded_2 : tensor<4x7xf32>, tensor<7x5xf32>) outs(%extracted_slice_1 : tensor<4x5xf32>) -> tensor<4x5xf32>
    %inserted_slice = tensor.insert_slice %3 into %arg2[%arg3, %arg4] [4, 5] [1, 1] : tensor<4x5xf32> into tensor<24x25xf32>
    return %inserted_slice : tensor<24x25xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<()[s0] -> (-s0 + 12, 7)>
#map1 = affine_map<()[s0] -> (-s0 + 7)>
module {
  func.func @vectorize_pad(%arg0: tensor<24x12xf32>, %arg1: tensor<12x25xf32>, %arg2: tensor<24x25xf32>, %arg3: index, %arg4: index, %arg5: index) -> tensor<24x25xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = affine.min #map()[%arg5]
    %extracted_slice = tensor.extract_slice %arg0[%arg3, %arg5] [4, %0] [1, 1] : tensor<24x12xf32> to tensor<4x?xf32>
    %extracted_slice_0 = tensor.extract_slice %arg1[%arg5, %arg4] [%0, 5] [1, 1] : tensor<12x25xf32> to tensor<?x5xf32>
    %extracted_slice_1 = tensor.extract_slice %arg2[%arg3, %arg4] [4, 5] [1, 1] : tensor<24x25xf32> to tensor<4x5xf32>
    %1 = affine.apply #map1()[%0]
    %padded = tensor.pad %extracted_slice nofold low[%c0, %c0] high[%c0, %1] {
    ^bb0(%arg6: index, %arg7: index):
      tensor.yield %cst : f32
    } : tensor<4x?xf32> to tensor<4x7xf32>
    %2 = affine.apply #map1()[%0]
    %padded_2 = tensor.pad %extracted_slice_0 nofold low[%c0, %c0] high[%2, %c0] {
    ^bb0(%arg6: index, %arg7: index):
      tensor.yield %cst : f32
    } : tensor<?x5xf32> to tensor<7x5xf32>
    %3 = linalg.matmul ins(%padded, %padded_2 : tensor<4x7xf32>, tensor<7x5xf32>) outs(%extracted_slice_1 : tensor<4x5xf32>) -> tensor<4x5xf32>
    %inserted_slice = tensor.insert_slice %3 into %arg2[%arg3, %arg4] [4, 5] [1, 1] : tensor<4x5xf32> into tensor<24x25xf32>
    return %inserted_slice : tensor<24x25xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 {vectorize_padding} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @vectorize(%arg0: tensor<24x12xf32>, %arg1: tensor<12x25xf32>, %arg2: tensor<24x25xf32>) -> tensor<24x25xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<24x12xf32>, tensor<12x25xf32>) outs(%arg2 : tensor<24x25xf32>) -> tensor<24x25xf32>
    return %0 : tensor<24x25xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.vectorize_children_and_apply_patterns %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

