"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_memref_cast_identity"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> {cast_dest = memref<f32>, test.cast} : () -> memref<f32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_memref_cast_static_to_dynamic"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> {cast_dest = memref<?xf32>, test.cast} : () -> memref<4xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_memref_memory_space_cast"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> {cast_dest = memref<4xf32, 1>, test.cast} : () -> memref<4xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_memref_cast_incompatible"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> {cast_dest = tensor<4xf32>, test.cast} : () -> memref<4xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

