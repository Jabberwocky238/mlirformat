"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "simpleTest"}> ({
    "test.simple"() : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i1, sym_name = "testImportedInterface"}> ({
    "test.non_cast"() : () -> ()
    %0 = "builtin.unrealized_conversion_cast"() : () -> i1
    "func.return"(%0) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

