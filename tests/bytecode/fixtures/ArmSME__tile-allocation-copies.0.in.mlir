"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]x[4]xf32>) -> (), sym_name = "simple_branch"}> ({
  ^bb0(%arg0: vector<[4]x[4]xf32> loc("<stdin>":3:8)):
    "cf.br"(%arg0)[^bb1] : (vector<[4]x[4]xf32>) -> () loc("<stdin>":4:5)
  ^bb1(%0: vector<[4]x[4]xf32> loc("<stdin>":5:8)):  // pred: ^bb0
    "func.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
