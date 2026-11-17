"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xi32>, index) -> tensor<?xi32>, sym_name = "no_crash_on_dynamic_tensor"}> ({
  ^bb0(%arg0: tensor<?xi32> loc("<stdin>":4:8), %arg1: index loc("<stdin>":4:30)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":6:10)
    %2 = "scf.for"(%0, %arg1, %1, %arg0) ({
    ^bb0(%arg2: index loc("<stdin>":8:10), %arg3: tensor<?xi32> loc("<stdin>":8:24)):
      %3 = "arith.index_cast"(%arg2) : (index) -> i32 loc("<stdin>":9:12)
      %4 = "tensor.insert"(%3, %arg3, %arg2) : (i32, tensor<?xi32>, index) -> tensor<?xi32> loc("<stdin>":10:12)
      "scf.yield"(%4) : (tensor<?xi32>) -> () loc("<stdin>":11:7)
    }) : (index, index, index, tensor<?xi32>) -> tensor<?xi32> loc("<stdin>":7:10)
    "func.return"(%2) : (tensor<?xi32>) -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
