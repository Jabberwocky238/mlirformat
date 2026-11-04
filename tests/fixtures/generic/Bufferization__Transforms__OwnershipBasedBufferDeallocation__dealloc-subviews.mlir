"builtin.module"() ({
  "func.func"() <{function_type = (index, index, memref<?x?xf32>) -> (), sym_name = "subview"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: memref<?x?xf32>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x4xf32, strided<[4, 1]>>
    %1 = "memref.subview"(%0, %arg0, %arg1, %arg0, %arg1, %arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 2, 2, 2>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: -9223372036854775808, -9223372036854775808>}> : (memref<64x4xf32, strided<[4, 1]>>, index, index, index, index, index, index) -> memref<?x?xf32, strided<[?, ?], offset: ?>>
    "test.copy"(%1, %arg2) : (memref<?x?xf32, strided<[?, ?], offset: ?>>, memref<?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

