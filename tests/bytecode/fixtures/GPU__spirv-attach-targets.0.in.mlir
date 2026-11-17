"builtin.module"() ({
  "gpu.module"() <{sym_name = "spirv_hot_module"}> ({
  ^bb0:
  }) : () -> () loc("<stdin>":2:3)
  "gpu.module"() <{sym_name = "spirv_warm_module"}> ({
  ^bb0:
  }) : () -> () loc("<stdin>":5:3)
  "gpu.module"() <{sym_name = "spirv_cold_module"}> ({
  ^bb0:
  }) : () -> () loc("<stdin>":8:3)
}) {gpu.container_module} : () -> () loc("<stdin>":1:1)
