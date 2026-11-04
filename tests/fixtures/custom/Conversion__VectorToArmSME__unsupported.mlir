#map = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func @transfer_read_2d__bad_type(%arg0: memref<?x?xf64>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f64
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst {permutation_map = #map} : memref<?x?xf64>, vector<[4]x[4]xf64>
    "prevent.dce"(%0) : (vector<[4]x[4]xf64>) -> ()
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func @transfer_read_2d__non_memref_type(%arg0: tensor<?x?xf64>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f64
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst {in_bounds = [true, true], permutation_map = #map} : tensor<?x?xf64>, vector<[2]x[2]xf64>
    "prevent.dce"(%0) : (vector<[2]x[2]xf64>) -> ()
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0)>
module {
  func.func @transfer_read_2d__bad_transfer_rank(%arg0: memref<?x?xf64>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f64
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst {in_bounds = [true], permutation_map = #map} : memref<?x?xf64>, vector<[2]xf64>
    "prevent.dce"(%0) : (vector<[2]xf64>) -> ()
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, 0)>
module {
  func.func @transfer_read_2d__non_transpose(%arg0: memref<?x?xf64>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f64
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst {in_bounds = [true, true], permutation_map = #map} : memref<?x?xf64>, vector<[2]x[2]xf64>
    "prevent.dce"(%0) : (vector<[2]x[2]xf64>) -> ()
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func @transfer_read_2d__out_of_bounds(%arg0: memref<?x?xf64>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f64
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst {permutation_map = #map} : memref<?x?xf64>, vector<[2]x[2]xf64>
    "prevent.dce"(%0) : (vector<[2]x[2]xf64>) -> ()
    return
  }
}

// -----
module {
  func.func @transfer_write_2d_zero__bad_type(%arg0: memref<?x?xi4>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant dense<0> : vector<[16]x[16]xi4>
    vector.transfer_write %cst, %arg0[%c0, %c0] {in_bounds = [true, true]} : vector<[16]x[16]xi4>, memref<?x?xi4>
    return
  }
}

// -----
module {
  func.func @transfer_write_2d_zero__bad_shape(%arg0: memref<?x?xi8>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant dense<0> : vector<[8]x[8]xi8>
    vector.transfer_write %cst, %arg0[%c0, %c0] {in_bounds = [true, true]} : vector<[8]x[8]xi8>, memref<?x?xi8>
    return
  }
}

// -----
module {
  func.func @transfer_write_2d_zero__bad_rank(%arg0: memref<?x?x?xi8>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant dense<0> : vector<[16]x[16]x[16]xi8>
    vector.transfer_write %cst, %arg0[%c0, %c0, %c0] {in_bounds = [true, true, true]} : vector<[16]x[16]x[16]xi8>, memref<?x?x?xi8>
    return
  }
}

// -----
module {
  func.func @transfer_write_2d_zero__non_memref_type(%arg0: tensor<?x?xi8>) -> tensor<?x?xi8> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant dense<0> : vector<[16]x[16]xi8>
    %0 = vector.transfer_write %cst, %arg0[%c0, %c0] {in_bounds = [true, true]} : vector<[16]x[16]xi8>, tensor<?x?xi8>
    return %0 : tensor<?x?xi8>
  }
}

// -----
module {
  func.func @transfer_write_2d__fixed(%arg0: vector<16x16xi8>, %arg1: memref<?x?xi8>) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg0, %arg1[%c0, %c0] {in_bounds = [true, true]} : vector<16x16xi8>, memref<?x?xi8>
    return
  }
}

// -----
module {
  func.func @transfer_write_2d__out_of_bounds(%arg0: vector<[4]x[4]xf32>, %arg1: memref<?x?xf32>) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg0, %arg1[%c0, %c0] : vector<[4]x[4]xf32>, memref<?x?xf32>
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0)>
module {
  func.func @transfer_write_slice_unsupported_permutation(%arg0: vector<[4]x[4]xf32>, %arg1: memref<?x?xf32>, %arg2: index) {
    %c0 = arith.constant 0 : index
    %0 = vector.extract %arg0[%arg2] : vector<[4]xf32> from vector<[4]x[4]xf32>
    vector.transfer_write %0, %arg1[%arg2, %c0] {in_bounds = [true], permutation_map = #map} : vector<[4]xf32>, memref<?x?xf32>
    return
  }
}

// -----
module {
  func.func @vector_outerproduct_unsupported_axpy(%arg0: vector<[2]xf64>, %arg1: f64, %arg2: vector<[2]xf64>) -> vector<[2]xf64> {
    %0 = vector.outerproduct %arg0, %arg1, %arg2 {kind = #vector.kind<mul>} : vector<[2]xf64>, f64
    return %0 : vector<[2]xf64>
  }
}

// -----
module {
  func.func @vector_outerproduct_unsupported_kind(%arg0: vector<[2]xf64>, %arg1: vector<[2]xf64>) {
    %0 = arm_sme.get_tile : vector<[2]x[2]xf64>
    %1 = vector.outerproduct %arg0, %arg1, %0 {kind = #vector.kind<mul>} : vector<[2]xf64>, vector<[2]xf64>
    "prevent.dce"(%1) : (vector<[2]x[2]xf64>) -> ()
  }
}

// -----
module {
  func.func @vector_outerproduct_unknown_mask(%arg0: vector<[4]xf32>, %arg1: vector<[4]xf32>, %arg2: vector<[4]x[4]xi1>) {
    %0 = arm_sme.get_tile : vector<[4]x[4]xf32>
    %1 = vector.mask %arg2 { vector.outerproduct %arg0, %arg1, %0 {kind = #vector.kind<add>} : vector<[4]xf32>, vector<[4]xf32> } : vector<[4]x[4]xi1> -> vector<[4]x[4]xf32>
    "prevent.dce"(%1) : (vector<[4]x[4]xf32>) -> ()
  }
}

// -----
module {
  func.func @negative_vector_extract_to_psel_0(%arg0: index, %arg1: index, %arg2: index) -> vector<[32]xi1> {
    %0 = vector.create_mask %arg0, %arg1 : vector<[4]x[32]xi1>
    %1 = vector.extract %0[%arg2] : vector<[32]xi1> from vector<[4]x[32]xi1>
    return %1 : vector<[32]xi1>
  }
}

// -----
module {
  func.func @negative_vector_extract_to_psel_1(%arg0: index, %arg1: index, %arg2: index) -> vector<[8]xi1> {
    %0 = vector.create_mask %arg0, %arg1 : vector<4x[8]xi1>
    %1 = vector.extract %0[%arg2] : vector<[8]xi1> from vector<4x[8]xi1>
    return %1 : vector<[8]xi1>
  }
}

// -----
module {
  func.func @negative_vector_extract_to_psel_2(%arg0: vector<[4]x[8]xi1>, %arg1: index) -> vector<[8]xi1> {
    %0 = vector.extract %arg0[%arg1] : vector<[8]xi1> from vector<[4]x[8]xi1>
    return %0 : vector<[8]xi1>
  }
}

// -----
module {
  func.func @negative_vector_extract_to_psel_3(%arg0: index, %arg1: index, %arg2: index) -> i1 {
    %0 = vector.create_mask %arg0, %arg1 : vector<[4]x[8]xi1>
    %1 = vector.extract %0[2, %arg2] : i1 from vector<[4]x[8]xi1>
    return %1 : i1
  }
}

