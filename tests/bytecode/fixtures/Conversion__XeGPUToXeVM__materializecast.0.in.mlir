"builtin.module"() ({
  "gpu.module"() <{sym_name = "materializecast"}> ({
    "gpu.func"() <{function_type = (memref<128xf32>) -> (), kernel}> ({
    ^bb0(%arg0: memref<128xf32> loc("<stdin>":4:10)):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:12)
      %1 = "arith.constant"() <{value = true}> : () -> i1 loc("<stdin>":6:12)
      %2 = "xegpu.load"(%arg0, %0, %1) : (memref<128xf32>, index, i1) -> f32 loc("<stdin>":7:12)
      "gpu.return"() : () -> () loc("<stdin>":8:7)
    }) {sym_name = "materialize_memref"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
