"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (memref<5xf32>, memref<5xf32>), sym_name = "test"}> ({
  ^bb0(%arg0: index loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:22)):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<5xf32> loc("<stdin>":4:10)
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<5xf32> loc("<stdin>":5:10)
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":6:10)
    %3:2 = "scf.for"(%arg0, %arg1, %2, %0, %1) ({
    ^bb0(%arg2: index loc("<stdin>":8:10), %arg3: memref<5xf32> loc("<stdin>":8:24), %arg4: memref<5xf32> loc("<stdin>":8:46)):
      "scf.yield"(%arg4, %arg3) : (memref<5xf32>, memref<5xf32>) -> () loc("<stdin>":9:7)
    }) : (index, index, index, memref<5xf32>, memref<5xf32>) -> (memref<5xf32>, memref<5xf32>) loc("<stdin>":7:12)
    "func.return"(%3#0, %3#1) : (memref<5xf32>, memref<5xf32>) -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
