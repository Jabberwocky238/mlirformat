"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> index, sym_name = "main"}> ({
  ^bb0(%arg1: i32):
    %1 = "func.call"(%arg1) <{callee = @f}> : (i32) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> index, sym_name = "f"}> ({
  ^bb0(%arg0: i32):
    %0 = "index.castu"(%arg0) : (i32) -> index
    "func.return"(%0) : (index) -> ()
  }) : () -> ()
}) : () -> ()

