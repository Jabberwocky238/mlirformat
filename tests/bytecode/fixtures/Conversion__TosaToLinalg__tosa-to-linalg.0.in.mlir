"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>) -> tensor<f32>, sym_name = "test_abs_scalar"}> ({
  ^bb0(%arg0: tensor<f32> loc("<stdin>":3:8)):
    %0 = "tosa.abs"(%arg0) : (tensor<f32>) -> tensor<f32> loc("<stdin>":4:10)
    "func.return"(%0) : (tensor<f32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
