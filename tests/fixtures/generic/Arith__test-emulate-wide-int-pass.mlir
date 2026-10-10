"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %2 = "arith.constant"() <{value = 0 : i64}> : () -> i64
    %3 = "func.call"(%2) <{callee = @emulate_me_please}> : (i64) -> i64
    %4 = "func.call"(%2) <{callee = @foo}> : (i64) -> i64
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64) -> i64, sym_name = "emulate_me_please"}> ({
  ^bb0(%arg1: i64):
    %1 = "arith.addi"(%arg1, %arg1) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
    "func.return"(%1) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64) -> i64, sym_name = "foo"}> ({
  ^bb0(%arg0: i64):
    %0 = "arith.addi"(%arg0, %arg0) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
    "func.return"(%0) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

