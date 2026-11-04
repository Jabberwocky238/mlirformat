"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_memref_store_scalar"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> {test.ptr} : () -> memref<f32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_memref_store_int"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> {test.ptr} : () -> memref<i32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_memref_store_i64"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> {test.ptr} : () -> memref<i64>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_memref_store_dynamic"}> ({
    %0 = "arith.constant"() <{value = 10 : index}> : () -> index
    %1 = "memref.alloc"(%0) <{operandSegmentSizes = array<i32: 1, 0>}> {test.ptr} : (index) -> memref<?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

