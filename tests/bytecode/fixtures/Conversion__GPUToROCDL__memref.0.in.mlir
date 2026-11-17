"builtin.module"() ({
  "gpu.module"() <{sym_name = "memref_conversions"}> ({
    "gpu.func"() <{function_type = (memref<8xf32>) -> (), kernel}> ({
    ^bb0(%arg0: memref<8xf32> loc("<stdin>":4:10)):
      "gpu.return"() : () -> () loc("<stdin>":5:7)
    }) {sym_name = "kern"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
