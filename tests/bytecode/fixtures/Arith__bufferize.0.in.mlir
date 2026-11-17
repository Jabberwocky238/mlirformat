"builtin.module"() ({
  "func.func"() <{function_type = (tensor<i32>, i32) -> (tensor<index>, index), sym_name = "index_cast"}> ({
  ^bb0(%arg0: tensor<i32> loc("<stdin>":3:8), %arg1: i32 loc("<stdin>":3:28)):
    %0 = "arith.index_cast"(%arg0) : (tensor<i32>) -> tensor<index> loc("<stdin>":4:10)
    %1 = "arith.index_cast"(%arg1) : (i32) -> index loc("<stdin>":5:10)
    "func.return"(%0, %1) : (tensor<index>, index) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
