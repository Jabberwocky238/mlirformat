"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernels"}> ({
    "gpu.func"() <{function_type = () -> (), kernel}> ({
      %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x16xf32> loc("<stdin>":4:12)
      "memref.dealloc"(%1) : (memref<8x16xf32>) -> () loc("<stdin>":5:7)
      "gpu.return"() : () -> () loc("<stdin>":6:7)
    }) {sym_name = "kernel_1"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x16xf32> loc("<stdin>":10:10)
    "memref.dealloc"(%0) : (memref<8x16xf32>) -> () loc("<stdin>":11:5)
    "func.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":9:3)
}) {gpu.container_module} : () -> () loc("<stdin>":1:1)
