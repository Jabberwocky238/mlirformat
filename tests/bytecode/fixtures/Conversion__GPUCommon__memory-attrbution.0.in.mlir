"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernel"}> ({
    "gpu.func"() <{function_type = (f32) -> ()}> ({
    ^bb0(%arg0: f32 loc("<stdin>":4:10), %arg1: memref<4xf32, #gpu.address_space<private>> loc("<stdin>":4:22)):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:12)
      "memref.store"(%arg0, %arg1, %0) : (f32, memref<4xf32, #gpu.address_space<private>>, index) -> () loc("<stdin>":6:7)
      "terminator"() : () -> () loc("<stdin>":7:7)
    }) {sym_name = "private"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
