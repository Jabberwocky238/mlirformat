"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "main"}> ({
  ^bb0(%arg0: f32):
    %0 = "foo"() {interrupt = true} : () -> f32
    %1 = "arith.addf"(%0, %arg0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "func.return"(%1) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

