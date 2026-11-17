"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (), sym_name = "testMatchingTypes"}> ({
  ^bb0(%arg4: i32 loc("<stdin>":3:8)):
    %5 = "scf.while"(%arg4) ({
    ^bb0(%arg6: i32 loc("<stdin>":5:10)):
      %6 = "arith.constant"() <{value = 10 : i32}> : () -> i32 loc("<stdin>":6:12)
      %7 = "arith.cmpi"(%arg6, %6) <{predicate = 2 : i64}> : (i32, i32) -> i1 loc("<stdin>":7:12)
      "scf.condition"(%7, %arg6) : (i1, i32) -> () loc("<stdin>":8:7)
    }, {
    ^bb0(%arg5: i32 loc("<stdin>":10:10)):
      "scf.yield"(%arg5) : (i32) -> () loc("<stdin>":11:7)
    }) : (i32) -> i32 loc("<stdin>":4:10)
    "func.return"() : () -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (i32) -> (), sym_name = "testNonMatchingTypes"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":16:8)):
    %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":17:10)
    %1 = "arith.constant"() <{value = 10 : i32}> : () -> i32 loc("<stdin>":18:10)
    %2:2 = "scf.while"(%arg0) ({
    ^bb0(%arg3: i32 loc("<stdin>":20:10)):
      %4 = "arith.cmpi"(%arg3, %1) <{predicate = 2 : i64}> : (i32, i32) -> i1 loc("<stdin>":21:12)
      "scf.condition"(%4, %arg3, %0) : (i1, i32, i32) -> () loc("<stdin>":22:7)
    }, {
    ^bb0(%arg1: i32 loc("<stdin>":24:10), %arg2: i32 loc("<stdin>":24:22)):
      %3 = "arith.addi"(%arg1, %arg2) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":25:12)
      "scf.yield"(%3) : (i32) -> () loc("<stdin>":26:7)
    }) : (i32) -> (i32, i32) loc("<stdin>":19:12)
    "func.return"() : () -> () loc("<stdin>":28:5)
  }) : () -> () loc("<stdin>":15:3)
}) : () -> () loc("<stdin>":1:1)
