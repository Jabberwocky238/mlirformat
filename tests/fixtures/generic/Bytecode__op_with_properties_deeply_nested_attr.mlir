"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "deeply_nested_attribute"}> ({
    %0 = "test.constant"() <{value = [[[[[[[[[[[[1]]]]]]]]]]]]}> : () -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "deeply_nested_infinite_loop"}> ({
    %0 = "test.constant"() <{value = [[[[[[1]]]]]]}> : () -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

