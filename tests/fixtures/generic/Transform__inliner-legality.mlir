"builtin.module"() ({
  "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg0: !transform.any_op):
    "transform.yield"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "f"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    "test.conversion_call_op"() <{callee = @f}> {noinline} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) {transform.with_named_sequence} : () -> ()

