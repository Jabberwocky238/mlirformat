"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "simple_std_for_loop"}> ({
  ^bb0(%arg28: index loc("<stdin>":3:8), %arg29: index loc("<stdin>":3:23), %arg30: index loc("<stdin>":3:38)):
    "scf.for"(%arg28, %arg29, %arg30) ({
    ^bb0(%arg31: index loc("<stdin>":5:10)):
      %15 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":6:13)
      "scf.yield"() : () -> () loc("<stdin>":7:7)
    }) : (index, index, index) -> () loc("<stdin>":4:5)
    "func.return"() : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "simple_std_2_for_loops"}> ({
  ^bb0(%arg23: index loc("<stdin>":12:8), %arg24: index loc("<stdin>":12:23), %arg25: index loc("<stdin>":12:38)):
    "scf.for"(%arg23, %arg24, %arg25) ({
    ^bb0(%arg26: index loc("<stdin>":14:10)):
      %13 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":15:13)
      "scf.for"(%arg23, %arg24, %arg25) ({
      ^bb0(%arg27: index loc("<stdin>":17:12)):
        %14 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":18:15)
        "scf.yield"() : () -> () loc("<stdin>":19:9)
      }) : (index, index, index) -> () loc("<stdin>":16:7)
      "scf.yield"() : () -> () loc("<stdin>":21:7)
    }) : (index, index, index) -> () loc("<stdin>":13:5)
    "func.return"() : () -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":11:3)
  "func.func"() <{function_type = (index, index, index) -> (f32, f32), sym_name = "for_yield"}> ({
  ^bb0(%arg17: index loc("<stdin>":26:8), %arg18: index loc("<stdin>":26:23), %arg19: index loc("<stdin>":26:38)):
    %9 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":27:10)
    %10 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":28:11)
    %11:2 = "scf.for"(%arg17, %arg18, %arg19, %9, %10) ({
    ^bb0(%arg20: index loc("<stdin>":30:10), %arg21: f32 loc("<stdin>":30:25), %arg22: f32 loc("<stdin>":30:38)):
      %12 = "arith.addf"(%arg21, %arg22) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":31:13)
      "scf.yield"(%12, %12) : (f32, f32) -> () loc("<stdin>":32:7)
    }) : (index, index, index, f32, f32) -> (f32, f32) loc("<stdin>":29:13)
    "func.return"(%11#0, %11#1) : (f32, f32) -> () loc("<stdin>":34:5)
  }) : () -> () loc("<stdin>":25:3)
  "func.func"() <{function_type = (index, index, index) -> f32, sym_name = "nested_for_yield"}> ({
  ^bb0(%arg10: index loc("<stdin>":37:8), %arg11: index loc("<stdin>":37:23), %arg12: index loc("<stdin>":37:38)):
    %5 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":38:10)
    %6 = "scf.for"(%arg10, %arg11, %arg12, %5) ({
    ^bb0(%arg13: index loc("<stdin>":40:10), %arg14: f32 loc("<stdin>":40:25)):
      %7 = "scf.for"(%arg10, %arg11, %arg12, %arg14) ({
      ^bb0(%arg15: index loc("<stdin>":42:12), %arg16: f32 loc("<stdin>":42:27)):
        %8 = "arith.addf"(%arg16, %arg16) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":43:14)
        "scf.yield"(%8) : (f32) -> () loc("<stdin>":44:9)
      }) : (index, index, index, f32) -> f32 loc("<stdin>":41:12)
      "scf.yield"(%7) : (f32) -> () loc("<stdin>":46:7)
    }) : (index, index, index, f32) -> f32 loc("<stdin>":39:10)
    "func.return"(%6) : (f32) -> () loc("<stdin>":48:5)
  }) : () -> () loc("<stdin>":36:3)
  "func.func"() <{function_type = (index, index, index) -> index, sym_name = "for_yield_index"}> ({
  ^bb0(%arg5: index loc("<stdin>":51:8), %arg6: index loc("<stdin>":51:22), %arg7: index loc("<stdin>":51:36)):
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":52:10)
    %4 = "scf.for"(%arg5, %arg6, %arg7, %3) ({
    ^bb0(%arg8: index loc("<stdin>":54:10), %arg9: index loc("<stdin>":54:24)):
      "scf.yield"(%arg9) : (index) -> () loc("<stdin>":55:7)
    }) : (index, index, index, index) -> index loc("<stdin>":53:10)
    "func.return"(%4) : (index) -> () loc("<stdin>":57:5)
  }) : () -> () loc("<stdin>":50:3)
  "func.func"() <{function_type = (index, index, index) -> index, sym_name = "for_yield_update_loop_carried_var"}> ({
  ^bb0(%arg0: index loc("<stdin>":60:8), %arg1: index loc("<stdin>":60:22), %arg2: index loc("<stdin>":60:36)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":61:10)
    %1 = "scf.for"(%arg0, %arg1, %arg2, %0) ({
    ^bb0(%arg3: index loc("<stdin>":63:10), %arg4: index loc("<stdin>":63:24)):
      %2 = "arith.addi"(%arg4, %arg4) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":64:12)
      "scf.yield"(%2) : (index) -> () loc("<stdin>":65:7)
    }) : (index, index, index, index) -> index loc("<stdin>":62:10)
    "func.return"(%1) : (index) -> () loc("<stdin>":67:5)
  }) : () -> () loc("<stdin>":59:3)
}) : () -> () loc("<stdin>":1:1)
