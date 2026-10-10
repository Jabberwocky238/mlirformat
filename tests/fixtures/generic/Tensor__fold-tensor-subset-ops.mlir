#map = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32>, index, index, index, index, index, index) -> vector<4xf32>, sym_name = "fold_vector_transfer_read_with_rank_reduced_extract_slice"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "tensor.extract_slice"(%arg0, %arg1, %arg2, %arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 2, 2, 0>, static_offsets = array<i64: 0, -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 1, -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1, 1>}> : (tensor<?x?x?xf32>, index, index, index, index) -> tensor<?x?xf32>
    %2 = "vector.transfer_read"(%1, %arg5, %arg6, %0) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (tensor<?x?xf32>, index, index, f32) -> vector<4xf32>
    "func.return"(%2) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x8x8x8xf32>, index, index, index, index) -> vector<4xf32>, sym_name = "transfer_read_from_rank_reducing_extract_slice_failure"}> ({
  ^bb0(%arg0: tensor<1x8x8x8xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %4 = "tensor.extract_slice"(%arg0, %arg1, %arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 3, 0, 0>, static_offsets = array<i64: 0, -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 1, 4, 1, 4>, static_strides = array<i64: 2, 3, 4, 5>}> : (tensor<1x8x8x8xf32>, index, index, index) -> tensor<1x4x4xf32>
    %5 = "vector.transfer_read"(%4, %1, %arg4, %2, %3) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 3, 1, 0>, permutation_map = #map}> : (tensor<1x4x4xf32>, index, index, index, f32) -> vector<4xf32>
    "func.return"(%5) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, index, index) -> vector<5x6xf32>, sym_name = "transfer_read_of_extract_slice"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: index, %arg2: index):
    %0 = "arith.constant"() <{value = 3 : index}> : () -> index
    %1 = "arith.constant"() <{value = 4 : index}> : () -> index
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3 = "tensor.extract_slice"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 5, -9223372036854775808>, static_sizes = array<i64: 10, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>, index, index) -> tensor<10x?xf32>
    %4 = "vector.transfer_read"(%3, %0, %1, %2) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (tensor<10x?xf32>, index, index, f32) -> vector<5x6xf32>
    "func.return"(%4) : (vector<5x6xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<12x32xf32>, index, index, index) -> vector<f32>, sym_name = "fold_extract_slice_with_transfer_read_0d"}> ({
  ^bb0(%arg0: tensor<12x32xf32>, %arg1: index, %arg2: index, %arg3: index):
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %1 = "tensor.extract_slice"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 1, 1>, static_strides = array<i64: 1, 1>}> : (tensor<12x32xf32>, index, index) -> tensor<f32>
    %2 = "vector.transfer_read"(%1, %0) <{in_bounds = [], operandSegmentSizes = array<i32: 1, 0, 1, 0>, permutation_map = #map}> : (tensor<f32>, f32) -> vector<f32>
    "func.return"(%2) : (vector<f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, index, index) -> vector<6xf32>, sym_name = "transfer_read_of_extract_slice"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: index, %arg2: index):
    %0 = "arith.constant"() <{value = 3 : index}> : () -> index
    %1 = "arith.constant"() <{value = 4 : index}> : () -> index
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3 = "tensor.extract_slice"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 5, -9223372036854775808>, static_sizes = array<i64: 10, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>, index, index) -> tensor<10x?xf32>
    %4 = "vector.transfer_read"(%3, %0, %1, %2) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (tensor<10x?xf32>, index, index, f32) -> vector<6xf32>
    "func.return"(%4) : (vector<6xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32>, index, index) -> vector<5x6xf32>, sym_name = "transfer_read_of_extract_slice_rank_reducing"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32>, %arg1: index, %arg2: index):
    %0 = "arith.constant"() <{value = 3 : index}> : () -> index
    %1 = "arith.constant"() <{value = 4 : index}> : () -> index
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3 = "tensor.extract_slice"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 5, -9223372036854775808, 6>, static_sizes = array<i64: 1, -9223372036854775808, 12>, static_strides = array<i64: 1, 1, 1>}> : (tensor<?x?x?xf32>, index, index) -> tensor<?x12xf32>
    %4 = "vector.transfer_read"(%3, %0, %1, %2) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (tensor<?x12xf32>, index, index, f32) -> vector<5x6xf32>
    "func.return"(%4) : (vector<5x6xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32>, index, index) -> vector<5x6xf32>, sym_name = "transfer_read_of_extract_slice_swappy_rank_reducing"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32>, %arg1: index, %arg2: index):
    %0 = "arith.constant"() <{value = 3 : index}> : () -> index
    %1 = "arith.constant"() <{value = 4 : index}> : () -> index
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3 = "tensor.extract_slice"(%arg0, %arg1, %arg2, %arg2) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>, static_offsets = array<i64: 5, -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, 1, 12>, static_strides = array<i64: 1, 1, 1>}> : (tensor<?x?x?xf32>, index, index, index) -> tensor<?x12xf32>
    %4 = "vector.transfer_read"(%3, %0, %1, %2) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (tensor<?x12xf32>, index, index, f32) -> vector<5x6xf32>
    "func.return"(%4) : (vector<5x6xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32>, vector<4xf32>, index, index, index, index, index, index, tensor<?x?xf32>) -> tensor<?x?x?xf32>, sym_name = "fold_vector_transfer_write_with_rank_reduced_insert_slice"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32>, %arg1: vector<4xf32>, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: tensor<?x?xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "vector.transfer_write"(%arg1, %arg8, %arg6, %arg7) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<4xf32>, tensor<?x?xf32>, index, index) -> tensor<?x?xf32>
    %2 = "tensor.insert_slice"(%1, %arg0, %arg2, %arg3, %arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 1, 2, 2, 0>, static_offsets = array<i64: 0, -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 1, -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1, 1>}> : (tensor<?x?xf32>, tensor<?x?x?xf32>, index, index, index, index) -> tensor<?x?x?xf32>
    "func.return"(%2) : (tensor<?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32>, vector<4xf32>, index, index, index, index, index, index, tensor<?x?xf32>) -> tensor<?x?x?xf32>, sym_name = "fold_vector_transfer_write_with_inner_rank_reduced_insert_slice"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32>, %arg1: vector<4xf32>, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: tensor<?x?xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "vector.transfer_write"(%arg1, %arg8, %arg6, %arg7) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<4xf32>, tensor<?x?xf32>, index, index) -> tensor<?x?xf32>
    %2 = "tensor.insert_slice"(%1, %arg0, %arg2, %arg3, %arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 1, 2, 2, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, 0>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808, 1>, static_strides = array<i64: 1, 1, 1>}> : (tensor<?x?xf32>, tensor<?x?x?xf32>, index, index, index, index) -> tensor<?x?x?xf32>
    "func.return"(%2) : (tensor<?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x12xf32>, vector<5x6xf32>, index, tensor<5x6xf32>) -> tensor<?x12xf32>, sym_name = "insert_slice_of_transfer_write"}> ({
  ^bb0(%arg0: tensor<?x12xf32>, %arg1: vector<5x6xf32>, %arg2: index, %arg3: tensor<5x6xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "vector.transfer_write"(%arg1, %arg3, %0, %0) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<5x6xf32>, tensor<5x6xf32>, index, index) -> tensor<5x6xf32>
    %2 = "tensor.insert_slice"(%1, %arg0, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0>, static_offsets = array<i64: 3, -9223372036854775808>, static_sizes = array<i64: 5, 6>, static_strides = array<i64: 1, 1>}> : (tensor<5x6xf32>, tensor<?x12xf32>, index) -> tensor<?x12xf32>
    "func.return"(%2) : (tensor<?x12xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1000x1000xf32>, vector<5x6xf32>, index, tensor<100x100xf32>) -> tensor<1000x1000xf32>, sym_name = "insert_slice_of_transfer_write_overwrite_all"}> ({
  ^bb0(%arg0: tensor<1000x1000xf32>, %arg1: vector<5x6xf32>, %arg2: index, %arg3: tensor<100x100xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "vector.transfer_write"(%arg1, %arg3, %0, %0) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<5x6xf32>, tensor<100x100xf32>, index, index) -> tensor<100x100xf32>
    %2 = "tensor.insert_slice"(%1, %arg0, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0>, static_offsets = array<i64: 3, -9223372036854775808>, static_sizes = array<i64: 100, 100>, static_strides = array<i64: 1, 1>}> : (tensor<100x100xf32>, tensor<1000x1000xf32>, index) -> tensor<1000x1000xf32>
    "func.return"(%2) : (tensor<1000x1000xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x12xf32>, vector<5x6xf32>, index, tensor<5x6xf32>) -> tensor<?x?x12xf32>, sym_name = "insert_slice_of_transfer_write_swappy_rank_extending"}> ({
  ^bb0(%arg0: tensor<?x?x12xf32>, %arg1: vector<5x6xf32>, %arg2: index, %arg3: tensor<5x6xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "vector.transfer_write"(%arg1, %arg3, %0, %0) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<5x6xf32>, tensor<5x6xf32>, index, index) -> tensor<5x6xf32>
    %2 = "tensor.insert_slice"(%1, %arg0, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0>, static_offsets = array<i64: 4, 3, -9223372036854775808>, static_sizes = array<i64: 5, 1, 6>, static_strides = array<i64: 1, 1, 1>}> : (tensor<5x6xf32>, tensor<?x?x12xf32>, index) -> tensor<?x?x12xf32>
    "func.return"(%2) : (tensor<?x?x12xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x12xf32>, vector<5x6xf32>, index, tensor<5x6xf32>) -> tensor<?x?x12xf32>, sym_name = "insert_slice_of_transfer_write_rank_extending"}> ({
  ^bb0(%arg0: tensor<?x?x12xf32>, %arg1: vector<5x6xf32>, %arg2: index, %arg3: tensor<5x6xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "vector.transfer_write"(%arg1, %arg3, %0, %0) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<5x6xf32>, tensor<5x6xf32>, index, index) -> tensor<5x6xf32>
    %2 = "tensor.insert_slice"(%1, %arg0, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0>, static_offsets = array<i64: 4, 3, -9223372036854775808>, static_sizes = array<i64: 1, 5, 6>, static_strides = array<i64: 1, 1, 1>}> : (tensor<5x6xf32>, tensor<?x?x12xf32>, index) -> tensor<?x?x12xf32>
    "func.return"(%2) : (tensor<?x?x12xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>, tensor<1x1xf32>, tensor<1x14xf32>, index) -> tensor<1x14xf32>, sym_name = "insert_slice_of_insert_slice"}> ({
  ^bb0(%arg0: tensor<f32>, %arg1: tensor<1x1xf32>, %arg2: tensor<1x14xf32>, %arg3: index):
    %0 = "tensor.insert_slice"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 1, 1>, static_strides = array<i64: 1, 1>}> : (tensor<f32>, tensor<1x1xf32>) -> tensor<1x1xf32>
    %1 = "tensor.insert_slice"(%0, %arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0>, static_offsets = array<i64: 0, -9223372036854775808>, static_sizes = array<i64: 1, 1>, static_strides = array<i64: 1, 1>}> : (tensor<1x1xf32>, tensor<1x14xf32>, index) -> tensor<1x14xf32>
    "func.return"(%1) : (tensor<1x14xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>, tensor<1xf32>, tensor<1x14xf32>, index) -> tensor<1x14xf32>, sym_name = "insert_slice_of_insert_slice"}> ({
  ^bb0(%arg0: tensor<f32>, %arg1: tensor<1xf32>, %arg2: tensor<1x14xf32>, %arg3: index):
    %0 = "tensor.insert_slice"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 1>, static_strides = array<i64: 1>}> : (tensor<f32>, tensor<1xf32>) -> tensor<1xf32>
    %1 = "tensor.insert_slice"(%0, %arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0>, static_offsets = array<i64: 0, -9223372036854775808>, static_sizes = array<i64: 1, 1>, static_strides = array<i64: 1, 1>}> : (tensor<1xf32>, tensor<1x14xf32>, index) -> tensor<1x14xf32>
    "func.return"(%1) : (tensor<1x14xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4xf32>, tensor<?xf32>, tensor<?x?xf32>, index) -> tensor<?x?xf32>, sym_name = "fail_insert_slice_of_insert_slice"}> ({
  ^bb0(%arg0: tensor<4xf32>, %arg1: tensor<?xf32>, %arg2: tensor<?x?xf32>, %arg3: index):
    %0 = "tensor.insert_slice"(%arg0, %arg1, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 4>, static_strides = array<i64: 1>}> : (tensor<4xf32>, tensor<?xf32>, index) -> tensor<?xf32>
    %1 = "tensor.insert_slice"(%0, %arg2, %arg3, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808, 423>, static_sizes = array<i64: -9223372036854775808, 1>, static_strides = array<i64: 1, 1>}> : (tensor<?xf32>, tensor<?x?xf32>, index, index) -> tensor<?x?xf32>
    "func.return"(%1) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>, tensor<?xf32>, tensor<?x?xf32>, index) -> tensor<?x?xf32>, sym_name = "insert_slice_of_insert_slice_dynamic"}> ({
  ^bb0(%arg0: tensor<?xf32>, %arg1: tensor<?xf32>, %arg2: tensor<?x?xf32>, %arg3: index):
    %0 = "tensor.insert_slice"(%arg0, %arg1, %arg3, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, tensor<?xf32>, index, index) -> tensor<?xf32>
    %1 = "tensor.insert_slice"(%0, %arg2, %arg3, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808, 423>, static_sizes = array<i64: -9223372036854775808, 1>, static_strides = array<i64: 1, 1>}> : (tensor<?xf32>, tensor<?x?xf32>, index, index) -> tensor<?x?xf32>
    "func.return"(%1) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>, tensor<?xf32>, tensor<?x?xf32>, index) -> tensor<?x?xf32>, sym_name = "insert_slice_of_insert_slice_dynamic"}> ({
  ^bb0(%arg0: tensor<?xf32>, %arg1: tensor<?xf32>, %arg2: tensor<?x?xf32>, %arg3: index):
    %0 = "tensor.insert_slice"(%arg0, %arg1, %arg3, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, tensor<?xf32>, index, index) -> tensor<?xf32>
    %1 = "tensor.insert_slice"(%0, %arg2, %arg3, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808, 423>, static_sizes = array<i64: -9223372036854775808, 1>, static_strides = array<i64: 1, 1>}> : (tensor<?xf32>, tensor<?x?xf32>, index, index) -> tensor<?x?xf32>
    "func.return"(%1) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<12x34xf32>, index, index, index, index) -> tensor<12x34xf32>, sym_name = "parallel_insert_slice_of_insert_slice_dynamic"}> ({
  ^bb0(%arg0: tensor<12x34xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index):
    %0 = "scf.forall"(%arg0) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>, staticLowerBound = array<i64: 0, 0>, staticStep = array<i64: 1, 1>, staticUpperBound = array<i64: 27, 8>}> ({
    ^bb0(%arg5: index, %arg6: index, %arg7: tensor<12x34xf32>):
      %1 = "make_me_a_tensor"() : () -> tensor<?x?xf32>
      %2 = "make_me_another_tensor"() : () -> tensor<?x?xf32>
      %3 = "tensor.insert_slice"(%1, %2, %arg2, %arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 1, 2, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>, tensor<?x?xf32>, index, index, index) -> tensor<?x?xf32>
      "scf.forall.in_parallel"() ({
        "tensor.parallel_insert_slice"(%3, %arg7, %arg1, %arg2, %arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 2, 2, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>, tensor<12x34xf32>, index, index, index, index) -> ()
      }) : () -> ()
    }) : (tensor<12x34xf32>) -> tensor<12x34xf32>
    "func.return"(%0) : (tensor<12x34xf32>) -> ()
  }) : () -> ()
}) : () -> ()

