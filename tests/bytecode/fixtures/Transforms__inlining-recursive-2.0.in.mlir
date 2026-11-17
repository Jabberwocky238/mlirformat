"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "parent1"}> ({
  ^bb0(%arg2: i32 loc("<stdin>":3:8)):
    %9 = "func.call"(%arg2) <{callee = @child}> : (i32) -> i32 loc("<stdin>":4:10)
    "func.return"(%9) : (i32) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (i32) -> i32, sym_name = "parent2"}> ({
  ^bb0(%arg1: i32 loc("<stdin>":8:8)):
    %8 = "func.call"(%arg1) <{callee = @child}> : (i32) -> i32 loc("<stdin>":9:10)
    "func.return"(%8) : (i32) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (i32) -> i32, sym_name = "child"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":13:8)):
    %0 = "arith.constant"() <{value = 10 : i32}> : () -> i32 loc("<stdin>":14:10)
    %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":15:10)
    %2 = "arith.cmpi"(%arg0, %0) <{predicate = 5 : i64}> : (i32, i32) -> i1 loc("<stdin>":16:10)
    %3 = "scf.if"(%2) ({
      "scf.yield"(%arg0) : (i32) -> () loc("<stdin>":18:7)
    }, {
      %4 = "arith.addi"(%arg0, %1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":20:12)
      %5 = "func.call"(%4) <{callee = @parent1}> : (i32) -> i32 loc("<stdin>":21:12)
      %6 = "func.call"(%4) <{callee = @parent2}> : (i32) -> i32 loc("<stdin>":22:12)
      %7 = "arith.addi"(%5, %6) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":23:12)
      "scf.yield"(%7) : (i32) -> () loc("<stdin>":24:7)
    }) : (i1) -> i32 loc("<stdin>":17:10)
    "func.return"(%3) : (i32) -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":12:3)
}) : () -> () loc("<stdin>":1:1)
