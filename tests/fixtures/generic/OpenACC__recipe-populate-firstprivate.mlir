"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_scalar"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> {test.var = "scalar"} : () -> memref<f32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_static_2d"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> {test.var = "static_2d"} : () -> memref<10x20xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "test_dynamic_2d"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "memref.alloc"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 2, 0>}> {test.var = "dynamic_2d"} : (index, index) -> memref<?x?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "test_mixed_dims"}> ({
  ^bb0(%arg0: index):
    %0 = "memref.alloc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0>}> {test.var = "mixed_dims"} : (index) -> memref<10x?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_scalar_int"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> {test.var = "scalar_int"} : () -> memref<i32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

