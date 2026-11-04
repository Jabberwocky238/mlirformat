"builtin.module"() ({
  "emitc.func"() <{function_type = (!emitc.ptr<i32>) -> (), sym_name = "emitc_do"}> ({
  ^bb0(%arg15: !emitc.ptr<i32>):
    %28 = "emitc.variable"() <{value = 0 : i32}> : () -> !emitc.lvalue<i32>
    %29 = "emitc.literal"() <{value = "10"}> : () -> i32
    %30 = "emitc.literal"() <{value = "1"}> : () -> i32
    "emitc.do"() ({
      "emitc.verbatim"(%arg15) <{value = "printf(\22%d\22, *{});"}> : (!emitc.ptr<i32>) -> ()
      %34 = "emitc.load"(%28) : (!emitc.lvalue<i32>) -> i32
      %35 = "emitc.add"(%34, %30) : (i32, i32) -> i32
      "emitc.assign"(%28, %35) : (!emitc.lvalue<i32>, i32) -> ()
    }, {
      %31 = "emitc.expression"(%28, %29) ({
      ^bb0(%arg16: !emitc.lvalue<i32>, %arg17: i32):
        %32 = "emitc.load"(%arg16) : (!emitc.lvalue<i32>) -> i32
        %33 = "emitc.cmp"(%32, %arg17) <{predicate = 3 : i64}> : (i32, i32) -> i1
        "emitc.yield"(%33) : (i1) -> ()
      }) : (!emitc.lvalue<i32>, i32) -> i1
      "emitc.yield"(%31) : (i1) -> ()
    }) : () -> ()
    "emitc.return"() : () -> ()
  }) : () -> ()
  "emitc.func"() <{function_type = (!emitc.ptr<i32>) -> (), sym_name = "emitc_do_with_expression"}> ({
  ^bb0(%arg10: !emitc.ptr<i32>):
    %18 = "emitc.variable"() <{value = 0 : i32}> : () -> !emitc.lvalue<i32>
    %19 = "emitc.literal"() <{value = "10"}> : () -> i32
    %20 = "emitc.literal"() <{value = "1"}> : () -> i32
    %21 = "emitc.expression"(%19, %20) ({
    ^bb0(%arg13: i32, %arg14: i32):
      %27 = "emitc.add"(%arg13, %arg14) : (i32, i32) -> i32
      "emitc.yield"(%27) : (i32) -> ()
    }) : (i32, i32) -> i32
    "emitc.do"() ({
      "emitc.verbatim"(%arg10) <{value = "printf(\22%d\22, *{});"}> : (!emitc.ptr<i32>) -> ()
      %25 = "emitc.load"(%18) : (!emitc.lvalue<i32>) -> i32
      %26 = "emitc.add"(%25, %20) : (i32, i32) -> i32
      "emitc.assign"(%18, %26) : (!emitc.lvalue<i32>, i32) -> ()
    }, {
      %22 = "emitc.expression"(%18, %21) ({
      ^bb0(%arg11: !emitc.lvalue<i32>, %arg12: i32):
        %23 = "emitc.load"(%arg11) : (!emitc.lvalue<i32>) -> i32
        %24 = "emitc.cmp"(%23, %arg12) <{predicate = 3 : i64}> : (i32, i32) -> i1
        "emitc.yield"(%24) : (i1) -> ()
      }) : (!emitc.lvalue<i32>, i32) -> i1
      "emitc.yield"(%22) : (i1) -> ()
    }) : () -> ()
    "emitc.return"() : () -> ()
  }) : () -> ()
  "emitc.func"() <{function_type = () -> (), sym_name = "emitc_double_do"}> ({
    %3 = "emitc.variable"() <{value = 0 : i32}> : () -> !emitc.lvalue<i32>
    %4 = "emitc.variable"() <{value = 0 : i32}> : () -> !emitc.lvalue<i32>
    %5 = "emitc.literal"() <{value = "1"}> : () -> i32
    %6 = "emitc.literal"() <{value = "3"}> : () -> i32
    %7 = "emitc.literal"() <{value = "5"}> : () -> i32
    "emitc.do"() ({
      %11 = "emitc.load"(%3) : (!emitc.lvalue<i32>) -> i32
      "emitc.do"() ({
        %16 = "emitc.load"(%4) : (!emitc.lvalue<i32>) -> i32
        "emitc.verbatim"(%11, %16) <{value = "printf(\22i = %d, j = %d\22, {}, {});"}> : (i32, i32) -> ()
        %17 = "emitc.add"(%16, %5) : (i32, i32) -> i32
        "emitc.assign"(%4, %17) : (!emitc.lvalue<i32>, i32) -> ()
      }, {
        %13 = "emitc.expression"(%4, %7) ({
        ^bb0(%arg8: !emitc.lvalue<i32>, %arg9: i32):
          %14 = "emitc.load"(%arg8) : (!emitc.lvalue<i32>) -> i32
          %15 = "emitc.cmp"(%14, %arg9) <{predicate = 3 : i64}> : (i32, i32) -> i1
          "emitc.yield"(%15) : (i1) -> ()
        }) : (!emitc.lvalue<i32>, i32) -> i1
        "emitc.yield"(%13) : (i1) -> ()
      }) : () -> ()
      %12 = "emitc.add"(%11, %5) : (i32, i32) -> i32
      "emitc.assign"(%3, %12) : (!emitc.lvalue<i32>, i32) -> ()
    }, {
      %8 = "emitc.expression"(%3, %6) ({
      ^bb0(%arg6: !emitc.lvalue<i32>, %arg7: i32):
        %9 = "emitc.load"(%arg6) : (!emitc.lvalue<i32>) -> i32
        %10 = "emitc.cmp"(%9, %arg7) <{predicate = 3 : i64}> : (i32, i32) -> i1
        "emitc.yield"(%10) : (i1) -> ()
      }) : (!emitc.lvalue<i32>, i32) -> i1
      "emitc.yield"(%8) : (i1) -> ()
    }) : () -> ()
    "emitc.return"() : () -> ()
  }) : () -> ()
  "emitc.func"() <{function_type = (i32, i32) -> i1, sym_name = "payload_do_with_empty_body"}> ({
  ^bb0(%arg4: i32, %arg5: i32):
    %2 = "emitc.cmp"(%arg4, %arg5) <{predicate = 2 : i64}> : (i32, i32) -> i1
    "emitc.return"(%2) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "emitc_do_with_empty_body"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    "emitc.do"() ({
    ^bb0:
    }, {
      %0 = "emitc.expression"(%arg0, %arg1) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %1 = "emitc.call"(%arg2, %arg3) <{callee = @payload_do_with_empty_body}> : (i32, i32) -> i1
        "emitc.yield"(%1) : (i1) -> ()
      }) : (i32, i32) -> i1
      "emitc.yield"(%0) : (i1) -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

