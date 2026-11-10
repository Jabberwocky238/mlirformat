"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32, i32, i32) -> i1, sym_name = "single_expression"}> ({
  ^bb0(%arg31: i32, %arg32: i32, %arg33: i32, %arg34: i32):
    %54 = "emitc.constant"() <{value = 42 : i32}> : () -> i32
    %55 = "emitc.mul"(%arg31, %54) : (i32, i32) -> i32
    %56 = "emitc.sub"(%55, %arg33) : (i32, i32) -> i32
    %57 = "emitc.cmp"(%56, %arg34) <{predicate = 2 : i64}> : (i32, i32) -> i1
    "func.return"(%57) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> i1, sym_name = "expression_recurring_args"}> ({
  ^bb0(%arg29: i32, %arg30: i32):
    %51 = "emitc.mul"(%arg29, %arg30) : (i32, i32) -> i32
    %52 = "emitc.sub"(%51, %arg29) : (i32, i32) -> i32
    %53 = "emitc.cmp"(%52, %arg30) <{predicate = 2 : i64}> : (i32, i32) -> i1
    "func.return"(%53) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32) -> (i32, i32), sym_name = "multiple_expressions"}> ({
  ^bb0(%arg25: i32, %arg26: i32, %arg27: i32, %arg28: i32):
    %47 = "emitc.mul"(%arg25, %arg26) : (i32, i32) -> i32
    %48 = "emitc.sub"(%47, %arg27) : (i32, i32) -> i32
    %49 = "emitc.add"(%arg26, %arg28) : (i32, i32) -> i32
    %50 = "emitc.div"(%49, %arg27) : (i32, i32) -> i32
    "func.return"(%48, %50) : (i32, i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32) -> i1, sym_name = "expression_with_call"}> ({
  ^bb0(%arg21: i32, %arg22: i32, %arg23: i32, %arg24: i32):
    %44 = "emitc.mul"(%arg21, %arg22) : (i32, i32) -> i32
    %45 = "emitc.call_opaque"(%44, %arg23) <{callee = "foo"}> : (i32, i32) -> i32
    %46 = "emitc.cmp"(%45, %arg22) <{predicate = 2 : i64}> : (i32, i32) -> i1
    "func.return"(%46) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> i1, sym_name = "no_nested_expression"}> ({
  ^bb0(%arg17: i32, %arg18: i32):
    %42 = "emitc.expression"(%arg17, %arg18) ({
    ^bb0(%arg19: i32, %arg20: i32):
      %43 = "emitc.cmp"(%arg19, %arg20) <{predicate = 2 : i64}> : (i32, i32) -> i1
      "emitc.yield"(%43) : (i1) -> ()
    }) : (i32, i32) -> i1
    "func.return"(%42) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (i32, i32), sym_name = "single_result_requirement"}> ({
    %41:2 = "emitc.call_opaque"() <{callee = "foo"}> : () -> (i32, i32)
    "func.return"(%41#0, %41#1) : (i32, i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, !emitc.ptr<i32>) -> i1, sym_name = "expression_with_load"}> ({
  ^bb0(%arg15: i32, %arg16: !emitc.ptr<i32>):
    %34 = "emitc.constant"() <{value = 0 : i64}> : () -> i64
    %35 = "emitc.variable"() <{value = #emitc.opaque<"42">}> : () -> !emitc.lvalue<i32>
    %36 = "emitc.load"(%35) : (!emitc.lvalue<i32>) -> i32
    %37 = "emitc.subscript"(%arg16, %34) : (!emitc.ptr<i32>, i64) -> !emitc.lvalue<i32>
    %38 = "emitc.load"(%37) : (!emitc.lvalue<i32>) -> i32
    %39 = "emitc.add"(%36, %38) : (i32, i32) -> i32
    %40 = "emitc.cmp"(%39, %arg15) <{predicate = 2 : i64}> : (i32, i32) -> i1
    "func.return"(%40) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, !emitc.opaque<"T0">, i32) -> i1, sym_name = "opaque_type_expression"}> ({
  ^bb0(%arg12: i32, %arg13: !emitc.opaque<"T0">, %arg14: i32):
    %30 = "emitc.constant"() <{value = #emitc.opaque<"V">}> : () -> !emitc.opaque<"T1">
    %31 = "emitc.mul"(%arg12, %30) : (i32, !emitc.opaque<"T1">) -> i32
    %32 = "emitc.sub"(%31, %arg13) : (i32, !emitc.opaque<"T0">) -> i32
    %33 = "emitc.cmp"(%32, %arg14) <{predicate = 2 : i64}> : (i32, i32) -> i1
    "func.return"(%33) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "expression_with_constant"}> ({
  ^bb0(%arg11: i32):
    %28 = "emitc.constant"() <{value = 42 : i32}> : () -> i32
    %29 = "emitc.mul"(%arg11, %28) : (i32, i32) -> i32
    "func.return"(%29) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "identity_cast_folded"}> ({
  ^bb0(%arg10: i32):
    %26 = "emitc.cast"(%arg10) : (i32) -> i32
    %27 = "emitc.bitwise_and"(%26, %arg10) : (i32, i32) -> i32
    "func.return"(%27) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!emitc.array<4x8xi32>, i32, i32) -> i32, sym_name = "expression_with_subscript"}> ({
  ^bb0(%arg7: !emitc.array<4x8xi32>, %arg8: i32, %arg9: i32):
    %22 = "emitc.add"(%arg8, %arg9) : (i32, i32) -> i32
    %23 = "emitc.mul"(%22, %arg9) : (i32, i32) -> i32
    %24 = "emitc.subscript"(%arg7, %22, %23) : (!emitc.array<4x8xi32>, i32, i32) -> !emitc.lvalue<i32>
    %25 = "emitc.load"(%24) : (!emitc.lvalue<i32>) -> i32
    "func.return"(%25) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!emitc.opaque<"mystruct">, i32, index) -> (), sym_name = "member"}> ({
  ^bb0(%arg4: !emitc.opaque<"mystruct">, %arg5: i32, %arg6: index):
    %12 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<!emitc.opaque<"mystruct">>
    "emitc.assign"(%12, %arg4) : (!emitc.lvalue<!emitc.opaque<"mystruct">>, !emitc.opaque<"mystruct">) -> ()
    %13 = "emitc.member"(%12) <{member = "a"}> : (!emitc.lvalue<!emitc.opaque<"mystruct">>) -> !emitc.lvalue<i32>
    "emitc.assign"(%13, %arg5) : (!emitc.lvalue<i32>, i32) -> ()
    %14 = "emitc.member"(%12) <{member = "b"}> : (!emitc.lvalue<!emitc.opaque<"mystruct">>) -> !emitc.lvalue<i32>
    %15 = "emitc.load"(%14) : (!emitc.lvalue<i32>) -> i32
    %16 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    "emitc.assign"(%16, %15) : (!emitc.lvalue<i32>, i32) -> ()
    %17 = "emitc.member"(%12) <{member = "c"}> : (!emitc.lvalue<!emitc.opaque<"mystruct">>) -> !emitc.array<2xi32>
    %18 = "emitc.subscript"(%17, %arg6) : (!emitc.array<2xi32>, index) -> !emitc.lvalue<i32>
    %19 = "emitc.load"(%18) : (!emitc.lvalue<i32>) -> i32
    "emitc.assign"(%16, %19) : (!emitc.lvalue<i32>, i32) -> ()
    %20 = "emitc.member"(%12) <{member = "d"}> : (!emitc.lvalue<!emitc.opaque<"mystruct">>) -> !emitc.array<2xi32>
    %21 = "emitc.subscript"(%20, %arg6) : (!emitc.array<2xi32>, index) -> !emitc.lvalue<i32>
    "emitc.assign"(%21, %arg5) : (!emitc.lvalue<i32>, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!emitc.ptr<!emitc.opaque<"mystruct">>, i32, index) -> (), sym_name = "member_of_pointer"}> ({
  ^bb0(%arg1: !emitc.ptr<!emitc.opaque<"mystruct">>, %arg2: i32, %arg3: index):
    %2 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>
    "emitc.assign"(%2, %arg1) : (!emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>, !emitc.ptr<!emitc.opaque<"mystruct">>) -> ()
    %3 = "emitc.member_of_ptr"(%2) <{member = "a"}> : (!emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>) -> !emitc.lvalue<i32>
    "emitc.assign"(%3, %arg2) : (!emitc.lvalue<i32>, i32) -> ()
    %4 = "emitc.member_of_ptr"(%2) <{member = "b"}> : (!emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>) -> !emitc.lvalue<i32>
    %5 = "emitc.load"(%4) : (!emitc.lvalue<i32>) -> i32
    %6 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    "emitc.assign"(%6, %5) : (!emitc.lvalue<i32>, i32) -> ()
    %7 = "emitc.member_of_ptr"(%2) <{member = "c"}> : (!emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>) -> !emitc.array<2xi32>
    %8 = "emitc.subscript"(%7, %arg3) : (!emitc.array<2xi32>, index) -> !emitc.lvalue<i32>
    %9 = "emitc.load"(%8) : (!emitc.lvalue<i32>) -> i32
    "emitc.assign"(%6, %9) : (!emitc.lvalue<i32>, i32) -> ()
    %10 = "emitc.member_of_ptr"(%2) <{member = "d"}> : (!emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>) -> !emitc.array<2xi32>
    %11 = "emitc.subscript"(%10, %arg3) : (!emitc.array<2xi32>, index) -> !emitc.lvalue<i32>
    "emitc.assign"(%11, %arg2) : (!emitc.lvalue<i32>, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> f32, sym_name = "expression_with_literal"}> ({
  ^bb0(%arg0: f32):
    %0 = "emitc.literal"() <{value = "M_PI"}> : () -> f32
    %1 = "emitc.add"(%arg0, %0) : (f32, f32) -> f32
    "func.return"(%1) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

