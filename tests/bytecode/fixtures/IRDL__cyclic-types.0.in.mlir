"builtin.module"() ({
  "func.func"() <{function_type = (!testd.self_referencing<i32>) -> (), sym_name = "no_references"}> ({
  ^bb0(%arg0: !testd.self_referencing<i32> loc("<stdin>":3:8)):
    "func.return"() : () -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
