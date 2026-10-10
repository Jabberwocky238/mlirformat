#map = affine_map<(d0, d1, d2)[s0] -> (d0 * 32 + d1 * 16 + d2 * s0 + 1)>
#map1 = affine_map<(d0, d1, d2)[s0] -> (d0 * 32 + d1 * s0 + d2 * 16 + 3)>
#map2 = affine_map<(d0, d1, d2)[s0] -> (d0 * s0 + d1 * 32 + d2 * 16 + 7)>
#map3 = affine_map<(d0, d1, d2)[s0] -> (d0 * s0 + d1 * 32 + d2 * 16 + s0)>
#map4 = affine_map<(d0, d1, d2)[s0, s1] -> (d0 * s0 + d1 * s1 + d2 + 1)>
#map5 = affine_map<(d0)[s0] -> (s0)>
#map6 = affine_map<(d0)[s0] -> (123)>
#map7 = affine_map<()[s0] -> (s0)>
#map8 = affine_map<()[s0] -> (123)>
#map9 = affine_map<(d0, d1, d2) -> (d0 floordiv 4 + d1 + d2)>
#map10 = affine_map<(d0, d1, d2) -> (d0 ceildiv 4 + d1 + d2)>
#map11 = affine_map<(d0, d1, d2) -> (d0 mod 4 + d1 + d2)>
#map12 = affine_map<(d0, d1, d2)[s0, s1, s2] -> (d0 * s0 + d0 * s1 + d1 * s1 + d2 * s2 - d0 * (s0 + s1 - 20))>
#map13 = affine_map<(d0, d1, d2)[s0, s1, s2] -> (d0 * s0 + d0 * s1 + d1 * (s1 * s2) + d2 * (s2 * s2) - (d0 + 1) * (s0 + s1 - 20))>
#map14 = affine_map<(d0, d1, d2)[s0, s1, s2] -> ((d0 + 1) * s0 + d1 + d2 - s0)>
#map15 = affine_map<(d0, d1, d2)[s0, s1, s2] -> ((d0 + (d1 + d2 * s2) * s1) * s0 + s0)>
module {
  func.func @f(%arg0: index) {
    %alloc = memref.alloc() : memref<3x4x5xf32>
    %alloc_0 = memref.alloc(%arg0) : memref<3x4x?xf32>
    %alloc_1 = memref.alloc(%arg0) : memref<3x?x5xf32>
    %alloc_2 = memref.alloc(%arg0) : memref<?x4x5xf32>
    %alloc_3 = memref.alloc(%arg0, %arg0) : memref<?x4x?xf32>
    %alloc_4 = memref.alloc(%arg0, %arg0, %arg0) : memref<?x?x?xf32>
    %alloc_5 = memref.alloc() : memref<3x4x5xf32>
    %alloc_6 = memref.alloc() : memref<3x4x5xf32, strided<[20, 5, 1]>>
    %alloc_7 = memref.alloc(%arg0) : memref<3x4x?xf32>
    %alloc_8 = memref.alloc(%arg0) : memref<3x?x5xf32>
    %alloc_9 = memref.alloc(%arg0) : memref<?x4x5xf32>
    %alloc_10 = memref.alloc(%arg0, %arg0) : memref<?x4x?xf32>
    %alloc_11 = memref.alloc(%arg0, %arg0, %arg0) : memref<?x?x?xf32>
    %alloc_12 = memref.alloc()[%arg0] : memref<3x4x5xf32, #map>
    %alloc_13 = memref.alloc()[%arg0] : memref<3x4x5xf32, #map1>
    %alloc_14 = memref.alloc(%arg0)[%arg0, %arg0] : memref<3x4x?xf32, strided<[?, ?, 1]>>
    %alloc_15 = memref.alloc(%arg0)[%arg0] : memref<3x?x5xf32, #map2>
    %alloc_16 = memref.alloc(%arg0)[%arg0] : memref<3x?x5xf32, strided<[?, 5, 1]>>
    %alloc_17 = memref.alloc(%arg0)[%arg0] : memref<3x?x5xf32, #map3>
    %alloc_18 = memref.alloc(%arg0)[%arg0, %arg0] : memref<3x?x5xf32, strided<[?, 32, 16], offset: ?>>
    %alloc_19 = memref.alloc(%arg0, %arg0)[%arg0, %arg0] : memref<?x?x16xf32, #map4>
    %alloc_20 = memref.alloc(%arg0, %arg0)[%arg0, %arg0] : memref<?x?x16xf32, strided<[?, ?, 1], offset: 1>>
    %alloc_21 = memref.alloc(%arg0) : memref<?xf32>
    %alloc_22 = memref.alloc()[%arg0] : memref<5xf32, #map5>
    %alloc_23 = memref.alloc()[%arg0] : memref<5xf32, #map6>
    %alloc_24 = memref.alloc()[%arg0] : memref<f32, #map7>
    %alloc_25 = memref.alloc()[%arg0] : memref<f32, #map8>
    %alloc_26 = memref.alloc() : memref<3x4x5xf32, #map9>
    %alloc_27 = memref.alloc() : memref<3x4x5xf32, #map10>
    %alloc_28 = memref.alloc() : memref<3x4x5xf32, #map11>
    %alloc_29 = memref.alloc()[%arg0, %arg0, %arg0] : memref<3x4x5xf32, #map12>
    %alloc_30 = memref.alloc()[%arg0, %arg0, %arg0] : memref<3x4x5xf32, #map13>
    %alloc_31 = memref.alloc()[%arg0, %arg0, %arg0] : memref<3x4x5xf32, #map14>
    %alloc_32 = memref.alloc()[%arg0, %arg0, %arg0] : memref<3x4x5xf32, #map15>
    return
  }
}

