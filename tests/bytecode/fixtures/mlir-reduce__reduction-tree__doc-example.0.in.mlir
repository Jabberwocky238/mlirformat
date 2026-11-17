"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "func1"}> ({
    "func.return"() : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (i1) -> f32, sym_name = "func2"}> ({
  ^bb0(%arg0: i1 loc("<stdin>":6:8)):
    %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":7:10)
    %1 = "arith.constant"() <{value = 2 : i32}> : () -> i32 loc("<stdin>":8:10)
    %2 = "arith.constant"() <{value = 2.200000e+00 : f32}> : () -> f32 loc("<stdin>":9:10)
    %3 = "arith.constant"() <{value = 5.300000e+00 : f32}> : () -> f32 loc("<stdin>":10:10)
    %4 = "arith.addi"(%0, %1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":11:10)
    %5 = "arith.addf"(%2, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":12:10)
    %6 = "arith.muli"(%4, %4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":13:10)
    %7 = "arith.subi"(%6, %4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":14:10)
    %8 = "arith.select"(%arg0, %5, %2) : (i1, f32, f32) -> f32 loc("<stdin>":15:10)
    %9 = "arith.addf"(%2, %8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":16:10)
    "func.return"(%9) : (f32) -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":1:1)
