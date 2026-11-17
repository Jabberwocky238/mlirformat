"builtin.module"() ({
  "func.func"() <{function_type = () -> f32, sym_name = "combined"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":3:10)
    %1 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":4:10)
    %2 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":5:10)
    %3 = "arith.constant"() <{value = 4 : i32}> : () -> i32 loc("<stdin>":6:10)
    %4 = "index.casts"(%2) : (i32) -> index loc("<stdin>":7:10)
    %5 = "index.casts"(%3) : (i32) -> index loc("<stdin>":8:10)
    %6 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":9:10)
    %7 = "vector.broadcast"(%1) : (f32) -> vector<4xf32> loc("<stdin>":10:10)
    %8 = "scf.for"(%4, %5, %6, %0) ({
    ^bb0(%arg0: index loc("<stdin>":12:10), %arg1: f32 loc("<stdin>":12:24)):
      %10 = "vector.extract"(%7) <{static_position = array<i64: 0>}> : (vector<4xf32>) -> f32 loc("<stdin>":13:13)
      %11 = "arith.addf"(%arg1, %10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":14:13)
      %12 = "vector.insert"(%11, %7) <{static_position = array<i64: 0>}> : (f32, vector<4xf32>) -> vector<4xf32> loc("<stdin>":15:13)
      "scf.yield"(%11) : (f32) -> () loc("<stdin>":16:7)
    }) : (index, index, index, f32) -> f32 loc("<stdin>":11:10)
    %9 = "ub.poison"() <{value = #ub.poison}> : () -> f32 loc("<stdin>":18:10)
    "func.return"(%9) : (f32) -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
