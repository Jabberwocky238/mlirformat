"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "function"}> ({
    %1 = "foo"() : () -> i32
    "func.return"(%1) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i32, sym_name = "function2"}> ({
    %0 = "foo"() : () -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

