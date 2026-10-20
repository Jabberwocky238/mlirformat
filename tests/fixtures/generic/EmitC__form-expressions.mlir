"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32, i32, i32) -> i1, sym_name = "single_expression"}> ({
  ^bb0(%arg24: i32, %arg25: i32, %arg26: i32, %arg27: i32):
    %30 = "emitc.constant"() <{value = 42 : i32}> : () -> i32
    %31 = "emitc.mul"(%arg24, %30) : (i32, i32) -> i32
    %32 = "emitc.sub"(%31, %arg26) : (i32, i32) -> i32
    %33 = "emitc.cmp"(%32, %arg27) <{predicate = 2 : i64}> : (i32, i32) -> i1
    "func.return"(%33) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32) -> (i32, i32), sym_name = "multiple_expressions"}> ({
  ^bb0(%arg20: i32, %arg21: i32, %arg22: i32, %arg23: i32):
    %26 = "emitc.mul"(%arg20, %arg21) : (i32, i32) -> i32
    %27 = "emitc.sub"(%26, %arg22) : (i32, i32) -> i32
    %28 = "emitc.add"(%arg21, %arg23) : (i32, i32) -> i32
    %29 = "emitc.div"(%28, %arg22) : (i32, i32) -> i32
    "func.return"(%27, %29) : (i32, i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32) -> i1, sym_name = "expression_with_call"}> ({
  ^bb0(%arg16: i32, %arg17: i32, %arg18: i32, %arg19: i32):
    %23 = "emitc.mul"(%arg16, %arg17) : (i32, i32) -> i32
    %24 = "emitc.call_opaque"(%23, %arg18) <{callee = "foo"}> : (i32, i32) -> i32
    %25 = "emitc.cmp"(%24, %arg17) <{predicate = 2 : i64}> : (i32, i32) -> i1
    "func.return"(%25) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, !emitc.ptr<i32>) -> i1, sym_name = "expression_with_dereference"}> ({
  ^bb0(%arg13: i32, %arg14: i32, %arg15: !emitc.ptr<i32>):
    %20 = "emitc.mul"(%arg13, %arg14) : (i32, i32) -> i32
    %21 = "emitc.apply"(%arg15) <{applicableOperator = "*"}> : (!emitc.ptr<i32>) -> i32
    %22 = "emitc.cmp"(%20, %21) <{predicate = 2 : i64}> : (i32, i32) -> i1
    "func.return"(%22) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, !emitc.ptr<i32>) -> i1, sym_name = "expression_with_address_taken"}> ({
  ^bb0(%arg10: i32, %arg11: i32, %arg12: !emitc.ptr<i32>):
    %16 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    %17 = "emitc.apply"(%16) <{applicableOperator = "&"}> : (!emitc.lvalue<i32>) -> !emitc.ptr<i32>
    %18 = "emitc.add"(%17, %arg11) : (!emitc.ptr<i32>, i32) -> !emitc.ptr<i32>
    %19 = "emitc.cmp"(%18, %arg12) <{predicate = 2 : i64}> : (!emitc.ptr<i32>, !emitc.ptr<i32>) -> i1
    "func.return"(%19) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> i1, sym_name = "no_nested_expression"}> ({
  ^bb0(%arg6: i32, %arg7: i32):
    %14 = "emitc.expression"(%arg6, %arg7) ({
    ^bb0(%arg8: i32, %arg9: i32):
      %15 = "emitc.cmp"(%arg8, %arg9) <{predicate = 2 : i64}> : (i32, i32) -> i1
      "emitc.yield"(%15) : (i1) -> ()
    }) : (i32, i32) -> i1
    "func.return"(%14) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (i32, i32), sym_name = "single_result_requirement"}> ({
    %13:2 = "emitc.call_opaque"() <{callee = "foo"}> : () -> (i32, i32)
    "func.return"(%13#0, %13#1) : (i32, i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, !emitc.ptr<i32>) -> i1, sym_name = "expression_with_load"}> ({
  ^bb0(%arg4: i32, %arg5: !emitc.ptr<i32>):
    %6 = "emitc.constant"() <{value = 0 : i64}> : () -> i64
    %7 = "emitc.variable"() <{value = #emitc.opaque<"42">}> : () -> !emitc.lvalue<i32>
    %8 = "emitc.load"(%7) : (!emitc.lvalue<i32>) -> i32
    %9 = "emitc.subscript"(%arg5, %6) : (!emitc.ptr<i32>, i64) -> !emitc.lvalue<i32>
    %10 = "emitc.load"(%9) : (!emitc.lvalue<i32>) -> i32
    %11 = "emitc.add"(%8, %10) : (i32, i32) -> i32
    %12 = "emitc.cmp"(%11, %arg4) <{predicate = 2 : i64}> : (i32, i32) -> i1
    "func.return"(%12) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, !emitc.opaque<"T0">, i32) -> i1, sym_name = "opaque_type_expression"}> ({
  ^bb0(%arg1: i32, %arg2: !emitc.opaque<"T0">, %arg3: i32):
    %2 = "emitc.constant"() <{value = #emitc.opaque<"V">}> : () -> !emitc.opaque<"T1">
    %3 = "emitc.mul"(%arg1, %2) : (i32, !emitc.opaque<"T1">) -> i32
    %4 = "emitc.sub"(%3, %arg2) : (i32, !emitc.opaque<"T0">) -> i32
    %5 = "emitc.cmp"(%4, %arg3) <{predicate = 2 : i64}> : (i32, i32) -> i1
    "func.return"(%5) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "expression_with_constant"}> ({
  ^bb0(%arg0: i32):
    %0 = "emitc.constant"() <{value = 42 : i32}> : () -> i32
    %1 = "emitc.mul"(%arg0, %0) : (i32, i32) -> i32
    "func.return"(%1) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

