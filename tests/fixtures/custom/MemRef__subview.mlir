#map = affine_map<(d0)[s0] -> (d0 + s0)>
#map1 = affine_map<(d0)[s0, s1] -> (d0 * s1 + s0)>
#map2 = affine_map<() -> (4)>
#map3 = affine_map<()[s0] -> (s0)>
#map4 = affine_map<(d0, d1)[s0] -> (d0 * 16 + d1 + s0)>
module {
  func.func @memref_subview(%arg0: index, %arg1: index, %arg2: index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %alloc = memref.alloc() : memref<8x16x4xf32, strided<[64, 4, 1]>>
    %subview = memref.subview %alloc[%c0, %c0, %c0] [%arg0, %arg1, %arg2] [%c1, %c1, %c1] : memref<8x16x4xf32, strided<[64, 4, 1]>> to memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
    %alloc_0 = memref.alloc()[%arg2] : memref<64xf32, #map>
    %subview_1 = memref.subview %alloc_0[%c1] [%arg0] [%c1] : memref<64xf32, #map> to memref<?xf32, #map1>
    %alloc_2 = memref.alloc() : memref<64x22xf32, strided<[22, 1]>>
    %subview_3 = memref.subview %alloc_2[%c0, %c1] [%arg0, %arg1] [%c1, %c0] : memref<64x22xf32, strided<[22, 1]>> to memref<?x?xf32, strided<[?, ?], offset: ?>>
    %subview_4 = memref.subview %alloc[0, 2, 0] [4, 4, 4] [1, 1, 1] : memref<8x16x4xf32, strided<[64, 4, 1]>> to memref<4x4x4xf32, strided<[64, 4, 1], offset: 8>>
    %alloc_5 = memref.alloc(%arg1, %arg2) : memref<?x?xf32>
    %subview_6 = memref.subview %alloc_5[0, 0] [4, 4] [1, 1] : memref<?x?xf32> to memref<4x4xf32, strided<[?, 1]>>
    %alloc_7 = memref.alloc() : memref<16x4xf32>
    %subview_8 = memref.subview %alloc_7[%arg1, %arg1] [4, 4] [%arg2, %arg2] : memref<16x4xf32> to memref<4x4xf32, strided<[?, ?], offset: ?>>
    %subview_9 = memref.subview %alloc_7[%arg1, %arg2] [4, 4] [2, 2] : memref<16x4xf32> to memref<4x4xf32, strided<[8, 2], offset: ?>>
    %alloc_10 = memref.alloc() : memref<1x9x1x4x1xf32, strided<[36, 36, 4, 4, 1]>>
    %subview_11 = memref.subview %alloc_10[%arg1, %arg1, %arg1, %arg1, %arg1] [1, 9, 1, 4, 1] [%arg2, %arg2, %arg2, %arg2, %arg2] : memref<1x9x1x4x1xf32, strided<[36, 36, 4, 4, 1]>> to memref<9x4xf32, strided<[?, ?], offset: ?>>
    %subview_12 = memref.subview %alloc_10[%arg1, %arg1, %arg1, %arg1, %arg1] [1, 9, 1, 4, 1] [%arg2, %arg2, %arg2, %arg2, %arg2] : memref<1x9x1x4x1xf32, strided<[36, 36, 4, 4, 1]>> to memref<1x9x4xf32, strided<[?, ?, ?], offset: ?>>
    %alloc_13 = memref.alloc(%arg1, %arg2)[%c0, %c1, %arg1, %arg0, %arg0, %arg2, %arg2] : memref<1x?x5x1x?x1xf32, strided<[?, ?, ?, ?, ?, ?], offset: ?>>
    %subview_14 = memref.subview %alloc_13[0, 0, 0, 0, 0, 0] [1, %arg1, 5, 1, %arg2, 1] [1, 1, 1, 1, 1, 1] : memref<1x?x5x1x?x1xf32, strided<[?, ?, ?, ?, ?, ?], offset: ?>> to memref<?x5x?xf32, strided<[?, ?, ?], offset: ?>>
    %subview_15 = memref.subview %alloc_13[%arg1, %arg1, %arg1, %arg1, %arg1, %arg1] [1, %arg1, 5, 1, %arg2, 1] [1, 1, 1, 1, 1, 1] : memref<1x?x5x1x?x1xf32, strided<[?, ?, ?, ?, ?, ?], offset: ?>> to memref<?x5x?x1xf32, strided<[?, ?, ?, ?], offset: ?>>
    %alloc_16 = memref.alloc() : memref<1x8xf32>
    %subview_17 = memref.subview %alloc_16[0, 0] [1, 8] [1, 1] : memref<1x8xf32> to memref<8xf32>
    %alloc_18 = memref.alloc() : memref<8x16x4xf32>
    %subview_19 = memref.subview %alloc_18[0, 0, 0] [1, 16, 4] [1, 1, 1] : memref<8x16x4xf32> to memref<16x4xf32>
    %subview_20 = memref.subview %alloc_18[3, 4, 1] [1, 6, 3] [1, 1, 1] : memref<8x16x4xf32> to memref<6x3xf32, strided<[4, 1], offset: 209>>
    %alloc_21 = memref.alloc() : memref<f32>
    %subview_22 = memref.subview %alloc_21[] [] [] : memref<f32> to memref<f32>
    %alloc_23 = memref.alloc() : memref<5x3xf32>
    %subview_24 = memref.subview %alloc_23[2, 0] [3, 3] [1, 1] : memref<5x3xf32> to memref<3x3xf32, strided<[3, 1], offset: 6>>
    %subview_25 = memref.subview %alloc_23[1, 0] [1, 3] [1, 1] : memref<5x3xf32> to memref<3xf32, strided<[1], offset: 3>>
    %subview_26 = memref.subview %alloc_23[1, 1] [1, 1] [1, 1] : memref<5x3xf32> to memref<f32, #map2>
    %subview_27 = memref.subview %alloc_23[%arg0, 1] [1, 1] [1, 1] : memref<5x3xf32> to memref<f32, #map3>
    %alloc_28 = memref.alloc(%arg0, %arg0) : memref<?x?xf32>
    %subview_29 = memref.subview %alloc_28[0, %arg1] [%arg2, 1] [1, 1] : memref<?x?xf32> to memref<?xf32, #map1>
    %c8 = arith.constant 8 : index
    %alloc_30 = memref.alloc() : memref<16x16xf32>
    %subview_31 = memref.subview %alloc_30[%c8, 8] [8, 8] [1, 1] : memref<16x16xf32> to memref<8x8xf32, #map4>
    return
  }
}

