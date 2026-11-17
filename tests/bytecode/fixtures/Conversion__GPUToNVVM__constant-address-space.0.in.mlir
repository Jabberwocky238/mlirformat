"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernel_module"}> ({
    "gpu.func"() <{function_type = (memref<16xf32, #gpu.address_space<constant>>) -> (), kernel}> ({
    ^bb0(%arg1: memref<16xf32, #gpu.address_space<constant>> loc("<stdin>":4:10)):
      %3 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:12)
      %4 = "memref.load"(%arg1, %3) : (memref<16xf32, #gpu.address_space<constant>>, index) -> f32 loc("<stdin>":6:12)
      "gpu.return"() : () -> () loc("<stdin>":7:7)
    }) {sym_name = "constant_load"} : () -> () loc("<stdin>":3:5)
    "gpu.func"() <{function_type = (memref<4x8xf32, #gpu.address_space<constant>>) -> (), kernel}> ({
    ^bb0(%arg0: memref<4x8xf32, #gpu.address_space<constant>> loc("<stdin>":10:10)):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":11:12)
      %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":12:12)
      %2 = "memref.load"(%arg0, %0, %1) : (memref<4x8xf32, #gpu.address_space<constant>>, index, index) -> f32 loc("<stdin>":13:12)
      "gpu.return"() : () -> () loc("<stdin>":14:7)
    }) {sym_name = "constant_multidim"} : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
}) {gpu.container_module} : () -> () loc("<stdin>":1:1)
