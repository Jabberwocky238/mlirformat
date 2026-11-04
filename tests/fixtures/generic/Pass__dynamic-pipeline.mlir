"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "f"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "inner_mod1"}> ({
    "func.func"() <{function_type = () -> (), sym_name = "foo"}> ({
      "func.return"() : () -> ()
    }) : () -> ()
    "func.func"() <{function_type = () -> (), sym_name = "baz"}> ({
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "inner_mod2"}> ({
    "func.func"() <{function_type = () -> (), sym_name = "foo"}> ({
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

