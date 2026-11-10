"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "simpleTest"}> ({
    "test.simple"() : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i1, sym_name = "testImportedInterface"}> ({
    "test.non_cast"() : () -> ()
    %1 = "builtin.unrealized_conversion_cast"() : () -> i1
    "func.return"(%1) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "testWithConstraint"}> ({
  ^bb0(%arg0: i32):
    %0 = "test.op_a"(%arg0) <{attr = 0 : i32}> : (i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

