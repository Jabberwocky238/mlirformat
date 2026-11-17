"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "gpu.func"() <{function_type = (memref<16xf32, #gpu.address_space<constant>>) -> (), kernel}> ({
    ^bb0(%arg2: memref<16xf32, #gpu.address_space<constant>> loc("<stdin>":4:10)):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:12)
      %1 = "memref.load"(%arg2, %0) : (memref<16xf32, #gpu.address_space<constant>>, index) -> f32 loc("<stdin>":6:12)
      "gpu.return"() : () -> () loc("<stdin>":7:7)
    }) {sym_name = "constant_memref_basic"} : () -> () loc("<stdin>":3:5)
    "gpu.func"() <{function_type = (memref<4x8xf32, #gpu.address_space<constant>>) -> (), kernel}> ({
    ^bb0(%arg1: memref<4x8xf32, #gpu.address_space<constant>> loc("<stdin>":10:10)):
      "gpu.return"() : () -> () loc("<stdin>":11:7)
    }) {sym_name = "constant_memref_multidim"} : () -> () loc("<stdin>":9:5)
    "gpu.func"() <{function_type = (memref<?x?xf32, #gpu.address_space<constant>>) -> (), kernel}> ({
    ^bb0(%arg0: memref<?x?xf32, #gpu.address_space<constant>> loc("<stdin>":14:10)):
      "gpu.return"() : () -> () loc("<stdin>":15:7)
    }) {sym_name = "constant_memref_dynamic"} : () -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
