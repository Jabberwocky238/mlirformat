"builtin.module"() ({
  "func.func"() <{function_type = (memref<2xf32>, i1) -> (), sym_name = "conversion_dealloc_simple"}> ({
  ^bb0(%arg0: memref<2xf32> loc("<stdin>":3:8), %arg1: i1 loc("<stdin>":3:30)):
    "bufferization.dealloc"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0>}> : (memref<2xf32>, i1) -> () loc("<stdin>":4:5)
    "func.return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
