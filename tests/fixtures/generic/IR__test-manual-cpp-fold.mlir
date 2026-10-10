"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "test"}> ({
    %0 = "test.constant"() <{value = 5 : i32}> : () -> i32
    %1 = "test.manual_cpp_op_with_fold"(%0) : (i32) -> i32
    "func.return"(%1) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

