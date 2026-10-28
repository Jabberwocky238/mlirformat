module {
  func.func @muli(%arg0: memref<?x?xi8>, %arg1: memref<?x?xi32>) {
    %c0 = arith.constant 0 : index
    %0 = amx.tile_zero : !amx.tile<16x64xi8>
    %1 = amx.tile_load %arg0[%c0, %c0] : memref<?x?xi8> into !amx.tile<16x64xi8>
    %2 = amx.tile_load %arg1[%c0, %c0] : memref<?x?xi32> into !amx.tile<16x16xi32>
    %3 = amx.tile_muli %0 zext, %1 zext, %2 : !amx.tile<16x64xi8>, !amx.tile<16x64xi8>, !amx.tile<16x16xi32>
    amx.tile_store %arg1[%c0, %c0], %3 : memref<?x?xi32>, !amx.tile<16x16xi32>
    %4 = amx.tile_muli %0, %1, %2 : !amx.tile<16x64xi8>, !amx.tile<16x64xi8>, !amx.tile<16x16xi32>
    amx.tile_store %arg1[%c0, %c0], %4 : memref<?x?xi32>, !amx.tile<16x16xi32>
    %5 = amx.tile_muli %0 zext, %1, %2 : !amx.tile<16x64xi8>, !amx.tile<16x64xi8>, !amx.tile<16x16xi32>
    amx.tile_store %arg1[%c0, %c0], %5 : memref<?x?xi32>, !amx.tile<16x16xi32>
    %6 = amx.tile_muli %0, %1 zext, %2 : !amx.tile<16x64xi8>, !amx.tile<16x64xi8>, !amx.tile<16x16xi32>
    amx.tile_store %arg1[%c0, %c0], %6 : memref<?x?xi32>, !amx.tile<16x16xi32>
    return
  }
  func.func @mulbf16(%arg0: memref<?x?xbf16>, %arg1: memref<?x?xf32>) {
    %c0 = arith.constant 0 : index
    %0 = amx.tile_zero : !amx.tile<16x32xbf16>
    %1 = amx.tile_load %arg0[%c0, %c0] : memref<?x?xbf16> into !amx.tile<16x32xbf16>
    %2 = amx.tile_load %arg1[%c0, %c0] : memref<?x?xf32> into !amx.tile<16x16xf32>
    %3 = amx.tile_mulf %0, %1, %2 : !amx.tile<16x32xbf16>, !amx.tile<16x32xbf16>, !amx.tile<16x16xf32>
    amx.tile_store %arg1[%c0, %c0], %3 : memref<?x?xf32>, !amx.tile<16x16xf32>
    return
  }
  func.func @mulfp16(%arg0: memref<?x?xf16>, %arg1: memref<?x?xf32>) {
    %c0 = arith.constant 0 : index
    %0 = amx.tile_zero : !amx.tile<16x32xf16>
    %1 = amx.tile_load %arg0[%c0, %c0] : memref<?x?xf16> into !amx.tile<16x32xf16>
    %2 = amx.tile_load %arg1[%c0, %c0] : memref<?x?xf32> into !amx.tile<16x16xf32>
    %3 = amx.tile_mulf %0, %1, %2 : !amx.tile<16x32xf16>, !amx.tile<16x32xf16>, !amx.tile<16x16xf32>
    amx.tile_store %arg1[%c0, %c0], %3 : memref<?x?xf32>, !amx.tile<16x16xf32>
    return
  }
  func.func @strides_implicit(%arg0: memref<16x32xi8>, %arg1: memref<32x32xbf16, strided<[64, 1]>>, %arg2: memref<16x32xf32, strided<[?, 1]>>) {
    %c0 = arith.constant 0 : index
    %0 = amx.tile_load %arg0[%c0, %c0] : memref<16x32xi8> into !amx.tile<16x32xi8>
    %1 = amx.tile_load %arg1[%c0, %c0] : memref<32x32xbf16, strided<[64, 1]>> into !amx.tile<16x32xbf16>
    %2 = amx.tile_load %arg2[%c0, %c0] : memref<16x32xf32, strided<[?, 1]>> into !amx.tile<16x16xf32>
    amx.tile_store %arg0[%c0, %c0], %0 : memref<16x32xi8>, !amx.tile<16x32xi8>
    amx.tile_store %arg1[%c0, %c0], %1 : memref<32x32xbf16, strided<[64, 1]>>, !amx.tile<16x32xbf16>
    amx.tile_store %arg2[%c0, %c0], %2 : memref<16x32xf32, strided<[?, 1]>>, !amx.tile<16x16xf32>
    return
  }
  func.func @strides_explicit(%arg0: index, %arg1: memref<?xi8>, %arg2: memref<16x32xbf16>, %arg3: memref<32x32xf32, strided<[64, 1]>>) {
    %c0 = arith.constant 0 : index
    %c64 = arith.constant 64 : index
    %0 = amx.tile_load %arg1[%c0], %arg0 : memref<?xi8> into !amx.tile<16x32xi8>
    %1 = amx.tile_load %arg2[%c0, %c0], %arg0 : memref<16x32xbf16> into !amx.tile<16x32xbf16>
    %2 = amx.tile_load %arg3[%c0, %c0], %c64 : memref<32x32xf32, strided<[64, 1]>> into !amx.tile<16x16xf32>
    amx.tile_store %arg1[%c0], %0, %arg0 : memref<?xi8>, !amx.tile<16x32xi8>
    amx.tile_store %arg2[%c0, %c0], %1, %arg0 : memref<16x32xbf16>, !amx.tile<16x32xbf16>
    amx.tile_store %arg3[%c0, %c0], %2, %c64 : memref<32x32xf32, strided<[64, 1]>>, !amx.tile<16x16xf32>
    return
  }
}

