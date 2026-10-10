"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (index, index), sym_name = "memref_alloc"}> ({
  ^bb0(%arg0: index):
    %0 = "memref.alloc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<6x?xf32>
    %1 = "test.reify_bound"(%0) <{dim = 0 : i64, type = "EQ"}> : (memref<6x?xf32>) -> index
    %2 = "test.reify_bound"(%0) <{dim = 1 : i64, type = "EQ"}> : (memref<6x?xf32>) -> index
    "func.return"(%1, %2) : (index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (index, index), sym_name = "memref_alloca"}> ({
  ^bb0(%arg0: index):
    %0 = "memref.alloca"(%arg0) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<6x?xf32>
    %1 = "test.reify_bound"(%0) <{dim = 0 : i64, type = "EQ"}> : (memref<6x?xf32>) -> index
    %2 = "test.reify_bound"(%0) <{dim = 1 : i64, type = "EQ"}> : (memref<6x?xf32>) -> index
    "func.return"(%1, %2) : (index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xf32>) -> index, sym_name = "memref_cast"}> ({
  ^bb0(%arg0: memref<10xf32>):
    %0 = "memref.cast"(%arg0) : (memref<10xf32>) -> memref<?xf32>
    %1 = "test.reify_bound"(%0) <{dim = 0 : i64, type = "EQ"}> : (memref<?xf32>) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>) -> index, sym_name = "memref_dim"}> ({
  ^bb0(%arg0: memref<?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "memref.dim"(%arg0, %0) : (memref<?xf32>, index) -> index
    %2 = "test.reify_bound"(%1) <{type = "EQ"}> : (index) -> index
    "func.return"(%2) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, index) -> (), sym_name = "memref_dim_all_positive"}> ({
  ^bb0(%arg0: memref<?xf32>, %arg1: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "memref.dim"(%arg0, %arg1) : (memref<?xf32>, index) -> index
    "test.compare"(%1, %0) <{cmp = "GE"}> : (index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, index) -> (index, index), sym_name = "memref_expand"}> ({
  ^bb0(%arg0: memref<?xf32>, %arg1: index):
    %0 = "memref.expand_shape"(%arg0, %arg1) <{reassociation = [[0, 1]], static_output_shape = array<i64: 4, -9223372036854775808>}> : (memref<?xf32>, index) -> memref<4x?xf32>
    %1 = "test.reify_bound"(%0) <{dim = 0 : i64, type = "EQ"}> : (memref<4x?xf32>) -> index
    %2 = "test.reify_bound"(%0) <{dim = 1 : i64, type = "EQ"}> : (memref<4x?xf32>) -> index
    "func.return"(%1, %2) : (index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (index, index), sym_name = "memref_collapse"}> ({
  ^bb0(%arg0: index):
    %0 = "memref.alloc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<3x4x?x2xf32>
    %1 = "memref.collapse_shape"(%0) <{reassociation = [[0, 1], [2, 3]]}> : (memref<3x4x?x2xf32>) -> memref<12x?xf32>
    %2 = "test.reify_bound"(%1) <{dim = 0 : i64, type = "EQ"}> : (memref<12x?xf32>) -> index
    %3 = "test.reify_bound"(%1) <{dim = 1 : i64, type = "EQ"}> : (memref<12x?xf32>) -> index
    "func.return"(%2, %3) : (index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "memref.global"() <{initial_value = dense<[0.000000e+00, 1.000000e+00, 2.000000e+00, 3.000000e+00]> : tensor<4xf32>, sym_name = "gv0", sym_visibility = "private", type = memref<4xf32>}> : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "memref_get_global"}> ({
    %0 = "memref.get_global"() <{name = @gv0}> : () -> memref<4xf32>
    %1 = "test.reify_bound"(%0) <{dim = 0 : i64, type = "EQ"}> : (memref<4xf32>) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<5xf32>) -> index, sym_name = "memref_rank"}> ({
  ^bb0(%arg0: memref<5xf32>):
    %0 = "memref.rank"(%arg0) : (memref<5xf32>) -> index
    %1 = "test.reify_bound"(%0) <{type = "EQ"}> : (index) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, index) -> index, sym_name = "memref_subview"}> ({
  ^bb0(%arg0: memref<?xf32>, %arg1: index):
    %0 = "memref.subview"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>, static_offsets = array<i64: 2>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (memref<?xf32>, index) -> memref<?xf32, strided<[1], offset: 2>>
    %1 = "test.reify_bound"(%0) <{dim = 0 : i64, type = "EQ"}> : (memref<?xf32, strided<[1], offset: 2>>) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

