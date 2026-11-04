"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernels"}> ({
    "gpu.func"() <{function_type = () -> ()}> ({
      "gpu.return"() : () -> ()
    }) {gpu.kernel, sym_name = "foo", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

