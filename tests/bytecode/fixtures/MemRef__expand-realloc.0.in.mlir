"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> memref<?xf32>, sym_name = "reallow_lowering_example"}> ({
  ^bb0(%arg0: index loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:22)):
    %0 = "memref.alloc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32> loc("<stdin>":4:10)
    %1 = "memref.realloc"(%0, %arg1) <{alignment = 8 : i64}> : (memref<?xf32>, index) -> memref<?xf32> loc("<stdin>":5:10)
    "func.return"(%1) : (memref<?xf32>) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
