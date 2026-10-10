module {
  func.func @unaligned_extsi_i4_to_i8(%arg0: vector<1xi4>) -> vector<1xi8> {
    %0 = arith.extsi %arg0 : vector<1xi4> to vector<1xi8>
    return %0 : vector<1xi8>
  }
  func.func @unaligned_extsi_i2_to_i8(%arg0: vector<2xi2>) -> vector<2xi8> {
    %0 = arith.extsi %arg0 : vector<2xi2> to vector<2xi8>
    return %0 : vector<2xi8>
  }
  func.func @aligned_extsi_i4_to_i8(%arg0: vector<8xi4>) -> vector<8xi8> {
    %0 = arith.extsi %arg0 : vector<8xi4> to vector<8xi8>
    return %0 : vector<8xi8>
  }
  func.func @aligned_extsi_i2_to_i8(%arg0: vector<8xi2>) -> vector<8xi8> {
    %0 = arith.extsi %arg0 : vector<8xi2> to vector<8xi8>
    return %0 : vector<8xi8>
  }
  func.func @aligned_extsi_i4_to_i32(%arg0: vector<8xi4>) -> vector<8xi32> {
    %0 = arith.extsi %arg0 : vector<8xi4> to vector<8xi32>
    return %0 : vector<8xi32>
  }
  func.func @aligned_extsi_i2_to_i32(%arg0: vector<8xi2>) -> vector<8xi32> {
    %0 = arith.extsi %arg0 : vector<8xi2> to vector<8xi32>
    return %0 : vector<8xi32>
  }
  func.func @aligned_extsi_i4_to_i32_2d(%arg0: vector<8x32xi4>) -> vector<8x32xi32> {
    %0 = arith.extsi %arg0 : vector<8x32xi4> to vector<8x32xi32>
    return %0 : vector<8x32xi32>
  }
  func.func @aligned_extsi_i2_to_i32_2d(%arg0: vector<8x32xi2>) -> vector<8x32xi32> {
    %0 = arith.extsi %arg0 : vector<8x32xi2> to vector<8x32xi32>
    return %0 : vector<8x32xi32>
  }
  func.func @aligned_trunci_i8_to_i4(%arg0: vector<8xi8>) -> vector<8xi4> {
    %0 = arith.trunci %arg0 : vector<8xi8> to vector<8xi4>
    return %0 : vector<8xi4>
  }
  func.func @aligned_trunci_i32_to_i4(%arg0: vector<8xi32>) -> vector<8xi4> {
    %0 = arith.trunci %arg0 : vector<8xi32> to vector<8xi4>
    return %0 : vector<8xi4>
  }
  func.func @aligned_trunci_2d(%arg0: vector<8x32xi32>) -> vector<8x32xi4> {
    %0 = arith.trunci %arg0 : vector<8x32xi32> to vector<8x32xi4>
    return %0 : vector<8x32xi4>
  }
  func.func @aligned_trunci_nd(%arg0: vector<3x8x32xi32>) -> vector<3x8x32xi4> {
    %0 = arith.trunci %arg0 : vector<3x8x32xi32> to vector<3x8x32xi4>
    return %0 : vector<3x8x32xi4>
  }
  func.func @aligned_trunci_i8_to_i2_no_match(%arg0: vector<8xi8>) -> vector<8xi2> {
    %0 = arith.trunci %arg0 : vector<8xi8> to vector<8xi2>
    return %0 : vector<8xi2>
  }
  func.func @aligned_extui_i4_to_i8(%arg0: vector<8xi4>) -> vector<8xi8> {
    %0 = arith.extui %arg0 : vector<8xi4> to vector<8xi8>
    return %0 : vector<8xi8>
  }
  func.func @aligned_extui_i2_to_i8(%arg0: vector<8xi2>) -> vector<8xi8> {
    %0 = arith.extui %arg0 : vector<8xi2> to vector<8xi8>
    return %0 : vector<8xi8>
  }
  func.func @aligned_extui_i4_to_i32(%arg0: vector<8xi4>) -> vector<8xi32> {
    %0 = arith.extui %arg0 : vector<8xi4> to vector<8xi32>
    return %0 : vector<8xi32>
  }
  func.func @aligned_extui_i2_to_i32(%arg0: vector<8xi2>) -> vector<8xi32> {
    %0 = arith.extui %arg0 : vector<8xi2> to vector<8xi32>
    return %0 : vector<8xi32>
  }
  func.func @aligned_extui_i4_to_i32_2d(%arg0: vector<8x32xi4>) -> vector<8x32xi32> {
    %0 = arith.extui %arg0 : vector<8x32xi4> to vector<8x32xi32>
    return %0 : vector<8x32xi32>
  }
  func.func @aligned_extui_i2_to_i32_2d(%arg0: vector<8x32xi2>) -> vector<8x32xi32> {
    %0 = arith.extui %arg0 : vector<8x32xi2> to vector<8x32xi32>
    return %0 : vector<8x32xi32>
  }
  func.func @aligned_sitofp(%arg0: vector<8xi4>) -> vector<8xf32> {
    %0 = arith.sitofp %arg0 : vector<8xi4> to vector<8xf32>
    return %0 : vector<8xf32>
  }
  func.func @aligned_sitofp_2d(%arg0: vector<8x32xi4>) -> vector<8x32xf32> {
    %0 = arith.sitofp %arg0 : vector<8x32xi4> to vector<8x32xf32>
    return %0 : vector<8x32xf32>
  }
  func.func @aligned_uitofp(%arg0: vector<8xi4>) -> vector<8xf32> {
    %0 = arith.uitofp %arg0 : vector<8xi4> to vector<8xf32>
    return %0 : vector<8xf32>
  }
  func.func @aligned_uitofp_2d(%arg0: vector<8x32xi4>) -> vector<8x32xf32> {
    %0 = arith.uitofp %arg0 : vector<8x32xi4> to vector<8x32xf32>
    return %0 : vector<8x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.rewrite_narrow_types
      } : !transform.any_op
      transform.yield 
    }
  }
}

