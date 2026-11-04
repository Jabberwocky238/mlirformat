"builtin.module"() ({
  "func.func"() <{function_type = (i1, i17, i17) -> i17, sym_name = "arith_select"}> ({
  ^bb0(%arg0: i1, %arg1: i17, %arg2: i17):
    %0 = "arith.select"(%arg0, %arg1, %arg2) : (i1, i17, i17) -> i17
    "func.return"(%0) : (i17) -> ()
  }) : () -> ()
}) : () -> ()

