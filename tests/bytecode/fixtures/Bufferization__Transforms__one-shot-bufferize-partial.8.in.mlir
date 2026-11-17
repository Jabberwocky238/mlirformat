"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>, f32) -> tensor<?xf32>, sym_name = "simple_tensor_test"}> ({
  ^bb0(%arg0: tensor<?xf32> loc("<stdin>":4:8), %arg1: f32 loc("<stdin>":4:30)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:10)
    %1 = "tensor.insert"(%arg1, %arg0, %0) : (f32, tensor<?xf32>, index) -> tensor<?xf32> loc("<stdin>":6:10)
    "func.return"(%1) : (tensor<?xf32>) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
