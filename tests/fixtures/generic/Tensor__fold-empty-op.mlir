"builtin.module"() ({
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg7: !transform.any_op):
      %12 = "transform.structured.match"(%arg7) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%12) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.tensor.fold_tensor_empty"() <{fold_single_use_only = false}> : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
  "func.func"() <{function_type = (index, index) -> tensor<2x3x5x4x?x7xf32>, sym_name = "empty_reshape_expansion"}> ({
  ^bb0(%arg5: index, %arg6: index):
    %10 = "tensor.empty"(%arg5) : (index) -> tensor<6x5x?xf32>
    %11 = "tensor.expand_shape"(%10, %arg6) <{reassociation = [[0, 1], [2], [3, 4, 5]], static_output_shape = array<i64: 2, 3, 5, 4, -9223372036854775808, 7>}> : (tensor<6x5x?xf32>, index) -> tensor<2x3x5x4x?x7xf32>
    "func.return"(%11) : (tensor<2x3x5x4x?x7xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> tensor<6x5x?xf32>, sym_name = "empty_reshape_collapse"}> ({
  ^bb0(%arg4: index):
    %8 = "tensor.empty"(%arg4) : (index) -> tensor<2x3x5x4x?x7xf32>
    %9 = "tensor.collapse_shape"(%8) <{reassociation = [[0, 1], [2], [3, 4, 5]]}> : (tensor<2x3x5x4x?x7xf32>) -> tensor<6x5x?xf32>
    "func.return"(%9) : (tensor<6x5x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<2x3x4x2xf32, #test.tensor_encoding<"encoding">>, sym_name = "empty_expand_encoding"}> ({
    %6 = "tensor.empty"() : () -> tensor<6x8xf32, #test.tensor_encoding<"encoding">>
    %7 = "tensor.expand_shape"(%6) <{reassociation = [[0, 1], [2, 3]], static_output_shape = array<i64: 2, 3, 4, 2>}> : (tensor<6x8xf32, #test.tensor_encoding<"encoding">>) -> tensor<2x3x4x2xf32, #test.tensor_encoding<"encoding">>
    "func.return"(%7) : (tensor<2x3x4x2xf32, #test.tensor_encoding<"encoding">>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<6x8xf32, #test.tensor_encoding<"encoding">>, sym_name = "empty_collapse_encoding"}> ({
    %4 = "tensor.empty"() : () -> tensor<2x3x4x2xf32, #test.tensor_encoding<"encoding">>
    %5 = "tensor.collapse_shape"(%4) <{reassociation = [[0, 1], [2, 3]]}> : (tensor<2x3x4x2xf32, #test.tensor_encoding<"encoding">>) -> tensor<6x8xf32, #test.tensor_encoding<"encoding">>
    "func.return"(%5) : (tensor<6x8xf32, #test.tensor_encoding<"encoding">>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> tensor<5x?x20xf32>, sym_name = "fold_empty_tensor_with_slice"}> ({
  ^bb0(%arg2: index, %arg3: index):
    %2 = "tensor.empty"(%arg2) : (index) -> tensor<?x10x40xf32>
    %3 = "tensor.extract_slice"(%2, %arg3) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>, static_offsets = array<i64: 0, 0, 0>, static_sizes = array<i64: 5, -9223372036854775808, 20>, static_strides = array<i64: 1, 1, 1>}> : (tensor<?x10x40xf32>, index) -> tensor<5x?x20xf32>
    "func.return"(%3) : (tensor<5x?x20xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> tensor<2xf32>, sym_name = "rank_reducing_empty_tensor_extract"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "tensor.empty"(%arg0) : (index) -> tensor<?x2xf32>
    %1 = "tensor.extract_slice"(%0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: 1, 2>, static_strides = array<i64: 1, 1>}> : (tensor<?x2xf32>, index) -> tensor<2xf32>
    "func.return"(%1) : (tensor<2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg2: !transform.any_op):
      %3 = "transform.structured.match"(%arg2) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%3) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.tensor.fold_tensor_empty"() <{fold_single_use_only = true}> : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
  "func.func"() <{function_type = (index, index) -> (tensor<5x?x20xf32>, tensor<5x?x20xf32>), sym_name = "double_use_of_tensor_empty"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "tensor.empty"(%arg0) : (index) -> tensor<?x10x40xf32>
    %1 = "tensor.extract_slice"(%0, %arg1) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>, static_offsets = array<i64: 0, 0, 0>, static_sizes = array<i64: 5, -9223372036854775808, 20>, static_strides = array<i64: 1, 1, 1>}> : (tensor<?x10x40xf32>, index) -> tensor<5x?x20xf32>
    %2 = "tensor.extract_slice"(%0, %arg1) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>, static_offsets = array<i64: 1, 1, 1>, static_sizes = array<i64: 5, -9223372036854775808, 20>, static_strides = array<i64: 1, 1, 1>}> : (tensor<?x10x40xf32>, index) -> tensor<5x?x20xf32>
    "func.return"(%1, %2) : (tensor<5x?x20xf32>, tensor<5x?x20xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg8: !transform.any_op):
      %6 = "transform.structured.match"(%arg8) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%6) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.tensor.fold_tensor_empty"() <{fold_single_use_only = false}> : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
  "func.func"() <{function_type = (index, index, index, index) -> tensor<5x?x?xf32>, sym_name = "concats_of_empty"}> ({
  ^bb0(%arg4: index, %arg5: index, %arg6: index, %arg7: index):
    %3 = "tensor.empty"(%arg4, %arg5) : (index, index) -> tensor<5x?x?xf32>
    %4 = "tensor.empty"(%arg6, %arg7) : (index, index) -> tensor<5x?x?xf32>
    %5 = "tensor.concat"(%3, %4) <{dim = 1 : i64}> : (tensor<5x?x?xf32>, tensor<5x?x?xf32>) -> tensor<5x?x?xf32>
    "func.return"(%5) : (tensor<5x?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index, index) -> tensor<5x?x?xf32, #test.tensor_encoding<"encoding">>, sym_name = "concats_of_empty_encoding"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index):
    %0 = "tensor.empty"(%arg0, %arg1) : (index, index) -> tensor<5x?x?xf32, #test.tensor_encoding<"encoding">>
    %1 = "tensor.empty"(%arg2, %arg3) : (index, index) -> tensor<5x?x?xf32, #test.tensor_encoding<"encoding">>
    %2 = "tensor.concat"(%0, %1) <{dim = 1 : i64}> : (tensor<5x?x?xf32, #test.tensor_encoding<"encoding">>, tensor<5x?x?xf32, #test.tensor_encoding<"encoding">>) -> tensor<5x?x?xf32, #test.tensor_encoding<"encoding">>
    "func.return"(%2) : (tensor<5x?x?xf32, #test.tensor_encoding<"encoding">>) -> ()
  }) : () -> ()
}) : () -> ()

