"builtin.module"() ({
  "func.func"() <{function_type = (i64) -> (), sym_name = "test_valid_arg_materialization"}> ({
  ^bb0(%arg0: i64 loc("<stdin>":3:8)):
    "foo.return"(%arg0) : (i64) -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
