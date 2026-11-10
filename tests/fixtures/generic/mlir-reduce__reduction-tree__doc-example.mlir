"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "func1"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> f32, sym_name = "func2"}> ({
  ^bb0(%arg0: i1):
    %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 2.200000e+00 : f32}> : () -> f32
    %3 = "arith.constant"() <{value = 5.300000e+00 : f32}> : () -> f32
    %4 = "arith.addi"(%0, %1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    %5 = "arith.addf"(%2, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %6 = "arith.muli"(%4, %4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    %7 = "arith.subi"(%6, %4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    %8 = "arith.select"(%arg0, %5, %2) : (i1, f32, f32) -> f32
    %9 = "arith.addf"(%2, %8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "func.return"(%9) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

