"builtin.module"() ({
  "func.func"() <{function_type = (f32, vector<4xf32>) -> (), sym_name = "fpclassify"}> ({
  ^bb0(%arg2: f32 loc("<stdin>":3:8), %arg3: vector<4xf32> loc("<stdin>":3:20)):
    %2 = "math.isfinite"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> i1 loc("<stdin>":4:10)
    %3 = "math.isfinite"(%arg3) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xi1> loc("<stdin>":5:10)
    %4 = "math.isnan"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> i1 loc("<stdin>":6:10)
    %5 = "math.isnan"(%arg3) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xi1> loc("<stdin>":7:10)
    %6 = "math.isinf"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> i1 loc("<stdin>":8:10)
    %7 = "math.isinf"(%arg3) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xi1> loc("<stdin>":9:10)
    %8 = "math.isnormal"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> i1 loc("<stdin>":10:10)
    %9 = "math.isnormal"(%arg3) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xi1> loc("<stdin>":11:10)
    "func.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (i32, vector<4xi32>) -> (), sym_name = "ctpop"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":15:8), %arg1: vector<4xi32> loc("<stdin>":15:20)):
    %0 = "math.ctpop"(%arg0) : (i32) -> i32 loc("<stdin>":16:10)
    %1 = "math.ctpop"(%arg1) : (vector<4xi32>) -> vector<4xi32> loc("<stdin>":17:10)
    "func.return"() : () -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":14:3)
}) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], []>, #spirv.resource_limits<>>} : () -> () loc("<stdin>":1:1)
