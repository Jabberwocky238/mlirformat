"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "op_with_custom_printer"}> ({
    %0 = "test.string_attr_pretty_name"() <{names = ["x"]}> : () -> i32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "op_without_custom_printer"}> ({
    %0 = "test.result_type_with_trait"() : () -> !test.test_type_with_trait
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

