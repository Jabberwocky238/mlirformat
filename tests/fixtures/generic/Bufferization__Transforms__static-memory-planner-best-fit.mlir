"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "reuse_non_overlapping"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1024xf32>
    "memref.dealloc"(%0) : (memref<1024xf32>) -> ()
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1024xf32>
    "memref.dealloc"(%1) : (memref<1024xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "no_reuse_overlapping"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1024xf32>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<512xf32>
    "memref.dealloc"(%0) : (memref<1024xf32>) -> ()
    "memref.dealloc"(%1) : (memref<512xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "best_fit_smallest_gap"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1024xf32>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<256xf32>
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1024xf32>
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<256xf32>
    "memref.dealloc"(%1) : (memref<256xf32>) -> ()
    "memref.dealloc"(%3) : (memref<256xf32>) -> ()
    "memref.dealloc"(%0) : (memref<1024xf32>) -> ()
    %4 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<128xf32>
    "memref.dealloc"(%2) : (memref<1024xf32>) -> ()
    "memref.dealloc"(%4) : (memref<128xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "best_fit_alignment"}> ({
    %0 = "memref.alloc"() <{alignment = 128 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<128xi8>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<56xi8>
    %2 = "memref.alloc"() <{alignment = 128 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<128xi8>
    "memref.dealloc"(%1) : (memref<56xi8>) -> ()
    %3 = "memref.alloc"() <{alignment = 128 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64xi8>
    %4 = "memref.alloc"() <{alignment = 256 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64xi8>
    "memref.dealloc"(%0) : (memref<128xi8>) -> ()
    "memref.dealloc"(%2) : (memref<128xi8>) -> ()
    "memref.dealloc"(%3) : (memref<64xi8>) -> ()
    "memref.dealloc"(%4) : (memref<64xi8>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

