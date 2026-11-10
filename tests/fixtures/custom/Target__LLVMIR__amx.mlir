module {
  func.func @amx_tile_zero(%arg0: memref<?x?xf32>, %arg1: index) {
    %0 = x86.amx.tile_zero : !x86.amx.tile<16x16xf32>
    x86.amx.tile_store %arg0[%arg1, %arg1], %0 : memref<?x?xf32>, !x86.amx.tile<16x16xf32>
    return
  }
  func.func @amx_tile_load_store(%arg0: memref<?x?xi8>, %arg1: memref<?x?xi8>, %arg2: index) {
    %0 = x86.amx.tile_load %arg0[%arg2, %arg2] : memref<?x?xi8> into !x86.amx.tile<16x64xi8>
    x86.amx.tile_store %arg1[%arg2, %arg2], %0 : memref<?x?xi8>, !x86.amx.tile<16x64xi8>
    return
  }
  func.func @amx_tile_load_store_strided(%arg0: memref<?xi8>, %arg1: memref<?xi8>, %arg2: index, %arg3: index) {
    %0 = x86.amx.tile_load %arg0[%arg2], %arg3 : memref<?xi8> into !x86.amx.tile<16x64xi8>
    x86.amx.tile_store %arg1[%arg2], %0, %arg3 : memref<?xi8>, !x86.amx.tile<16x64xi8>
    return
  }
  func.func @amx_tile_mulf_bf16(%arg0: memref<?x?xbf16>, %arg1: memref<?x?xbf16>, %arg2: index, %arg3: memref<?x?xf32>) {
    %0 = x86.amx.tile_zero : !x86.amx.tile<16x16xf32>
    %1 = x86.amx.tile_load %arg0[%arg2, %arg2] : memref<?x?xbf16> into !x86.amx.tile<16x32xbf16>
    %2 = x86.amx.tile_load %arg1[%arg2, %arg2] : memref<?x?xbf16> into !x86.amx.tile<16x32xbf16>
    %3 = x86.amx.tile_mulf %1, %2, %0 : !x86.amx.tile<16x32xbf16>, !x86.amx.tile<16x32xbf16>, !x86.amx.tile<16x16xf32>
    x86.amx.tile_store %arg3[%arg2, %arg2], %3 : memref<?x?xf32>, !x86.amx.tile<16x16xf32>
    return
  }
  func.func @amx_tile_mulf_f16(%arg0: memref<?x?xf16>, %arg1: memref<?x?xf16>, %arg2: index, %arg3: memref<?x?xf32>) {
    %0 = x86.amx.tile_zero : !x86.amx.tile<16x16xf32>
    %1 = x86.amx.tile_load %arg0[%arg2, %arg2] : memref<?x?xf16> into !x86.amx.tile<16x32xf16>
    %2 = x86.amx.tile_load %arg1[%arg2, %arg2] : memref<?x?xf16> into !x86.amx.tile<16x32xf16>
    %3 = x86.amx.tile_mulf %1, %2, %0 : !x86.amx.tile<16x32xf16>, !x86.amx.tile<16x32xf16>, !x86.amx.tile<16x16xf32>
    x86.amx.tile_store %arg3[%arg2, %arg2], %3 : memref<?x?xf32>, !x86.amx.tile<16x16xf32>
    return
  }
  func.func @amx_tile_mulf_f8(%arg0: memref<?x?xf8E4M3FN>, %arg1: memref<?x?xf8E5M2>, %arg2: index, %arg3: memref<?x?xf32>) {
    %c0 = arith.constant 0 : index
    %c16 = arith.constant 16 : index
    %0 = x86.amx.tile_zero : !x86.amx.tile<16x16xf32>
    %1 = x86.amx.tile_load %arg0[%arg2, %arg2] : memref<?x?xf8E4M3FN> into !x86.amx.tile<16x64xf8E4M3FN>
    %2 = x86.amx.tile_load %arg1[%arg2, %arg2] : memref<?x?xf8E5M2> into !x86.amx.tile<16x64xf8E5M2>
    %3 = x86.amx.tile_load %arg0[%c0, %c0] : memref<?x?xf8E4M3FN> into !x86.amx.tile<16x64xf8E4M3FN>
    %4 = x86.amx.tile_load %arg1[%c0, %c0] : memref<?x?xf8E5M2> into !x86.amx.tile<16x64xf8E5M2>
    %5 = x86.amx.tile_mulf %1, %3, %0 : !x86.amx.tile<16x64xf8E4M3FN>, !x86.amx.tile<16x64xf8E4M3FN>, !x86.amx.tile<16x16xf32>
    %6 = x86.amx.tile_mulf %1, %2, %0 : !x86.amx.tile<16x64xf8E4M3FN>, !x86.amx.tile<16x64xf8E5M2>, !x86.amx.tile<16x16xf32>
    %7 = x86.amx.tile_mulf %2, %1, %0 : !x86.amx.tile<16x64xf8E5M2>, !x86.amx.tile<16x64xf8E4M3FN>, !x86.amx.tile<16x16xf32>
    %8 = x86.amx.tile_mulf %2, %4, %0 : !x86.amx.tile<16x64xf8E5M2>, !x86.amx.tile<16x64xf8E5M2>, !x86.amx.tile<16x16xf32>
    x86.amx.tile_store %arg3[%arg2, %c0], %5 : memref<?x?xf32>, !x86.amx.tile<16x16xf32>
    x86.amx.tile_store %arg3[%arg2, %c16], %6 : memref<?x?xf32>, !x86.amx.tile<16x16xf32>
    x86.amx.tile_store %arg3[%c0, %arg2], %7 : memref<?x?xf32>, !x86.amx.tile<16x16xf32>
    x86.amx.tile_store %arg3[%c16, %arg2], %8 : memref<?x?xf32>, !x86.amx.tile<16x16xf32>
    return
  }
  func.func @amx_tile_muli(%arg0: memref<?x?xi8>, %arg1: memref<?x?xi8>, %arg2: memref<?x?xi32>, %arg3: index, %arg4: memref<?x?xi8>) {
    %c0 = arith.constant 0 : index
    %c16 = arith.constant 16 : index
    %0 = x86.amx.tile_load %arg0[%arg3, %arg3] : memref<?x?xi8> into !x86.amx.tile<16x64xi8>
    %1 = x86.amx.tile_load %arg1[%arg3, %arg3] : memref<?x?xi8> into !x86.amx.tile<16x64xi8>
    %2 = x86.amx.tile_load %arg2[%arg3, %arg3] : memref<?x?xi32> into !x86.amx.tile<16x16xi32>
    %3 = x86.amx.tile_muli %0 zext, %1 zext, %2 : !x86.amx.tile<16x64xi8>, !x86.amx.tile<16x64xi8>, !x86.amx.tile<16x16xi32>
    %4 = x86.amx.tile_muli %0, %1, %2 : !x86.amx.tile<16x64xi8>, !x86.amx.tile<16x64xi8>, !x86.amx.tile<16x16xi32>
    %5 = x86.amx.tile_muli %0 zext, %1, %2 : !x86.amx.tile<16x64xi8>, !x86.amx.tile<16x64xi8>, !x86.amx.tile<16x16xi32>
    %6 = x86.amx.tile_muli %0, %1 zext, %2 : !x86.amx.tile<16x64xi8>, !x86.amx.tile<16x64xi8>, !x86.amx.tile<16x16xi32>
    x86.amx.tile_store %arg4[%c0, %c0], %3 : memref<?x?xi8>, !x86.amx.tile<16x16xi32>
    x86.amx.tile_store %arg4[%c0, %c16], %4 : memref<?x?xi8>, !x86.amx.tile<16x16xi32>
    x86.amx.tile_store %arg4[%c16, %c0], %5 : memref<?x?xi8>, !x86.amx.tile<16x16xi32>
    x86.amx.tile_store %arg4[%c16, %c16], %6 : memref<?x?xi8>, !x86.amx.tile<16x16xi32>
    return
  }
  func.func @amx_tile_type_through_cf(%arg0: memref<?x?xi8>, %arg1: memref<?x?xi8>, %arg2: index, %arg3: i1) {
    cf.cond_br %arg3, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    %0 = x86.amx.tile_load %arg0[%arg2, %arg2] : memref<?x?xi8> into !x86.amx.tile<16x64xi8>
    cf.br ^bb3(%0 : !x86.amx.tile<16x64xi8>)
  ^bb2:  // pred: ^bb0
    %1 = x86.amx.tile_zero : !x86.amx.tile<16x64xi8>
    cf.br ^bb3(%1 : !x86.amx.tile<16x64xi8>)
  ^bb3(%2: !x86.amx.tile<16x64xi8>):  // 2 preds: ^bb1, ^bb2
    cf.br ^bb4
  ^bb4:  // pred: ^bb3
    x86.amx.tile_store %arg1[%arg2, %arg2], %2 : memref<?x?xi8>, !x86.amx.tile<16x64xi8>
    return
  }
}

