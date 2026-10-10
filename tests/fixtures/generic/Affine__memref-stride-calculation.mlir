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
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "f"}> ({
  ^bb0(%arg0: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x4x5xf32>
    %1 = "memref.alloc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<3x4x?xf32>
    %2 = "memref.alloc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<3x?x5xf32>
    %3 = "memref.alloc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?x4x5xf32>
    %4 = "memref.alloc"(%arg0, %arg0) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x4x?xf32>
    %5 = "memref.alloc"(%arg0, %arg0, %arg0) <{operandSegmentSizes = array<i32: 3, 0>}> : (index, index, index) -> memref<?x?x?xf32>
    %6 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x4x5xf32>
    %7 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x4x5xf32, strided<[20, 5, 1]>>
    %8 = "memref.alloc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<3x4x?xf32>
    %9 = "memref.alloc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<3x?x5xf32>
    %10 = "memref.alloc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?x4x5xf32>
    %11 = "memref.alloc"(%arg0, %arg0) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x4x?xf32>
    %12 = "memref.alloc"(%arg0, %arg0, %arg0) <{operandSegmentSizes = array<i32: 3, 0>}> : (index, index, index) -> memref<?x?x?xf32>
    %13 = "memref.alloc"(%arg0) <{operandSegmentSizes = array<i32: 0, 1>}> : (index) -> memref<3x4x5xf32, #map>
    %14 = "memref.alloc"(%arg0) <{operandSegmentSizes = array<i32: 0, 1>}> : (index) -> memref<3x4x5xf32, #map1>
    %15 = "memref.alloc"(%arg0, %arg0, %arg0) <{operandSegmentSizes = array<i32: 1, 2>}> : (index, index, index) -> memref<3x4x?xf32, strided<[?, ?, 1]>>
    %16 = "memref.alloc"(%arg0, %arg0) <{operandSegmentSizes = array<i32: 1, 1>}> : (index, index) -> memref<3x?x5xf32, #map2>
    %17 = "memref.alloc"(%arg0, %arg0) <{operandSegmentSizes = array<i32: 1, 1>}> : (index, index) -> memref<3x?x5xf32, strided<[?, 5, 1]>>
    %18 = "memref.alloc"(%arg0, %arg0) <{operandSegmentSizes = array<i32: 1, 1>}> : (index, index) -> memref<3x?x5xf32, #map3>
    %19 = "memref.alloc"(%arg0, %arg0, %arg0) <{operandSegmentSizes = array<i32: 1, 2>}> : (index, index, index) -> memref<3x?x5xf32, strided<[?, 32, 16], offset: ?>>
    %20 = "memref.alloc"(%arg0, %arg0, %arg0, %arg0) <{operandSegmentSizes = array<i32: 2, 2>}> : (index, index, index, index) -> memref<?x?x16xf32, #map4>
    %21 = "memref.alloc"(%arg0, %arg0, %arg0, %arg0) <{operandSegmentSizes = array<i32: 2, 2>}> : (index, index, index, index) -> memref<?x?x16xf32, strided<[?, ?, 1], offset: 1>>
    %22 = "memref.alloc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32>
    %23 = "memref.alloc"(%arg0) <{operandSegmentSizes = array<i32: 0, 1>}> : (index) -> memref<5xf32, #map5>
    %24 = "memref.alloc"(%arg0) <{operandSegmentSizes = array<i32: 0, 1>}> : (index) -> memref<5xf32, #map6>
    %25 = "memref.alloc"(%arg0) <{operandSegmentSizes = array<i32: 0, 1>}> : (index) -> memref<f32, #map7>
    %26 = "memref.alloc"(%arg0) <{operandSegmentSizes = array<i32: 0, 1>}> : (index) -> memref<f32, #map8>
    %27 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x4x5xf32, #map9>
    %28 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x4x5xf32, #map10>
    %29 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x4x5xf32, #map11>
    %30 = "memref.alloc"(%arg0, %arg0, %arg0) <{operandSegmentSizes = array<i32: 0, 3>}> : (index, index, index) -> memref<3x4x5xf32, #map12>
    %31 = "memref.alloc"(%arg0, %arg0, %arg0) <{operandSegmentSizes = array<i32: 0, 3>}> : (index, index, index) -> memref<3x4x5xf32, #map13>
    %32 = "memref.alloc"(%arg0, %arg0, %arg0) <{operandSegmentSizes = array<i32: 0, 3>}> : (index, index, index) -> memref<3x4x5xf32, #map14>
    %33 = "memref.alloc"(%arg0, %arg0, %arg0) <{operandSegmentSizes = array<i32: 0, 3>}> : (index, index, index) -> memref<3x4x5xf32, #map15>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

