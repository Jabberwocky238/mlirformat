"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "replace_with_new_op"}> ({
    %0 = "test.replace_with_new_op"() : () -> i32
    %1 = "arith.addi"(%0, %0) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    "func.return"(%1) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

