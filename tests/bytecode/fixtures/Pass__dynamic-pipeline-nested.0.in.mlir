"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "f"}> ({
    "func.return"() : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
  "builtin.module"() <{sym_name = "inner_mod1"}> ({
    "builtin.module"() <{sym_name = "foo"}> ({
    ^bb0:
    }) : () -> () loc("<stdin>":6:5)
    "builtin.module"() <{sym_name = "baz"}> ({
    ^bb0:
    }) : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":1:1)
