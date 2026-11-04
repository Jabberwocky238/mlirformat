"builtin.module"() ({
  "func.func"() <{function_type = () -> f32, sym_name = "combined"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %3 = "arith.constant"() <{value = 4 : i32}> : () -> i32
    %4 = "index.casts"(%2) : (i32) -> index
    %5 = "index.casts"(%3) : (i32) -> index
    %6 = "arith.constant"() <{value = 1 : index}> : () -> index
    %7 = "vector.broadcast"(%1) : (f32) -> vector<4xf32>
    %8 = "scf.for"(%4, %5, %6, %0) ({
    ^bb0(%arg0: index, %arg1: f32):
      %10 = "vector.extract"(%7) <{static_position = array<i64: 0>}> : (vector<4xf32>) -> f32
      %11 = "arith.addf"(%arg1, %10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %12 = "vector.insert"(%11, %7) <{static_position = array<i64: 0>}> : (f32, vector<4xf32>) -> vector<4xf32>
      "scf.yield"(%11) : (f32) -> ()
    }) : (index, index, index, f32) -> f32
    %9 = "ub.poison"() <{value = #ub.poison}> : () -> f32
    "func.return"(%9) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

