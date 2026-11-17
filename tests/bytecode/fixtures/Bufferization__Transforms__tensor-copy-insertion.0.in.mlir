"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>, index, f32) -> (tensor<?xf32>, tensor<?xf32>), sym_name = "read_after_write_conflict"}> ({
  ^bb0(%arg0: tensor<?xf32> loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:30), %arg2: f32 loc("<stdin>":3:44)):
    %0 = "tensor.insert"(%arg2, %arg0, %arg1) : (f32, tensor<?xf32>, index) -> tensor<?xf32> loc("<stdin>":4:10)
    "func.return"(%0, %arg0) : (tensor<?xf32>, tensor<?xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
