"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "f"}> ({
    "func.return"() : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
  "builtin.module"() <{sym_name = "inner_mod1"}> ({
    "func.func"() <{function_type = () -> (), sym_name = "foo"}> ({
      "func.return"() : () -> () loc("<stdin>":7:7)
    }) : () -> () loc("<stdin>":6:5)
    "func.func"() <{function_type = () -> (), sym_name = "baz"}> ({
      "func.return"() : () -> () loc("<stdin>":10:7)
    }) : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":5:3)
  "builtin.module"() <{sym_name = "inner_mod2"}> ({
    "func.func"() <{function_type = () -> (), sym_name = "foo"}> ({
      "func.return"() : () -> () loc("<stdin>":15:7)
    }) : () -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":13:3)
}) : () -> () loc("<stdin>":1:1)
