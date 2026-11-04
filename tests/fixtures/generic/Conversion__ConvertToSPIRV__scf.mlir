"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> f32, sym_name = "if_yield"}> ({
  ^bb0(%arg7: i1):
    %11 = "scf.if"(%arg7) ({
      %14 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
      %15 = "math.sqrt"(%14) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "scf.yield"(%15) : (f32) -> ()
    }, {
      %12 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
      %13 = "math.exp"(%12) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "scf.yield"(%13) : (f32) -> ()
    }) : (i1) -> f32
    "func.return"(%11) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "while"}> ({
  ^bb0(%arg3: i32, %arg4: i32):
    %7 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %8 = "scf.while"(%arg3) ({
    ^bb0(%arg6: i32):
      %10 = "arith.cmpi"(%arg6, %arg4) <{predicate = 2 : i64}> : (i32, i32) -> i1
      "scf.condition"(%10, %arg6) : (i1, i32) -> ()
    }, {
    ^bb0(%arg5: i32):
      %9 = "arith.muli"(%arg5, %7) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "scf.yield"(%9) : (i32) -> ()
    }) : (i32) -> i32
    "func.return"(%8) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "for"}> ({
    %0 = "arith.constant"() <{value = 4 : index}> : () -> index
    %1 = "arith.constant"() <{value = 42 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %4 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %5:2 = "scf.for"(%0, %1, %2, %3, %4) ({
    ^bb0(%arg0: index, %arg1: f32, %arg2: f32):
      %6 = "arith.addf"(%arg1, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "scf.yield"(%6, %6) : (f32, f32) -> ()
    }) : (index, index, index, f32, f32) -> (f32, f32)
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

