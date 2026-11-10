"builtin.module"() ({
  "func.func"() <{function_type = (memref<2xf32>, i1) -> (), sym_name = "conversion_dealloc_simple"}> ({
  ^bb0(%arg0: memref<2xf32>, %arg1: i1):
    "bufferization.dealloc"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0>}> : (memref<2xf32>, i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

