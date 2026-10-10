module {
  func.func @f1(%arg0: vector<32xi64>) -> vector<20xi8> {
    %0 = arith.trunci %arg0 : vector<32xi64> to vector<32xi5>
    %1 = vector.bitcast %0 : vector<32xi5> to vector<20xi8>
    return %1 : vector<20xi8>
  }
  func.func @f2(%arg0: vector<16xi16>) -> vector<3xi16> {
    %0 = arith.trunci %arg0 : vector<16xi16> to vector<16xi3>
    %1 = vector.bitcast %0 : vector<16xi3> to vector<3xi16>
    return %1 : vector<3xi16>
  }
  func.func @f3(%arg0: vector<16xi16>) -> vector<2xi32> {
    %0 = arith.trunci %arg0 : vector<16xi16> to vector<16xi4>
    %1 = vector.bitcast %0 : vector<16xi4> to vector<2xi32>
    return %1 : vector<2xi32>
  }
  func.func @f4(%arg0: vector<16xi16>) -> vector<8xi6> {
    %0 = arith.trunci %arg0 : vector<16xi16> to vector<16xi3>
    %1 = vector.bitcast %0 : vector<16xi3> to vector<8xi6>
    return %1 : vector<8xi6>
  }
  func.func @f1ext(%arg0: vector<5xi8>) -> vector<8xi16> {
    %0 = vector.bitcast %arg0 : vector<5xi8> to vector<8xi5>
    %1 = arith.extsi %0 : vector<8xi5> to vector<8xi16>
    return %1 : vector<8xi16>
  }
  func.func @f2ext(%arg0: vector<5xi8>) -> vector<8xi16> {
    %0 = vector.bitcast %arg0 : vector<5xi8> to vector<8xi5>
    %1 = arith.extui %0 : vector<8xi5> to vector<8xi16>
    return %1 : vector<8xi16>
  }
  func.func @f3ext(%arg0: vector<5xi8>) -> vector<8xi17> {
    %0 = vector.bitcast %arg0 : vector<5xi8> to vector<8xi5>
    %1 = arith.extsi %0 : vector<8xi5> to vector<8xi17>
    return %1 : vector<8xi17>
  }
  func.func @i4_transpose(%arg0: vector<8x16xi4>) -> vector<16x8xi4> {
    %0 = vector.transpose %arg0, [1, 0] : vector<8x16xi4> to vector<16x8xi4>
    return %0 : vector<16x8xi4>
  }
  func.func @i7_transpose(%arg0: vector<8x16xi7>) -> vector<16x8xi7> {
    %0 = vector.transpose %arg0, [1, 0] : vector<8x16xi7> to vector<16x8xi7>
    return %0 : vector<16x8xi7>
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

