"builtin.module"() ({
  "func.func"() <{function_type = (tensor<i32>) -> (), sym_name = "foreach_scalar_no_reduc"}> ({
  ^bb0(%arg4: tensor<i32> loc("<stdin>":3:8)):
    "sparse_tensor.foreach"(%arg4) ({
    ^bb0(%arg5: i32 loc("<stdin>":5:10)):
      "sparse_tensor.yield"() : () -> () loc("<stdin>":6:7)
    }) : (tensor<i32>) -> () loc("<stdin>":4:5)
    "func.return"() : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (tensor<i32>, i32) -> i32, sym_name = "foreach_scalar_with_reduc"}> ({
  ^bb0(%arg0: tensor<i32> loc("<stdin>":11:8), %arg1: i32 loc("<stdin>":11:28)):
    %0 = "sparse_tensor.foreach"(%arg0, %arg1) ({
    ^bb0(%arg2: i32 loc("<stdin>":13:10), %arg3: i32 loc("<stdin>":13:22)):
      "sparse_tensor.yield"(%arg2) : (i32) -> () loc("<stdin>":14:7)
    }) : (tensor<i32>, i32) -> i32 loc("<stdin>":12:10)
    "func.return"(%0) : (i32) -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":10:3)
}) : () -> () loc("<stdin>":1:1)
