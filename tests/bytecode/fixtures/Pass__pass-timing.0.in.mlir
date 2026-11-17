"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "foo"}> ({
    "func.return"() : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "bar"}> ({
    "func.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = () -> (), sym_name = "baz"}> ({
    "func.return"() : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = () -> (), sym_name = "foobar"}> ({
    "func.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":11:3)
  "builtin.module"() ({
    "func.func"() <{function_type = () -> (), sym_name = "baz"}> ({
      "func.return"() : () -> () loc("<stdin>":16:7)
    }) : () -> () loc("<stdin>":15:5)
    "func.func"() <{function_type = () -> (), sym_name = "foobar"}> ({
      "func.return"() : () -> () loc("<stdin>":19:7)
    }) : () -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":14:3)
}) : () -> () loc("<stdin>":1:1)
