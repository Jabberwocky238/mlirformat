"builtin.module"() ({
  "emitc.func"() <{function_type = (i32) -> i32, sym_name = "payload_one_result"}> ({
  ^bb0(%arg17: i32 loc("<stdin>":3:8)):
    %38 = "emitc.add"(%arg17, %arg17) : (i32, i32) -> i32 loc("<stdin>":4:11)
    "emitc.return"(%38) : (i32) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> i32, sym_name = "one_result"}> ({
    %30 = "emitc.literal"() <{value = "1.0"}> : () -> i32 loc("<stdin>":8:11)
    %31 = "emitc.literal"() <{value = "1.0"}> : () -> i32 loc("<stdin>":9:11)
    %32 = "emitc.literal"() <{value = "10.0"}> : () -> i32 loc("<stdin>":10:11)
    %33 = "scf.while"(%30) ({
    ^bb0(%arg16: i32 loc("<stdin>":12:10)):
      %35 = "emitc.add"(%arg16, %31) : (i32, i32) -> i32 loc("<stdin>":13:13)
      %36 = "emitc.cmp"(%35, %32) <{predicate = 2 : i64}> : (i32, i32) -> i1 loc("<stdin>":14:13)
      %37 = "emitc.add"(%arg16, %arg16) : (i32, i32) -> i32 loc("<stdin>":15:13)
      "scf.condition"(%36, %37) : (i1, i32) -> () loc("<stdin>":16:7)
    }, {
    ^bb0(%arg15: i32 loc("<stdin>":18:10)):
      %34 = "emitc.call"(%arg15) <{callee = @payload_one_result}> : (i32) -> i32 loc("<stdin>":19:13)
      "scf.yield"(%34) : (i32) -> () loc("<stdin>":20:7)
    }) : (i32) -> i32 loc("<stdin>":11:11)
    "func.return"(%33) : (i32) -> () loc("<stdin>":22:5)
  }) : () -> () loc("<stdin>":7:3)
  "emitc.func"() <{function_type = (i32) -> i32, sym_name = "payload_two_results"}> ({
  ^bb0(%arg14: i32 loc("<stdin>":25:8)):
    %29 = "emitc.add"(%arg14, %arg14) : (i32, i32) -> i32 loc("<stdin>":26:11)
    "emitc.return"(%29) : (i32) -> () loc("<stdin>":27:5)
  }) : () -> () loc("<stdin>":24:3)
  "func.func"() <{function_type = () -> i32, sym_name = "two_results"}> ({
    %22 = "emitc.literal"() <{value = "1.0"}> : () -> i32 loc("<stdin>":30:11)
    %23 = "emitc.literal"() <{value = "10.0"}> : () -> i32 loc("<stdin>":31:11)
    %24:2 = "scf.while"(%22, %22) ({
    ^bb0(%arg12: i32 loc("<stdin>":33:10), %arg13: i32 loc("<stdin>":33:23)):
      %27 = "emitc.add"(%arg12, %arg13) : (i32, i32) -> i32 loc("<stdin>":34:13)
      %28 = "emitc.cmp"(%27, %23) <{predicate = 2 : i64}> : (i32, i32) -> i1 loc("<stdin>":35:13)
      "scf.condition"(%28, %22, %arg13) : (i1, i32, i32) -> () loc("<stdin>":36:7)
    }, {
    ^bb0(%arg10: i32 loc("<stdin>":38:10), %arg11: i32 loc("<stdin>":38:23)):
      %25 = "emitc.call"(%arg10) <{callee = @payload_two_results}> : (i32) -> i32 loc("<stdin>":39:13)
      %26 = "emitc.call"(%arg11) <{callee = @payload_two_results}> : (i32) -> i32 loc("<stdin>":40:13)
      "scf.yield"(%25, %26) : (i32, i32) -> () loc("<stdin>":41:7)
    }) : (i32, i32) -> (i32, i32) loc("<stdin>":32:13)
    "func.return"(%24#0) : (i32) -> () loc("<stdin>":43:5)
  }) : () -> () loc("<stdin>":29:3)
  "emitc.func"() <{function_type = (i32) -> i32, sym_name = "payload_double_use"}> ({
  ^bb0(%arg9: i32 loc("<stdin>":46:8)):
    %21 = "emitc.add"(%arg9, %arg9) : (i32, i32) -> i32 loc("<stdin>":47:11)
    "emitc.return"(%21) : (i32) -> () loc("<stdin>":48:5)
  }) : () -> () loc("<stdin>":45:3)
  "emitc.func"() <{function_type = (i32, !emitc.ptr<i32>) -> i32, sym_name = "foo_with_side_effect"}> ({
  ^bb0(%arg7: i32 loc("<stdin>":51:8), %arg8: !emitc.ptr<i32> loc("<stdin>":51:20)):
    %20 = "emitc.add"(%arg7, %arg7) : (i32, i32) -> i32 loc("<stdin>":52:11)
    "emitc.verbatim"(%arg8, %20) <{value = "{}[0] = {};"}> : (!emitc.ptr<i32>, i32) -> () loc("<stdin>":53:5)
    "emitc.return"(%20) : (i32) -> () loc("<stdin>":54:5)
  }) : () -> () loc("<stdin>":50:3)
  "func.func"() <{function_type = (!emitc.ptr<i32>) -> i32, sym_name = "double_use"}> ({
  ^bb0(%arg4: !emitc.ptr<i32> loc("<stdin>":57:8)):
    %11 = "emitc.literal"() <{value = "1.0"}> : () -> i32 loc("<stdin>":58:11)
    %12 = "emitc.literal"() <{value = "1.0"}> : () -> i32 loc("<stdin>":59:11)
    %13 = "emitc.literal"() <{value = "10.0"}> : () -> i32 loc("<stdin>":60:11)
    %14 = "scf.while"(%11) ({
    ^bb0(%arg6: i32 loc("<stdin>":62:10)):
      %16 = "emitc.call"(%arg6, %arg4) <{callee = @foo_with_side_effect}> : (i32, !emitc.ptr<i32>) -> i32 loc("<stdin>":63:13)
      %17 = "emitc.add"(%16, %16) : (i32, i32) -> i32 loc("<stdin>":64:13)
      %18 = "emitc.add"(%arg6, %17) : (i32, i32) -> i32 loc("<stdin>":65:13)
      %19 = "emitc.cmp"(%18, %13) <{predicate = 2 : i64}> : (i32, i32) -> i1 loc("<stdin>":66:13)
      "scf.condition"(%19, %arg6) : (i1, i32) -> () loc("<stdin>":67:7)
    }, {
    ^bb0(%arg5: i32 loc("<stdin>":69:10)):
      %15 = "emitc.call"(%arg5) <{callee = @payload_double_use}> : (i32) -> i32 loc("<stdin>":70:13)
      "scf.yield"(%15) : (i32) -> () loc("<stdin>":71:7)
    }) : (i32) -> i32 loc("<stdin>":61:11)
    "func.return"(%14) : (i32) -> () loc("<stdin>":73:5)
  }) : () -> () loc("<stdin>":56:3)
  "emitc.func"() <{function_type = () -> i1, sym_name = "payload_empty_after_region"}> ({
    %10 = "emitc.literal"() <{value = "true"}> : () -> i1 loc("<stdin>":76:11)
    "emitc.return"(%10) : (i1) -> () loc("<stdin>":77:5)
  }) : () -> () loc("<stdin>":75:3)
  "func.func"() <{function_type = () -> (), sym_name = "empty_after_region"}> ({
    "scf.while"() ({
      %9 = "emitc.call"() <{callee = @payload_empty_after_region}> : () -> i1 loc("<stdin>":81:12)
      "scf.condition"(%9) : (i1) -> () loc("<stdin>":82:7)
    }, {
      "scf.yield"() : () -> () loc("<stdin>":84:7)
    }) : () -> () loc("<stdin>":80:5)
    "func.return"() : () -> () loc("<stdin>":86:5)
  }) : () -> () loc("<stdin>":79:3)
  "emitc.func"() <{function_type = (i32) -> i32, sym_name = "payload_different_number_of_vars"}> ({
  ^bb0(%arg3: i32 loc("<stdin>":89:8)):
    %8 = "emitc.add"(%arg3, %arg3) : (i32, i32) -> i32 loc("<stdin>":90:10)
    "emitc.return"(%8) : (i32) -> () loc("<stdin>":91:5)
  }) : () -> () loc("<stdin>":88:3)
  "func.func"() <{function_type = () -> (i32, i32), sym_name = "different_number_of_vars"}> ({
    %0 = "emitc.literal"() <{value = "1.0"}> : () -> i32 loc("<stdin>":94:10)
    %1 = "emitc.literal"() <{value = "7.0"}> : () -> i32 loc("<stdin>":95:10)
    %2 = "emitc.literal"() <{value = "10.0"}> : () -> i32 loc("<stdin>":96:10)
    %3:2 = "scf.while"(%0) ({
    ^bb0(%arg2: i32 loc("<stdin>":98:10)):
      %5 = "emitc.add"(%arg2, %1) : (i32, i32) -> i32 loc("<stdin>":99:12)
      %6 = "emitc.cmp"(%5, %2) <{predicate = 2 : i64}> : (i32, i32) -> i1 loc("<stdin>":100:12)
      %7 = "emitc.add"(%arg2, %arg2) : (i32, i32) -> i32 loc("<stdin>":101:12)
      "scf.condition"(%6, %7, %5) : (i1, i32, i32) -> () loc("<stdin>":102:7)
    }, {
    ^bb0(%arg0: i32 loc("<stdin>":104:10), %arg1: i32 loc("<stdin>":104:22)):
      %4 = "emitc.call"(%arg0) <{callee = @payload_different_number_of_vars}> : (i32) -> i32 loc("<stdin>":105:12)
      "scf.yield"(%4) : (i32) -> () loc("<stdin>":106:7)
    }) : (i32) -> (i32, i32) loc("<stdin>":97:12)
    "func.return"(%3#0, %3#1) : (i32, i32) -> () loc("<stdin>":108:5)
  }) : () -> () loc("<stdin>":93:3)
}) : () -> () loc("<stdin>":1:1)
