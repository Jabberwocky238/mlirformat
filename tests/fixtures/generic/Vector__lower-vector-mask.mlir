#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>, index, vector<16xi1>) -> vector<16xf32>, sym_name = "vector_transfer_read"}> ({
  ^bb0(%arg0: tensor<?xf32>, %arg1: index, %arg2: vector<16xi1>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "vector.mask"(%arg2) ({
      %2 = "vector.transfer_read"(%arg0, %arg1, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<?xf32>, index, f32) -> vector<16xf32>
      "vector.yield"(%2) : (vector<16xf32>) -> ()
    }) : (vector<16xi1>) -> vector<16xf32>
    "func.return"(%1) : (vector<16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<16xf32>, memref<?xf32>, index, vector<16xi1>) -> (), sym_name = "vector_transfer_write_on_memref"}> ({
  ^bb0(%arg0: vector<16xf32>, %arg1: memref<?xf32>, %arg2: index, %arg3: vector<16xi1>):
    "vector.mask"(%arg3) ({
      "vector.transfer_write"(%arg0, %arg1, %arg2) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<16xf32>, memref<?xf32>, index) -> ()
      "vector.yield"() : () -> ()
    }) : (vector<16xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<16xf32>, tensor<?xf32>, index, vector<16xi1>) -> tensor<?xf32>, sym_name = "vector_transfer_write_on_tensor"}> ({
  ^bb0(%arg0: vector<16xf32>, %arg1: tensor<?xf32>, %arg2: index, %arg3: vector<16xi1>):
    %0 = "vector.mask"(%arg3) ({
      %1 = "vector.transfer_write"(%arg0, %arg1, %arg2) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<16xf32>, tensor<?xf32>, index) -> tensor<?xf32>
      "vector.yield"(%1) : (tensor<?xf32>) -> ()
    }) : (vector<16xi1>) -> tensor<?xf32>
    "func.return"(%0) : (tensor<?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<64xf32>, tensor<3xf32>) -> tensor<3xf32>, sym_name = "vector_gather"}> ({
  ^bb0(%arg0: tensor<64xf32>, %arg1: tensor<3xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 3 : index}> : () -> index
    %3 = "vector.create_mask"(%2) : (index) -> vector<4xi1>
    %4 = "vector.mask"(%3) ({
      %14 = "vector.transfer_read"(%arg1, %0, %1) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<3xf32>, index, f32) -> vector<4xf32>
      "vector.yield"(%14) : (vector<4xf32>) -> ()
    }) : (vector<4xi1>) -> vector<4xf32>
    %5 = "arith.constant"() <{value = dense<[0, 1, 2, 3]> : vector<4xindex>}> : () -> vector<4xindex>
    %6 = "arith.constant"() <{value = dense<true> : vector<4xi1>}> : () -> vector<4xi1>
    %7 = "arith.constant"() <{value = dense<0.000000e+00> : vector<4xf32>}> : () -> vector<4xf32>
    %8 = "arith.constant"() <{value = 0 : index}> : () -> index
    %9 = "vector.mask"(%3) ({
      %13 = "vector.gather"(%arg0, %8, %5, %6, %7) : (tensor<64xf32>, index, vector<4xindex>, vector<4xi1>, vector<4xf32>) -> vector<4xf32>
      "vector.yield"(%13) : (vector<4xf32>) -> ()
    }) : (vector<4xi1>) -> vector<4xf32>
    %10 = "arith.constant"() <{value = 0 : index}> : () -> index
    %11 = "vector.mask"(%3) ({
      %12 = "vector.transfer_write"(%9, %arg1, %10) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<4xf32>, tensor<3xf32>, index) -> tensor<3xf32>
      "vector.yield"(%12) : (tensor<3xf32>) -> ()
    }) : (vector<4xi1>) -> tensor<3xf32>
    "func.return"(%11) : (tensor<3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xf32>, vector<8xi1>) -> vector<8xf32>, sym_name = "empty_vector_mask_with_return"}> ({
  ^bb0(%arg0: vector<8xf32>, %arg1: vector<8xi1>):
    %0 = "vector.mask"(%arg1) ({
      "vector.yield"(%arg0) : (vector<8xf32>) -> ()
    }) : (vector<8xi1>) -> vector<8xf32>
    "func.return"(%0) : (vector<8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

