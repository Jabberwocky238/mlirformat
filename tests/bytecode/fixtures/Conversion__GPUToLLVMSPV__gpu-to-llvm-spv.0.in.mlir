"builtin.module"() ({
  "gpu.module"() <{sym_name = "builtins"}> ({
    "func.func"() <{function_type = () -> (index, index, index), sym_name = "gpu_block_id"}> ({
      %12 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":4:13)
      %13 = "gpu.block_id"() <{dimension = #gpu<dim y>}> : () -> index loc("<stdin>":5:13)
      %14 = "gpu.block_id"() <{dimension = #gpu<dim z>}> : () -> index loc("<stdin>":6:13)
      "func.return"(%12, %13, %14) : (index, index, index) -> () loc("<stdin>":7:7)
    }) : () -> () loc("<stdin>":3:5)
    "func.func"() <{function_type = () -> (index, index, index), sym_name = "gpu_global_id"}> ({
      %9 = "gpu.global_id"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":10:12)
      %10 = "gpu.global_id"() <{dimension = #gpu<dim y>}> : () -> index loc("<stdin>":11:13)
      %11 = "gpu.global_id"() <{dimension = #gpu<dim z>}> : () -> index loc("<stdin>":12:13)
      "func.return"(%9, %10, %11) : (index, index, index) -> () loc("<stdin>":13:7)
    }) : () -> () loc("<stdin>":9:5)
    "func.func"() <{function_type = () -> (index, index, index), sym_name = "gpu_block_dim"}> ({
      %6 = "gpu.block_dim"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":16:12)
      %7 = "gpu.block_dim"() <{dimension = #gpu<dim y>}> : () -> index loc("<stdin>":17:12)
      %8 = "gpu.block_dim"() <{dimension = #gpu<dim z>}> : () -> index loc("<stdin>":18:12)
      "func.return"(%6, %7, %8) : (index, index, index) -> () loc("<stdin>":19:7)
    }) : () -> () loc("<stdin>":15:5)
    "func.func"() <{function_type = () -> (index, index, index), sym_name = "gpu_thread_id"}> ({
      %3 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":22:12)
      %4 = "gpu.thread_id"() <{dimension = #gpu<dim y>}> : () -> index loc("<stdin>":23:12)
      %5 = "gpu.thread_id"() <{dimension = #gpu<dim z>}> : () -> index loc("<stdin>":24:12)
      "func.return"(%3, %4, %5) : (index, index, index) -> () loc("<stdin>":25:7)
    }) : () -> () loc("<stdin>":21:5)
    "func.func"() <{function_type = () -> (index, index, index), sym_name = "gpu_grid_dim"}> ({
      %0 = "gpu.grid_dim"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":28:12)
      %1 = "gpu.grid_dim"() <{dimension = #gpu<dim y>}> : () -> index loc("<stdin>":29:12)
      %2 = "gpu.grid_dim"() <{dimension = #gpu<dim z>}> : () -> index loc("<stdin>":30:12)
      "func.return"(%0, %1, %2) : (index, index, index) -> () loc("<stdin>":31:7)
    }) : () -> () loc("<stdin>":27:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
