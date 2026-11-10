"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<i64>, sym_name = "rank0", sym_visibility = "private"}> ({
    %3 = "arith.constant"() <{value = dense<-1> : tensor<i64>}> : () -> tensor<i64>
    "func.return"(%3) : (tensor<i64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1xi64>) -> tensor<1xi64>, sym_name = "rank1", sym_visibility = "private"}> ({
  ^bb0(%arg5: tensor<1xi64>):
    "func.return"(%arg5) : (tensor<1xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x1xi64>) -> tensor<1x1xi64>, sym_name = "rank2_single_element", sym_visibility = "private"}> ({
  ^bb0(%arg4: tensor<1x1xi64>):
    "func.return"(%arg4) : (tensor<1x1xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1xi64>, i1) -> tensor<1xi64>, sym_name = "non_return_terminator", sym_visibility = "private"}> ({
  ^bb0(%arg2: tensor<1xi64>, %arg3: i1):
    "cf.cond_br"(%arg3)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    "cf.br"(%arg2)[^bb3] : (tensor<1xi64>) -> ()
  ^bb2:  // pred: ^bb0
    %1 = "tensor.empty"() : () -> tensor<1xi64>
    "cf.br"(%1)[^bb3] : (tensor<1xi64>) -> ()
  ^bb3(%2: tensor<1xi64>):  // 2 preds: ^bb1, ^bb2
    "func.return"(%2) : (tensor<1xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1xi64>) -> tensor<1xi64>, sym_name = "callee", sym_visibility = "private"}> ({
  ^bb0(%arg1: tensor<1xi64>):
    "func.return"(%arg1) : (tensor<1xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1xi64>) -> tensor<1xi64>, sym_name = "caller", sym_visibility = "private"}> ({
  ^bb0(%arg0: tensor<1xi64>):
    %0 = "func.call"(%arg0) <{callee = @callee}> : (tensor<1xi64>) -> tensor<1xi64>
    "func.return"(%0) : (tensor<1xi64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1xi64>) -> tensor<1xi64>, sym_name = "callee", sym_visibility = "private"}> ({
  ^bb0(%arg1: tensor<1xi64>):
    "func.return"(%arg1) : (tensor<1xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1xi64>) -> tensor<2xi64>, sym_name = "non_scalarizable_caller_multiple_dimensions_return", sym_visibility = "private"}> ({
  ^bb0(%arg0: tensor<1xi64>):
    %0 = "func.call"(%arg0) <{callee = @callee}> : (tensor<1xi64>) -> tensor<1xi64>
    %1 = "tensor.empty"() : () -> tensor<2xi64>
    "func.return"(%1) : (tensor<2xi64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1xi64>) -> tensor<1xi64>, sym_name = "callee", sym_visibility = "private"}> ({
  ^bb0(%arg1: tensor<1xi64>):
    "func.return"(%arg1) : (tensor<1xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1xi64>) -> (tensor<1xi64>, i64), sym_name = "non_scalarizeable_caller_with_multiple_returns", sym_visibility = "private"}> ({
  ^bb0(%arg0: tensor<1xi64>):
    %0 = "func.call"(%arg0) <{callee = @callee}> : (tensor<1xi64>) -> tensor<1xi64>
    %1 = "arith.constant"() <{value = 7 : i64}> : () -> i64
    "func.return"(%0, %1) : (tensor<1xi64>, i64) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1xi64>) -> tensor<1xi64>, sym_name = "callee", sym_visibility = "private"}> ({
  ^bb0(%arg5: tensor<1xi64>):
    "func.return"(%arg5) : (tensor<1xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1xi64>, tensor<1xi64>) -> tensor<1xi64>, sym_name = "non_scalarizeable_caller_expecting_tensor_type", sym_visibility = "private"}> ({
  ^bb0(%arg0: tensor<1xi64>, %arg1: tensor<1xi64>):
    %0 = "func.call"(%arg0) <{callee = @callee}> : (tensor<1xi64>) -> tensor<1xi64>
    %1 = "tensor.empty"() : () -> tensor<1xi64>
    %2 = "linalg.map"(%0, %arg1, %1) ({
    ^bb0(%arg2: i64, %arg3: i64, %arg4: i64):
      %3 = "arith.addi"(%arg2, %arg3) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      "linalg.yield"(%3) : (i64) -> ()
    }) : (tensor<1xi64>, tensor<1xi64>, tensor<1xi64>) -> tensor<1xi64>
    "func.return"(%2) : (tensor<1xi64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1xi64>) -> tensor<1xi64>, sym_name = "callee", sym_visibility = "private"}> ({
  ^bb0(%arg0: tensor<1xi64>):
    "func.return"(%arg0) : (tensor<1xi64>) -> ()
  }) : () -> ()
  %0 = "tensor.empty"() : () -> tensor<1xi64>
  %1 = "func.call"(%0) <{callee = @callee}> : (tensor<1xi64>) -> tensor<1xi64>
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1xi64>) -> tensor<1xi64>, sym_name = "callee", sym_visibility = "private"}> ({
  ^bb0(%arg1: tensor<1xi64>):
    "func.return"(%arg1) : (tensor<1xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1xi64>) -> tensor<1xi64>, sym_name = "caller_using_constant", sym_visibility = "private"}> ({
  ^bb0(%arg0: tensor<1xi64>):
    %0 = "func.constant"() <{value = @callee}> : () -> ((tensor<1xi64>) -> tensor<1xi64>)
    %1 = "func.call_indirect"(%0, %arg0) : ((tensor<1xi64>) -> tensor<1xi64>, tensor<1xi64>) -> tensor<1xi64>
    "func.return"(%1) : (tensor<1xi64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2xi64>) -> tensor<2xi64>, sym_name = "multiple_elements", sym_visibility = "private"}> ({
  ^bb0(%arg5: tensor<2xi64>):
    "func.return"(%arg5) : (tensor<2xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xi64>) -> tensor<?xi64>, sym_name = "dynamic_shape", sym_visibility = "private"}> ({
  ^bb0(%arg4: tensor<?xi64>):
    "func.return"(%arg4) : (tensor<?xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<*xi64>) -> tensor<*xi64>, sym_name = "unranked", sym_visibility = "private"}> ({
  ^bb0(%arg3: tensor<*xi64>):
    "func.return"(%arg3) : (tensor<*xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1xi64>) -> tensor<1xi64>, sym_name = "public_function"}> ({
  ^bb0(%arg2: tensor<1xi64>):
    "func.return"(%arg2) : (tensor<1xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1xi64>) -> tensor<1xi64>, sym_name = "callee", sym_visibility = "private"}> ({
  ^bb0(%arg1: tensor<1xi64>):
    "func.return"(%arg1) : (tensor<1xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1xi64>) -> tensor<1xi64>, sym_name = "public_caller"}> ({
  ^bb0(%arg0: tensor<1xi64>):
    %0 = "func.call"(%arg0) <{callee = @callee}> : (tensor<1xi64>) -> tensor<1xi64>
    "func.return"(%0) : (tensor<1xi64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1xi64>) -> tensor<1xi64>, sym_name = "recursive_a", sym_visibility = "private"}> ({
  ^bb0(%arg1: tensor<1xi64>):
    %1 = "func.call"(%arg1) <{callee = @recursive_b}> : (tensor<1xi64>) -> tensor<1xi64>
    "func.return"(%1) : (tensor<1xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1xi64>) -> tensor<1xi64>, sym_name = "recursive_b", sym_visibility = "private"}> ({
  ^bb0(%arg0: tensor<1xi64>):
    %0 = "func.call"(%arg0) <{callee = @recursive_a}> : (tensor<1xi64>) -> tensor<1xi64>
    "func.return"(%0) : (tensor<1xi64>) -> ()
  }) : () -> ()
}) : () -> ()

