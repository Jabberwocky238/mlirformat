"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, i1, index, index) -> (memref<?xf32>, memref<?xf32>), sym_name = "loop_with_realloc", sym_visibility = "private"}> ({
  ^bb0(%arg0: index loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:22), %arg2: index loc("<stdin>":3:36), %arg3: i1 loc("<stdin>":3:50), %arg4: index loc("<stdin>":3:61), %arg5: index loc("<stdin>":3:75)):
    %0 = "memref.alloc"(%arg4) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32> loc("<stdin>":4:10)
    %1 = "memref.alloc"(%arg4) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32> loc("<stdin>":5:10)
    %2:2 = "scf.for"(%arg0, %arg1, %arg2, %0, %1) ({
    ^bb0(%arg6: index loc("<stdin>":7:10), %arg7: memref<?xf32> loc("<stdin>":7:24), %arg8: memref<?xf32> loc("<stdin>":7:46)):
      %3 = "memref.realloc"(%arg7, %arg5) : (memref<?xf32>, index) -> memref<?xf32> loc("<stdin>":8:12)
      %4 = "memref.realloc"(%arg8, %arg5) : (memref<?xf32>, index) -> memref<?xf32> loc("<stdin>":9:12)
      "scf.yield"(%3, %4) : (memref<?xf32>, memref<?xf32>) -> () loc("<stdin>":10:7)
    }) : (index, index, index, memref<?xf32>, memref<?xf32>) -> (memref<?xf32>, memref<?xf32>) loc("<stdin>":6:12)
    "func.return"(%2#0, %2#1) : (memref<?xf32>, memref<?xf32>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
