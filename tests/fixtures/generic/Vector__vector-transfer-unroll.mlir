#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x4xf32>) -> vector<4x4xf32>, sym_name = "transfer_read_unroll"}> ({
  ^bb0(%arg0: memref<4x4xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "vector.transfer_read"(%arg0, %0, %0, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x4xf32>, index, index, f32) -> vector<4x4xf32>
    "func.return"(%2) : (vector<4x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x4xf32>, vector<4x4xf32>) -> (), sym_name = "transfer_write_unroll"}> ({
  ^bb0(%arg0: memref<4x4xf32>, %arg1: vector<4x4xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg1, %arg0, %0, %0) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<4x4xf32>, memref<4x4xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<6x34x62xi8>) -> (), sym_name = "negative_transfer_write"}> ({
  ^bb0(%arg0: vector<6x34x62xi8>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<6x34x62xi8>
    "vector.transfer_write"(%arg0, %1, %0, %0, %0) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 1, 3, 0>, permutation_map = #map}> : (vector<6x34x62xi8>, memref<6x34x62xi8>, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x4xf32>) -> (), sym_name = "transfer_readwrite_unroll"}> ({
  ^bb0(%arg0: memref<4x4xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "vector.transfer_read"(%arg0, %0, %0, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x4xf32>, index, index, f32) -> vector<4x4xf32>
    "vector.transfer_write"(%2, %arg0, %0, %0) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<4x4xf32>, memref<4x4xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x4xf32>) -> vector<4x4xf32>, sym_name = "transfer_read_unroll_tensor"}> ({
  ^bb0(%arg0: tensor<4x4xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "vector.transfer_read"(%arg0, %0, %0, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (tensor<4x4xf32>, index, index, f32) -> vector<4x4xf32>
    "func.return"(%2) : (vector<4x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x4xf32>, vector<4x4xf32>) -> tensor<4x4xf32>, sym_name = "transfer_write_unroll_tensor"}> ({
  ^bb0(%arg0: tensor<4x4xf32>, %arg1: vector<4x4xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "vector.transfer_write"(%arg1, %arg0, %0, %0) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<4x4xf32>, tensor<4x4xf32>, index, index) -> tensor<4x4xf32>
    "func.return"(%1) : (tensor<4x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x4xf32>, tensor<4x4xf32>) -> tensor<4x4xf32>, sym_name = "transfer_readwrite_unroll_tensor"}> ({
  ^bb0(%arg0: tensor<4x4xf32>, %arg1: tensor<4x4xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "vector.transfer_read"(%arg0, %0, %0, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (tensor<4x4xf32>, index, index, f32) -> vector<4x4xf32>
    %3 = "vector.transfer_write"(%2, %arg1, %0, %0) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<4x4xf32>, tensor<4x4xf32>, index, index) -> tensor<4x4xf32>
    "func.return"(%3) : (tensor<4x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<6x4xf32>) -> vector<4x6xf32>, sym_name = "transfer_read_unroll_permutation"}> ({
  ^bb0(%arg0: memref<6x4xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "vector.transfer_read"(%arg0, %0, %0, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<6x4xf32>, index, index, f32) -> vector<4x6xf32>
    "func.return"(%2) : (vector<4x6xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<6x4xf32>) -> vector<6x4xf32>, sym_name = "transfer_read_unroll_broadcast"}> ({
  ^bb0(%arg0: memref<6x4xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "vector.transfer_read"(%arg0, %0, %0, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<6x4xf32>, index, index, f32) -> vector<6x4xf32>
    "func.return"(%2) : (vector<6x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (0, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<6x4xf32>) -> vector<4x6xf32>, sym_name = "transfer_read_unroll_broadcast_permuation"}> ({
  ^bb0(%arg0: memref<6x4xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "vector.transfer_read"(%arg0, %0, %0, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<6x4xf32>, index, index, f32) -> vector<4x6xf32>
    "func.return"(%2) : (vector<4x6xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d2, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32>) -> vector<6x4xf32>, sym_name = "transfer_read_unroll_different_rank"}> ({
  ^bb0(%arg0: memref<?x?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "vector.transfer_read"(%arg0, %0, %0, %0, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 3, 1, 0>, permutation_map = #map}> : (memref<?x?x?xf32>, index, index, index, f32) -> vector<6x4xf32>
    "func.return"(%2) : (vector<6x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32>, vector<6x4xindex>, vector<6x4xi1>, vector<6x4xf32>) -> vector<6x4xf32>, sym_name = "vector_gather_unroll"}> ({
  ^bb0(%arg0: memref<?x?x?xf32>, %arg1: vector<6x4xindex>, %arg2: vector<6x4xi1>, %arg3: vector<6x4xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "vector.gather"(%arg0, %0, %0, %0, %arg1, %arg2, %arg3) : (memref<?x?x?xf32>, index, index, index, vector<6x4xindex>, vector<6x4xi1>, vector<6x4xf32>) -> vector<6x4xf32>
    "func.return"(%1) : (vector<6x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

