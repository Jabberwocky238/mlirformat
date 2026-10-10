"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernels"}> ({
    "gpu.func"() <{function_type = (f32) -> ()}> ({
    ^bb0(%arg0: f32):
      %0 = "gpu.all_reduce"(%arg0) <{op = #gpu<all_reduce_op maxnumf>, uniform}> ({
      }) : (f32) -> f32
      "gpu.return"() : () -> ()
    }) {gpu.kernel, sym_name = "kernel", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

