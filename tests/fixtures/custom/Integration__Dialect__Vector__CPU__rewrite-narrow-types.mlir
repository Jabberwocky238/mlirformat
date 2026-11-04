module {
  func.func @print_as_i1_16xi5(%arg0: vector<16xi5>) {
    %0 = vector.bitcast %arg0 : vector<16xi5> to vector<80xi1>
    vector.print %0 : vector<80xi1>
    return
  }
  func.func @print_as_i1_10xi8(%arg0: vector<10xi8>) {
    %0 = vector.bitcast %arg0 : vector<10xi8> to vector<80xi1>
    vector.print %0 : vector<80xi1>
    return
  }
  func.func @f(%arg0: vector<16xi16>) {
    %0 = arith.trunci %arg0 : vector<16xi16> to vector<16xi5>
    call @print_as_i1_16xi5(%0) : (vector<16xi5>) -> ()
    %1 = vector.bitcast %0 : vector<16xi5> to vector<10xi8>
    call @print_as_i1_10xi8(%1) : (vector<10xi8>) -> ()
    return
  }
  func.func @print_as_i1_8xi3(%arg0: vector<8xi3>) {
    %0 = vector.bitcast %arg0 : vector<8xi3> to vector<24xi1>
    vector.print %0 : vector<24xi1>
    return
  }
  func.func @print_as_i1_3xi8(%arg0: vector<3xi8>) {
    %0 = vector.bitcast %arg0 : vector<3xi8> to vector<24xi1>
    vector.print %0 : vector<24xi1>
    return
  }
  func.func @f2(%arg0: vector<8xi32>) {
    %0 = arith.trunci %arg0 : vector<8xi32> to vector<8xi3>
    call @print_as_i1_8xi3(%0) : (vector<8xi3>) -> ()
    %1 = vector.bitcast %0 : vector<8xi3> to vector<3xi8>
    call @print_as_i1_3xi8(%1) : (vector<3xi8>) -> ()
    return
  }
  func.func @print_as_i1_2xi24(%arg0: vector<2xi24>) {
    %0 = vector.bitcast %arg0 : vector<2xi24> to vector<48xi1>
    vector.print %0 : vector<48xi1>
    return
  }
  func.func @print_as_i1_3xi16(%arg0: vector<3xi16>) {
    %0 = vector.bitcast %arg0 : vector<3xi16> to vector<48xi1>
    vector.print %0 : vector<48xi1>
    return
  }
  func.func @f3(%arg0: vector<2xi48>) {
    %0 = arith.trunci %arg0 : vector<2xi48> to vector<2xi24>
    call @print_as_i1_2xi24(%0) : (vector<2xi24>) -> ()
    %1 = vector.bitcast %0 : vector<2xi24> to vector<3xi16>
    call @print_as_i1_3xi16(%1) : (vector<3xi16>) -> ()
    return
  }
  func.func @print_as_i1_8xi5(%arg0: vector<8xi5>) {
    %0 = vector.bitcast %arg0 : vector<8xi5> to vector<40xi1>
    vector.print %0 : vector<40xi1>
    return
  }
  func.func @print_as_i1_8xi16(%arg0: vector<8xi16>) {
    %0 = vector.bitcast %arg0 : vector<8xi16> to vector<128xi1>
    vector.print %0 : vector<128xi1>
    return
  }
  func.func @fext(%arg0: vector<5xi8>) {
    %0 = vector.bitcast %arg0 : vector<5xi8> to vector<8xi5>
    call @print_as_i1_8xi5(%0) : (vector<8xi5>) -> ()
    %1 = arith.extui %0 : vector<8xi5> to vector<8xi16>
    call @print_as_i1_8xi16(%1) : (vector<8xi16>) -> ()
    return
  }
  func.func @fcst_maskedload(%arg0: memref<?xi4>, %arg1: vector<6xi4>) -> vector<6xi4> {
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [3] : vector<6xi1>
    %1 = vector.maskedload %arg0[%c0], %0, %arg1 : memref<?xi4>, vector<6xi1>, vector<6xi4> into vector<6xi4>
    return %1 : vector<6xi4>
  }
  func.func @entry() {
    %cst = arith.constant dense<[-1, -2, -3, -4, -5, -6, -7, -8, -9, -10, -11, -12, -13, -14, -15, -16]> : vector<16xi16>
    call @f(%cst) : (vector<16xi16>) -> ()
    %cst_0 = arith.constant dense<[65535, 65534, 65533, 65532, 65531, 65530, 65529, 65528]> : vector<8xi32>
    call @f2(%cst_0) : (vector<8xi32>) -> ()
    %cst_1 = arith.constant dense<[-13994362404865, -4271950758]> : vector<2xi48>
    call @f3(%cst_1) : (vector<2xi48>) -> ()
    %cst_2 = arith.constant dense<[-17, -18, -19, -20, -21]> : vector<5xi8>
    call @fext(%cst_2) : (vector<5xi8>) -> ()
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c6 = arith.constant 6 : index
    %alloc = memref.alloc(%c6) : memref<?xi4>
    scf.for %arg0 = %c0 to %c6 step %c1 {
      %1 = arith.index_cast %arg0 : index to i4
      memref.store %1, %alloc[%arg0] : memref<?xi4>
    }
    %cst_3 = arith.constant dense<[7, -8, -7, -6, -5, -4]> : vector<6xi4>
    %0 = call @fcst_maskedload(%alloc, %cst_3) : (memref<?xi4>, vector<6xi4>) -> vector<6xi4>
    vector.print %0 : vector<6xi4>
    memref.dealloc %alloc : memref<?xi4>
    return
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

