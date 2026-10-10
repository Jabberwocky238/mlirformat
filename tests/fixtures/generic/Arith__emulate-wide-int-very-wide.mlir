"builtin.module"() ({
  "func.func"() <{function_type = (i1024, i1024) -> i1024, sym_name = "muli_scalar"}> ({
  ^bb0(%arg0: i1024, %arg1: i1024):
    %0 = "arith.muli"(%arg0, %arg1) <{overflowFlags = #arith.overflow<none>}> : (i1024, i1024) -> i1024
    "func.return"(%0) : (i1024) -> ()
  }) : () -> ()
}) : () -> ()

