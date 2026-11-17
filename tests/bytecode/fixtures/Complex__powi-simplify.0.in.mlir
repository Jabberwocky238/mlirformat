"builtin.module"() ({
  "func.func"() <{function_type = (complex<f32>) -> complex<f32>, sym_name = "pow3"}> ({
  ^bb0(%arg1: complex<f32> loc("<stdin>":3:8)):
    %2 = "arith.constant"() <{value = 3 : i32}> : () -> i32 loc("<stdin>":4:10)
    %3 = "complex.powi"(%arg1, %2) : (complex<f32>, i32) -> complex<f32> loc("<stdin>":5:10)
    "func.return"(%3) : (complex<f32>) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (complex<f32>) -> complex<f32>, sym_name = "pow9"}> ({
  ^bb0(%arg0: complex<f32> loc("<stdin>":9:8)):
    %0 = "arith.constant"() <{value = 9 : i32}> : () -> i32 loc("<stdin>":10:10)
    %1 = "complex.powi"(%arg0, %0) : (complex<f32>, i32) -> complex<f32> loc("<stdin>":11:10)
    "func.return"(%1) : (complex<f32>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":8:3)
}) : () -> () loc("<stdin>":1:1)
