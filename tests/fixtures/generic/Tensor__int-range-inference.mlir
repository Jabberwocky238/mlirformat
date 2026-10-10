"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x5xi32>) -> index, sym_name = "dim_const"}> ({
  ^bb0(%arg0: tensor<3x5xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "tensor.dim"(%arg0, %0) : (tensor<3x5xi32>, index) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x5xi32>, index) -> index, sym_name = "dim_any_static"}> ({
  ^bb0(%arg0: tensor<3x5xi32>, %arg1: index):
    %0 = "tensor.dim"(%arg0, %arg1) : (tensor<3x5xi32>, index) -> index
    %1 = "test.reflect_bounds"(%0) : (index) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x5xi32>) -> index, sym_name = "dim_dynamic"}> ({
  ^bb0(%arg0: tensor<?x5xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "tensor.dim"(%arg0, %0) : (tensor<?x5xi32>, index) -> index
    %2 = "test.reflect_bounds"(%1) : (index) -> index
    "func.return"(%2) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x5xi32>, index) -> index, sym_name = "dim_any_dynamic"}> ({
  ^bb0(%arg0: tensor<?x5xi32>, %arg1: index):
    %0 = "tensor.dim"(%arg0, %arg1) : (tensor<?x5xi32>, index) -> index
    %1 = "test.reflect_bounds"(%0) : (index) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x3x5xi32>, index) -> index, sym_name = "dim_some_omitting_dynamic"}> ({
  ^bb0(%arg0: tensor<?x3x5xi32>, %arg1: index):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.maxsi"(%arg1, %0) : (index, index) -> index
    %2 = "tensor.dim"(%arg0, %1) : (tensor<?x3x5xi32>, index) -> index
    %3 = "test.reflect_bounds"(%2) : (index) -> index
    "func.return"(%3) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*xi32>) -> index, sym_name = "dim_unranked"}> ({
  ^bb0(%arg0: tensor<*xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "tensor.dim"(%arg0, %0) : (tensor<*xi32>, index) -> index
    %2 = "test.reflect_bounds"(%1) : (index) -> index
    "func.return"(%2) : (index) -> ()
  }) : () -> ()
}) : () -> ()

