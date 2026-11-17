"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32) -> complex<f32>, sym_name = "create_complex"}> ({
  ^bb0(%arg0: f32 loc("<stdin>":3:8), %arg1: f32 loc("<stdin>":3:20)):
    %0 = "complex.create"(%arg0, %arg1) : (f32, f32) -> complex<f32> loc("<stdin>":4:10)
    "func.return"(%0) : (complex<f32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
