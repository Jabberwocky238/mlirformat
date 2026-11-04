"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "fold_legalization"}> ({
    %0 = "test.op_in_place_self_fold"() : () -> i32
    "test.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

