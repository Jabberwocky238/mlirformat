module {
  func.func @amx_tile_zero(%arg0: memref<?x?xf32>, %arg1: index) {
    %0 = amx.tile_zero : !amx.tile<16x16xf32>
    amx.tile_store %arg0[%arg1, %arg1], %0 : memref<?x?xf32>, !amx.tile<16x16xf32>
    return
  }
  func.func @amx_tile_load_store(%arg0: memref<?x?xi8>, %arg1: memref<?x?xi8>, %arg2: index) {
    %0 = amx.tile_load %arg0[%arg2, %arg2] : memref<?x?xi8> into !amx.tile<16x64xi8>
    amx.tile_store %arg1[%arg2, %arg2], %0 : memref<?x?xi8>, !amx.tile<16x64xi8>
    return
  }
  func.func @amx_tile_load_store_strided(%arg0: memref<?xi8>, %arg1: memref<?xi8>, %arg2: index, %arg3: index) {
    %0 = amx.tile_load %arg0[%arg2], %arg3 : memref<?xi8> into !amx.tile<16x64xi8>
    amx.tile_store %arg1[%arg2], %0, %arg3 : memref<?xi8>, !amx.tile<16x64xi8>
    return
  }
  func.func @amx_tile_mulf_bf16(%arg0: memref<?x?xbf16>, %arg1: memref<?x?xbf16>, %arg2: index, %arg3: memref<?x?xf32>) {
    %0 = amx.tile_zero : !amx.tile<16x16xf32>
    %1 = amx.tile_load %arg0[%arg2, %arg2] : memref<?x?xbf16> into !amx.tile<16x32xbf16>
    %2 = amx.tile_load %arg1[%arg2, %arg2] : memref<?x?xbf16> into !amx.tile<16x32xbf16>
    %3 = amx.tile_mulf %1, %2, %0 : !amx.tile<16x32xbf16>, !amx.tile<16x32xbf16>, !amx.tile<16x16xf32>
    amx.tile_store %arg3[%arg2, %arg2], %3 : memref<?x?xf32>, !amx.tile<16x16xf32>
    return
  }
  func.func @amx_tile_mulf_f16(%arg0: memref<?x?xf16>, %arg1: memref<?x?xf16>, %arg2: index, %arg3: memref<?x?xf32>) {
    %0 = amx.tile_zero : !amx.tile<16x16xf32>
    %1 = amx.tile_load %arg0[%arg2, %arg2] : memref<?x?xf16> into !amx.tile<16x32xf16>
    %2 = amx.tile_load %arg1[%arg2, %arg2] : memref<?x?xf16> into !amx.tile<16x32xf16>
    %3 = amx.tile_mulf %1, %2, %0 : !amx.tile<16x32xf16>, !amx.tile<16x32xf16>, !amx.tile<16x16xf32>
    amx.tile_store %arg3[%arg2, %arg2], %3 : memref<?x?xf32>, !amx.tile<16x16xf32>
    return
  }
  func.func @amx_tile_muli(%arg0: memref<?x?xi8>, %arg1: memref<?x?xi8>, %arg2: memref<?x?xi32>, %arg3: index, %arg4: memref<?x?xi8>) {
    %c0 = arith.constant 0 : index
    %c16 = arith.constant 16 : index
    %0 = amx.tile_load %arg0[%arg3, %arg3] : memref<?x?xi8> into !amx.tile<16x64xi8>
    %1 = amx.tile_load %arg1[%arg3, %arg3] : memref<?x?xi8> into !amx.tile<16x64xi8>
    %2 = amx.tile_load %arg2[%arg3, %arg3] : memref<?x?xi32> into !amx.tile<16x16xi32>
    %3 = amx.tile_muli %0 zext, %1 zext, %2 : !amx.tile<16x64xi8>, !amx.tile<16x64xi8>, !amx.tile<16x16xi32>
    %4 = amx.tile_muli %0, %1, %2 : !amx.tile<16x64xi8>, !amx.tile<16x64xi8>, !amx.tile<16x16xi32>
    %5 = amx.tile_muli %0 zext, %1, %2 : !amx.tile<16x64xi8>, !amx.tile<16x64xi8>, !amx.tile<16x16xi32>
    %6 = amx.tile_muli %0, %1 zext, %2 : !amx.tile<16x64xi8>, !amx.tile<16x64xi8>, !amx.tile<16x16xi32>
    amx.tile_store %arg4[%c0, %c0], %3 : memref<?x?xi8>, !amx.tile<16x16xi32>
    amx.tile_store %arg4[%c0, %c16], %4 : memref<?x?xi8>, !amx.tile<16x16xi32>
    amx.tile_store %arg4[%c16, %c0], %5 : memref<?x?xi8>, !amx.tile<16x16xi32>
    amx.tile_store %arg4[%c16, %c16], %6 : memref<?x?xi8>, !amx.tile<16x16xi32>
    return
  }
  func.func @amx_tile_type_through_cf(%arg0: memref<?x?xi8>, %arg1: memref<?x?xi8>, %arg2: index, %arg3: i1) {
    cf.cond_br %arg3, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    %0 = amx.tile_load %arg0[%arg2, %arg2] : memref<?x?xi8> into !amx.tile<16x64xi8>
    cf.br ^bb3(%0 : !amx.tile<16x64xi8>)
  ^bb2:  // pred: ^bb0
    %1 = amx.tile_zero : !amx.tile<16x64xi8>
    cf.br ^bb3(%1 : !amx.tile<16x64xi8>)
  ^bb3(%2: !amx.tile<16x64xi8>):  // 2 preds: ^bb1, ^bb2
    cf.br ^bb4
  ^bb4:  // pred: ^bb3
    amx.tile_store %arg1[%arg2, %arg2], %2 : memref<?x?xi8>, !amx.tile<16x64xi8>
    return
  }
}

