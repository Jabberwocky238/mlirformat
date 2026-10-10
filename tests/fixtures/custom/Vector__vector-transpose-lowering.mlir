module {
  func.func @transpose23(%arg0: vector<2x3xf32>) -> vector<3x2xf32> {
    %0 = vector.transpose %arg0, [1, 0] : vector<2x3xf32> to vector<3x2xf32>
    return %0 : vector<3x2xf32>
  }
  func.func @transpose102_1x8x8xf32(%arg0: vector<1x8x8xf32>) -> vector<8x1x8xf32> {
    %0 = vector.transpose %arg0, [1, 0, 2] : vector<1x8x8xf32> to vector<8x1x8xf32>
    return %0 : vector<8x1x8xf32>
  }
  func.func @transpose102_8x1x8xf32(%arg0: vector<8x1x8xf32>) -> vector<1x8x8xf32> {
    %0 = vector.transpose %arg0, [1, 0, 2] : vector<8x1x8xf32> to vector<1x8x8xf32>
    return %0 : vector<1x8x8xf32>
  }
  func.func @transpose1023_2x1x8x4xf32(%arg0: vector<2x1x8x4xf32>) -> vector<1x2x8x4xf32> {
    %0 = vector.transpose %arg0, [1, 0, 2, 3] : vector<2x1x8x4xf32> to vector<1x2x8x4xf32>
    return %0 : vector<1x2x8x4xf32>
  }
  func.func @transpose23_scalable(%arg0: vector<2x[3]xf32>) -> vector<[3]x2xf32> {
    %0 = vector.transpose %arg0, [1, 0] : vector<2x[3]xf32> to vector<[3]x2xf32>
    return %0 : vector<[3]x2xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.lower_transpose
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
}

// -----
module {
  func.func @transpose(%arg0: vector<2x4xf32>) -> vector<4x2xf32> {
    %0 = vector.transpose %arg0, [1, 0] : vector<2x4xf32> to vector<4x2xf32>
    return %0 : vector<4x2xf32>
  }
  func.func @transpose_scalable(%arg0: vector<2x[4]xf32>) -> vector<[4]x2xf32> {
    %0 = vector.transpose %arg0, [1, 0] : vector<2x[4]xf32> to vector<[4]x2xf32>
    return %0 : vector<[4]x2xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.lower_transpose lowering_strategy = shuffle_1d
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
}

// -----
module {
  func.func @transpose_shuffle16x16xf32(%arg0: vector<16x16xf32>) -> vector<16x16xf32> {
    %0 = vector.transpose %arg0, [1, 0] : vector<16x16xf32> to vector<16x16xf32>
    return %0 : vector<16x16xf32>
  }
  func.func @transpose_shuffle16x16xf32_scalable(%arg0: vector<16x[16]xf32>) -> vector<[16]x16xf32> {
    %0 = vector.transpose %arg0, [1, 0] : vector<16x[16]xf32> to vector<[16]x16xf32>
    return %0 : vector<[16]x16xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.lower_transpose lowering_strategy = shuffle_16x16
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
}

// -----
module {
  func.func @transpose021_shuffle16x16xf32(%arg0: vector<1x16x16xf32>) -> vector<1x16x16xf32> {
    %0 = vector.transpose %arg0, [0, 2, 1] : vector<1x16x16xf32> to vector<1x16x16xf32>
    return %0 : vector<1x16x16xf32>
  }
  func.func @transpose021_shuffle16x16xf32_scalable(%arg0: vector<1x16x[16]xf32>) -> vector<1x[16]x16xf32> {
    %0 = vector.transpose %arg0, [0, 2, 1] : vector<1x16x[16]xf32> to vector<1x[16]x16xf32>
    return %0 : vector<1x[16]x16xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.lower_transpose lowering_strategy = shuffle_16x16
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
}

// -----
module {
  func.func @transpose10_4x1xf32(%arg0: vector<4x1xf32>) -> vector<1x4xf32> {
    %0 = vector.transpose %arg0, [1, 0] : vector<4x1xf32> to vector<1x4xf32>
    return %0 : vector<1x4xf32>
  }
  func.func @transpose10_nx4x1xf32(%arg0: vector<[4]x1xf32>) -> vector<1x[4]xf32> {
    %0 = vector.transpose %arg0, [1, 0] : vector<[4]x1xf32> to vector<1x[4]xf32>
    return %0 : vector<1x[4]xf32>
  }
  func.func @transpose10_1x4xf32(%arg0: vector<1x4xf32>) -> vector<4x1xf32> {
    %0 = vector.transpose %arg0, [1, 0] : vector<1x4xf32> to vector<4x1xf32>
    return %0 : vector<4x1xf32>
  }
  func.func @transpose10_1xnx4xf32(%arg0: vector<1x[4]xf32>) -> vector<[4]x1xf32> {
    %0 = vector.transpose %arg0, [1, 0] : vector<1x[4]xf32> to vector<[4]x1xf32>
    return %0 : vector<[4]x1xf32>
  }
  func.func @transpose10_4x1xf32_scalable(%arg0: vector<4x[1]xf32>) -> vector<[1]x4xf32> {
    %0 = vector.transpose %arg0, [1, 0] : vector<4x[1]xf32> to vector<[1]x4xf32>
    return %0 : vector<[1]x4xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.lower_transpose
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
}

