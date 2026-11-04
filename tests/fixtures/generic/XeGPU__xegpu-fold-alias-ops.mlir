"builtin.module"() ({
  "func.func"() <{function_type = (memref<256x256xf32>, index, index, index, index) -> !xegpu.tensor_desc<8x16xf32>, sym_name = "fold_subview_with_xegpu_create_nd_tdesc"}> ({
  ^bb0(%arg0: memref<256x256xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index):
    %0 = "memref.subview"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 32, 32>, static_strides = array<i64: 1, 1>}> : (memref<256x256xf32>, index, index) -> memref<32x32xf32, strided<[256, 1], offset: ?>>
    %1 = "xegpu.create_nd_tdesc"(%0, %arg3, %arg4) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<32x32xf32, strided<[256, 1], offset: ?>>, index, index) -> !xegpu.tensor_desc<8x16xf32>
    "func.return"(%1) : (!xegpu.tensor_desc<8x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

