module {
  func.func @transpose4x8xf32(%arg0: vector<4x8xf32>) -> vector<8x4xf32> {
    %0 = vector.transpose %arg0, [1, 0] : vector<4x8xf32> to vector<8x4xf32>
    return %0 : vector<8x4xf32>
  }
  func.func @transpose021_1x4x8xf32(%arg0: vector<1x4x8xf32>) -> vector<1x8x4xf32> {
    %0 = vector.transpose %arg0, [0, 2, 1] : vector<1x4x8xf32> to vector<1x8x4xf32>
    return %0 : vector<1x8x4xf32>
  }
  func.func @transpose8x8xf32(%arg0: vector<8x8xf32>) -> vector<8x8xf32> {
    %0 = vector.transpose %arg0, [1, 0] : vector<8x8xf32> to vector<8x8xf32>
    return %0 : vector<8x8xf32>
  }
  func.func @transpose021_1x8x8xf32(%arg0: vector<1x8x8xf32>) -> vector<1x8x8xf32> {
    %0 = vector.transpose %arg0, [0, 2, 1] : vector<1x8x8xf32> to vector<1x8x8xf32>
    return %0 : vector<1x8x8xf32>
  }
  func.func @transpose120_8x1x8xf32(%arg0: vector<8x1x8xf32>) -> vector<1x8x8xf32> {
    %0 = vector.transpose %arg0, [1, 2, 0] : vector<8x1x8xf32> to vector<1x8x8xf32>
    return %0 : vector<1x8x8xf32>
  }
  func.func @transpose120_8x8x1xf32(%arg0: vector<8x8x1xf32>) -> vector<8x1x8xf32> {
    %0 = vector.transpose %arg0, [1, 2, 0] : vector<8x8x1xf32> to vector<8x1x8xf32>
    return %0 : vector<8x1x8xf32>
  }
  func.func @transpose102_8x8x1xf32(%arg0: vector<8x8x1xf32>) -> vector<8x8x1xf32> {
    %0 = vector.transpose %arg0, [1, 0, 2] : vector<8x8x1xf32> to vector<8x8x1xf32>
    return %0 : vector<8x8x1xf32>
  }
  func.func @transpose201_8x1x8xf32(%arg0: vector<8x1x8xf32>) -> vector<8x8x1xf32> {
    %0 = vector.transpose %arg0, [2, 0, 1] : vector<8x1x8xf32> to vector<8x8x1xf32>
    return %0 : vector<8x8x1xf32>
  }
  func.func @transpose201_1x8x8xf32(%arg0: vector<1x8x8xf32>) -> vector<8x1x8xf32> {
    %0 = vector.transpose %arg0, [2, 0, 1] : vector<1x8x8xf32> to vector<8x1x8xf32>
    return %0 : vector<8x1x8xf32>
  }
  func.func @transpose210_8x1x8xf32(%arg0: vector<8x1x8xf32>) -> vector<8x1x8xf32> {
    %0 = vector.transpose %arg0, [2, 1, 0] : vector<8x1x8xf32> to vector<8x1x8xf32>
    return %0 : vector<8x1x8xf32>
  }
  func.func @transpose210_8x8x1xf32(%arg0: vector<8x8x1xf32>) -> vector<1x8x8xf32> {
    %0 = vector.transpose %arg0, [2, 1, 0] : vector<8x8x1xf32> to vector<1x8x8xf32>
    return %0 : vector<1x8x8xf32>
  }
  func.func @transpose210_1x8x8xf32(%arg0: vector<1x8x8xf32>) -> vector<8x8x1xf32> {
    %0 = vector.transpose %arg0, [2, 1, 0] : vector<1x8x8xf32> to vector<8x8x1xf32>
    return %0 : vector<8x8x1xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.lower_transpose avx2_lowering_strategy = true
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
}

