"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32, index) -> tensor<3xf32>, sym_name = "no_conflict"}> ({
  ^bb0(%arg0: f32 loc("<stdin>":3:8), %arg1: f32 loc("<stdin>":3:20), %arg2: index loc("<stdin>":3:32)):
    %0 = "tensor.from_elements"(%arg0, %arg0, %arg0) : (f32, f32, f32) -> tensor<3xf32> loc("<stdin>":4:10)
    %1 = "tensor.insert"(%arg1, %0, %arg2) : (f32, tensor<3xf32>, index) -> tensor<3xf32> loc("<stdin>":5:10)
    "func.return"(%1) : (tensor<3xf32>) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
