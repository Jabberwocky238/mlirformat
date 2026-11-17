"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32, i32, i32) -> i1, sym_name = "single_expression"}> ({
  ^bb0(%arg31: i32 loc("<stdin>":3:8), %arg32: i32 loc("<stdin>":3:21), %arg33: i32 loc("<stdin>":3:34), %arg34: i32 loc("<stdin>":3:47)):
    %54 = "emitc.constant"() <{value = 42 : i32}> : () -> i32 loc("<stdin>":4:11)
    %55 = "emitc.mul"(%arg31, %54) : (i32, i32) -> i32 loc("<stdin>":5:11)
    %56 = "emitc.sub"(%55, %arg33) : (i32, i32) -> i32 loc("<stdin>":6:11)
    %57 = "emitc.cmp"(%56, %arg34) <{predicate = 2 : i64}> : (i32, i32) -> i1 loc("<stdin>":7:11)
    "func.return"(%57) : (i1) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (i32, i32) -> i1, sym_name = "expression_recurring_args"}> ({
  ^bb0(%arg29: i32 loc("<stdin>":11:8), %arg30: i32 loc("<stdin>":11:21)):
    %51 = "emitc.mul"(%arg29, %arg30) : (i32, i32) -> i32 loc("<stdin>":12:11)
    %52 = "emitc.sub"(%51, %arg29) : (i32, i32) -> i32 loc("<stdin>":13:11)
    %53 = "emitc.cmp"(%52, %arg30) <{predicate = 2 : i64}> : (i32, i32) -> i1 loc("<stdin>":14:11)
    "func.return"(%53) : (i1) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":10:3)
  "func.func"() <{function_type = (i32, i32, i32, i32) -> (i32, i32), sym_name = "multiple_expressions"}> ({
  ^bb0(%arg25: i32 loc("<stdin>":18:8), %arg26: i32 loc("<stdin>":18:21), %arg27: i32 loc("<stdin>":18:34), %arg28: i32 loc("<stdin>":18:47)):
    %47 = "emitc.mul"(%arg25, %arg26) : (i32, i32) -> i32 loc("<stdin>":19:11)
    %48 = "emitc.sub"(%47, %arg27) : (i32, i32) -> i32 loc("<stdin>":20:11)
    %49 = "emitc.add"(%arg26, %arg28) : (i32, i32) -> i32 loc("<stdin>":21:11)
    %50 = "emitc.div"(%49, %arg27) : (i32, i32) -> i32 loc("<stdin>":22:11)
    "func.return"(%48, %50) : (i32, i32) -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (i32, i32, i32, i32) -> i1, sym_name = "expression_with_call"}> ({
  ^bb0(%arg21: i32 loc("<stdin>":26:8), %arg22: i32 loc("<stdin>":26:21), %arg23: i32 loc("<stdin>":26:34), %arg24: i32 loc("<stdin>":26:47)):
    %44 = "emitc.mul"(%arg21, %arg22) : (i32, i32) -> i32 loc("<stdin>":27:11)
    %45 = "emitc.call_opaque"(%44, %arg23) <{callee = "foo"}> : (i32, i32) -> i32 loc("<stdin>":28:11)
    %46 = "emitc.cmp"(%45, %arg22) <{predicate = 2 : i64}> : (i32, i32) -> i1 loc("<stdin>":29:11)
    "func.return"(%46) : (i1) -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":25:3)
  "func.func"() <{function_type = (i32, i32) -> i1, sym_name = "no_nested_expression"}> ({
  ^bb0(%arg17: i32 loc("<stdin>":33:8), %arg18: i32 loc("<stdin>":33:21)):
    %42 = "emitc.expression"(%arg17, %arg18) ({
    ^bb0(%arg19: i32 loc("<stdin>":35:10), %arg20: i32 loc("<stdin>":35:23)):
      %43 = "emitc.cmp"(%arg19, %arg20) <{predicate = 2 : i64}> : (i32, i32) -> i1 loc("<stdin>":36:13)
      "emitc.yield"(%43) : (i1) -> () loc("<stdin>":37:7)
    }) : (i32, i32) -> i1 loc("<stdin>":34:11)
    "func.return"(%42) : (i1) -> () loc("<stdin>":39:5)
  }) : () -> () loc("<stdin>":32:3)
  "func.func"() <{function_type = () -> (i32, i32), sym_name = "single_result_requirement"}> ({
    %41:2 = "emitc.call_opaque"() <{callee = "foo"}> : () -> (i32, i32) loc("<stdin>":42:13)
    "func.return"(%41#0, %41#1) : (i32, i32) -> () loc("<stdin>":43:5)
  }) : () -> () loc("<stdin>":41:3)
  "func.func"() <{function_type = (i32, !emitc.ptr<i32>) -> i1, sym_name = "expression_with_load"}> ({
  ^bb0(%arg15: i32 loc("<stdin>":46:8), %arg16: !emitc.ptr<i32> loc("<stdin>":46:21)):
    %34 = "emitc.constant"() <{value = 0 : i64}> : () -> i64 loc("<stdin>":47:11)
    %35 = "emitc.variable"() <{value = #emitc.opaque<"42">}> : () -> !emitc.lvalue<i32> loc("<stdin>":48:11)
    %36 = "emitc.load"(%35) : (!emitc.lvalue<i32>) -> i32 loc("<stdin>":49:11)
    %37 = "emitc.subscript"(%arg16, %34) : (!emitc.ptr<i32>, i64) -> !emitc.lvalue<i32> loc("<stdin>":50:11)
    %38 = "emitc.load"(%37) : (!emitc.lvalue<i32>) -> i32 loc("<stdin>":51:11)
    %39 = "emitc.add"(%36, %38) : (i32, i32) -> i32 loc("<stdin>":52:11)
    %40 = "emitc.cmp"(%39, %arg15) <{predicate = 2 : i64}> : (i32, i32) -> i1 loc("<stdin>":53:11)
    "func.return"(%40) : (i1) -> () loc("<stdin>":54:5)
  }) : () -> () loc("<stdin>":45:3)
  "func.func"() <{function_type = (i32, !emitc.opaque<"T0">, i32) -> i1, sym_name = "opaque_type_expression"}> ({
  ^bb0(%arg12: i32 loc("<stdin>":57:8), %arg13: !emitc.opaque<"T0"> loc("<stdin>":57:21), %arg14: i32 loc("<stdin>":57:50)):
    %30 = "emitc.constant"() <{value = #emitc.opaque<"V">}> : () -> !emitc.opaque<"T1"> loc("<stdin>":58:11)
    %31 = "emitc.mul"(%arg12, %30) : (i32, !emitc.opaque<"T1">) -> i32 loc("<stdin>":59:11)
    %32 = "emitc.sub"(%31, %arg13) : (i32, !emitc.opaque<"T0">) -> i32 loc("<stdin>":60:11)
    %33 = "emitc.cmp"(%32, %arg14) <{predicate = 2 : i64}> : (i32, i32) -> i1 loc("<stdin>":61:11)
    "func.return"(%33) : (i1) -> () loc("<stdin>":62:5)
  }) : () -> () loc("<stdin>":56:3)
  "func.func"() <{function_type = (i32) -> i32, sym_name = "expression_with_constant"}> ({
  ^bb0(%arg11: i32 loc("<stdin>":65:8)):
    %28 = "emitc.constant"() <{value = 42 : i32}> : () -> i32 loc("<stdin>":66:11)
    %29 = "emitc.mul"(%arg11, %28) : (i32, i32) -> i32 loc("<stdin>":67:11)
    "func.return"(%29) : (i32) -> () loc("<stdin>":68:5)
  }) : () -> () loc("<stdin>":64:3)
  "func.func"() <{function_type = (i32) -> i32, sym_name = "identity_cast_folded"}> ({
  ^bb0(%arg10: i32 loc("<stdin>":71:8)):
    %26 = "emitc.cast"(%arg10) : (i32) -> i32 loc("<stdin>":72:11)
    %27 = "emitc.bitwise_and"(%26, %arg10) : (i32, i32) -> i32 loc("<stdin>":73:11)
    "func.return"(%27) : (i32) -> () loc("<stdin>":74:5)
  }) : () -> () loc("<stdin>":70:3)
  "func.func"() <{function_type = (!emitc.array<4x8xi32>, i32, i32) -> i32, sym_name = "expression_with_subscript"}> ({
  ^bb0(%arg7: !emitc.array<4x8xi32> loc("<stdin>":77:8), %arg8: i32 loc("<stdin>":77:38), %arg9: i32 loc("<stdin>":77:50)):
    %22 = "emitc.add"(%arg8, %arg9) : (i32, i32) -> i32 loc("<stdin>":78:11)
    %23 = "emitc.mul"(%22, %arg9) : (i32, i32) -> i32 loc("<stdin>":79:11)
    %24 = "emitc.subscript"(%arg7, %22, %23) : (!emitc.array<4x8xi32>, i32, i32) -> !emitc.lvalue<i32> loc("<stdin>":80:11)
    %25 = "emitc.load"(%24) : (!emitc.lvalue<i32>) -> i32 loc("<stdin>":81:11)
    "func.return"(%25) : (i32) -> () loc("<stdin>":82:5)
  }) : () -> () loc("<stdin>":76:3)
  "func.func"() <{function_type = (!emitc.opaque<"mystruct">, i32, index) -> (), sym_name = "member"}> ({
  ^bb0(%arg4: !emitc.opaque<"mystruct"> loc("<stdin>":85:8), %arg5: i32 loc("<stdin>":85:42), %arg6: index loc("<stdin>":85:54)):
    %12 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<!emitc.opaque<"mystruct">> loc("<stdin>":86:11)
    "emitc.assign"(%12, %arg4) : (!emitc.lvalue<!emitc.opaque<"mystruct">>, !emitc.opaque<"mystruct">) -> () loc("<stdin>":87:5)
    %13 = "emitc.member"(%12) <{member = "a"}> : (!emitc.lvalue<!emitc.opaque<"mystruct">>) -> !emitc.lvalue<i32> loc("<stdin>":88:11)
    "emitc.assign"(%13, %arg5) : (!emitc.lvalue<i32>, i32) -> () loc("<stdin>":89:5)
    %14 = "emitc.member"(%12) <{member = "b"}> : (!emitc.lvalue<!emitc.opaque<"mystruct">>) -> !emitc.lvalue<i32> loc("<stdin>":90:11)
    %15 = "emitc.load"(%14) : (!emitc.lvalue<i32>) -> i32 loc("<stdin>":91:11)
    %16 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32> loc("<stdin>":92:11)
    "emitc.assign"(%16, %15) : (!emitc.lvalue<i32>, i32) -> () loc("<stdin>":93:5)
    %17 = "emitc.member"(%12) <{member = "c"}> : (!emitc.lvalue<!emitc.opaque<"mystruct">>) -> !emitc.array<2xi32> loc("<stdin>":94:11)
    %18 = "emitc.subscript"(%17, %arg6) : (!emitc.array<2xi32>, index) -> !emitc.lvalue<i32> loc("<stdin>":95:11)
    %19 = "emitc.load"(%18) : (!emitc.lvalue<i32>) -> i32 loc("<stdin>":96:11)
    "emitc.assign"(%16, %19) : (!emitc.lvalue<i32>, i32) -> () loc("<stdin>":97:5)
    %20 = "emitc.member"(%12) <{member = "d"}> : (!emitc.lvalue<!emitc.opaque<"mystruct">>) -> !emitc.array<2xi32> loc("<stdin>":98:11)
    %21 = "emitc.subscript"(%20, %arg6) : (!emitc.array<2xi32>, index) -> !emitc.lvalue<i32> loc("<stdin>":99:11)
    "emitc.assign"(%21, %arg5) : (!emitc.lvalue<i32>, i32) -> () loc("<stdin>":100:5)
    "func.return"() : () -> () loc("<stdin>":101:5)
  }) : () -> () loc("<stdin>":84:3)
  "func.func"() <{function_type = (!emitc.ptr<!emitc.opaque<"mystruct">>, i32, index) -> (), sym_name = "member_of_pointer"}> ({
  ^bb0(%arg1: !emitc.ptr<!emitc.opaque<"mystruct">> loc("<stdin>":104:8), %arg2: i32 loc("<stdin>":104:54), %arg3: index loc("<stdin>":104:66)):
    %2 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>> loc("<stdin>":105:10)
    "emitc.assign"(%2, %arg1) : (!emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>, !emitc.ptr<!emitc.opaque<"mystruct">>) -> () loc("<stdin>":106:5)
    %3 = "emitc.member_of_ptr"(%2) <{member = "a"}> : (!emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>) -> !emitc.lvalue<i32> loc("<stdin>":107:10)
    "emitc.assign"(%3, %arg2) : (!emitc.lvalue<i32>, i32) -> () loc("<stdin>":108:5)
    %4 = "emitc.member_of_ptr"(%2) <{member = "b"}> : (!emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>) -> !emitc.lvalue<i32> loc("<stdin>":109:10)
    %5 = "emitc.load"(%4) : (!emitc.lvalue<i32>) -> i32 loc("<stdin>":110:10)
    %6 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32> loc("<stdin>":111:10)
    "emitc.assign"(%6, %5) : (!emitc.lvalue<i32>, i32) -> () loc("<stdin>":112:5)
    %7 = "emitc.member_of_ptr"(%2) <{member = "c"}> : (!emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>) -> !emitc.array<2xi32> loc("<stdin>":113:10)
    %8 = "emitc.subscript"(%7, %arg3) : (!emitc.array<2xi32>, index) -> !emitc.lvalue<i32> loc("<stdin>":114:10)
    %9 = "emitc.load"(%8) : (!emitc.lvalue<i32>) -> i32 loc("<stdin>":115:10)
    "emitc.assign"(%6, %9) : (!emitc.lvalue<i32>, i32) -> () loc("<stdin>":116:5)
    %10 = "emitc.member_of_ptr"(%2) <{member = "d"}> : (!emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>) -> !emitc.array<2xi32> loc("<stdin>":117:11)
    %11 = "emitc.subscript"(%10, %arg3) : (!emitc.array<2xi32>, index) -> !emitc.lvalue<i32> loc("<stdin>":118:11)
    "emitc.assign"(%11, %arg2) : (!emitc.lvalue<i32>, i32) -> () loc("<stdin>":119:5)
    "func.return"() : () -> () loc("<stdin>":120:5)
  }) : () -> () loc("<stdin>":103:3)
  "func.func"() <{function_type = (f32) -> f32, sym_name = "expression_with_literal"}> ({
  ^bb0(%arg0: f32 loc("<stdin>":123:8)):
    %0 = "emitc.literal"() <{value = "M_PI"}> : () -> f32 loc("<stdin>":124:10)
    %1 = "emitc.add"(%arg0, %0) : (f32, f32) -> f32 loc("<stdin>":125:10)
    "func.return"(%1) : (f32) -> () loc("<stdin>":126:5)
  }) : () -> () loc("<stdin>":122:3)
}) : () -> () loc("<stdin>":1:1)
