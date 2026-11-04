module {
  func.func @pad_and_transfer_read(%arg0: tensor<5x6xf32>) -> vector<7x9xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 5.000000e+00 : f32
    %cst_0 = arith.constant 6.000000e+00 : f32
    %padded = tensor.pad %arg0 low[0, 0] high[5, 7] {
    ^bb0(%arg1: index, %arg2: index):
      tensor.yield %cst : f32
    } : tensor<5x6xf32> to tensor<10x13xf32>
    %0 = vector.transfer_read %padded[%c0, %c0], %cst_0 : tensor<10x13xf32>, vector<7x9xf32>
    return %0 : vector<7x9xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.linalg.pad_vectorization
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
}

// -----
module {
  func.func private @make_vector() -> vector<7x9xf32>
  func.func @pad_and_transfer_write_static_low_and_high(%arg0: tensor<5x6xf32>) -> tensor<5x6xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 5.000000e+00 : f32
    %padded = tensor.pad %arg0 low[0, 0] high[5, 7] {
    ^bb0(%arg1: index, %arg2: index):
      tensor.yield %cst : f32
    } : tensor<5x6xf32> to tensor<10x13xf32>
    %0 = call @make_vector() : () -> vector<7x9xf32>
    %1 = vector.transfer_write %0, %padded[%c0, %c0] : vector<7x9xf32>, tensor<10x13xf32>
    %extracted_slice = tensor.extract_slice %1[0, 0] [5, 6] [1, 1] : tensor<10x13xf32> to tensor<5x6xf32>
    return %extracted_slice : tensor<5x6xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.linalg.pad_vectorization
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
}

// -----
module {
  func.func private @make_vector() -> vector<7x9xf32>
  func.func @pad_and_transfer_write_static_low_dynamic_high(%arg0: tensor<?x?xf32>, %arg1: index, %arg2: index) -> tensor<?x6xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 5.000000e+00 : f32
    %extracted_slice = tensor.extract_slice %arg0[0, 0] [%arg1, 6] [1, 1] : tensor<?x?xf32> to tensor<?x6xf32>
    %padded = tensor.pad %extracted_slice low[0, 0] high[%arg2, 7] {
    ^bb0(%arg3: index, %arg4: index):
      tensor.yield %cst : f32
    } : tensor<?x6xf32> to tensor<?x13xf32>
    %0 = call @make_vector() : () -> vector<7x9xf32>
    %1 = vector.transfer_write %0, %padded[%c0, %c0] : vector<7x9xf32>, tensor<?x13xf32>
    %extracted_slice_0 = tensor.extract_slice %1[0, 0] [%arg1, 6] [1, 1] : tensor<?x13xf32> to tensor<?x6xf32>
    return %extracted_slice_0 : tensor<?x6xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.linalg.pad_vectorization
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
}

// -----
module {
  func.func private @make_vector() -> vector<7x9xf32>
  func.func @pad_and_transfer_write_static_non_zero_low_pad(%arg0: tensor<5x6xf32>) -> tensor<5x6xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 5.000000e+00 : f32
    %padded = tensor.pad %arg0 low[0, 1] high[5, 6] {
    ^bb0(%arg1: index, %arg2: index):
      tensor.yield %cst : f32
    } : tensor<5x6xf32> to tensor<10x13xf32>
    %0 = call @make_vector() : () -> vector<7x9xf32>
    %1 = vector.transfer_write %0, %padded[%c0, %c0] : vector<7x9xf32>, tensor<10x13xf32>
    %extracted_slice = tensor.extract_slice %1[0, 0] [5, 6] [1, 1] : tensor<10x13xf32> to tensor<5x6xf32>
    return %extracted_slice : tensor<5x6xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.linalg.pad_vectorization
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
}

// -----
module {
  func.func private @make_vector() -> vector<7x9xf32>
  func.func @pad_and_transfer_write_static_non_zero_offset(%arg0: tensor<5x6xf32>) -> tensor<5x6xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 5.000000e+00 : f32
    %padded = tensor.pad %arg0 low[0, 0] high[5, 7] {
    ^bb0(%arg1: index, %arg2: index):
      tensor.yield %cst : f32
    } : tensor<5x6xf32> to tensor<10x13xf32>
    %0 = call @make_vector() : () -> vector<7x9xf32>
    %1 = vector.transfer_write %0, %padded[%c0, %c0] : vector<7x9xf32>, tensor<10x13xf32>
    %extracted_slice = tensor.extract_slice %1[0, 1] [5, 6] [1, 1] : tensor<10x13xf32> to tensor<5x6xf32>
    return %extracted_slice : tensor<5x6xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.linalg.pad_vectorization
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
}

// -----
module {
  func.func private @make_vector() -> tensor<12x13xf32>
  func.func @pad_and_insert_slice_source(%arg0: tensor<5x6xf32>) -> tensor<12x13xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 5.000000e+00 : f32
    %padded = tensor.pad %arg0 low[0, 0] high[2, 3] {
    ^bb0(%arg1: index, %arg2: index):
      tensor.yield %cst : f32
    } : tensor<5x6xf32> to tensor<7x9xf32>
    %0 = call @make_vector() : () -> tensor<12x13xf32>
    %inserted_slice = tensor.insert_slice %padded into %0[0, 0] [7, 9] [1, 1] : tensor<7x9xf32> into tensor<12x13xf32>
    return %inserted_slice : tensor<12x13xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.linalg.pad_vectorization
      } : !transform.op<"func.func">
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
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.linalg.pad_vectorization
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
}

