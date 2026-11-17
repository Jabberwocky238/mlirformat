"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "foo0"}> ({
  ^bb0(%arg1: i32 loc("<stdin>":3:8)):
    %3 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":4:10)
    %4 = "arith.cmpi"(%arg1, %3) <{predicate = 0 : i64}> : (i32, i32) -> i1 loc("<stdin>":5:10)
    "cf.cond_br"(%4)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":6:5)
  ^bb1:  // pred: ^bb0
    "func.return"(%3) : (i32) -> () loc("<stdin>":8:5)
  ^bb2:  // pred: ^bb0
    %5 = "func.call"(%arg1) <{callee = @foo1}> : (i32) -> i32 loc("<stdin>":10:10)
    "func.return"(%5) : (i32) -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (i32) -> i32, sym_name = "foo1"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":14:8)):
    %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":15:10)
    %1 = "arith.subi"(%arg0, %0) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":16:10)
    %2 = "func.call"(%1) <{callee = @foo0}> : (i32) -> i32 loc("<stdin>":17:10)
    "func.return"(%2) : (i32) -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":13:3)
}) : () -> () loc("<stdin>":1:1)
