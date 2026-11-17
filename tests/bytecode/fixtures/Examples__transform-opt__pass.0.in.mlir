"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "return_42"}> ({
    %1 = "arith.constant"() <{value = 21 : i32}> : () -> i32 loc("<stdin>":3:10)
    %2 = "arith.constant"() <{value = 2 : i32}> : () -> i32 loc("<stdin>":4:10)
    %3 = "arith.muli"(%1, %2) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":5:10)
    "func.return"(%3) : (i32) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
  "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg0: !transform.any_op loc("<stdin>":9:8)):
    %0 = "transform.apply_registered_pass"(%arg0) <{options = {}, pass_name = "canonicalize"}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":10:10)
    "transform.print"(%0) : (!transform.any_op) -> () loc("<stdin>":11:5)
    "transform.yield"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":8:3)
}) {transform.with_named_sequence} : () -> () loc("<stdin>":1:1)
