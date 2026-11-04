"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, f32) -> f32, sym_name = "doubleup"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: f32):
    %0 = "scf.for"(%arg0, %arg1, %arg2, %arg3) ({
    ^bb0(%arg4: index, %arg5: f32):
      %1 = "arith.addf"(%arg5, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "scf.yield"(%1) : (f32) -> ()
    }) : (index, index, index, f32) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

