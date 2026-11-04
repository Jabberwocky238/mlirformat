#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func private @prepareAccTestData(%arg0: vector<4x4xi32>) -> memref<4x?xi32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c0_i32 = arith.constant 0 : i32
    %vscale = vector.vscale
    %c4_vscale = arith.muli %c4, %vscale : index
    %alloc = memref.alloc(%c4_vscale) : memref<4x?xi32>
    scf.for %arg1 = %c0 to %c4_vscale step %c4 {
      vector.transfer_write %arg0, %alloc[%c0, %arg1] {in_bounds = [true, true]} : vector<4x4xi32>, memref<4x?xi32>
    }
    return %alloc : memref<4x?xi32>
  }
  func.func private @prepareLHSTestData(%arg0: vector<4x8xi8>) -> memref<4x8xi8> {
    %c0 = arith.constant 0 : index
    %c0_i8 = arith.constant 0 : i8
    %alloc = memref.alloc() : memref<4x8xi8>
    vector.transfer_write %arg0, %alloc[%c0, %c0] {in_bounds = [true, true]} : vector<4x8xi8>, memref<4x8xi8>
    return %alloc : memref<4x8xi8>
  }
  func.func private @prepareRHSTestData(%arg0: vector<4x8xi8>) -> memref<?xi8> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c0_i8 = arith.constant 0 : i8
    %vscale = vector.vscale
    %c4_vscale = arith.muli %c4, %vscale : index
    %alloc = memref.alloc(%c4_vscale) : memref<?x8xi8>
    scf.for %arg1 = %c0 to %c4_vscale step %c4 {
      vector.transfer_write %arg0, %alloc[%arg1, %c0] {in_bounds = [true, true]} : vector<4x8xi8>, memref<?x8xi8>
    }
    %collapse_shape = memref.collapse_shape %alloc [[0, 1]] : memref<?x8xi8> into memref<?xi8>
    return %collapse_shape : memref<?xi8>
  }
  func.func @test_smmla() attributes {no_inline} {
    %c0 = arith.constant 0 : index
    %c0_i32 = arith.constant 0 : i32
    %c0_i8 = arith.constant 0 : i8
    %cst = arith.constant dense<[[-44, 20, 44, -46], [-8, 25, -34, 26], [-20, -36, -3, 39], [-48, -31, -25, -21]]> : vector<4x4xi32>
    %0 = call @prepareAccTestData(%cst) : (vector<4x4xi32>) -> memref<4x?xi32>
    %1 = vector.transfer_read %0[%c0, %c0], %c0_i32 {in_bounds = [true, true]} : memref<4x?xi32>, vector<4x[4]xi32>
    %cst_0 = arith.constant dense<[[-35, -27, -36, -31, 23, -34, -8, -33], [-20, 17, -32, -47, 37, 22, -7, -21], [-7, -35, 20, -4, 39, 46, -23, 40], [40, 27, 37, 43, 38, -6, 37, 49]]> : vector<4x8xi8>
    %2 = call @prepareLHSTestData(%cst_0) : (vector<4x8xi8>) -> memref<4x8xi8>
    %3 = vector.transfer_read %2[%c0, %c0], %c0_i8 {in_bounds = [true, true]} : memref<4x8xi8>, vector<4x8xi8>
    %cst_1 = arith.constant dense<[[-17, -50, -1, 48, -13, 22, 39, 33], [-35, -24, 37, -32, 33, 30, -11, -17], [-28, 31, 3, -44, -15, -27, 22, 35], [-23, 39, 48, 26, -23, 32, -39, -38]]> : vector<4x8xi8>
    %4 = call @prepareRHSTestData(%cst_1) : (vector<4x8xi8>) -> memref<?xi8>
    %5 = vector.transfer_read %4[%c0], %c0_i8 {in_bounds = [true]} : memref<?xi8>, vector<[32]xi8>
    %6 = vector.shape_cast %5 : vector<[32]xi8> to vector<[4]x8xi8>
    %7 = arith.extsi %3 : vector<4x8xi8> to vector<4x8xi32>
    %8 = arith.extsi %6 : vector<[4]x8xi8> to vector<[4]x8xi32>
    %9 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %7, %8, %1 : vector<4x8xi32>, vector<[4]x8xi32> into vector<4x[4]xi32>
    vector.print str "Result(SMMLA):\0A"
    %10 = vector.extract %9[0] : vector<[4]xi32> from vector<4x[4]xi32>
    %11 = vector.extract %9[1] : vector<[4]xi32> from vector<4x[4]xi32>
    %12 = vector.extract %9[2] : vector<[4]xi32> from vector<4x[4]xi32>
    %13 = vector.extract %9[3] : vector<[4]xi32> from vector<4x[4]xi32>
    vector.print %10 : vector<[4]xi32>
    vector.print %11 : vector<[4]xi32>
    vector.print %12 : vector<[4]xi32>
    vector.print %13 : vector<[4]xi32>
    memref.dealloc %0 : memref<4x?xi32>
    memref.dealloc %2 : memref<4x8xi8>
    memref.dealloc %4 : memref<?xi8>
    return
  }
  func.func @test_ummla() attributes {no_inline} {
    %c0 = arith.constant 0 : index
    %c0_i32 = arith.constant 0 : i32
    %c0_i8 = arith.constant 0 : i8
    %cst = arith.constant dense<[[16, 16, 48, 40], [40, 24, 35, 12], [33, 24, 29, 19], [28, 13, 33, 18]]> : vector<4x4xi32>
    %0 = call @prepareAccTestData(%cst) : (vector<4x4xi32>) -> memref<4x?xi32>
    %1 = vector.transfer_read %0[%c0, %c0], %c0_i32 {in_bounds = [true, true]} : memref<4x?xi32>, vector<4x[4]xi32>
    %cst_0 = arith.constant dense<[[35, 42, 37, 49, 36, 36, 23, 33], [39, 34, 33, 45, 43, 10, 44, 47], [18, 35, 29, 25, 36, 33, 28, 29], [26, 49, 43, 32, 27, 16, 45, 33]]> : vector<4x8xi8>
    %2 = call @prepareLHSTestData(%cst_0) : (vector<4x8xi8>) -> memref<4x8xi8>
    %3 = vector.transfer_read %2[%c0, %c0], %c0_i8 {in_bounds = [true, true]} : memref<4x8xi8>, vector<4x8xi8>
    %cst_1 = arith.constant dense<[[18, 31, 37, 35, 44, 22, 37, 28], [21, 22, 49, 39, 30, 28, 35, 37], [21, 47, 39, 35, 23, 43, 24, 49], [49, 49, 40, 32, 37, 20, 47, 40]]> : vector<4x8xi8>
    %4 = call @prepareRHSTestData(%cst_1) : (vector<4x8xi8>) -> memref<?xi8>
    %5 = vector.transfer_read %4[%c0], %c0_i8 {in_bounds = [true]} : memref<?xi8>, vector<[32]xi8>
    %6 = vector.shape_cast %5 : vector<[32]xi8> to vector<[4]x8xi8>
    %7 = arith.extui %3 : vector<4x8xi8> to vector<4x8xi32>
    %8 = arith.extui %6 : vector<[4]x8xi8> to vector<[4]x8xi32>
    %9 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %7, %8, %1 : vector<4x8xi32>, vector<[4]x8xi32> into vector<4x[4]xi32>
    vector.print str "Result(UMMLA):\0A"
    %10 = vector.extract %9[0] : vector<[4]xi32> from vector<4x[4]xi32>
    %11 = vector.extract %9[1] : vector<[4]xi32> from vector<4x[4]xi32>
    %12 = vector.extract %9[2] : vector<[4]xi32> from vector<4x[4]xi32>
    %13 = vector.extract %9[3] : vector<[4]xi32> from vector<4x[4]xi32>
    vector.print %10 : vector<[4]xi32>
    vector.print %11 : vector<[4]xi32>
    vector.print %12 : vector<[4]xi32>
    vector.print %13 : vector<[4]xi32>
    memref.dealloc %0 : memref<4x?xi32>
    memref.dealloc %2 : memref<4x8xi8>
    memref.dealloc %4 : memref<?xi8>
    return
  }
  func.func @test_usmmla() attributes {no_inline} {
    %c0 = arith.constant 0 : index
    %c0_i32 = arith.constant 0 : i32
    %c0_i8 = arith.constant 0 : i8
    %cst = arith.constant dense<[[-44, 20, 44, -46], [-8, 25, -34, 26], [-20, -36, -3, 39], [-48, -31, -25, -21]]> : vector<4x4xi32>
    %0 = call @prepareAccTestData(%cst) : (vector<4x4xi32>) -> memref<4x?xi32>
    %1 = vector.transfer_read %0[%c0, %c0], %c0_i32 {in_bounds = [true, true]} : memref<4x?xi32>, vector<4x[4]xi32>
    %cst_0 = arith.constant dense<[[-103, -95, 24, -99, -45, -102, 52, 27], [-88, 77, -120, 124, -7, 28, 13, 122], [97, 82, -75, 39, 53, 25, 80, -16], [-72, -29, 106, -91, 126, 113, 121, -28]]> : vector<4x8xi8>
    %2 = call @prepareLHSTestData(%cst_0) : (vector<4x8xi8>) -> memref<4x8xi8>
    %3 = vector.transfer_read %2[%c0, %c0], %c0_i8 {in_bounds = [true, true]} : memref<4x8xi8>, vector<4x8xi8>
    %cst_1 = arith.constant dense<[[40, 27, 37, 43, 38, -6, 37, 49], [-17, -50, -1, 48, -13, 22, 39, 33], [-35, -24, 37, -32, 33, 30, -11, -17], [-28, 31, 3, -44, -15, -27, 22, 35]]> : vector<4x8xi8>
    %4 = call @prepareRHSTestData(%cst_1) : (vector<4x8xi8>) -> memref<?xi8>
    %5 = vector.transfer_read %4[%c0], %c0_i8 {in_bounds = [true]} : memref<?xi8>, vector<[32]xi8>
    %6 = vector.shape_cast %5 : vector<[32]xi8> to vector<[4]x8xi8>
    %7 = arith.extui %3 : vector<4x8xi8> to vector<4x8xi32>
    %8 = arith.extsi %6 : vector<[4]x8xi8> to vector<[4]x8xi32>
    %9 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %7, %8, %1 : vector<4x8xi32>, vector<[4]x8xi32> into vector<4x[4]xi32>
    vector.print str "Result(USMMLA):\0A"
    %10 = vector.extract %9[0] : vector<[4]xi32> from vector<4x[4]xi32>
    %11 = vector.extract %9[1] : vector<[4]xi32> from vector<4x[4]xi32>
    %12 = vector.extract %9[2] : vector<[4]xi32> from vector<4x[4]xi32>
    %13 = vector.extract %9[3] : vector<[4]xi32> from vector<4x[4]xi32>
    vector.print %10 : vector<[4]xi32>
    vector.print %11 : vector<[4]xi32>
    vector.print %12 : vector<[4]xi32>
    vector.print %13 : vector<[4]xi32>
    memref.dealloc %0 : memref<4x?xi32>
    memref.dealloc %2 : memref<4x8xi8>
    memref.dealloc %4 : memref<?xi8>
    return
  }
  func.func @test_summla() attributes {no_inline} {
    %c0 = arith.constant 0 : index
    %c0_i32 = arith.constant 0 : i32
    %c0_i8 = arith.constant 0 : i8
    %cst = arith.constant dense<[[-44, 20, 44, -46], [-8, 25, -34, 26], [-20, -36, -3, 39], [-48, -31, -25, -21]]> : vector<4x4xi32>
    %0 = call @prepareAccTestData(%cst) : (vector<4x4xi32>) -> memref<4x?xi32>
    %1 = vector.transfer_read %0[%c0, %c0], %c0_i32 {in_bounds = [true, true]} : memref<4x?xi32>, vector<4x[4]xi32>
    %cst_0 = arith.constant dense<[[-35, -27, -36, -31, 23, -34, -8, -33], [-20, 17, -32, -47, 37, 22, -7, -21], [-7, -35, 20, -4, 39, 46, -23, 40], [40, 27, 37, 43, 38, -6, 37, 49]]> : vector<4x8xi8>
    %2 = call @prepareLHSTestData(%cst_0) : (vector<4x8xi8>) -> memref<4x8xi8>
    %3 = vector.transfer_read %2[%c0, %c0], %c0_i8 {in_bounds = [true, true]} : memref<4x8xi8>, vector<4x8xi8>
    %cst_1 = arith.constant dense<[[125, -85, -118, -69, 108, -81, 82, 99], [-35, 25, -92, 97, -100, -35, -38, -79], [-85, -96, -37, -65, -112, 45, -95, -46], [-33, -91, 123, 99, 108, 86, 37, 92]]> : vector<4x8xi8>
    %4 = call @prepareRHSTestData(%cst_1) : (vector<4x8xi8>) -> memref<?xi8>
    %5 = vector.transfer_read %4[%c0], %c0_i8 {in_bounds = [true]} : memref<?xi8>, vector<[32]xi8>
    %6 = vector.shape_cast %5 : vector<[32]xi8> to vector<[4]x8xi8>
    %7 = arith.extsi %3 : vector<4x8xi8> to vector<4x8xi32>
    %8 = arith.extui %6 : vector<[4]x8xi8> to vector<[4]x8xi32>
    %9 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %7, %8, %1 : vector<4x8xi32>, vector<[4]x8xi32> into vector<4x[4]xi32>
    vector.print str "Result(SUMMLA (i.e. USMMLA transposed)):\0A"
    %10 = vector.extract %9[0] : vector<[4]xi32> from vector<4x[4]xi32>
    %11 = vector.extract %9[1] : vector<[4]xi32> from vector<4x[4]xi32>
    %12 = vector.extract %9[2] : vector<[4]xi32> from vector<4x[4]xi32>
    %13 = vector.extract %9[3] : vector<[4]xi32> from vector<4x[4]xi32>
    vector.print %10 : vector<[4]xi32>
    vector.print %11 : vector<[4]xi32>
    vector.print %12 : vector<[4]xi32>
    vector.print %13 : vector<[4]xi32>
    memref.dealloc %0 : memref<4x?xi32>
    memref.dealloc %2 : memref<4x8xi8>
    memref.dealloc %4 : memref<?xi8>
    return
  }
  func.func @main() {
    %c128_i32 = arith.constant 128 : i32
    %c256_i32 = arith.constant 256 : i32
    call @setArmVLBits(%c128_i32) : (i32) -> ()
    call @test_smmla() : () -> ()
    call @setArmVLBits(%c256_i32) : (i32) -> ()
    call @test_smmla() : () -> ()
    call @setArmVLBits(%c128_i32) : (i32) -> ()
    call @test_ummla() : () -> ()
    call @setArmVLBits(%c256_i32) : (i32) -> ()
    call @test_ummla() : () -> ()
    call @setArmVLBits(%c128_i32) : (i32) -> ()
    call @test_usmmla() : () -> ()
    call @setArmVLBits(%c256_i32) : (i32) -> ()
    call @test_usmmla() : () -> ()
    call @setArmVLBits(%c128_i32) : (i32) -> ()
    call @test_summla() : () -> ()
    call @setArmVLBits(%c256_i32) : (i32) -> ()
    call @test_summla() : () -> ()
    return
  }
  func.func private @setArmVLBits(i32)
  func.func private @printMemrefI32(memref<*xi32>)
}

