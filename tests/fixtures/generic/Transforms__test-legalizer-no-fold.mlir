"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "remove_foldable_op"}> ({
  ^bb0(%arg0: i32):
    %0 = "test.op_with_region_fold"(%arg0) ({
      "foo.op_with_region_terminator"() : () -> ()
    }) : (i32) -> i32
    "test.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

