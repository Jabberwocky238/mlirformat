"builtin.module"() ({
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "dynamicRanked"}> ({
  ^bb0(%arg0: memref<*xf32> loc("<stdin>":4:8)):
    %0 = "memref.rank"(%arg0) : (memref<*xf32>) -> index loc("<stdin>":5:10)
    %1 = "memref.alloc"(%0) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xindex> loc("<stdin>":6:10)
    "func.return"() : () -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
