"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_static_memref_alloc"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> {test.ptr} : () -> memref<10x20xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_dynamic_memref_alloc"}> ({
    %0 = "arith.constant"() <{value = 10 : index}> : () -> index
    %1 = "arith.constant"() <{value = 20 : index}> : () -> index
    %2 = "memref.alloc"(%0, %1) <{operandSegmentSizes = array<i32: 2, 0>}> {test.ptr} : (index, index) -> memref<?x?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

