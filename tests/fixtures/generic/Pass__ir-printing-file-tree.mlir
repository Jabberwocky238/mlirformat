"builtin.module"() <{sym_name = "outer"}> ({
  "func.func"() <{function_type = () -> (), sym_name = "sym/A"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "sym\\backslash"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "inner"}> ({
    "func.func"() <{function_type = () -> (), sym_name = "symB"}> ({
      "func.return"() : () -> ()
    }) : () -> ()
    "func.func"() <{function_type = () -> (), sym_name = "symC"}> ({
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

