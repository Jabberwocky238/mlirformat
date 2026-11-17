"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "wrap_while_loop_in_zero_trip_check"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":3:8)):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 5 : i32}> : () -> i32 loc("<stdin>":5:10)
    %2:2 = "scf.while"(%0) ({
    ^bb0(%arg3: i32 loc("<stdin>":7:10)):
      %4 = "arith.cmpi"(%arg3, %arg0) <{predicate = 2 : i64}> : (i32, i32) -> i1 loc("<stdin>":8:12)
      %5 = "arith.addi"(%arg0, %1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":9:12)
      "scf.condition"(%4, %arg3, %5) : (i1, i32, i32) -> () loc("<stdin>":10:7)
    }, {
    ^bb0(%arg1: i32 loc("<stdin>":12:10), %arg2: i32 loc("<stdin>":12:22)):
      %3 = "arith.addi"(%arg1, %arg2) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":13:12)
      "scf.yield"(%3) : (i32) -> () loc("<stdin>":14:7)
    }) : (i32) -> (i32, i32) loc("<stdin>":6:12)
    "func.return"(%2#0) : (i32) -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
