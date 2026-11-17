"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> f32, sym_name = "if_yield"}> ({
  ^bb0(%arg7: i1 loc("<stdin>":3:8)):
    %11 = "scf.if"(%arg7) ({
      %14 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":5:13)
      %15 = "math.sqrt"(%14) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":6:13)
      "scf.yield"(%15) : (f32) -> () loc("<stdin>":7:7)
    }, {
      %12 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":9:13)
      %13 = "math.exp"(%12) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":10:13)
      "scf.yield"(%13) : (f32) -> () loc("<stdin>":11:7)
    }) : (i1) -> f32 loc("<stdin>":4:11)
    "func.return"(%11) : (f32) -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "while"}> ({
  ^bb0(%arg3: i32 loc("<stdin>":16:8), %arg4: i32 loc("<stdin>":16:20)):
    %7 = "arith.constant"() <{value = 2 : i32}> : () -> i32 loc("<stdin>":17:10)
    %8 = "scf.while"(%arg3) ({
    ^bb0(%arg6: i32 loc("<stdin>":19:10)):
      %10 = "arith.cmpi"(%arg6, %arg4) <{predicate = 2 : i64}> : (i32, i32) -> i1 loc("<stdin>":20:13)
      "scf.condition"(%10, %arg6) : (i1, i32) -> () loc("<stdin>":21:7)
    }, {
    ^bb0(%arg5: i32 loc("<stdin>":23:10)):
      %9 = "arith.muli"(%arg5, %7) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":24:12)
      "scf.yield"(%9) : (i32) -> () loc("<stdin>":25:7)
    }) : (i32) -> i32 loc("<stdin>":18:10)
    "func.return"(%8) : (i32) -> () loc("<stdin>":27:5)
  }) : () -> () loc("<stdin>":15:3)
  "func.func"() <{function_type = () -> (), sym_name = "for"}> ({
    %0 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":30:10)
    %1 = "arith.constant"() <{value = 42 : index}> : () -> index loc("<stdin>":31:10)
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":32:10)
    %3 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":33:10)
    %4 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":34:10)
    %5:2 = "scf.for"(%0, %1, %2, %3, %4) ({
    ^bb0(%arg0: index loc("<stdin>":36:10), %arg1: f32 loc("<stdin>":36:24), %arg2: f32 loc("<stdin>":36:36)):
      %6 = "arith.addf"(%arg1, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":37:12)
      "scf.yield"(%6, %6) : (f32, f32) -> () loc("<stdin>":38:7)
    }) : (index, index, index, f32, f32) -> (f32, f32) loc("<stdin>":35:12)
    "func.return"() : () -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":29:3)
}) : () -> () loc("<stdin>":1:1)
