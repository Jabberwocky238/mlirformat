"builtin.module"() <{sym_name = "outer"}> ({
  "func.func"() <{function_type = () -> (), sym_name = "sym/A"}> ({
    "func.return"() : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "sym\\backslash"}> ({
    "func.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":5:3)
  "builtin.module"() <{sym_name = "inner"}> ({
    "func.func"() <{function_type = () -> (), sym_name = "symB"}> ({
      "func.return"() : () -> () loc("<stdin>":10:7)
    }) : () -> () loc("<stdin>":9:5)
    "func.func"() <{function_type = () -> (), sym_name = "symC"}> ({
      "func.return"() : () -> () loc("<stdin>":13:7)
    }) : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":8:3)
}) : () -> () loc("<stdin>":1:1)
