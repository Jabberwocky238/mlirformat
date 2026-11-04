"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "f"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "inner_mod1"}> ({
    "builtin.module"() <{sym_name = "foo"}> ({
    ^bb0:
    }) : () -> ()
    "builtin.module"() <{sym_name = "baz"}> ({
    ^bb0:
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

