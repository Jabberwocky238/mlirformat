"builtin.module"() ({
  "func.func"() <{function_type = (index) -> index, sym_name = "cf_br"}> ({
  ^bb0(%arg0: index loc("<stdin>":3:8)):
    "cf.br"(%arg0)[^bb1] : (index) -> () loc("<stdin>":4:5)
  ^bb1(%0: index loc("<stdin>":5:8)):  // pred: ^bb0
    "func.return"(%0) : (index) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
