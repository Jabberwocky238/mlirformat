"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "main"}> ({
  ^bb0(%arg0: f32 loc("<stdin>":3:8)):
    %0 = "foo"() {interrupt_before_all = true} : () -> f32 loc("<stdin>":4:10)
    %1 = "arith.addf"(%0, %arg0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":5:10)
    "func.return"(%1) : (f32) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
