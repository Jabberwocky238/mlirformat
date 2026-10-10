#map = affine_map<(d0, d1, d2) -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32>, index) -> f32, sym_name = "transfer_read_0d"}> ({
  ^bb0(%arg0: memref<?x?x?xf32>, %arg1: index):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "vector.transfer_read"(%arg0, %arg1, %arg1, %arg1, %0) <{in_bounds = [], operandSegmentSizes = array<i32: 1, 3, 1, 0>, permutation_map = #map}> : (memref<?x?x?xf32>, index, index, index, f32) -> vector<f32>
    %2 = "vector.extract"(%1) <{static_position = array<i64>}> : (vector<f32>) -> f32
    "func.return"(%2) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32>, index, index) -> f32, sym_name = "transfer_read_1d"}> ({
  ^bb0(%arg0: memref<?x?x?xf32>, %arg1: index, %arg2: index):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "vector.transfer_read"(%arg0, %arg1, %arg1, %arg1, %0) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 3, 1, 0>, permutation_map = #map}> : (memref<?x?x?xf32>, index, index, index, f32) -> vector<5xf32>
    %3 = "vector.extract"(%2, %arg2) <{static_position = array<i64: -9223372036854775808>}> : (vector<5xf32>, index) -> f32
    "func.return"(%3) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32>, index) -> f32, sym_name = "tensor_transfer_read_0d"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32>, %arg1: index):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "vector.transfer_read"(%arg0, %arg1, %arg1, %arg1, %0) <{in_bounds = [], operandSegmentSizes = array<i32: 1, 3, 1, 0>, permutation_map = #map}> : (tensor<?x?x?xf32>, index, index, index, f32) -> vector<f32>
    %2 = "vector.extract"(%1) <{static_position = array<i64>}> : (vector<f32>) -> f32
    "func.return"(%2) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32>, index, f32) -> (), sym_name = "transfer_write_0d"}> ({
  ^bb0(%arg0: memref<?x?x?xf32>, %arg1: index, %arg2: f32):
    %0 = "vector.broadcast"(%arg2) : (f32) -> vector<f32>
    "vector.transfer_write"(%0, %arg0, %arg1, %arg1, %arg1) <{in_bounds = [], operandSegmentSizes = array<i32: 1, 1, 3, 0>, permutation_map = #map}> : (vector<f32>, memref<?x?x?xf32>, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32>, index, f32) -> (), sym_name = "transfer_write_1d"}> ({
  ^bb0(%arg0: memref<?x?x?xf32>, %arg1: index, %arg2: f32):
    %0 = "vector.broadcast"(%arg2) : (f32) -> vector<1xf32>
    "vector.transfer_write"(%0, %arg0, %arg1, %arg1, %arg1) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 3, 0>, permutation_map = #map}> : (vector<1xf32>, memref<?x?x?xf32>, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32>, index, f32) -> tensor<?x?x?xf32>, sym_name = "tensor_transfer_write_0d"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32>, %arg1: index, %arg2: f32):
    %0 = "vector.broadcast"(%arg2) : (f32) -> vector<f32>
    %1 = "vector.transfer_write"(%0, %arg0, %arg1, %arg1, %arg1) <{in_bounds = [], operandSegmentSizes = array<i32: 1, 1, 3, 0>, permutation_map = #map}> : (vector<f32>, tensor<?x?x?xf32>, index, index, index) -> tensor<?x?x?xf32>
    "func.return"(%1) : (tensor<?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?x?xf32>, index, index) -> f32, sym_name = "transfer_read_2d_extract"}> ({
  ^bb0(%arg0: memref<?x?x?x?xf32>, %arg1: index, %arg2: index):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "vector.transfer_read"(%arg0, %arg1, %arg1, %arg1, %arg1, %0) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<?x?x?x?xf32>, index, index, index, index, f32) -> vector<10x5xf32>
    %3 = "vector.extract"(%2) <{static_position = array<i64: 8, 1>}> : (vector<10x5xf32>) -> f32
    "func.return"(%3) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32>, index) -> (), sym_name = "transfer_write_arith_constant"}> ({
  ^bb0(%arg0: memref<?x?x?xf32>, %arg1: index):
    %0 = "arith.constant"() <{value = dense<5.000000e+00> : vector<1x1xf32>}> : () -> vector<1x1xf32>
    "vector.transfer_write"(%0, %arg0, %arg1, %arg1, %arg1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 3, 0>, permutation_map = #map}> : (vector<1x1xf32>, memref<?x?x?xf32>, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, index) -> (f32, f32), sym_name = "transfer_read_multi_use"}> ({
  ^bb0(%arg0: memref<?xf32>, %arg1: index):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "vector.transfer_read"(%arg0, %arg1, %0) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<?xf32>, index, f32) -> vector<16xf32>
    %2 = "vector.extract"(%1) <{static_position = array<i64: 0>}> : (vector<16xf32>) -> f32
    %3 = "vector.extract"(%1) <{static_position = array<i64: 1>}> : (vector<16xf32>) -> f32
    "func.return"(%2, %3) : (f32, f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, index) -> vector<16xf32>, sym_name = "subvector_extract"}> ({
  ^bb0(%arg0: memref<?x?xf32>, %arg1: index):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "vector.transfer_read"(%arg0, %arg1, %arg1, %0) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32) -> vector<8x16xf32>
    %2 = "vector.extract"(%1) <{static_position = array<i64: 0>}> : (vector<8x16xf32>) -> vector<16xf32>
    "func.return"(%2) : (vector<16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, index, index) -> f32, sym_name = "transfer_read_1d_extract_dynamic"}> ({
  ^bb0(%arg0: memref<?xf32>, %arg1: index, %arg2: index):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "vector.transfer_read"(%arg0, %arg1, %0) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<?xf32>, index, f32) -> vector<5xf32>
    %2 = "vector.extract"(%1, %arg2) <{static_position = array<i64: -9223372036854775808>}> : (vector<5xf32>, index) -> f32
    "func.return"(%2) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, index, index, index, index) -> f32, sym_name = "transfer_read_2d_extract_dynamic"}> ({
  ^bb0(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "vector.transfer_read"(%arg0, %arg1, %arg2, %0) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32) -> vector<10x5xf32>
    %2 = "vector.extract"(%1, %arg3, %arg4) <{static_position = array<i64: -9223372036854775808, -9223372036854775808>}> : (vector<10x5xf32>, index, index) -> f32
    "func.return"(%2) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

