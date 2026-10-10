"builtin.module"() ({
  "func.func"() <{function_type = (!test.optional_value_type, !test.optional_value_type<3>) -> (), sym_name = "test"}> ({
  ^bb0(%arg0: !test.optional_value_type, %arg1: !test.optional_value_type<3>):
    "test.format_maybe_empty_type"(%arg0) : (!test.optional_value_type) -> ()
    "test.format_maybe_empty_type"(%arg1) : (!test.optional_value_type<3>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

