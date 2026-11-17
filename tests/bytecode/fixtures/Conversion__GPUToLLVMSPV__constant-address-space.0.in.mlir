"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernels"}> ({
    "gpu.func"() <{function_type = (memref<16xf32, #gpu.address_space<constant>>) -> (), kernel}> ({
    ^bb0(%arg4: memref<16xf32, #gpu.address_space<constant>> loc("<stdin>":4:10)):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:12)
      %1 = "memref.load"(%arg4, %0) : (memref<16xf32, #gpu.address_space<constant>>, index) -> f32 loc("<stdin>":6:12)
      "gpu.return"() : () -> () loc("<stdin>":7:7)
    }) {sym_name = "constant_load"} : () -> () loc("<stdin>":3:5)
    "gpu.func"() <{function_type = (memref<f32, #gpu.address_space<global>>, memref<f32, #gpu.address_space<workgroup>>, memref<f32, #gpu.address_space<private>>, memref<f32, #gpu.address_space<constant>>) -> ()}> ({
    ^bb0(%arg0: memref<f32, #gpu.address_space<global>> loc("<stdin>":10:10), %arg1: memref<f32, #gpu.address_space<workgroup>> loc("<stdin>":10:58), %arg2: memref<f32, #gpu.address_space<private>> loc("<stdin>":10:109), %arg3: memref<f32, #gpu.address_space<constant>> loc("<stdin>":10:158)):
      "gpu.return"() : () -> () loc("<stdin>":11:7)
    }) {sym_name = "all_address_spaces"} : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
