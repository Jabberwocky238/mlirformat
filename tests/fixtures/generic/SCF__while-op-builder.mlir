"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (), sym_name = "testMatchingTypes"}> ({
  ^bb0(%arg4: i32):
    %5 = "scf.while"(%arg4) ({
    ^bb0(%arg6: i32):
      %6 = "arith.constant"() <{value = 10 : i32}> : () -> i32
      %7 = "arith.cmpi"(%arg6, %6) <{predicate = 2 : i64}> : (i32, i32) -> i1
      "scf.condition"(%7, %arg6) : (i1, i32) -> ()
    }, {
    ^bb0(%arg5: i32):
      "scf.yield"(%arg5) : (i32) -> ()
    }) : (i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "testNonMatchingTypes"}> ({
  ^bb0(%arg0: i32):
    %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 10 : i32}> : () -> i32
    %2:2 = "scf.while"(%arg0) ({
    ^bb0(%arg3: i32):
      %4 = "arith.cmpi"(%arg3, %1) <{predicate = 2 : i64}> : (i32, i32) -> i1
      "scf.condition"(%4, %arg3, %0) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg1: i32, %arg2: i32):
      %3 = "arith.addi"(%arg1, %arg2) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "scf.yield"(%3) : (i32) -> ()
    }) : (i32) -> (i32, i32)
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

