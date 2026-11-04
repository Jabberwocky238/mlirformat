"builtin.module"() ({
  "func.func"() <{function_type = (memref<100x100xf32>, index, index, index, index) -> memref<?x?xf32, strided<[100, 1], offset: ?>>, sym_name = "subview_folder"}> ({
  ^bb0(%arg0: memref<100x100xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index):
    %0 = "memref.subview"(%arg0, %arg1, %arg2, %arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 2, 2, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (memref<100x100xf32>, index, index, index, index) -> memref<?x?xf32, strided<[100, 1], offset: ?>>
    "func.return"(%0) : (memref<?x?xf32, strided<[100, 1], offset: ?>>) -> ()
  }) : () -> ()
}) : () -> ()

