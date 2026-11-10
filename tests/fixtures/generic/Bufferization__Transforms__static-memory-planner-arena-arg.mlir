"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8192xi8>) -> (), sym_name = "arena_from_arg"}> ({
  ^bb0(%arg0: memref<8192xi8>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1024xf32>
    "memref.dealloc"(%0) : (memref<1024xf32>) -> ()
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<512xf32>
    "memref.dealloc"(%1) : (memref<512xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

