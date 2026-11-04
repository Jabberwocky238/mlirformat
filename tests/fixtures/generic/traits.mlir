"builtin.module"() ({
  "func.func"() <{function_type = (tensor<i32>, tensor<i32>) -> tensor<i32>, sym_name = "broadcast_scalar_scalar_scalar"}> ({
  ^bb0(%arg0: tensor<i32>, %arg1: tensor<i32>):
    %0 = "test.broadcastable"(%arg0, %arg1) : (tensor<i32>, tensor<i32>) -> tensor<i32>
    "func.return"(%0) : (tensor<i32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4xi32>, tensor<i32>) -> tensor<4xi32>, sym_name = "broadcast_tensor_scalar_tensor"}> ({
  ^bb0(%arg0: tensor<4xi32>, %arg1: tensor<i32>):
    %0 = "test.broadcastable"(%arg0, %arg1) : (tensor<4xi32>, tensor<i32>) -> tensor<4xi32>
    "func.return"(%0) : (tensor<4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x3x2xi32>, tensor<3x1xi32>) -> tensor<4x3x2xi32>, sym_name = "broadcast_tensor_tensor_tensor"}> ({
  ^bb0(%arg0: tensor<4x3x2xi32>, %arg1: tensor<3x1xi32>):
    %0 = "test.broadcastable"(%arg0, %arg1) : (tensor<4x3x2xi32>, tensor<3x1xi32>) -> tensor<4x3x2xi32>
    "func.return"(%0) : (tensor<4x3x2xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x1x6x1xi32>, tensor<7x1x5xi32>) -> tensor<8x7x6x5xi32>, sym_name = "broadcast_tensor_tensor_tensor"}> ({
  ^bb0(%arg0: tensor<8x1x6x1xi32>, %arg1: tensor<7x1x5xi32>):
    %0 = "test.broadcastable"(%arg0, %arg1) : (tensor<8x1x6x1xi32>, tensor<7x1x5xi32>) -> tensor<8x7x6x5xi32>
    "func.return"(%0) : (tensor<8x7x6x5xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x1x6x1xi32>, tensor<7x1x5xi32>) -> tensor<?x7x6x5xi32>, sym_name = "broadcast_tensor_tensor_tensor"}> ({
  ^bb0(%arg0: tensor<?x1x6x1xi32>, %arg1: tensor<7x1x5xi32>):
    %0 = "test.broadcastable"(%arg0, %arg1) : (tensor<?x1x6x1xi32>, tensor<7x1x5xi32>) -> tensor<?x7x6x5xi32>
    "func.return"(%0) : (tensor<?x7x6x5xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x1x?x1xi32>, tensor<7x1x5xi32>) -> tensor<8x7x?x5xi32>, sym_name = "broadcast_tensor_tensor_tensor"}> ({
  ^bb0(%arg0: tensor<8x1x?x1xi32>, %arg1: tensor<7x1x5xi32>):
    %0 = "test.broadcastable"(%arg0, %arg1) : (tensor<8x1x?x1xi32>, tensor<7x1x5xi32>) -> tensor<8x7x?x5xi32>
    "func.return"(%0) : (tensor<8x7x?x5xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2xi32>, tensor<2xi32>) -> tensor<*xi32>, sym_name = "broadcast_tensor_tensor_tensor"}> ({
  ^bb0(%arg0: tensor<2xi32>, %arg1: tensor<2xi32>):
    %0 = "test.broadcastable"(%arg0, %arg1) : (tensor<2xi32>, tensor<2xi32>) -> tensor<*xi32>
    "func.return"(%0) : (tensor<*xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x3x2xi32>, tensor<?xi32>) -> tensor<4x3x2xi32>, sym_name = "broadcast_tensor_tensor_tensor"}> ({
  ^bb0(%arg0: tensor<4x3x2xi32>, %arg1: tensor<?xi32>):
    %0 = "test.broadcastable"(%arg0, %arg1) : (tensor<4x3x2xi32>, tensor<?xi32>) -> tensor<4x3x2xi32>
    "func.return"(%0) : (tensor<4x3x2xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xi32>, tensor<?xi32>) -> tensor<2xi32>, sym_name = "broadcast_tensor_tensor_tensor"}> ({
  ^bb0(%arg0: tensor<?xi32>, %arg1: tensor<?xi32>):
    %0 = "test.broadcastable"(%arg0, %arg1) : (tensor<?xi32>, tensor<?xi32>) -> tensor<2xi32>
    "func.return"(%0) : (tensor<2xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x6x1xi32>, tensor<*xi32>) -> tensor<?x6x?xi32>, sym_name = "broadcast_tensor_tensor_tensor"}> ({
  ^bb0(%arg0: tensor<?x6x1xi32>, %arg1: tensor<*xi32>):
    %0 = "test.broadcastable"(%arg0, %arg1) : (tensor<?x6x1xi32>, tensor<*xi32>) -> tensor<?x6x?xi32>
    "func.return"(%0) : (tensor<?x6x?xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*xi32>, tensor<*xi32>) -> tensor<2xi32>, sym_name = "broadcast_tensor_tensor_tensor"}> ({
  ^bb0(%arg0: tensor<*xi32>, %arg1: tensor<*xi32>):
    %0 = "test.broadcastable"(%arg0, %arg1) : (tensor<*xi32>, tensor<*xi32>) -> tensor<2xi32>
    "func.return"(%0) : (tensor<2xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x2xi32>, tensor<*xi32>) -> tensor<4x3x2xi32>, sym_name = "broadcast_tensor_tensor_tensor"}> ({
  ^bb0(%arg0: tensor<3x2xi32>, %arg1: tensor<*xi32>):
    %0 = "test.broadcastable"(%arg0, %arg0, %arg1) : (tensor<3x2xi32>, tensor<3x2xi32>, tensor<*xi32>) -> tensor<4x3x2xi32>
    "func.return"(%0) : (tensor<4x3x2xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x1x6x1xi32>, tensor<7x1x5xi32>) -> tensor<?x7x6x5xi32>, sym_name = "broadcast_tensor_tensor_tensor"}> ({
  ^bb0(%arg0: tensor<?x1x6x1xi32>, %arg1: tensor<7x1x5xi32>):
    %0 = "test.broadcastable"(%arg0, %arg1) : (tensor<?x1x6x1xi32>, tensor<7x1x5xi32>) -> tensor<?x7x6x5xi32>
    "func.return"(%0) : (tensor<?x7x6x5xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4xi32>, tensor<4xi32>) -> tensor<4xi1>, sym_name = "broadcastDifferentResultType"}> ({
  ^bb0(%arg0: tensor<4xi32>, %arg1: tensor<4xi32>):
    %0 = "test.broadcastable"(%arg0, %arg1) : (tensor<4xi32>, tensor<4xi32>) -> tensor<4xi1>
    "func.return"(%0) : (tensor<4xi1>) -> ()
  }) : () -> ()
}) : () -> ()

