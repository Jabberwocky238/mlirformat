"builtin.module"() ({
  "func.func"() <{function_type = (index) -> index, sym_name = "ins_1_index_outs_none_results_1_index"}> ({
  ^bb0(%arg0: index):
    %0 = "test.destination_style_op"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (index) -> index
    "func.return"(%0) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x2xf32>) -> index, sym_name = "ins_1_tensor_outs_none_results_1_index"}> ({
  ^bb0(%arg0: tensor<2x2xf32>):
    %0 = "test.destination_style_op"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (tensor<2x2xf32>) -> index
    "func.return"(%0) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, tensor<2x2xf32>) -> tensor<2x2xf32>, sym_name = "ins_1_index_outs_1_tensor_results_1_tensor"}> ({
  ^bb0(%arg0: index, %arg1: tensor<2x2xf32>):
    %0 = "test.destination_style_op"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0>}> : (index, tensor<2x2xf32>) -> tensor<2x2xf32>
    "func.return"(%0) : (tensor<2x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x2xf32>, tensor<2x2xf32>) -> tensor<2x2xf32>, sym_name = "ins_1_tensor_outs_1_tensor_results_1_tensor"}> ({
  ^bb0(%arg0: tensor<2x2xf32>, %arg1: tensor<2x2xf32>):
    %0 = "test.destination_style_op"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0>}> : (tensor<2x2xf32>, tensor<2x2xf32>) -> tensor<2x2xf32>
    "func.return"(%0) : (tensor<2x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

