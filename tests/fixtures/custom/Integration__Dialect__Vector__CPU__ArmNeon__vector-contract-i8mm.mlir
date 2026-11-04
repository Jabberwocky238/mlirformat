#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @test_smmla() {
    %c0 = arith.constant 0 : index
    %c0_i32 = arith.constant 0 : i32
    %c0_i8 = arith.constant 0 : i8
    %cst = arith.constant dense<[[-44, 20, 44, -46], [-8, 25, -34, 26], [-20, -36, -3, 39], [-48, -31, -25, -21]]> : vector<4x4xi32>
    %alloca = memref.alloca() : memref<4x4xi32>
    vector.transfer_write %cst, %alloca[%c0, %c0] : vector<4x4xi32>, memref<4x4xi32>
    %0 = vector.transfer_read %alloca[%c0, %c0], %c0_i32 {in_bounds = [true, true]} : memref<4x4xi32>, vector<4x4xi32>
    %cst_0 = arith.constant dense<[[-35, -27, -36, -31, 23, -34, -8, -33], [-20, 17, -32, -47, 37, 22, -7, -21], [-7, -35, 20, -4, 39, 46, -23, 40], [40, 27, 37, 43, 38, -6, 37, 49]]> : vector<4x8xi8>
    %alloca_1 = memref.alloca() : memref<4x8xi8>
    vector.transfer_write %cst_0, %alloca_1[%c0, %c0] : vector<4x8xi8>, memref<4x8xi8>
    %1 = vector.transfer_read %alloca_1[%c0, %c0], %c0_i8 {in_bounds = [true, true]} : memref<4x8xi8>, vector<4x8xi8>
    %cst_2 = arith.constant dense<[[-17, -50, -1, 48, -13, 22, 39, 33], [-35, -24, 37, -32, 33, 30, -11, -17], [-28, 31, 3, -44, -15, -27, 22, 35], [-23, 39, 48, 26, -23, 32, -39, -38]]> : vector<4x8xi8>
    %alloca_3 = memref.alloca() : memref<4x8xi8>
    vector.transfer_write %cst_2, %alloca_3[%c0, %c0] : vector<4x8xi8>, memref<4x8xi8>
    %2 = vector.transfer_read %alloca_3[%c0, %c0], %c0_i8 {in_bounds = [true, true]} : memref<4x8xi8>, vector<4x8xi8>
    %3 = arith.extsi %1 : vector<4x8xi8> to vector<4x8xi32>
    %4 = arith.extsi %2 : vector<4x8xi8> to vector<4x8xi32>
    %5 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %3, %4, %0 : vector<4x8xi32>, vector<4x8xi32> into vector<4x4xi32>
    vector.print str "Result(SMMLA):\0A"
    %6 = vector.extract %5[0] : vector<4xi32> from vector<4x4xi32>
    %7 = vector.extract %5[1] : vector<4xi32> from vector<4x4xi32>
    %8 = vector.extract %5[2] : vector<4xi32> from vector<4x4xi32>
    %9 = vector.extract %5[3] : vector<4xi32> from vector<4x4xi32>
    vector.print %6 : vector<4xi32>
    vector.print %7 : vector<4xi32>
    vector.print %8 : vector<4xi32>
    vector.print %9 : vector<4xi32>
    return
  }
  func.func @test_ummla() {
    %c0 = arith.constant 0 : index
    %c0_i32 = arith.constant 0 : i32
    %c0_i8 = arith.constant 0 : i8
    %cst = arith.constant dense<[[16, 16, 48, 40], [40, 24, 35, 12], [33, 24, 29, 19], [28, 13, 33, 18]]> : vector<4x4xi32>
    %alloca = memref.alloca() : memref<4x4xi32>
    vector.transfer_write %cst, %alloca[%c0, %c0] : vector<4x4xi32>, memref<4x4xi32>
    %0 = vector.transfer_read %alloca[%c0, %c0], %c0_i32 {in_bounds = [true, true]} : memref<4x4xi32>, vector<4x4xi32>
    %cst_0 = arith.constant dense<[[35, 42, 37, 49, 36, 36, 23, 33], [39, 34, 33, 45, 43, 10, 44, 47], [18, 35, 29, 25, 36, 33, 28, 29], [26, 49, 43, 32, 27, 16, 45, 33]]> : vector<4x8xi8>
    %alloca_1 = memref.alloca() : memref<4x8xi8>
    vector.transfer_write %cst_0, %alloca_1[%c0, %c0] : vector<4x8xi8>, memref<4x8xi8>
    %1 = vector.transfer_read %alloca_1[%c0, %c0], %c0_i8 {in_bounds = [true, true]} : memref<4x8xi8>, vector<4x8xi8>
    %cst_2 = arith.constant dense<[[18, 31, 37, 35, 44, 22, 37, 28], [21, 22, 49, 39, 30, 28, 35, 37], [21, 47, 39, 35, 23, 43, 24, 49], [49, 49, 40, 32, 37, 20, 47, 40]]> : vector<4x8xi8>
    %alloca_3 = memref.alloca() : memref<4x8xi8>
    vector.transfer_write %cst_2, %alloca_3[%c0, %c0] : vector<4x8xi8>, memref<4x8xi8>
    %2 = vector.transfer_read %alloca_3[%c0, %c0], %c0_i8 {in_bounds = [true, true]} : memref<4x8xi8>, vector<4x8xi8>
    %3 = arith.extui %1 : vector<4x8xi8> to vector<4x8xi32>
    %4 = arith.extui %2 : vector<4x8xi8> to vector<4x8xi32>
    %5 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %3, %4, %0 : vector<4x8xi32>, vector<4x8xi32> into vector<4x4xi32>
    vector.print str "Result(UMMLA):\0A"
    %6 = vector.extract %5[0] : vector<4xi32> from vector<4x4xi32>
    %7 = vector.extract %5[1] : vector<4xi32> from vector<4x4xi32>
    %8 = vector.extract %5[2] : vector<4xi32> from vector<4x4xi32>
    %9 = vector.extract %5[3] : vector<4xi32> from vector<4x4xi32>
    vector.print %6 : vector<4xi32>
    vector.print %7 : vector<4xi32>
    vector.print %8 : vector<4xi32>
    vector.print %9 : vector<4xi32>
    return
  }
  func.func @test_usmmla() {
    %c0 = arith.constant 0 : index
    %c0_i32 = arith.constant 0 : i32
    %c0_i8 = arith.constant 0 : i8
    %cst = arith.constant dense<[[-44, 20, 44, -46], [-8, 25, -34, 26], [-20, -36, -3, 39], [-48, -31, -25, -21]]> : vector<4x4xi32>
    %alloca = memref.alloca() : memref<4x4xi32>
    vector.transfer_write %cst, %alloca[%c0, %c0] : vector<4x4xi32>, memref<4x4xi32>
    %0 = vector.transfer_read %alloca[%c0, %c0], %c0_i32 {in_bounds = [true, true]} : memref<4x4xi32>, vector<4x4xi32>
    %cst_0 = arith.constant dense<[[-103, -95, 24, -99, -45, -102, 52, 27], [-88, 77, -120, 124, -7, 28, 13, 122], [97, 82, -75, 39, 53, 25, 80, -16], [-72, -29, 106, -91, 126, 113, 121, -28]]> : vector<4x8xi8>
    %alloca_1 = memref.alloca() : memref<4x8xi8>
    vector.transfer_write %cst_0, %alloca_1[%c0, %c0] : vector<4x8xi8>, memref<4x8xi8>
    %1 = vector.transfer_read %alloca_1[%c0, %c0], %c0_i8 {in_bounds = [true, true]} : memref<4x8xi8>, vector<4x8xi8>
    %cst_2 = arith.constant dense<[[40, 27, 37, 43, 38, -6, 37, 49], [-17, -50, -1, 48, -13, 22, 39, 33], [-35, -24, 37, -32, 33, 30, -11, -17], [-28, 31, 3, -44, -15, -27, 22, 35]]> : vector<4x8xi8>
    %alloca_3 = memref.alloca() : memref<4x8xi8>
    vector.transfer_write %cst_2, %alloca_3[%c0, %c0] : vector<4x8xi8>, memref<4x8xi8>
    %2 = vector.transfer_read %alloca_3[%c0, %c0], %c0_i8 {in_bounds = [true, true]} : memref<4x8xi8>, vector<4x8xi8>
    %3 = arith.extui %1 : vector<4x8xi8> to vector<4x8xi32>
    %4 = arith.extsi %2 : vector<4x8xi8> to vector<4x8xi32>
    %5 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %3, %4, %0 : vector<4x8xi32>, vector<4x8xi32> into vector<4x4xi32>
    vector.print str "Result(USMMLA):\0A"
    %6 = vector.extract %5[0] : vector<4xi32> from vector<4x4xi32>
    %7 = vector.extract %5[1] : vector<4xi32> from vector<4x4xi32>
    %8 = vector.extract %5[2] : vector<4xi32> from vector<4x4xi32>
    %9 = vector.extract %5[3] : vector<4xi32> from vector<4x4xi32>
    vector.print %6 : vector<4xi32>
    vector.print %7 : vector<4xi32>
    vector.print %8 : vector<4xi32>
    vector.print %9 : vector<4xi32>
    return
  }
  func.func @test_summla() {
    %c0 = arith.constant 0 : index
    %c0_i32 = arith.constant 0 : i32
    %c0_i8 = arith.constant 0 : i8
    %cst = arith.constant dense<[[-44, 20, 44, -46], [-8, 25, -34, 26], [-20, -36, -3, 39], [-48, -31, -25, -21]]> : vector<4x4xi32>
    %alloca = memref.alloca() : memref<4x4xi32>
    vector.transfer_write %cst, %alloca[%c0, %c0] : vector<4x4xi32>, memref<4x4xi32>
    %0 = vector.transfer_read %alloca[%c0, %c0], %c0_i32 {in_bounds = [true, true]} : memref<4x4xi32>, vector<4x4xi32>
    %cst_0 = arith.constant dense<[[-35, -27, -36, -31, 23, -34, -8, -33], [-20, 17, -32, -47, 37, 22, -7, -21], [-7, -35, 20, -4, 39, 46, -23, 40], [40, 27, 37, 43, 38, -6, 37, 49]]> : vector<4x8xi8>
    %alloca_1 = memref.alloca() : memref<4x8xi8>
    vector.transfer_write %cst_0, %alloca_1[%c0, %c0] : vector<4x8xi8>, memref<4x8xi8>
    %1 = vector.transfer_read %alloca_1[%c0, %c0], %c0_i8 {in_bounds = [true, true]} : memref<4x8xi8>, vector<4x8xi8>
    %cst_2 = arith.constant dense<[[125, -85, -118, -69, 108, -81, 82, 99], [-35, 25, -92, 97, -100, -35, -38, -79], [-85, -96, -37, -65, -112, 45, -95, -46], [-33, -91, 123, 99, 108, 86, 37, 92]]> : vector<4x8xi8>
    %alloca_3 = memref.alloca() : memref<4x8xi8>
    vector.transfer_write %cst_2, %alloca_3[%c0, %c0] : vector<4x8xi8>, memref<4x8xi8>
    %2 = vector.transfer_read %alloca_3[%c0, %c0], %c0_i8 {in_bounds = [true, true]} : memref<4x8xi8>, vector<4x8xi8>
    %3 = arith.extsi %1 : vector<4x8xi8> to vector<4x8xi32>
    %4 = arith.extui %2 : vector<4x8xi8> to vector<4x8xi32>
    %5 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %3, %4, %0 : vector<4x8xi32>, vector<4x8xi32> into vector<4x4xi32>
    vector.print str "Result(SUMMLA (i.e. USMMLA transposed)):\0A"
    %6 = vector.extract %5[0] : vector<4xi32> from vector<4x4xi32>
    %7 = vector.extract %5[1] : vector<4xi32> from vector<4x4xi32>
    %8 = vector.extract %5[2] : vector<4xi32> from vector<4x4xi32>
    %9 = vector.extract %5[3] : vector<4xi32> from vector<4x4xi32>
    vector.print %6 : vector<4xi32>
    vector.print %7 : vector<4xi32>
    vector.print %8 : vector<4xi32>
    vector.print %9 : vector<4xi32>
    return
  }
  func.func @main() {
    call @test_smmla() : () -> ()
    call @test_ummla() : () -> ()
    call @test_usmmla() : () -> ()
    call @test_summla() : () -> ()
    return
  }
}

