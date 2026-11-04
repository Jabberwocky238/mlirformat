module {
  func.func @fold_subview_with_xegpu_create_nd_tdesc(%arg0: memref<256x256xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) -> !xegpu.tensor_desc<8x16xf32> {
    %subview = memref.subview %arg0[%arg1, %arg2] [32, 32] [1, 1] : memref<256x256xf32> to memref<32x32xf32, strided<[256, 1], offset: ?>>
    %0 = xegpu.create_nd_tdesc %subview[%arg3, %arg4] : memref<32x32xf32, strided<[256, 1], offset: ?>> -> !xegpu.tensor_desc<8x16xf32>
    return %0 : !xegpu.tensor_desc<8x16xf32>
  }
}

