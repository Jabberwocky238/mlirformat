"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (memref<5xf32>, memref<5xf32>), sym_name = "test"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<5xf32>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<5xf32>
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3:2 = "scf.for"(%arg0, %arg1, %2, %0, %1) ({
    ^bb0(%arg2: index, %arg3: memref<5xf32>, %arg4: memref<5xf32>):
      "scf.yield"(%arg4, %arg3) : (memref<5xf32>, memref<5xf32>) -> ()
    }) : (index, index, index, memref<5xf32>, memref<5xf32>) -> (memref<5xf32>, memref<5xf32>)
    "func.return"(%3#0, %3#1) : (memref<5xf32>, memref<5xf32>) -> ()
  }) : () -> ()
}) : () -> ()

