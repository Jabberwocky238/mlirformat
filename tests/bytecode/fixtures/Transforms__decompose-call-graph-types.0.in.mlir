"builtin.module"() ({
  "func.func"() <{function_type = (tuple<i1, i32>) -> tuple<i1, i32>, sym_name = "identity"}> ({
  ^bb0(%arg0: tuple<i1, i32> loc("<stdin>":3:8)):
    "func.return"(%arg0) : (tuple<i1, i32>) -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
