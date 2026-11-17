"builtin.module"() ({
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg31: !transform.any_op loc("<stdin>":6:10)):
      %39 = "transform.structured.match"(%arg31) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func"> loc("<stdin>":7:13)
      "transform.apply_patterns"(%39) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.tensor.fold_tensor_subset_ops_into_vector_transfers"() : () -> () loc("<stdin>":9:9)
      }) : (!transform.op<"func.func">) -> () loc("<stdin>":8:7)
      "transform.yield"() : () -> () loc("<stdin>":11:7)
    }) : () -> () loc("<stdin>":5:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":4:3)
  "func.func"() <{function_type = (tensor<?x?xf32>, index, index) -> vector<5x6xf32>, sym_name = "transfer_read_of_extract_slice"}> ({
  ^bb0(%arg28: tensor<?x?xf32> loc("<stdin>":15:8), %arg29: index loc("<stdin>":15:33), %arg30: index loc("<stdin>":15:48)):
    %34 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":16:11)
    %35 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":17:11)
    %36 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":18:11)
    %37 = "tensor.extract_slice"(%arg28, %arg29, %arg30) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 5, -9223372036854775808>, static_sizes = array<i64: 10, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>, index, index) -> tensor<10x?xf32> loc("<stdin>":19:11)
    %38 = "vector.transfer_read"(%37, %34, %35, %36) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (tensor<10x?xf32>, index, index, f32) -> vector<5x6xf32> loc("<stdin>":20:11)
    "func.return"(%38) : (vector<5x6xf32>) -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = (tensor<?x?xf32>, index, index) -> vector<6xf32>, sym_name = "transfer_read_of_extract_slice_1d"}> ({
  ^bb0(%arg25: tensor<?x?xf32> loc("<stdin>":24:8), %arg26: index loc("<stdin>":24:33), %arg27: index loc("<stdin>":24:48)):
    %29 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":25:11)
    %30 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":26:11)
    %31 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":27:11)
    %32 = "tensor.extract_slice"(%arg25, %arg26, %arg27) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 5, -9223372036854775808>, static_sizes = array<i64: 10, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>, index, index) -> tensor<10x?xf32> loc("<stdin>":28:11)
    %33 = "vector.transfer_read"(%32, %29, %30, %31) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d1)>}> : (tensor<10x?xf32>, index, index, f32) -> vector<6xf32> loc("<stdin>":29:11)
    "func.return"(%33) : (vector<6xf32>) -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":23:3)
  "func.func"() <{function_type = (tensor<?x?x?xf32>, index, index) -> vector<5x6xf32>, sym_name = "transfer_read_of_extract_slice_rank_reducing"}> ({
  ^bb0(%arg22: tensor<?x?x?xf32> loc("<stdin>":33:8), %arg23: index loc("<stdin>":33:35), %arg24: index loc("<stdin>":33:50)):
    %24 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":34:11)
    %25 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":35:11)
    %26 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":36:11)
    %27 = "tensor.extract_slice"(%arg22, %arg23, %arg24) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 5, -9223372036854775808, 6>, static_sizes = array<i64: 1, -9223372036854775808, 12>, static_strides = array<i64: 1, 1, 1>}> : (tensor<?x?x?xf32>, index, index) -> tensor<?x12xf32> loc("<stdin>":37:11)
    %28 = "vector.transfer_read"(%27, %24, %25, %26) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (tensor<?x12xf32>, index, index, f32) -> vector<5x6xf32> loc("<stdin>":38:11)
    "func.return"(%28) : (vector<5x6xf32>) -> () loc("<stdin>":39:5)
  }) : () -> () loc("<stdin>":32:3)
  "func.func"() <{function_type = (tensor<?x?x?xf32>, index, index) -> vector<5x6xf32>, sym_name = "transfer_read_of_extract_slice_non_leading_rank_reduction"}> ({
  ^bb0(%arg19: tensor<?x?x?xf32> loc("<stdin>":42:8), %arg20: index loc("<stdin>":42:35), %arg21: index loc("<stdin>":42:50)):
    %19 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":43:11)
    %20 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":44:11)
    %21 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":45:11)
    %22 = "tensor.extract_slice"(%arg19, %arg20, %arg21) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 5, -9223372036854775808, 6>, static_sizes = array<i64: -9223372036854775808, 1, 12>, static_strides = array<i64: 1, 1, 1>}> : (tensor<?x?x?xf32>, index, index) -> tensor<?x12xf32> loc("<stdin>":46:11)
    %23 = "vector.transfer_read"(%22, %19, %20, %21) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (tensor<?x12xf32>, index, index, f32) -> vector<5x6xf32> loc("<stdin>":47:11)
    "func.return"(%23) : (vector<5x6xf32>) -> () loc("<stdin>":48:5)
  }) : () -> () loc("<stdin>":41:3)
  "func.func"() <{function_type = (tensor<?x?xf32>, index, index) -> vector<5x6xf32>, sym_name = "masked_transfer_read_of_extract_slice"}> ({
  ^bb0(%arg16: tensor<?x?xf32> loc("<stdin>":51:8), %arg17: index loc("<stdin>":51:33), %arg18: index loc("<stdin>":51:48)):
    %12 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":52:11)
    %13 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":53:11)
    %14 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":54:11)
    %15 = "tensor.extract_slice"(%arg16, %arg17, %arg18) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 5, -9223372036854775808>, static_sizes = array<i64: 10, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>, index, index) -> tensor<10x?xf32> loc("<stdin>":55:11)
    %16 = "vector.create_mask"(%12, %13) : (index, index) -> vector<5x6xi1> loc("<stdin>":56:11)
    %17 = "vector.mask"(%16) ({
      %18 = "vector.transfer_read"(%15, %12, %13, %14) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (tensor<10x?xf32>, index, index, f32) -> vector<5x6xf32> loc("<stdin>":58:13)
      "vector.yield"(%18) : (vector<5x6xf32>) -> () loc("<stdin>":59:7)
    }) : (vector<5x6xi1>) -> vector<5x6xf32> loc("<stdin>":57:11)
    "func.return"(%17) : (vector<5x6xf32>) -> () loc("<stdin>":61:5)
  }) : () -> () loc("<stdin>":50:3)
  "func.func"() <{function_type = (tensor<?x12xf32>, vector<5x6xf32>, index, tensor<5x6xf32>) -> tensor<?x12xf32>, sym_name = "insert_slice_of_transfer_write"}> ({
  ^bb0(%arg12: tensor<?x12xf32> loc("<stdin>":64:8), %arg13: vector<5x6xf32> loc("<stdin>":64:34), %arg14: index loc("<stdin>":64:59), %arg15: tensor<5x6xf32> loc("<stdin>":64:74)):
    %9 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":65:10)
    %10 = "vector.transfer_write"(%arg13, %arg15, %9, %9) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (vector<5x6xf32>, tensor<5x6xf32>, index, index) -> tensor<5x6xf32> loc("<stdin>":66:11)
    %11 = "tensor.insert_slice"(%10, %arg12, %arg14) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0>, static_offsets = array<i64: 3, -9223372036854775808>, static_sizes = array<i64: 5, 6>, static_strides = array<i64: 1, 1>}> : (tensor<5x6xf32>, tensor<?x12xf32>, index) -> tensor<?x12xf32> loc("<stdin>":67:11)
    "func.return"(%11) : (tensor<?x12xf32>) -> () loc("<stdin>":68:5)
  }) : () -> () loc("<stdin>":63:3)
  "func.func"() <{function_type = (tensor<1x1x12xf32>, vector<1x6xf32>, index, tensor<1x6xf32>) -> tensor<1x1x12xf32>, sym_name = "unit_insert_slice_of_unit_transfer_write"}> ({
  ^bb0(%arg8: tensor<1x1x12xf32> loc("<stdin>":71:8), %arg9: vector<1x6xf32> loc("<stdin>":71:35), %arg10: index loc("<stdin>":71:59), %arg11: tensor<1x6xf32> loc("<stdin>":71:74)):
    %6 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":72:10)
    %7 = "vector.transfer_write"(%arg9, %arg11, %6, %6) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (vector<1x6xf32>, tensor<1x6xf32>, index, index) -> tensor<1x6xf32> loc("<stdin>":73:10)
    %8 = "tensor.insert_slice"(%7, %arg8, %arg10) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0>, static_offsets = array<i64: 0, 0, -9223372036854775808>, static_sizes = array<i64: 1, 1, 6>, static_strides = array<i64: 1, 1, 1>}> : (tensor<1x6xf32>, tensor<1x1x12xf32>, index) -> tensor<1x1x12xf32> loc("<stdin>":74:10)
    "func.return"(%8) : (tensor<1x1x12xf32>) -> () loc("<stdin>":75:5)
  }) : () -> () loc("<stdin>":70:3)
  "func.func"() <{function_type = (tensor<?x?x12xf32>, vector<5x6xf32>, index, tensor<5x6xf32>) -> tensor<?x?x12xf32>, sym_name = "insert_slice_of_transfer_write_non_leading_rank_reduction"}> ({
  ^bb0(%arg4: tensor<?x?x12xf32> loc("<stdin>":78:8), %arg5: vector<5x6xf32> loc("<stdin>":78:35), %arg6: index loc("<stdin>":78:59), %arg7: tensor<5x6xf32> loc("<stdin>":78:73)):
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":79:10)
    %4 = "vector.transfer_write"(%arg5, %arg7, %3, %3) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (vector<5x6xf32>, tensor<5x6xf32>, index, index) -> tensor<5x6xf32> loc("<stdin>":80:10)
    %5 = "tensor.insert_slice"(%4, %arg4, %arg6) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0>, static_offsets = array<i64: 4, 3, -9223372036854775808>, static_sizes = array<i64: 5, 1, 6>, static_strides = array<i64: 1, 1, 1>}> : (tensor<5x6xf32>, tensor<?x?x12xf32>, index) -> tensor<?x?x12xf32> loc("<stdin>":81:10)
    "func.return"(%5) : (tensor<?x?x12xf32>) -> () loc("<stdin>":82:5)
  }) : () -> () loc("<stdin>":77:3)
  "func.func"() <{function_type = (tensor<?x?x12xf32>, vector<5x6xf32>, index, tensor<5x6xf32>) -> tensor<?x?x12xf32>, sym_name = "insert_slice_of_transfer_write_rank_extending"}> ({
  ^bb0(%arg0: tensor<?x?x12xf32> loc("<stdin>":85:8), %arg1: vector<5x6xf32> loc("<stdin>":85:35), %arg2: index loc("<stdin>":85:59), %arg3: tensor<5x6xf32> loc("<stdin>":85:73)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":86:10)
    %1 = "vector.transfer_write"(%arg1, %arg3, %0, %0) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (vector<5x6xf32>, tensor<5x6xf32>, index, index) -> tensor<5x6xf32> loc("<stdin>":87:10)
    %2 = "tensor.insert_slice"(%1, %arg0, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0>, static_offsets = array<i64: 4, 3, -9223372036854775808>, static_sizes = array<i64: 1, 5, 6>, static_strides = array<i64: 1, 1, 1>}> : (tensor<5x6xf32>, tensor<?x?x12xf32>, index) -> tensor<?x?x12xf32> loc("<stdin>":88:10)
    "func.return"(%2) : (tensor<?x?x12xf32>) -> () loc("<stdin>":89:5)
  }) : () -> () loc("<stdin>":84:3)
}) : () -> () loc("<stdin>":3:1)
