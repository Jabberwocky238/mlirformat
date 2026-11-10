"builtin.module"() ({
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "do_nothing"}> ({
  ^bb0(%arg2: !transform.any_op):
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> !transform.any_op, sym_name = "print_in_matcher"}> ({
  ^bb0(%arg1: !transform.any_op):
    "transform.print"(%arg1) : (!transform.any_op) -> ()
    "transform.yield"(%arg1) : (!transform.any_op) -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg0: !transform.any_op):
    %1 = "transform.foreach_match"(%arg0) <{actions = [@do_nothing], matchers = [@print_in_matcher]}> : (!transform.any_op) -> !transform.any_op
    "transform.yield"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "payload"}> ({
    %0 = "test.print_me"() : () -> i1
    "func.return"() : () -> ()
  }) {transform.target_tag = "start_here"} : () -> ()
}) {transform.with_named_sequence} : () -> ()

