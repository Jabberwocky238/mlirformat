"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x2xf8E5M2>, vector<2x2xf8E8M0FNU>) -> vector<2x2xf32>, sym_name = "conversion_f8_f32_fallback"}> ({
  ^bb0(%arg0: vector<2x2xf8E5M2> loc("<stdin>":3:8), %arg1: vector<2x2xf8E8M0FNU> loc("<stdin>":3:35)):
    %0 = "arith.scaling_extf"(%arg0, %arg1) : (vector<2x2xf8E5M2>, vector<2x2xf8E8M0FNU>) -> vector<2x2xf32> loc("<stdin>":4:10)
    "func.return"(%0) : (vector<2x2xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
