"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_module_cluster_size"}> ({
    "gpu.func"() <{function_type = () -> (), kernel, known_cluster_size = array<i32: 8, 2, 4>}> ({
      "gpu.return"() : () -> () loc("<stdin>":5:7)
    }) {sym_name = "kernel_with_cluster_size"} : () -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
