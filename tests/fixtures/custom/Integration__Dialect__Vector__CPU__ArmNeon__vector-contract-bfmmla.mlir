#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map3 = affine_map<(d0, d1) -> (d1)>
#map4 = affine_map<(d0, d1) -> (d0, d1)>
#map5 = affine_map<(d0, d1) -> (d0)>
module {
  func.func @matrix_by_matrix_mul_and_acc() {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 0.000000e+00 : bf16
    %cst_1 = arith.constant dense<[[0.699999988, 1.000000e+00, -1.000000e-01, 1.800000e+00], [-5.000000e-01, 0.899999976, 0.699999988, -0.699999988], [5.000000e-01, -1.300000e+00, -2.200000e+00, 1.000000e-01], [-0.699999988, 1.000000e+00, 1.700000e+00, -1.000000e+00]]> : vector<4x4xf32>
    %alloca = memref.alloca() : memref<4x4xf32>
    vector.transfer_write %cst_1, %alloca[%c0, %c0] {in_bounds = [true, true]} : vector<4x4xf32>, memref<4x4xf32>
    %0 = vector.transfer_read %alloca[%c0, %c0], %cst {in_bounds = [true, true]} : memref<4x4xf32>, vector<4x4xf32>
    %cst_2 = arith.constant dense<[[1.000980e-01, 6.992180e-01, -8.984370e-01, 1.296880e+00], [-1.601560e+00, 6.992180e-01, -3.007810e-01, -3.007810e-01], [-4.003910e-01, 6.015630e-01, 8.007810e-01, -5.000000e-01], [-6.015630e-01, -1.000000e+00, -1.000000e+00, -1.000000e+00]]> : vector<4x4xbf16>
    %alloca_3 = memref.alloca() : memref<4x4xbf16>
    vector.transfer_write %cst_2, %alloca_3[%c0, %c0] {in_bounds = [true, true]} : vector<4x4xbf16>, memref<4x4xbf16>
    %1 = vector.transfer_read %alloca_3[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<4x4xbf16>, vector<4x4xbf16>
    %cst_4 = arith.constant dense<[[6.015630e-01, 1.296880e+00, 1.000980e-01, -8.984370e-01], [5.000000e-01, 1.601560e+00, 1.796880e+00, 1.601560e+00], [-2.001950e-01, 4.003910e-01, 1.000000e+00, 4.003910e-01], [-1.296880e+00, -2.001950e-01, -2.203130e+00, 3.007810e-01]]> : vector<4x4xbf16>
    %alloca_5 = memref.alloca() : memref<4x4xbf16>
    vector.transfer_write %cst_4, %alloca_5[%c0, %c0] {in_bounds = [true, true]} : vector<4x4xbf16>, memref<4x4xbf16>
    %2 = vector.transfer_read %alloca_5[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<4x4xbf16>, vector<4x4xbf16>
    %3 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %1, %2, %0 : vector<4x4xbf16>, vector<4x4xbf16> into vector<4x4xf32>
    vector.print str "Result(BFMMLA):\0A"
    %4 = vector.extract %3[0] : vector<4xf32> from vector<4x4xf32>
    %5 = vector.extract %3[1] : vector<4xf32> from vector<4x4xf32>
    %6 = vector.extract %3[2] : vector<4xf32> from vector<4x4xf32>
    %7 = vector.extract %3[3] : vector<4xf32> from vector<4x4xf32>
    vector.print %4 : vector<4xf32>
    vector.print %5 : vector<4xf32>
    vector.print %6 : vector<4xf32>
    vector.print %7 : vector<4xf32>
    return
  }
  func.func @vector_by_matrix_mul_and_acc() {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 0.000000e+00 : bf16
    %cst_1 = arith.constant dense<[0.699999988, 1.000000e+00, -1.000000e-01, 1.800000e+00]> : vector<4xf32>
    %alloca = memref.alloca() : memref<4xf32>
    vector.transfer_write %cst_1, %alloca[%c0] {in_bounds = [true]} : vector<4xf32>, memref<4xf32>
    %0 = vector.transfer_read %alloca[%c0], %cst {in_bounds = [true]} : memref<4xf32>, vector<4xf32>
    %cst_2 = arith.constant dense<[1.000980e-01, 6.992180e-01, -8.984370e-01, 1.296880e+00]> : vector<4xbf16>
    %alloca_3 = memref.alloca() : memref<4xbf16>
    vector.transfer_write %cst_2, %alloca_3[%c0] {in_bounds = [true]} : vector<4xbf16>, memref<4xbf16>
    %1 = vector.transfer_read %alloca_3[%c0], %cst_0 {in_bounds = [true]} : memref<4xbf16>, vector<4xbf16>
    %cst_4 = arith.constant dense<[[6.015630e-01, 1.296880e+00, 1.000980e-01, -8.984370e-01], [5.000000e-01, 1.601560e+00, 1.796880e+00, 1.601560e+00], [-2.001950e-01, 4.003910e-01, 1.000000e+00, 4.003910e-01], [-1.296880e+00, -2.001950e-01, -2.203130e+00, 3.007810e-01]]> : vector<4x4xbf16>
    %alloca_5 = memref.alloca() : memref<4x4xbf16>
    vector.transfer_write %cst_4, %alloca_5[%c0, %c0] {in_bounds = [true, true]} : vector<4x4xbf16>, memref<4x4xbf16>
    %2 = vector.transfer_read %alloca_5[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<4x4xbf16>, vector<4x4xbf16>
    %3 = vector.contract {indexing_maps = [#map3, #map4, #map5], iterator_types = ["parallel", "reduction"], kind = #vector.kind<add>} %1, %2, %0 : vector<4xbf16>, vector<4x4xbf16> into vector<4xf32>
    vector.print str "Result(BFMMLA, vecmat):\0A"
    vector.print %3 : vector<4xf32>
    return
  }
  func.func @main() {
    call @matrix_by_matrix_mul_and_acc() : () -> ()
    call @vector_by_matrix_mul_and_acc() : () -> ()
    return
  }
}

