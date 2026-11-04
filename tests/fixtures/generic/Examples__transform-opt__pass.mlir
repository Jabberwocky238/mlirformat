"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "return_42"}> ({
    %1 = "arith.constant"() <{value = 21 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %3 = "arith.muli"(%1, %2) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    "func.return"(%3) : (i32) -> ()
  }) : () -> ()
  "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg0: !transform.any_op):
    %0 = "transform.apply_registered_pass"(%arg0) <{options = {}, pass_name = "canonicalize"}> : (!transform.any_op) -> !transform.any_op
    "transform.print"(%0) : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
}) {transform.with_named_sequence} : () -> ()

