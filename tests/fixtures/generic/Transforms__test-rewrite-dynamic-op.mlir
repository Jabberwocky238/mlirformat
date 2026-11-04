"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (), sym_name = "rewrite_dynamic_op"}> ({
  ^bb0(%arg0: i32):
    %0:2 = "test.dynamic_one_operand_two_results"(%arg0) : (i32) -> (i32, i32)
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

