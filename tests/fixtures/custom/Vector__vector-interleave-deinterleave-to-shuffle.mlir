module {
  func.func @vector_interleave_to_shuffle_1d(%arg0: vector<7xi16>, %arg1: vector<7xi16>) -> vector<14xi16> {
    %0 = vector.interleave %arg0, %arg1 : vector<7xi16> -> vector<14xi16>
    return %0 : vector<14xi16>
  }
  func.func @vector_interleave_to_shuffle_0d(%arg0: vector<f32>, %arg1: vector<f32>) -> vector<2xf32> {
    %0 = vector.interleave %arg0, %arg1 : vector<f32> -> vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @vector_deinterleave_to_shuffle_1d(%arg0: vector<14xi16>) -> (vector<7xi16>, vector<7xi16>) {
    %res1, %res2 = vector.deinterleave %arg0 : vector<14xi16> -> vector<7xi16>
    return %res1, %res2 : vector<7xi16>, vector<7xi16>
  }
  func.func @vector_deinterleave_size2(%arg0: vector<2xi32>) -> (vector<1xi32>, vector<1xi32>) {
    %res1, %res2 = vector.deinterleave %arg0 : vector<2xi32> -> vector<1xi32>
    return %res1, %res2 : vector<1xi32>, vector<1xi32>
  }
  func.func @negative_cases(%arg0: vector<[4]xi32>, %arg1: vector<[4]xi32>, %arg2: vector<2x4xi32>, %arg3: vector<2x4xi32>, %arg4: vector<[8]xi32>, %arg5: vector<2x8xi32>) -> (vector<[8]xi32>, vector<2x8xi32>, vector<[4]xi32>, vector<[4]xi32>, vector<2x4xi32>, vector<2x4xi32>) {
    %0 = vector.interleave %arg0, %arg1 : vector<[4]xi32> -> vector<[8]xi32>
    %1 = vector.interleave %arg2, %arg3 : vector<2x4xi32> -> vector<2x8xi32>
    %res1, %res2 = vector.deinterleave %arg4 : vector<[8]xi32> -> vector<[4]xi32>
    %res1_0, %res2_1 = vector.deinterleave %arg5 : vector<2x8xi32> -> vector<2x4xi32>
    return %0, %1, %res1, %res2, %res1_0, %res2_1 : vector<[8]xi32>, vector<2x8xi32>, vector<[4]xi32>, vector<[4]xi32>, vector<2x4xi32>, vector<2x4xi32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.interleave_and_deinterleave_to_shuffle
      } : !transform.any_op
      transform.yield 
    }
  }
}

