"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, f32) -> f32, sym_name = "doubleup"}> ({
  ^bb0(%arg0: index loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:22), %arg2: index loc("<stdin>":3:36), %arg3: f32 loc("<stdin>":3:50)):
    %0 = "scf.for"(%arg0, %arg1, %arg2, %arg3) ({
    ^bb0(%arg4: index loc("<stdin>":5:10), %arg5: f32 loc("<stdin>":5:24)):
      %1 = "arith.addf"(%arg5, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":6:12)
      "scf.yield"(%1) : (f32) -> () loc("<stdin>":7:7)
    }) : (index, index, index, f32) -> f32 loc("<stdin>":4:10)
    "func.return"(%0) : (f32) -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
