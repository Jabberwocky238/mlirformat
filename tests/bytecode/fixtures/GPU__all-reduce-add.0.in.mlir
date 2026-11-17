"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernels"}> ({
    "gpu.func"() <{function_type = (f32) -> (), kernel}> ({
    ^bb0(%arg0: f32 loc("<stdin>":4:10)):
      %0 = "gpu.all_reduce"(%arg0) <{op = #gpu<all_reduce_op add>, uniform}> ({
      }) : (f32) -> f32 loc("<stdin>":5:12)
      "gpu.return"() : () -> () loc("<stdin>":7:7)
    }) {sym_name = "kernel"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
