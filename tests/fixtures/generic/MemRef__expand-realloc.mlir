"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> memref<?xf32>, sym_name = "reallow_lowering_example"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "memref.alloc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32>
    %1 = "memref.realloc"(%0, %arg1) <{alignment = 8 : i64}> : (memref<?xf32>, index) -> memref<?xf32>
    "func.return"(%1) : (memref<?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> memref<4xf32>, sym_name = "reallow_lowering_example"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
    %1 = "memref.realloc"(%0) <{alignment = 8 : i64}> : (memref<2xf32>) -> memref<4xf32>
    "func.return"(%1) : (memref<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> memref<4xf32>, sym_name = "reallow_lowering_example"}> ({
  ^bb0(%arg0: index):
    %0 = "memref.alloc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32>
    %1 = "memref.realloc"(%0) : (memref<?xf32>) -> memref<4xf32>
    "func.return"(%1) : (memref<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> memref<?xf32>, sym_name = "reallow_lowering_example"}> ({
  ^bb0(%arg0: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
    %1 = "memref.realloc"(%0, %arg0) : (memref<2xf32>, index) -> memref<?xf32>
    "func.return"(%1) : (memref<?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

