"builtin.module"() ({
  "func.func"() <{function_type = (!async.token) -> (), sym_name = "reference_counting"}> ({
  ^bb0(%arg0: !async.token loc("<stdin>":3:8)):
    "async.runtime.add_ref"(%arg0) <{count = 2 : i64}> : (!async.token) -> () loc("<stdin>":4:5)
    "async.runtime.drop_ref"(%arg0) <{count = 1 : i64}> : (!async.token) -> () loc("<stdin>":5:5)
    "func.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
