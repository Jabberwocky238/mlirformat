"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<i64>, sym_name = "rank0", sym_visibility = "private"}> ({
    %3 = "arith.constant"() <{value = dense<-1> : tensor<i64>}> : () -> tensor<i64> loc("<stdin>":3:10)
    "func.return"(%3) : (tensor<i64>) -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (tensor<1xi64>) -> tensor<1xi64>, sym_name = "rank1", sym_visibility = "private"}> ({
  ^bb0(%arg5: tensor<1xi64> loc("<stdin>":7:8)):
    "func.return"(%arg5) : (tensor<1xi64>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = (tensor<1x1xi64>) -> tensor<1x1xi64>, sym_name = "rank2_single_element", sym_visibility = "private"}> ({
  ^bb0(%arg4: tensor<1x1xi64> loc("<stdin>":11:8)):
    "func.return"(%arg4) : (tensor<1x1xi64>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":10:3)
  "func.func"() <{function_type = (tensor<1xi64>, i1) -> tensor<1xi64>, sym_name = "non_return_terminator", sym_visibility = "private"}> ({
  ^bb0(%arg2: tensor<1xi64> loc("<stdin>":15:8), %arg3: i1 loc("<stdin>":15:30)):
    "cf.cond_br"(%arg3)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":16:5)
  ^bb1:  // pred: ^bb0
    "cf.br"(%arg2)[^bb3] : (tensor<1xi64>) -> () loc("<stdin>":18:5)
  ^bb2:  // pred: ^bb0
    %1 = "tensor.empty"() : () -> tensor<1xi64> loc("<stdin>":20:10)
    "cf.br"(%1)[^bb3] : (tensor<1xi64>) -> () loc("<stdin>":21:5)
  ^bb3(%2: tensor<1xi64> loc("<stdin>":22:8)):  // 2 preds: ^bb1, ^bb2
    "func.return"(%2) : (tensor<1xi64>) -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = (tensor<1xi64>) -> tensor<1xi64>, sym_name = "callee", sym_visibility = "private"}> ({
  ^bb0(%arg1: tensor<1xi64> loc("<stdin>":26:8)):
    "func.return"(%arg1) : (tensor<1xi64>) -> () loc("<stdin>":27:5)
  }) : () -> () loc("<stdin>":25:3)
  "func.func"() <{function_type = (tensor<1xi64>) -> tensor<1xi64>, sym_name = "caller", sym_visibility = "private"}> ({
  ^bb0(%arg0: tensor<1xi64> loc("<stdin>":30:8)):
    %0 = "func.call"(%arg0) <{callee = @callee}> : (tensor<1xi64>) -> tensor<1xi64> loc("<stdin>":31:10)
    "func.return"(%0) : (tensor<1xi64>) -> () loc("<stdin>":32:5)
  }) : () -> () loc("<stdin>":29:3)
}) : () -> () loc("<stdin>":1:1)
