module {
  func.func @pad_static(%arg0: tensor<2x?x2xf32>, %arg1: f32) -> tensor<2x3x4xf32> {
    %padded = tensor.pad %arg0 low[0, 0, 2] high[0, 1, 0] {
    ^bb0(%arg2: index, %arg3: index, %arg4: index):
      tensor.yield %arg1 : f32
    } : tensor<2x?x2xf32> to tensor<2x3x4xf32>
    return %padded : tensor<2x3x4xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.pad"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 {vectorize_padding} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pad_static_source(%arg0: tensor<2x5x2xf32>, %arg1: f32) -> tensor<2x6x4xf32> {
    %padded = tensor.pad %arg0 low[0, 0, 2] high[0, 1, 0] {
    ^bb0(%arg2: index, %arg3: index, %arg4: index):
      tensor.yield %arg1 : f32
    } : tensor<2x5x2xf32> to tensor<2x6x4xf32>
    return %padded : tensor<2x6x4xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.pad"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 {vectorize_padding} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pad_static_dynamic(%arg0: tensor<1x2x2x?xf32>, %arg1: index, %arg2: index, %arg3: f32) -> tensor<6x?x?x?xf32> {
    %padded = tensor.pad %arg0 low[2, %arg1, 3, 3] high[3, 3, %arg2, 2] {
    ^bb0(%arg4: index, %arg5: index, %arg6: index, %arg7: index):
      tensor.yield %arg3 : f32
    } : tensor<1x2x2x?xf32> to tensor<6x?x?x?xf32>
    return %padded : tensor<6x?x?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.pad"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 {vectorize_padding} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pad_static_complex(%arg0: tensor<2x5x2xcomplex<f32>>, %arg1: complex<f32>) -> tensor<2x6x4xcomplex<f32>> {
    %padded = tensor.pad %arg0 low[0, 0, 2] high[0, 1, 0] {
    ^bb0(%arg2: index, %arg3: index, %arg4: index):
      tensor.yield %arg1 : complex<f32>
    } : tensor<2x5x2xcomplex<f32>> to tensor<2x6x4xcomplex<f32>>
    return %padded : tensor<2x6x4xcomplex<f32>>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.pad"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 {vectorize_padding} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func private @make_vector() -> tensor<12x13xf32>
  func.func @pad_and_insert_slice_dest(%arg0: tensor<1x5x6xf32>) -> tensor<1x12x13xf32> {
    %cst = arith.constant 5.000000e+00 : f32
    %padded = tensor.pad %arg0 low[0, 0, 0] high[0, 7, 7] {
    ^bb0(%arg1: index, %arg2: index, %arg3: index):
      tensor.yield %cst : f32
    } : tensor<1x5x6xf32> to tensor<1x12x13xf32>
    %0 = call @make_vector() : () -> tensor<12x13xf32>
    %inserted_slice = tensor.insert_slice %0 into %padded[0, 0, 0] [1, 12, 13] [1, 1, 1] : tensor<12x13xf32> into tensor<1x12x13xf32>
    return %inserted_slice : tensor<1x12x13xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.pad"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 {vectorize_padding} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pad_tensor_non_const_pad_value(%arg0: tensor<5x6xf32>) -> tensor<12x13xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 5.000000e+00 : f32
    %padded = tensor.pad %arg0 low[3, 4] high[4, 3] {
    ^bb0(%arg1: index, %arg2: index):
      %0 = arith.index_cast %arg1 : index to i32
      %1 = arith.index_cast %arg2 : index to i32
      %2 = arith.sitofp %0 : i32 to f32
      %3 = arith.sitofp %1 : i32 to f32
      %4 = arith.mulf %2, %3 : f32
      tensor.yield %4 : f32
    } : tensor<5x6xf32> to tensor<12x13xf32>
    return %padded : tensor<12x13xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.pad"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 {vectorize_padding} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @test_masked_pad_static_dynamic(%arg0: tensor<1x2x2x?xf32>, %arg1: index, %arg2: index, %arg3: f32) -> tensor<6x?x?x?xf32> {
    %padded = tensor.pad %arg0 low[2, %arg1, 3, 3] high[3, 3, %arg2, 2] {
    ^bb0(%arg4: index, %arg5: index, %arg6: index, %arg7: index):
      tensor.yield %arg3 : f32
    } : tensor<1x2x2x?xf32> to tensor<6x?x?x?xf32>
    return %padded : tensor<6x?x?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.pad"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 {vectorize_padding} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

