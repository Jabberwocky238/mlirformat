"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernel"}> ({
    "gpu.func"() <{function_type = () -> index}> ({
      %0 = "gpu.global_id"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":4:12)
      "gpu.return"(%0) : (index) -> () loc("<stdin>":5:7)
    }) {sym_name = "gpu_global_id"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
