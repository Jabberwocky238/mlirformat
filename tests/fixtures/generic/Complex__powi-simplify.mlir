"builtin.module"() ({
  "func.func"() <{function_type = (complex<f32>) -> complex<f32>, sym_name = "pow3"}> ({
  ^bb0(%arg1: complex<f32>):
    %2 = "arith.constant"() <{value = 3 : i32}> : () -> i32
    %3 = "complex.powi"(%arg1, %2) : (complex<f32>, i32) -> complex<f32>
    "func.return"(%3) : (complex<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (complex<f32>) -> complex<f32>, sym_name = "pow9"}> ({
  ^bb0(%arg0: complex<f32>):
    %0 = "arith.constant"() <{value = 9 : i32}> : () -> i32
    %1 = "complex.powi"(%arg0, %0) : (complex<f32>, i32) -> complex<f32>
    "func.return"(%1) : (complex<f32>) -> ()
  }) : () -> ()
}) : () -> ()

