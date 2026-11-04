#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @m16n8k16_mmasync16816_f16_f16_f32_row_row_row(%arg0: memref<42x32xf16, #gpu.address_space<workgroup>>, %arg1: memref<32x64xf16, #gpu.address_space<workgroup>>, %arg2: memref<42x64xf32, #gpu.address_space<workgroup>>) {
    %c0 = arith.constant 0 : index
    %c8 = arith.constant 8 : index
    %cst = arith.constant 0.000000e+00 : f16
    %cst_0 = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<42x32xf16, #gpu.address_space<workgroup>>, vector<16x16xf16>
    %1 = arith.extf %0 : vector<16x16xf16> to vector<16x16xf32>
    %2 = vector.transfer_read %arg1[%c0, %c0], %cst {in_bounds = [true, true], permutation_map = #map} : memref<32x64xf16, #gpu.address_space<workgroup>>, vector<16x16xf16>
    %3 = vector.transfer_read %arg2[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<42x64xf32, #gpu.address_space<workgroup>>, vector<16x16xf32>
    %4 = vector.extract_strided_slice %2 {offsets = [0, 0], sizes = [8, 16], strides = [1, 1]} : vector<16x16xf16> to vector<8x16xf16>
    %5 = arith.extf %4 : vector<8x16xf16> to vector<8x16xf32>
    %6 = vector.extract_strided_slice %3 {offsets = [0, 0], sizes = [16, 8], strides = [1, 1]} : vector<16x16xf32> to vector<16x8xf32>
    %7 = vector.contract {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %1, %5, %6 : vector<16x16xf32>, vector<8x16xf32> into vector<16x8xf32>
    vector.transfer_write %7, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<16x8xf32>, memref<42x64xf32, #gpu.address_space<workgroup>>
    %8 = vector.extract_strided_slice %2 {offsets = [8, 0], sizes = [8, 16], strides = [1, 1]} : vector<16x16xf16> to vector<8x16xf16>
    %9 = arith.extf %8 : vector<8x16xf16> to vector<8x16xf32>
    %10 = vector.extract_strided_slice %3 {offsets = [0, 8], sizes = [16, 8], strides = [1, 1]} : vector<16x16xf32> to vector<16x8xf32>
    %11 = vector.contract {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %1, %9, %10 : vector<16x16xf32>, vector<8x16xf32> into vector<16x8xf32>
    vector.transfer_write %11, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<16x8xf32>, memref<42x64xf32, #gpu.address_space<workgroup>>
    return
  }
}

