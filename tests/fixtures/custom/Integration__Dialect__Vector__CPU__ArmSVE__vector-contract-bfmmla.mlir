#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func private @prepareAccTestData(%arg0: vector<4x4xf32>) -> memref<4x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %vscale = vector.vscale
    %c4_vscale = arith.muli %c4, %vscale : index
    %alloc = memref.alloc(%c4_vscale) : memref<4x?xf32>
    scf.for %arg1 = %c0 to %c4_vscale step %c4 {
      vector.transfer_write %arg0, %alloc[%c0, %arg1] {in_bounds = [true, true]} : vector<4x4xf32>, memref<4x?xf32>
    }
    return %alloc : memref<4x?xf32>
  }
  func.func private @prepareLHSTestData(%arg0: vector<4x4xbf16>) -> memref<4x4xbf16> {
    %c0 = arith.constant 0 : index
    %alloc = memref.alloc() : memref<4x4xbf16>
    vector.transfer_write %arg0, %alloc[%c0, %c0] {in_bounds = [true, true]} : vector<4x4xbf16>, memref<4x4xbf16>
    return %alloc : memref<4x4xbf16>
  }
  func.func private @prepareRHSTestData(%arg0: vector<4x4xbf16>) -> memref<?xbf16> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %vscale = vector.vscale
    %c4_vscale = arith.muli %c4, %vscale : index
    %alloc = memref.alloc(%c4_vscale) : memref<?x4xbf16>
    scf.for %arg1 = %c0 to %c4_vscale step %c4 {
      vector.transfer_write %arg0, %alloc[%arg1, %c0] {in_bounds = [true, true]} : vector<4x4xbf16>, memref<?x4xbf16>
    }
    %collapse_shape = memref.collapse_shape %alloc [[0, 1]] : memref<?x4xbf16> into memref<?xbf16>
    return %collapse_shape : memref<?xbf16>
  }
  func.func @test_bfmmla() {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 0.000000e+00 : bf16
    %cst_1 = arith.constant dense<[[0.699999988, 1.000000e+00, -1.000000e-01, 1.800000e+00], [-5.000000e-01, 0.899999976, 0.699999988, -0.699999988], [5.000000e-01, -1.300000e+00, -2.200000e+00, 1.000000e-01], [-0.699999988, 1.000000e+00, 1.700000e+00, -1.000000e+00]]> : vector<4x4xf32>
    %0 = call @prepareAccTestData(%cst_1) : (vector<4x4xf32>) -> memref<4x?xf32>
    %1 = vector.transfer_read %0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<4x?xf32>, vector<4x[4]xf32>
    %cst_2 = arith.constant dense<[[1.000980e-01, 6.992180e-01, -8.984370e-01, 1.296880e+00], [-1.601560e+00, 6.992180e-01, -3.007810e-01, -3.007810e-01], [-4.003910e-01, 6.015630e-01, 8.007810e-01, -5.000000e-01], [-6.015630e-01, -1.000000e+00, -1.000000e+00, -1.000000e+00]]> : vector<4x4xbf16>
    %2 = call @prepareLHSTestData(%cst_2) : (vector<4x4xbf16>) -> memref<4x4xbf16>
    %3 = vector.transfer_read %2[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<4x4xbf16>, vector<4x4xbf16>
    %cst_3 = arith.constant dense<[[6.015630e-01, 1.296880e+00, 1.000980e-01, -8.984370e-01], [5.000000e-01, 1.601560e+00, 1.796880e+00, 1.601560e+00], [-2.001950e-01, 4.003910e-01, 1.000000e+00, 4.003910e-01], [-1.296880e+00, -2.001950e-01, -2.203130e+00, 3.007810e-01]]> : vector<4x4xbf16>
    %4 = call @prepareRHSTestData(%cst_3) : (vector<4x4xbf16>) -> memref<?xbf16>
    %5 = vector.transfer_read %4[%c0], %cst_0 {in_bounds = [true]} : memref<?xbf16>, vector<[16]xbf16>
    %6 = vector.shape_cast %5 : vector<[16]xbf16> to vector<[4]x4xbf16>
    %7 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %3, %6, %1 : vector<4x4xbf16>, vector<[4]x4xbf16> into vector<4x[4]xf32>
    vector.print str "Result(BFMMLA):\0A"
    %8 = vector.extract %7[0] : vector<[4]xf32> from vector<4x[4]xf32>
    %9 = vector.extract %7[1] : vector<[4]xf32> from vector<4x[4]xf32>
    %10 = vector.extract %7[2] : vector<[4]xf32> from vector<4x[4]xf32>
    %11 = vector.extract %7[3] : vector<[4]xf32> from vector<4x[4]xf32>
    vector.print %8 : vector<[4]xf32>
    vector.print %9 : vector<[4]xf32>
    vector.print %10 : vector<[4]xf32>
    vector.print %11 : vector<[4]xf32>
    memref.dealloc %0 : memref<4x?xf32>
    memref.dealloc %2 : memref<4x4xbf16>
    memref.dealloc %4 : memref<?xbf16>
    return
  }
  func.func @main() {
    %c128_i32 = arith.constant 128 : i32
    %c256_i32 = arith.constant 256 : i32
    call @setArmVLBits(%c128_i32) : (i32) -> ()
    call @test_bfmmla() : () -> ()
    call @setArmVLBits(%c256_i32) : (i32) -> ()
    call @test_bfmmla() : () -> ()
    return
  }
  func.func private @setArmVLBits(i32)
  func.func private @printMemrefF32(memref<*xf32>)
}

