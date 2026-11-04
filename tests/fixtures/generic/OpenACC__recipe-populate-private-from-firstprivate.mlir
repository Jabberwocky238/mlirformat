"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_scalar_from_firstprivate"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> {test.var = "scalar"} : () -> memref<f32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "test_dynamic_from_firstprivate"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "memref.alloc"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 2, 0>}> {test.var = "dynamic_d2"} : (index, index) -> memref<?x?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

