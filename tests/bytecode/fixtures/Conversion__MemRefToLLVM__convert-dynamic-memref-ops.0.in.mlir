"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> memref<?x42x?xf32>, sym_name = "mixed_alloc"}> ({
  ^bb0(%arg0: index loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:22)):
    %0 = "memref.alloc"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x42x?xf32> loc("<stdin>":4:10)
    "func.return"(%0) : (memref<?x42x?xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
