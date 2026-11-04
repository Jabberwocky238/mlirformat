"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*xf32>) -> index, sym_name = "test_tensor_dim_unranked"}> ({
  ^bb0(%arg0: tensor<*xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "tensor.dim"(%arg0, %0) : (tensor<*xf32>, index) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf64, #sparse>, index) -> index, sym_name = "test_no_constant_dim"}> ({
  ^bb0(%arg0: tensor<?xf64, #sparse>, %arg1: index):
    %0 = "tensor.dim"(%arg0, %arg1) : (tensor<?xf64, #sparse>, index) -> index
    "func.return"(%0) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>) -> index, sym_name = "test_tensor_dim_no_encoding"}> ({
  ^bb0(%arg0: tensor<?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "tensor.dim"(%arg0, %0) : (tensor<?xf32>, index) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*xf32>, tensor<1xi32>) -> tensor<?xf32>, sym_name = "test_tensor_reshape_unranked"}> ({
  ^bb0(%arg0: tensor<*xf32>, %arg1: tensor<1xi32>):
    %0 = "tensor.reshape"(%arg0, %arg1) : (tensor<*xf32>, tensor<1xi32>) -> tensor<?xf32>
    "func.return"(%0) : (tensor<?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<1xi32>) -> tensor<?xf32>, sym_name = "test_tensor_reshape_no_encoding"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: tensor<1xi32>):
    %0 = "tensor.reshape"(%arg0, %arg1) : (tensor<?x?xf32>, tensor<1xi32>) -> tensor<?xf32>
    "func.return"(%0) : (tensor<?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

