"builtin.module"() ({
  "builtin.module"() ({
    "func.func"() <{function_type = (i32) -> i32, sym_name = "func1"}> ({
    ^bb0(%arg1: i32):
      %3 = "arith.addi"(%arg1, %arg1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %4 = "arith.addi"(%arg1, %arg1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %5 = "arith.addi"(%3, %4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "func.return"(%5) : (i32) -> ()
    }) : () -> ()
  }) : () -> ()
  "gpu.module"() <{sym_name = "gpu_module"}> ({
    "gpu.func"() <{function_type = (i32) -> i32}> ({
    ^bb0(%arg0: i32):
      %0 = "arith.addi"(%arg0, %arg0) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %1 = "arith.addi"(%arg0, %arg0) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %2 = "arith.addi"(%0, %1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "gpu.return"(%2) : (i32) -> ()
    }) {sym_name = "func2", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

