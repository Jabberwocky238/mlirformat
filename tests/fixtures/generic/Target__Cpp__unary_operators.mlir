"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (), sym_name = "unary"}> ({
  ^bb0(%arg0: i32):
    %0 = "emitc.unary_minus"(%arg0) : (i32) -> i32
    %1 = "emitc.unary_plus"(%arg0) : (i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

