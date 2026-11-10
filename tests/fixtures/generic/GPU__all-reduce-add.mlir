"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernels"}> ({
    "gpu.func"() <{function_type = (f32) -> (), kernel}> ({
    ^bb0(%arg0: f32):
      %0 = "gpu.all_reduce"(%arg0) <{op = #gpu<all_reduce_op add>, uniform}> ({
      }) : (f32) -> f32
      "gpu.return"() : () -> ()
    }) {sym_name = "kernel"} : () -> ()
  }) : () -> ()
}) : () -> ()

