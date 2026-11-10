#map = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x3xf32>, index, index, f32) -> vector<1xf32>, sym_name = "canonicalize_transfer_read_size1_map"}> ({
  ^bb0(%arg0: memref<4x3xf32>, %arg1: index, %arg2: index, %arg3: f32):
    %0 = "vector.transfer_read"(%arg0, %arg1, %arg2, %arg3) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x3xf32>, index, index, f32) -> vector<1xf32>
    "func.return"(%0) : (vector<1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1xf32>, memref<4x3xf32>, index, index) -> (), sym_name = "canonicalize_transfer_write_size1_map"}> ({
  ^bb0(%arg0: vector<1xf32>, %arg1: memref<4x3xf32>, %arg2: index, %arg3: index):
    "vector.transfer_write"(%arg0, %arg1, %arg2, %arg3) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<1xf32>, memref<4x3xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x3x2xf32>, index, index, index, f32) -> vector<1xf32>, sym_name = "canonicalize_transfer_read_size1_rank3"}> ({
  ^bb0(%arg0: memref<4x3x2xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: f32):
    %0 = "vector.transfer_read"(%arg0, %arg1, %arg2, %arg3, %arg4) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 3, 1, 0>, permutation_map = #map}> : (memref<4x3x2xf32>, index, index, index, f32) -> vector<1xf32>
    "func.return"(%0) : (vector<1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x3x2xf32>, index, index, index, f32) -> vector<1xf32>, sym_name = "canonicalize_transfer_read_size1_middle_dim"}> ({
  ^bb0(%arg0: memref<4x3x2xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: f32):
    %0 = "vector.transfer_read"(%arg0, %arg1, %arg2, %arg3, %arg4) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 3, 1, 0>, permutation_map = #map}> : (memref<4x3x2xf32>, index, index, index, f32) -> vector<1xf32>
    "func.return"(%0) : (vector<1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x3xf32>, index, index, f32) -> vector<1xf32>, sym_name = "negative_size1_already_minor_identity"}> ({
  ^bb0(%arg0: memref<4x3xf32>, %arg1: index, %arg2: index, %arg3: f32):
    %0 = "vector.transfer_read"(%arg0, %arg1, %arg2, %arg3) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x3xf32>, index, index, f32) -> vector<1xf32>
    "func.return"(%0) : (vector<1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x3xf32>, index, index, f32) -> vector<4xf32>, sym_name = "negative_size1_size_not_one"}> ({
  ^bb0(%arg0: memref<4x3xf32>, %arg1: index, %arg2: index, %arg3: f32):
    %0 = "vector.transfer_read"(%arg0, %arg1, %arg2, %arg3) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x3xf32>, index, index, f32) -> vector<4xf32>
    "func.return"(%0) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4xf32>, index, f32) -> vector<f32>, sym_name = "negative_size1_rank0"}> ({
  ^bb0(%arg0: memref<4xf32>, %arg1: index, %arg2: f32):
    %0 = "vector.transfer_read"(%arg0, %arg1, %arg2) <{in_bounds = [], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<4xf32>, index, f32) -> vector<f32>
    "func.return"(%0) : (vector<f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x3xf32>, index, index, f32) -> vector<2x4xf32>, sym_name = "negative_size1_rank2"}> ({
  ^bb0(%arg0: memref<4x3xf32>, %arg1: index, %arg2: index, %arg3: f32):
    %0 = "vector.transfer_read"(%arg0, %arg1, %arg2, %arg3) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x3xf32>, index, index, f32) -> vector<2x4xf32>
    "func.return"(%0) : (vector<2x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x3xf32>, index, index, f32) -> vector<[1]xf32>, sym_name = "negative_size1_scalable"}> ({
  ^bb0(%arg0: memref<4x3xf32>, %arg1: index, %arg2: index, %arg3: f32):
    %0 = "vector.transfer_read"(%arg0, %arg1, %arg2, %arg3) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x3xf32>, index, index, f32) -> vector<[1]xf32>
    "func.return"(%0) : (vector<[1]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

