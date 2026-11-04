#map = affine_map<(d0, d1) -> (d1, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf64>) -> (), sym_name = "transfer_read_2d__bad_type"}> ({
  ^bb0(%arg0: memref<?x?xf64>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %2 = "vector.transfer_read"(%arg0, %0, %0, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf64>, index, index, f64) -> vector<[4]x[4]xf64>
    "prevent.dce"(%2) : (vector<[4]x[4]xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf64>) -> (), sym_name = "transfer_read_2d__non_memref_type"}> ({
  ^bb0(%arg0: tensor<?x?xf64>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %2 = "vector.transfer_read"(%arg0, %0, %0, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (tensor<?x?xf64>, index, index, f64) -> vector<[2]x[2]xf64>
    "prevent.dce"(%2) : (vector<[2]x[2]xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf64>) -> (), sym_name = "transfer_read_2d__bad_transfer_rank"}> ({
  ^bb0(%arg0: memref<?x?xf64>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %2 = "vector.transfer_read"(%arg0, %0, %0, %1) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf64>, index, index, f64) -> vector<[2]xf64>
    "prevent.dce"(%2) : (vector<[2]xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, 0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf64>) -> (), sym_name = "transfer_read_2d__non_transpose"}> ({
  ^bb0(%arg0: memref<?x?xf64>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %2 = "vector.transfer_read"(%arg0, %0, %0, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf64>, index, index, f64) -> vector<[2]x[2]xf64>
    "prevent.dce"(%2) : (vector<[2]x[2]xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf64>) -> (), sym_name = "transfer_read_2d__out_of_bounds"}> ({
  ^bb0(%arg0: memref<?x?xf64>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %2 = "vector.transfer_read"(%arg0, %0, %0, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf64>, index, index, f64) -> vector<[2]x[2]xf64>
    "prevent.dce"(%2) : (vector<[2]x[2]xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi4>) -> (), sym_name = "transfer_write_2d_zero__bad_type"}> ({
  ^bb0(%arg0: memref<?x?xi4>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = dense<0> : vector<[16]x[16]xi4>}> : () -> vector<[16]x[16]xi4>
    "vector.transfer_write"(%1, %arg0, %0, %0) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<[16]x[16]xi4>, memref<?x?xi4>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi8>) -> (), sym_name = "transfer_write_2d_zero__bad_shape"}> ({
  ^bb0(%arg0: memref<?x?xi8>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = dense<0> : vector<[8]x[8]xi8>}> : () -> vector<[8]x[8]xi8>
    "vector.transfer_write"(%1, %arg0, %0, %0) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<[8]x[8]xi8>, memref<?x?xi8>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xi8>) -> (), sym_name = "transfer_write_2d_zero__bad_rank"}> ({
  ^bb0(%arg0: memref<?x?x?xi8>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = dense<0> : vector<[16]x[16]x[16]xi8>}> : () -> vector<[16]x[16]x[16]xi8>
    "vector.transfer_write"(%1, %arg0, %0, %0, %0) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 1, 3, 0>, permutation_map = #map}> : (vector<[16]x[16]x[16]xi8>, memref<?x?x?xi8>, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xi8>) -> tensor<?x?xi8>, sym_name = "transfer_write_2d_zero__non_memref_type"}> ({
  ^bb0(%arg0: tensor<?x?xi8>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = dense<0> : vector<[16]x[16]xi8>}> : () -> vector<[16]x[16]xi8>
    %2 = "vector.transfer_write"(%1, %arg0, %0, %0) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<[16]x[16]xi8>, tensor<?x?xi8>, index, index) -> tensor<?x?xi8>
    "func.return"(%2) : (tensor<?x?xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<16x16xi8>, memref<?x?xi8>) -> (), sym_name = "transfer_write_2d__fixed"}> ({
  ^bb0(%arg0: vector<16x16xi8>, %arg1: memref<?x?xi8>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg0, %arg1, %0, %0) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<16x16xi8>, memref<?x?xi8>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]x[4]xf32>, memref<?x?xf32>) -> (), sym_name = "transfer_write_2d__out_of_bounds"}> ({
  ^bb0(%arg0: vector<[4]x[4]xf32>, %arg1: memref<?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg0, %arg1, %0, %0) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<[4]x[4]xf32>, memref<?x?xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]x[4]xf32>, memref<?x?xf32>, index) -> (), sym_name = "transfer_write_slice_unsupported_permutation"}> ({
  ^bb0(%arg0: vector<[4]x[4]xf32>, %arg1: memref<?x?xf32>, %arg2: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "vector.extract"(%arg0, %arg2) <{static_position = array<i64: -9223372036854775808>}> : (vector<[4]x[4]xf32>, index) -> vector<[4]xf32>
    "vector.transfer_write"(%1, %arg1, %arg2, %0) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<[4]xf32>, memref<?x?xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[2]xf64>, f64, vector<[2]xf64>) -> vector<[2]xf64>, sym_name = "vector_outerproduct_unsupported_axpy"}> ({
  ^bb0(%arg0: vector<[2]xf64>, %arg1: f64, %arg2: vector<[2]xf64>):
    %0 = "vector.outerproduct"(%arg0, %arg1, %arg2) <{kind = #vector.kind<mul>}> : (vector<[2]xf64>, f64, vector<[2]xf64>) -> vector<[2]xf64>
    "func.return"(%0) : (vector<[2]xf64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[2]xf64>, vector<[2]xf64>) -> (), sym_name = "vector_outerproduct_unsupported_kind"}> ({
  ^bb0(%arg0: vector<[2]xf64>, %arg1: vector<[2]xf64>):
    %0 = "arm_sme.get_tile"() : () -> vector<[2]x[2]xf64>
    %1 = "vector.outerproduct"(%arg0, %arg1, %0) <{kind = #vector.kind<mul>}> : (vector<[2]xf64>, vector<[2]xf64>, vector<[2]x[2]xf64>) -> vector<[2]x[2]xf64>
    "prevent.dce"(%1) : (vector<[2]x[2]xf64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]xf32>, vector<[4]xf32>, vector<[4]x[4]xi1>) -> (), sym_name = "vector_outerproduct_unknown_mask"}> ({
  ^bb0(%arg0: vector<[4]xf32>, %arg1: vector<[4]xf32>, %arg2: vector<[4]x[4]xi1>):
    %0 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xf32>
    %1 = "vector.mask"(%arg2) ({
      %2 = "vector.outerproduct"(%arg0, %arg1, %0) <{kind = #vector.kind<add>}> : (vector<[4]xf32>, vector<[4]xf32>, vector<[4]x[4]xf32>) -> vector<[4]x[4]xf32>
      "vector.yield"(%2) : (vector<[4]x[4]xf32>) -> ()
    }) : (vector<[4]x[4]xi1>) -> vector<[4]x[4]xf32>
    "prevent.dce"(%1) : (vector<[4]x[4]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> vector<[32]xi1>, sym_name = "negative_vector_extract_to_psel_0"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index):
    %0 = "vector.create_mask"(%arg0, %arg1) : (index, index) -> vector<[4]x[32]xi1>
    %1 = "vector.extract"(%0, %arg2) <{static_position = array<i64: -9223372036854775808>}> : (vector<[4]x[32]xi1>, index) -> vector<[32]xi1>
    "func.return"(%1) : (vector<[32]xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> vector<[8]xi1>, sym_name = "negative_vector_extract_to_psel_1"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index):
    %0 = "vector.create_mask"(%arg0, %arg1) : (index, index) -> vector<4x[8]xi1>
    %1 = "vector.extract"(%0, %arg2) <{static_position = array<i64: -9223372036854775808>}> : (vector<4x[8]xi1>, index) -> vector<[8]xi1>
    "func.return"(%1) : (vector<[8]xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]x[8]xi1>, index) -> vector<[8]xi1>, sym_name = "negative_vector_extract_to_psel_2"}> ({
  ^bb0(%arg0: vector<[4]x[8]xi1>, %arg1: index):
    %0 = "vector.extract"(%arg0, %arg1) <{static_position = array<i64: -9223372036854775808>}> : (vector<[4]x[8]xi1>, index) -> vector<[8]xi1>
    "func.return"(%0) : (vector<[8]xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> i1, sym_name = "negative_vector_extract_to_psel_3"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index):
    %0 = "vector.create_mask"(%arg0, %arg1) : (index, index) -> vector<[4]x[8]xi1>
    %1 = "vector.extract"(%0, %arg2) <{static_position = array<i64: 2, -9223372036854775808>}> : (vector<[4]x[8]xi1>, index) -> i1
    "func.return"(%1) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

