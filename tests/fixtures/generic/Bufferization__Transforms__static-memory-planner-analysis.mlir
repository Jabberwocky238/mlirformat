"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "simple_sequential"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1024xf32>
    "memref.dealloc"(%0) : (memref<1024xf32>) -> ()
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<512xf32>
    "memref.dealloc"(%1) : (memref<512xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "non_sequential_pairs"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1024xf32>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<512xf32>
    "memref.dealloc"(%0) : (memref<1024xf32>) -> ()
    "memref.dealloc"(%1) : (memref<512xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "interleaved_pairs"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<512xf32>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<256xf32>
    "memref.dealloc"(%0) : (memref<512xf32>) -> ()
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<128xf32>
    "memref.dealloc"(%1) : (memref<256xf32>) -> ()
    "memref.dealloc"(%2) : (memref<128xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "dynamic_shape_skipped"}> ({
  ^bb0(%arg0: index):
    %0 = "memref.alloc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "no_dealloc_skipped"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1024xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> (), sym_name = "different_block_skipped"}> ({
  ^bb0(%arg0: i1):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1024xf32>
    "scf.if"(%arg0) ({
      "memref.dealloc"(%0) : (memref<1024xf32>) -> ()
      "scf.yield"() : () -> ()
    }, {
    }) : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "multiple_sequential"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1024xf32>
    "memref.dealloc"(%0) : (memref<1024xf32>) -> ()
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<512xf32>
    "memref.dealloc"(%1) : (memref<512xf32>) -> ()
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2048xf32>
    "memref.dealloc"(%2) : (memref<2048xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "alignment_padding"}> ({
    %0 = "memref.alloc"() <{alignment = 128 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<256xf32>
    "memref.dealloc"(%0) : (memref<256xf32>) -> ()
    %1 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<128xf32>
    "memref.dealloc"(%1) : (memref<128xf32>) -> ()
    %2 = "memref.alloc"() <{alignment = 128 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64xf32>
    "memref.dealloc"(%2) : (memref<64xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "lcm_alignment"}> ({
    %0 = "memref.alloc"() <{alignment = 4 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3xi32>
    "memref.dealloc"(%0) : (memref<3xi32>) -> ()
    %1 = "memref.alloc"() <{alignment = 16 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3xi32>
    "memref.dealloc"(%1) : (memref<3xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

