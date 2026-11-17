"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "func"}> ({
    %1 = "ub.poison"() <{value = #ub.poison}> : () -> i32 loc("<stdin>":3:10)
    "func.return"(%1) : (i32) -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (!llvm.ptr) -> i32, sym_name = "test_inline"}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":7:8)):
    %0 = "func.call"() <{callee = @func}> : () -> i32 loc("<stdin>":8:10)
    "func.return"(%0) : (i32) -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":6:3)
}) : () -> () loc("<stdin>":1:1)
