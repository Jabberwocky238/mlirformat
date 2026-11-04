"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "func"}> ({
    %1 = "ub.poison"() <{value = #ub.poison}> : () -> i32
    "func.return"(%1) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!llvm.ptr) -> i32, sym_name = "test_inline"}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "func.call"() <{callee = @func}> : () -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

