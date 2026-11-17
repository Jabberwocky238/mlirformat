"builtin.module"() ({
  "func.func"() <{function_type = (memref<999xi32>) -> (), sym_name = "alloc_copy"}> ({
  ^bb0(%arg0: memref<999xi32> loc("<stdin>":3:8)):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<999xi32> loc("<stdin>":4:10)
    "memref.copy"(%arg0, %0) : (memref<999xi32>, memref<999xi32>) -> () loc("<stdin>":5:5)
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<999xi32> loc("<stdin>":6:10)
    "memref.copy"(%arg0, %1) : (memref<999xi32>, memref<999xi32>) -> () loc("<stdin>":7:5)
    "func.return"() : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
