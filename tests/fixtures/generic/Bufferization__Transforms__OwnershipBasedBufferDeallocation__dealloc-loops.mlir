"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, i1, index, index) -> (memref<?xf32>, memref<?xf32>), sym_name = "loop_with_realloc", sym_visibility = "private"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: i1, %arg4: index, %arg5: index):
    %0 = "memref.alloc"(%arg4) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32>
    %1 = "memref.alloc"(%arg4) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32>
    %2:2 = "scf.for"(%arg0, %arg1, %arg2, %0, %1) ({
    ^bb0(%arg6: index, %arg7: memref<?xf32>, %arg8: memref<?xf32>):
      %3 = "memref.realloc"(%arg7, %arg5) : (memref<?xf32>, index) -> memref<?xf32>
      %4 = "memref.realloc"(%arg8, %arg5) : (memref<?xf32>, index) -> memref<?xf32>
      "scf.yield"(%3, %4) : (memref<?xf32>, memref<?xf32>) -> ()
    }) : (index, index, index, memref<?xf32>, memref<?xf32>) -> (memref<?xf32>, memref<?xf32>)
    "func.return"(%2#0, %2#1) : (memref<?xf32>, memref<?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, i1, index, index) -> (memref<?xf32>, memref<?xf32>), sym_name = "swapping_loop_with_realloc", sym_visibility = "private"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: i1, %arg4: index, %arg5: index):
    %0 = "memref.alloc"(%arg4) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32>
    %1 = "memref.alloc"(%arg4) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32>
    %2:2 = "scf.for"(%arg0, %arg1, %arg2, %0, %1) ({
    ^bb0(%arg6: index, %arg7: memref<?xf32>, %arg8: memref<?xf32>):
      %3 = "memref.realloc"(%arg7, %arg5) : (memref<?xf32>, index) -> memref<?xf32>
      %4 = "memref.realloc"(%arg8, %arg5) : (memref<?xf32>, index) -> memref<?xf32>
      "scf.yield"(%4, %3) : (memref<?xf32>, memref<?xf32>) -> ()
    }) : (index, index, index, memref<?xf32>, memref<?xf32>) -> (memref<?xf32>, memref<?xf32>)
    "func.return"(%2#0, %2#1) : (memref<?xf32>, memref<?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

