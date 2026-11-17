"builtin.module"() ({
  "emitc.func"() <{function_type = (!emitc.ptr<i32>) -> (), sym_name = "emitc_do"}> ({
  ^bb0(%arg15: !emitc.ptr<i32> loc("<stdin>":3:8)):
    %28 = "emitc.variable"() <{value = 0 : i32}> : () -> !emitc.lvalue<i32> loc("<stdin>":4:11)
    %29 = "emitc.literal"() <{value = "10"}> : () -> i32 loc("<stdin>":5:11)
    %30 = "emitc.literal"() <{value = "1"}> : () -> i32 loc("<stdin>":6:11)
    "emitc.do"() ({
      "emitc.verbatim"(%arg15) <{value = "printf(\22%d\22, *{});"}> : (!emitc.ptr<i32>) -> () loc("<stdin>":8:7)
      %34 = "emitc.load"(%28) : (!emitc.lvalue<i32>) -> i32 loc("<stdin>":9:13)
      %35 = "emitc.add"(%34, %30) : (i32, i32) -> i32 loc("<stdin>":10:13)
      "emitc.assign"(%28, %35) : (!emitc.lvalue<i32>, i32) -> () loc("<stdin>":11:7)
    }, {
      %31 = "emitc.expression"(%28, %29) ({
      ^bb0(%arg16: !emitc.lvalue<i32> loc("<stdin>":14:12), %arg17: i32 loc("<stdin>":14:40)):
        %32 = "emitc.load"(%arg16) : (!emitc.lvalue<i32>) -> i32 loc("<stdin>":15:15)
        %33 = "emitc.cmp"(%32, %arg17) <{predicate = 3 : i64}> : (i32, i32) -> i1 loc("<stdin>":16:15)
        "emitc.yield"(%33) : (i1) -> () loc("<stdin>":17:9)
      }) : (!emitc.lvalue<i32>, i32) -> i1 loc("<stdin>":13:13)
      "emitc.yield"(%31) : (i1) -> () loc("<stdin>":19:7)
    }) : () -> () loc("<stdin>":7:5)
    "emitc.return"() : () -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":2:3)
  "emitc.func"() <{function_type = (!emitc.ptr<i32>) -> (), sym_name = "emitc_do_with_expression"}> ({
  ^bb0(%arg10: !emitc.ptr<i32> loc("<stdin>":24:8)):
    %18 = "emitc.variable"() <{value = 0 : i32}> : () -> !emitc.lvalue<i32> loc("<stdin>":25:11)
    %19 = "emitc.literal"() <{value = "10"}> : () -> i32 loc("<stdin>":26:11)
    %20 = "emitc.literal"() <{value = "1"}> : () -> i32 loc("<stdin>":27:11)
    %21 = "emitc.expression"(%19, %20) ({
    ^bb0(%arg13: i32 loc("<stdin>":29:10), %arg14: i32 loc("<stdin>":29:23)):
      %27 = "emitc.add"(%arg13, %arg14) : (i32, i32) -> i32 loc("<stdin>":30:13)
      "emitc.yield"(%27) : (i32) -> () loc("<stdin>":31:7)
    }) : (i32, i32) -> i32 loc("<stdin>":28:11)
    "emitc.do"() ({
      "emitc.verbatim"(%arg10) <{value = "printf(\22%d\22, *{});"}> : (!emitc.ptr<i32>) -> () loc("<stdin>":34:7)
      %25 = "emitc.load"(%18) : (!emitc.lvalue<i32>) -> i32 loc("<stdin>":35:13)
      %26 = "emitc.add"(%25, %20) : (i32, i32) -> i32 loc("<stdin>":36:13)
      "emitc.assign"(%18, %26) : (!emitc.lvalue<i32>, i32) -> () loc("<stdin>":37:7)
    }, {
      %22 = "emitc.expression"(%18, %21) ({
      ^bb0(%arg11: !emitc.lvalue<i32> loc("<stdin>":40:12), %arg12: i32 loc("<stdin>":40:40)):
        %23 = "emitc.load"(%arg11) : (!emitc.lvalue<i32>) -> i32 loc("<stdin>":41:15)
        %24 = "emitc.cmp"(%23, %arg12) <{predicate = 3 : i64}> : (i32, i32) -> i1 loc("<stdin>":42:15)
        "emitc.yield"(%24) : (i1) -> () loc("<stdin>":43:9)
      }) : (!emitc.lvalue<i32>, i32) -> i1 loc("<stdin>":39:13)
      "emitc.yield"(%22) : (i1) -> () loc("<stdin>":45:7)
    }) : () -> () loc("<stdin>":33:5)
    "emitc.return"() : () -> () loc("<stdin>":47:5)
  }) : () -> () loc("<stdin>":23:3)
  "emitc.func"() <{function_type = () -> (), sym_name = "emitc_double_do"}> ({
    %3 = "emitc.variable"() <{value = 0 : i32}> : () -> !emitc.lvalue<i32> loc("<stdin>":50:10)
    %4 = "emitc.variable"() <{value = 0 : i32}> : () -> !emitc.lvalue<i32> loc("<stdin>":51:10)
    %5 = "emitc.literal"() <{value = "1"}> : () -> i32 loc("<stdin>":52:10)
    %6 = "emitc.literal"() <{value = "3"}> : () -> i32 loc("<stdin>":53:10)
    %7 = "emitc.literal"() <{value = "5"}> : () -> i32 loc("<stdin>":54:10)
    "emitc.do"() ({
      %11 = "emitc.load"(%3) : (!emitc.lvalue<i32>) -> i32 loc("<stdin>":56:13)
      "emitc.do"() ({
        %16 = "emitc.load"(%4) : (!emitc.lvalue<i32>) -> i32 loc("<stdin>":58:15)
        "emitc.verbatim"(%11, %16) <{value = "printf(\22i = %d, j = %d\22, {}, {});"}> : (i32, i32) -> () loc("<stdin>":59:9)
        %17 = "emitc.add"(%16, %5) : (i32, i32) -> i32 loc("<stdin>":60:15)
        "emitc.assign"(%4, %17) : (!emitc.lvalue<i32>, i32) -> () loc("<stdin>":61:9)
      }, {
        %13 = "emitc.expression"(%4, %7) ({
        ^bb0(%arg8: !emitc.lvalue<i32> loc("<stdin>":64:14), %arg9: i32 loc("<stdin>":64:41)):
          %14 = "emitc.load"(%arg8) : (!emitc.lvalue<i32>) -> i32 loc("<stdin>":65:17)
          %15 = "emitc.cmp"(%14, %arg9) <{predicate = 3 : i64}> : (i32, i32) -> i1 loc("<stdin>":66:17)
          "emitc.yield"(%15) : (i1) -> () loc("<stdin>":67:11)
        }) : (!emitc.lvalue<i32>, i32) -> i1 loc("<stdin>":63:15)
        "emitc.yield"(%13) : (i1) -> () loc("<stdin>":69:9)
      }) : () -> () loc("<stdin>":57:7)
      %12 = "emitc.add"(%11, %5) : (i32, i32) -> i32 loc("<stdin>":71:13)
      "emitc.assign"(%3, %12) : (!emitc.lvalue<i32>, i32) -> () loc("<stdin>":72:7)
    }, {
      %8 = "emitc.expression"(%3, %6) ({
      ^bb0(%arg6: !emitc.lvalue<i32> loc("<stdin>":75:12), %arg7: i32 loc("<stdin>":75:39)):
        %9 = "emitc.load"(%arg6) : (!emitc.lvalue<i32>) -> i32 loc("<stdin>":76:14)
        %10 = "emitc.cmp"(%9, %arg7) <{predicate = 3 : i64}> : (i32, i32) -> i1 loc("<stdin>":77:15)
        "emitc.yield"(%10) : (i1) -> () loc("<stdin>":78:9)
      }) : (!emitc.lvalue<i32>, i32) -> i1 loc("<stdin>":74:12)
      "emitc.yield"(%8) : (i1) -> () loc("<stdin>":80:7)
    }) : () -> () loc("<stdin>":55:5)
    "emitc.return"() : () -> () loc("<stdin>":82:5)
  }) : () -> () loc("<stdin>":49:3)
  "emitc.func"() <{function_type = (i32, i32) -> i1, sym_name = "payload_do_with_empty_body"}> ({
  ^bb0(%arg4: i32 loc("<stdin>":85:8), %arg5: i32 loc("<stdin>":85:20)):
    %2 = "emitc.cmp"(%arg4, %arg5) <{predicate = 2 : i64}> : (i32, i32) -> i1 loc("<stdin>":86:10)
    "emitc.return"(%2) : (i1) -> () loc("<stdin>":87:5)
  }) : () -> () loc("<stdin>":84:3)
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "emitc_do_with_empty_body"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":90:8), %arg1: i32 loc("<stdin>":90:20)):
    "emitc.do"() ({
    ^bb0:
    }, {
      %0 = "emitc.expression"(%arg0, %arg1) ({
      ^bb0(%arg2: i32 loc("<stdin>":95:12), %arg3: i32 loc("<stdin>":95:24)):
        %1 = "emitc.call"(%arg2, %arg3) <{callee = @payload_do_with_empty_body}> : (i32, i32) -> i1 loc("<stdin>":96:14)
        "emitc.yield"(%1) : (i1) -> () loc("<stdin>":97:9)
      }) : (i32, i32) -> i1 loc("<stdin>":94:12)
      "emitc.yield"(%0) : (i1) -> () loc("<stdin>":99:7)
    }) : () -> () loc("<stdin>":91:5)
    "func.return"() : () -> () loc("<stdin>":101:5)
  }) : () -> () loc("<stdin>":89:3)
}) : () -> () loc("<stdin>":1:1)
