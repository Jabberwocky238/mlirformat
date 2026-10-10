#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg31: !transform.any_op):
      %39 = "transform.structured.match"(%arg31) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%39) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.tensor.fold_tensor_subset_ops_into_vector_transfers"() : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf32>, index, index) -> vector<5x6xf32>, sym_name = "transfer_read_of_extract_slice"}> ({
  ^bb0(%arg28: tensor<?x?xf32>, %arg29: index, %arg30: index):
    %34 = "arith.constant"() <{value = 3 : index}> : () -> index
    %35 = "arith.constant"() <{value = 4 : index}> : () -> index
    %36 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %37 = "tensor.extract_slice"(%arg28, %arg29, %arg30) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 5, -9223372036854775808>, static_sizes = array<i64: 10, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>, index, index) -> tensor<10x?xf32>
    %38 = "vector.transfer_read"(%37, %34, %35, %36) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (tensor<10x?xf32>, index, index, f32) -> vector<5x6xf32>
    "func.return"(%38) : (vector<5x6xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf32>, index, index) -> vector<6xf32>, sym_name = "transfer_read_of_extract_slice_1d"}> ({
  ^bb0(%arg25: tensor<?x?xf32>, %arg26: index, %arg27: index):
    %29 = "arith.constant"() <{value = 3 : index}> : () -> index
    %30 = "arith.constant"() <{value = 4 : index}> : () -> index
    %31 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %32 = "tensor.extract_slice"(%arg25, %arg26, %arg27) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 5, -9223372036854775808>, static_sizes = array<i64: 10, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>, index, index) -> tensor<10x?xf32>
    %33 = "vector.transfer_read"(%32, %29, %30, %31) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map1}> : (tensor<10x?xf32>, index, index, f32) -> vector<6xf32>
    "func.return"(%33) : (vector<6xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?xf32>, index, index) -> vector<5x6xf32>, sym_name = "transfer_read_of_extract_slice_rank_reducing"}> ({
  ^bb0(%arg22: tensor<?x?x?xf32>, %arg23: index, %arg24: index):
    %24 = "arith.constant"() <{value = 3 : index}> : () -> index
    %25 = "arith.constant"() <{value = 4 : index}> : () -> index
    %26 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %27 = "tensor.extract_slice"(%arg22, %arg23, %arg24) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 5, -9223372036854775808, 6>, static_sizes = array<i64: 1, -9223372036854775808, 12>, static_strides = array<i64: 1, 1, 1>}> : (tensor<?x?x?xf32>, index, index) -> tensor<?x12xf32>
    %28 = "vector.transfer_read"(%27, %24, %25, %26) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (tensor<?x12xf32>, index, index, f32) -> vector<5x6xf32>
    "func.return"(%28) : (vector<5x6xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?xf32>, index, index) -> vector<5x6xf32>, sym_name = "transfer_read_of_extract_slice_non_leading_rank_reduction"}> ({
  ^bb0(%arg19: tensor<?x?x?xf32>, %arg20: index, %arg21: index):
    %19 = "arith.constant"() <{value = 3 : index}> : () -> index
    %20 = "arith.constant"() <{value = 4 : index}> : () -> index
    %21 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %22 = "tensor.extract_slice"(%arg19, %arg20, %arg21) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 5, -9223372036854775808, 6>, static_sizes = array<i64: -9223372036854775808, 1, 12>, static_strides = array<i64: 1, 1, 1>}> : (tensor<?x?x?xf32>, index, index) -> tensor<?x12xf32>
    %23 = "vector.transfer_read"(%22, %19, %20, %21) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (tensor<?x12xf32>, index, index, f32) -> vector<5x6xf32>
    "func.return"(%23) : (vector<5x6xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf32>, index, index) -> vector<5x6xf32>, sym_name = "masked_transfer_read_of_extract_slice"}> ({
  ^bb0(%arg16: tensor<?x?xf32>, %arg17: index, %arg18: index):
    %12 = "arith.constant"() <{value = 3 : index}> : () -> index
    %13 = "arith.constant"() <{value = 4 : index}> : () -> index
    %14 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %15 = "tensor.extract_slice"(%arg16, %arg17, %arg18) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 5, -9223372036854775808>, static_sizes = array<i64: 10, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>, index, index) -> tensor<10x?xf32>
    %16 = "vector.create_mask"(%12, %13) : (index, index) -> vector<5x6xi1>
    %17 = "vector.mask"(%16) ({
      %18 = "vector.transfer_read"(%15, %12, %13, %14) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (tensor<10x?xf32>, index, index, f32) -> vector<5x6xf32>
      "vector.yield"(%18) : (vector<5x6xf32>) -> ()
    }) : (vector<5x6xi1>) -> vector<5x6xf32>
    "func.return"(%17) : (vector<5x6xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x12xf32>, vector<5x6xf32>, index, tensor<5x6xf32>) -> tensor<?x12xf32>, sym_name = "insert_slice_of_transfer_write"}> ({
  ^bb0(%arg12: tensor<?x12xf32>, %arg13: vector<5x6xf32>, %arg14: index, %arg15: tensor<5x6xf32>):
    %9 = "arith.constant"() <{value = 0 : index}> : () -> index
    %10 = "vector.transfer_write"(%arg13, %arg15, %9, %9) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<5x6xf32>, tensor<5x6xf32>, index, index) -> tensor<5x6xf32>
    %11 = "tensor.insert_slice"(%10, %arg12, %arg14) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0>, static_offsets = array<i64: 3, -9223372036854775808>, static_sizes = array<i64: 5, 6>, static_strides = array<i64: 1, 1>}> : (tensor<5x6xf32>, tensor<?x12xf32>, index) -> tensor<?x12xf32>
    "func.return"(%11) : (tensor<?x12xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x1x12xf32>, vector<1x6xf32>, index, tensor<1x6xf32>) -> tensor<1x1x12xf32>, sym_name = "unit_insert_slice_of_unit_transfer_write"}> ({
  ^bb0(%arg8: tensor<1x1x12xf32>, %arg9: vector<1x6xf32>, %arg10: index, %arg11: tensor<1x6xf32>):
    %6 = "arith.constant"() <{value = 0 : index}> : () -> index
    %7 = "vector.transfer_write"(%arg9, %arg11, %6, %6) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<1x6xf32>, tensor<1x6xf32>, index, index) -> tensor<1x6xf32>
    %8 = "tensor.insert_slice"(%7, %arg8, %arg10) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0>, static_offsets = array<i64: 0, 0, -9223372036854775808>, static_sizes = array<i64: 1, 1, 6>, static_strides = array<i64: 1, 1, 1>}> : (tensor<1x6xf32>, tensor<1x1x12xf32>, index) -> tensor<1x1x12xf32>
    "func.return"(%8) : (tensor<1x1x12xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x12xf32>, vector<5x6xf32>, index, tensor<5x6xf32>) -> tensor<?x?x12xf32>, sym_name = "insert_slice_of_transfer_write_non_leading_rank_reduction"}> ({
  ^bb0(%arg4: tensor<?x?x12xf32>, %arg5: vector<5x6xf32>, %arg6: index, %arg7: tensor<5x6xf32>):
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "vector.transfer_write"(%arg5, %arg7, %3, %3) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<5x6xf32>, tensor<5x6xf32>, index, index) -> tensor<5x6xf32>
    %5 = "tensor.insert_slice"(%4, %arg4, %arg6) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0>, static_offsets = array<i64: 4, 3, -9223372036854775808>, static_sizes = array<i64: 5, 1, 6>, static_strides = array<i64: 1, 1, 1>}> : (tensor<5x6xf32>, tensor<?x?x12xf32>, index) -> tensor<?x?x12xf32>
    "func.return"(%5) : (tensor<?x?x12xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x12xf32>, vector<5x6xf32>, index, tensor<5x6xf32>) -> tensor<?x?x12xf32>, sym_name = "insert_slice_of_transfer_write_rank_extending"}> ({
  ^bb0(%arg0: tensor<?x?x12xf32>, %arg1: vector<5x6xf32>, %arg2: index, %arg3: tensor<5x6xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "vector.transfer_write"(%arg1, %arg3, %0, %0) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<5x6xf32>, tensor<5x6xf32>, index, index) -> tensor<5x6xf32>
    %2 = "tensor.insert_slice"(%1, %arg0, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0>, static_offsets = array<i64: 4, 3, -9223372036854775808>, static_sizes = array<i64: 1, 5, 6>, static_strides = array<i64: 1, 1, 1>}> : (tensor<5x6xf32>, tensor<?x?x12xf32>, index) -> tensor<?x?x12xf32>
    "func.return"(%2) : (tensor<?x?x12xf32>) -> ()
  }) : () -> ()
}) : () -> ()

