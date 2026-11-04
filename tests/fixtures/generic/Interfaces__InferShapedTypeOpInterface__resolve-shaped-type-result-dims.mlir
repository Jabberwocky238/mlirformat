"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x3x?xf32>, tensor<?x5xf32>) -> (index, index, index, index, index), sym_name = "result_shape"}> ({
  ^bb0(%arg0: tensor<2x3x?xf32>, %arg1: tensor<?x5xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3:2 = "test.op_with_result_shape_interface"(%arg0, %arg1) : (tensor<2x3x?xf32>, tensor<?x5xf32>) -> (tensor<?x5xf32>, tensor<2x3x?xf32>)
    %4 = "tensor.dim"(%3#0, %0) : (tensor<?x5xf32>, index) -> index
    %5 = "tensor.dim"(%3#0, %1) : (tensor<?x5xf32>, index) -> index
    %6 = "tensor.dim"(%3#1, %0) : (tensor<2x3x?xf32>, index) -> index
    %7 = "tensor.dim"(%3#1, %1) : (tensor<2x3x?xf32>, index) -> index
    %8 = "tensor.dim"(%3#1, %2) : (tensor<2x3x?xf32>, index) -> index
    "func.return"(%4, %5, %6, %7, %8) : (index, index, index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x3x?xf32>, tensor<?x5xf32>) -> (index, index, index, index, index), sym_name = "reify_shaped_type_using_reify_result_shapes"}> ({
  ^bb0(%arg0: tensor<2x3x?xf32>, %arg1: tensor<?x5xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3:2 = "test.reify_shaped_type_using_reify_result_shapes"(%arg0, %arg1) : (tensor<2x3x?xf32>, tensor<?x5xf32>) -> (tensor<?x5xf32>, tensor<2x3x?xf32>)
    %4 = "tensor.dim"(%3#0, %0) : (tensor<?x5xf32>, index) -> index
    %5 = "tensor.dim"(%3#0, %1) : (tensor<?x5xf32>, index) -> index
    %6 = "tensor.dim"(%3#1, %0) : (tensor<2x3x?xf32>, index) -> index
    %7 = "tensor.dim"(%3#1, %1) : (tensor<2x3x?xf32>, index) -> index
    %8 = "tensor.dim"(%3#1, %2) : (tensor<2x3x?xf32>, index) -> index
    "func.return"(%4, %5, %6, %7, %8) : (index, index, index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x3x?xf32>, tensor<?x5xf32>) -> (index, index, index, index, index), sym_name = "reify_shaped_type_using_reify_shape_of_result"}> ({
  ^bb0(%arg0: tensor<2x3x?xf32>, %arg1: tensor<?x5xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3:2 = "test.reify_shaped_type_using_reify_result_shapes"(%arg0, %arg1) : (tensor<2x3x?xf32>, tensor<?x5xf32>) -> (tensor<?x5xf32>, tensor<2x3x?xf32>)
    %4 = "tensor.dim"(%3#0, %0) : (tensor<?x5xf32>, index) -> index
    %5 = "tensor.dim"(%3#0, %1) : (tensor<?x5xf32>, index) -> index
    %6 = "tensor.dim"(%3#1, %0) : (tensor<2x3x?xf32>, index) -> index
    %7 = "tensor.dim"(%3#1, %1) : (tensor<2x3x?xf32>, index) -> index
    %8 = "tensor.dim"(%3#1, %2) : (tensor<2x3x?xf32>, index) -> index
    "func.return"(%4, %5, %6, %7, %8) : (index, index, index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x3x?xf32>, tensor<?x5xf32>) -> (index, index, index, index, index), sym_name = "reify_shaped_type_using_reify_dim_of_result"}> ({
  ^bb0(%arg0: tensor<2x3x?xf32>, %arg1: tensor<?x5xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3:2 = "test.reify_shaped_type_using_reify_result_shapes"(%arg0, %arg1) : (tensor<2x3x?xf32>, tensor<?x5xf32>) -> (tensor<?x5xf32>, tensor<2x3x?xf32>)
    %4 = "tensor.dim"(%3#0, %0) : (tensor<?x5xf32>, index) -> index
    %5 = "tensor.dim"(%3#0, %1) : (tensor<?x5xf32>, index) -> index
    %6 = "tensor.dim"(%3#1, %0) : (tensor<2x3x?xf32>, index) -> index
    %7 = "tensor.dim"(%3#1, %1) : (tensor<2x3x?xf32>, index) -> index
    %8 = "tensor.dim"(%3#1, %2) : (tensor<2x3x?xf32>, index) -> index
    "func.return"(%4, %5, %6, %7, %8) : (index, index, index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>) -> (index, index), sym_name = "test_unreifiable_result_shapes"}> ({
  ^bb0(%arg0: tensor<?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "test.unreifiable_result_shapes"(%arg0) : (tensor<?x?xf32>) -> tensor<?x?xf32>
    %3 = "tensor.dim"(%2, %0) : (tensor<?x?xf32>, index) -> index
    %4 = "tensor.dim"(%2, %1) : (tensor<?x?xf32>, index) -> index
    "func.return"(%3, %4) : (index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>) -> (index, index), sym_name = "test_unreifiable_result_shape"}> ({
  ^bb0(%arg0: tensor<?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "test.unreifiable_result_shape"(%arg0) : (tensor<?x?xf32>) -> tensor<?x?xf32>
    %3 = "tensor.dim"(%2, %0) : (tensor<?x?xf32>, index) -> index
    %4 = "tensor.dim"(%2, %1) : (tensor<?x?xf32>, index) -> index
    "func.return"(%3, %4) : (index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>) -> (index, index), sym_name = "test_unreifiable_dim_of_result_shape"}> ({
  ^bb0(%arg0: tensor<?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "test.unreifiable_dim_of_result_shape"(%arg0) : (tensor<?x?xf32>) -> tensor<?x?xf32>
    %3 = "tensor.dim"(%2, %0) : (tensor<?x?xf32>, index) -> index
    %4 = "tensor.dim"(%2, %1) : (tensor<?x?xf32>, index) -> index
    "func.return"(%3, %4) : (index, index) -> ()
  }) : () -> ()
}) : () -> ()

