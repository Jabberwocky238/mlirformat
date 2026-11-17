"builtin.module"() ({
  "gpu.module"() <{sym_name = "nvvm_module", targets = [#nvvm.target]}> ({
    "func.func"() <{function_type = () -> index, sym_name = "kernel_0"}> ({
      %3 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":4:12)
      %4 = "gpu.lane_id"() : () -> index loc("<stdin>":5:12)
      %5 = "index.add"(%3, %4) : (index, index) -> index loc("<stdin>":6:12)
      "func.return"(%5) : (index) -> () loc("<stdin>":7:7)
    }) : () -> () loc("<stdin>":3:5)
    "gpu.func"() <{function_type = (memref<f32, #gpu.address_space<global>>) -> (), kernel, known_block_size = array<i32: 128, 1, 1>}> ({
    ^bb0(%arg1: memref<f32, #gpu.address_space<global>> loc("<stdin>":10:10)):
      "gpu.return"() : () -> () loc("<stdin>":11:7)
    }) {sym_name = "kernel_1"} : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
  "gpu.module"() <{sym_name = "nvvm_module_2"}> ({
    "func.func"() <{function_type = () -> index, sym_name = "kernel_0"}> ({
      %0 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":16:12)
      %1 = "gpu.lane_id"() : () -> index loc("<stdin>":17:12)
      %2 = "index.add"(%0, %1) : (index, index) -> index loc("<stdin>":18:12)
      "func.return"(%2) : (index) -> () loc("<stdin>":19:7)
    }) : () -> () loc("<stdin>":15:5)
    "gpu.func"() <{function_type = (memref<f32, #gpu.address_space<global>>) -> (), kernel, known_block_size = array<i32: 128, 1, 1>}> ({
    ^bb0(%arg0: memref<f32, #gpu.address_space<global>> loc("<stdin>":22:10)):
      "gpu.return"() : () -> () loc("<stdin>":23:7)
    }) {sym_name = "kernel_1"} : () -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":14:3)
}) : () -> () loc("<stdin>":1:1)
