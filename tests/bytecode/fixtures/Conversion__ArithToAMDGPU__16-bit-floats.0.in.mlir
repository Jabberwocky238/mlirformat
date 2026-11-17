"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f16, sym_name = "scalar_trunc"}> ({
  ^bb0(%arg2: f32 loc("<stdin>":3:8)):
    %2 = "arith.truncf"(%arg2) : (f32) -> f16 loc("<stdin>":4:10)
    "func.return"(%2) : (f16) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (vector<2xf32>) -> vector<2xf16>, sym_name = "vector_trunc_short"}> ({
  ^bb0(%arg1: vector<2xf32> loc("<stdin>":8:8)):
    %1 = "arith.truncf"(%arg1) : (vector<2xf32>) -> vector<2xf16> loc("<stdin>":9:10)
    "func.return"(%1) : (vector<2xf16>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (vector<9xf32>) -> vector<9xf16>, sym_name = "vector_trunc_long"}> ({
  ^bb0(%arg0: vector<9xf32> loc("<stdin>":13:8)):
    %0 = "arith.truncf"(%arg0) : (vector<9xf32>) -> vector<9xf16> loc("<stdin>":14:10)
    "func.return"(%0) : (vector<9xf16>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
}) : () -> () loc("<stdin>":1:1)
