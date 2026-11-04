#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @m16n8k32_int8_row_row_row(%arg0: memref<128x128xi8, #gpu.address_space<workgroup>>, %arg1: memref<128x128xi8, #gpu.address_space<workgroup>>, %arg2: memref<128x128xi32>) {
    %cst = arith.constant dense<0> : vector<32x8xi8>
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c17 = arith.constant 17 : index
    %c39 = arith.constant 39 : index
    %c40 = arith.constant 40 : index
    %c49 = arith.constant 49 : index
    %c50 = arith.constant 50 : index
    %c0_i8 = arith.constant 0 : i8
    %c0_i32 = arith.constant 0 : i32
    %0 = vector.transfer_read %arg0[%c0, %c0], %c0_i8 {in_bounds = [true, true]} : memref<128x128xi8, #gpu.address_space<workgroup>>, vector<16x32xi8>
    %1 = vector.transfer_read %arg1[%c39, %c40], %c0_i8 {in_bounds = [true, true], permutation_map = #map} : memref<128x128xi8, #gpu.address_space<workgroup>>, vector<8x32xi8>
    %2 = vector.transfer_read %arg2[%c49, %c40], %c0_i32 {in_bounds = [true, true]} : memref<128x128xi32>, vector<16x8xi32>
    %3 = vector.contract {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %2 : vector<16x32xi8>, vector<8x32xi8> into vector<16x8xi32>
    vector.transfer_write %3, %arg2[%c49, %c40] {in_bounds = [true, true]} : vector<16x8xi32>, memref<128x128xi32>
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @m8n8k4_f64_row_row_row(%arg0: memref<128x128xf64>, %arg1: memref<128x128xf64>, %arg2: memref<128x128xf64>) {
    %cst = arith.constant dense<0.000000e+00> : vector<4x8xf64>
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c17 = arith.constant 17 : index
    %c39 = arith.constant 39 : index
    %c40 = arith.constant 40 : index
    %c49 = arith.constant 49 : index
    %c50 = arith.constant 50 : index
    %cst_0 = arith.constant 0.000000e+00 : f64
    %cst_1 = arith.constant 0.000000e+00 : f64
    %0 = vector.transfer_read %arg0[%c1, %c1], %cst_0 {in_bounds = [true, true]} : memref<128x128xf64>, vector<8x4xf64>
    %1 = vector.transfer_read %arg1[%c39, %c40], %cst_0 {in_bounds = [true, true], permutation_map = #map} : memref<128x128xf64>, vector<8x4xf64>
    %2 = vector.transfer_read %arg2[%c49, %c40], %cst_1 {in_bounds = [true, true]} : memref<128x128xf64>, vector<8x8xf64>
    %3 = vector.contract {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %2 : vector<8x4xf64>, vector<8x4xf64> into vector<8x8xf64>
    vector.transfer_write %3, %arg2[%c49, %c40] {in_bounds = [true, true]} : vector<8x8xf64>, memref<128x128xf64>
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @m16n8k16_fp16_row_row_row(%arg0: memref<20x20xf16, #gpu.address_space<workgroup>>, %arg1: memref<20x20xf16, #gpu.address_space<workgroup>>, %arg2: memref<20x20xf16, #gpu.address_space<workgroup>>) {
    %cst = arith.constant dense<0.000000e+00> : vector<16x8xf16>
    %c0 = arith.constant 0 : index
    %cst_0 = arith.constant 0.000000e+00 : f16
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<20x20xf16, #gpu.address_space<workgroup>>, vector<16x16xf16>
    %1 = vector.transfer_read %arg1[%c0, %c0], %cst_0 {in_bounds = [true, true], permutation_map = #map} : memref<20x20xf16, #gpu.address_space<workgroup>>, vector<8x16xf16>
    %2 = vector.transfer_read %arg2[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<20x20xf16, #gpu.address_space<workgroup>>, vector<16x8xf16>
    %3 = vector.contract {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %2 : vector<16x16xf16>, vector<8x16xf16> into vector<16x8xf16>
    vector.transfer_write %3, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<16x8xf16>, memref<20x20xf16, #gpu.address_space<workgroup>>
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @m16n16k16_mmasync16816_fp16_f16_row_row_row(%arg0: memref<42x32xf16, #gpu.address_space<workgroup>>, %arg1: memref<32x64xf16, #gpu.address_space<workgroup>>, %arg2: memref<42x64xf16, #gpu.address_space<workgroup>>) {
    %c0 = arith.constant 0 : index
    %c8 = arith.constant 8 : index
    %cst = arith.constant 0.000000e+00 : f16
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<42x32xf16, #gpu.address_space<workgroup>>, vector<16x16xf16>
    %1 = vector.transfer_read %arg1[%c0, %c0], %cst {in_bounds = [true, true], permutation_map = #map} : memref<32x64xf16, #gpu.address_space<workgroup>>, vector<16x16xf16>
    %2 = vector.transfer_read %arg2[%c0, %c0], %cst {in_bounds = [true, true]} : memref<42x64xf16, #gpu.address_space<workgroup>>, vector<16x16xf16>
    %3 = vector.extract_strided_slice %1 {offsets = [0, 0], sizes = [8, 16], strides = [1, 1]} : vector<16x16xf16> to vector<8x16xf16>
    %4 = vector.extract_strided_slice %2 {offsets = [0, 0], sizes = [16, 8], strides = [1, 1]} : vector<16x16xf16> to vector<16x8xf16>
    %5 = vector.contract {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %3, %4 : vector<16x16xf16>, vector<8x16xf16> into vector<16x8xf16>
    vector.transfer_write %5, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<16x8xf16>, memref<42x64xf16, #gpu.address_space<workgroup>>
    %6 = vector.extract_strided_slice %1 {offsets = [8, 0], sizes = [8, 16], strides = [1, 1]} : vector<16x16xf16> to vector<8x16xf16>
    %7 = vector.extract_strided_slice %2 {offsets = [0, 8], sizes = [16, 8], strides = [1, 1]} : vector<16x16xf16> to vector<16x8xf16>
    %8 = vector.contract {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %6, %7 : vector<16x16xf16>, vector<8x16xf16> into vector<16x8xf16>
    vector.transfer_write %8, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<16x8xf16>, memref<42x64xf16, #gpu.address_space<workgroup>>
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map4 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @multi_dim_m16n8k16_fp16_row_row_row(%arg0: memref<4x32x1x32xf16, #gpu.address_space<workgroup>>, %arg1: memref<4x1x32x32xf16, #gpu.address_space<workgroup>>, %arg2: memref<1x32x40xf16, #gpu.address_space<workgroup>>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f16
    %0 = vector.transfer_read %arg0[%c0, %c0, %c0, %c0], %cst {in_bounds = [true, true], permutation_map = #map} : memref<4x32x1x32xf16, #gpu.address_space<workgroup>>, vector<16x16xf16>
    %1 = vector.transfer_read %arg1[%c0, %c0, %c0, %c0], %cst {in_bounds = [true, true], permutation_map = #map1} : memref<4x1x32x32xf16, #gpu.address_space<workgroup>>, vector<16x16xf16>
    %2 = vector.transfer_read %arg2[%c0, %c0, %c0], %cst {in_bounds = [true, true]} : memref<1x32x40xf16, #gpu.address_space<workgroup>>, vector<16x16xf16>
    %3 = vector.extract_strided_slice %1 {offsets = [0, 0], sizes = [8, 16], strides = [1, 1]} : vector<16x16xf16> to vector<8x16xf16>
    %4 = vector.extract_strided_slice %2 {offsets = [0, 0], sizes = [16, 8], strides = [1, 1]} : vector<16x16xf16> to vector<16x8xf16>
    %5 = vector.contract {indexing_maps = [#map2, #map3, #map4], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %3, %4 : vector<16x16xf16>, vector<8x16xf16> into vector<16x8xf16>
    vector.transfer_write %5, %arg2[%c0, %c0, %c0] {in_bounds = [true, true]} : vector<16x8xf16>, memref<1x32x40xf16, #gpu.address_space<workgroup>>
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d2, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @batch_m16n8k16_fp16_row_row_row(%arg0: memref<2x20x20xf16, #gpu.address_space<workgroup>>, %arg1: memref<2x20x20xf16, #gpu.address_space<workgroup>>, %arg2: memref<2x20x20xf16, #gpu.address_space<workgroup>>) {
    %cst = arith.constant dense<0.000000e+00> : vector<20x20xf16>
    %c0 = arith.constant 0 : index
    %cst_0 = arith.constant 0.000000e+00 : f16
    %0 = vector.transfer_read %arg0[%c0, %c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<2x20x20xf16, #gpu.address_space<workgroup>>, vector<16x16xf16>
    %1 = vector.transfer_read %arg1[%c0, %c0, %c0], %cst_0 {in_bounds = [true, true], permutation_map = #map} : memref<2x20x20xf16, #gpu.address_space<workgroup>>, vector<8x16xf16>
    %2 = vector.transfer_read %arg2[%c0, %c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<2x20x20xf16, #gpu.address_space<workgroup>>, vector<16x8xf16>
    %3 = vector.contract {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %2 : vector<16x16xf16>, vector<8x16xf16> into vector<16x8xf16>
    vector.transfer_write %3, %arg2[%c0, %c0, %c0] {in_bounds = [true, true]} : vector<16x8xf16>, memref<2x20x20xf16, #gpu.address_space<workgroup>>
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @m16n8k16_fp16_row_col_row(%arg0: memref<20x20xf16, #gpu.address_space<workgroup>>, %arg1: memref<20x20xf16, #gpu.address_space<workgroup>>, %arg2: memref<20x20xf16, #gpu.address_space<workgroup>>) {
    %cst = arith.constant dense<0.000000e+00> : vector<16x8xf16>
    %c0 = arith.constant 0 : index
    %cst_0 = arith.constant 0.000000e+00 : f16
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<20x20xf16, #gpu.address_space<workgroup>>, vector<16x16xf16>
    %1 = vector.transfer_read %arg1[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<20x20xf16, #gpu.address_space<workgroup>>, vector<8x16xf16>
    %2 = vector.transfer_read %arg2[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<20x20xf16, #gpu.address_space<workgroup>>, vector<16x8xf16>
    %3 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %2 : vector<16x16xf16>, vector<8x16xf16> into vector<16x8xf16>
    vector.transfer_write %3, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<16x8xf16>, memref<20x20xf16, #gpu.address_space<workgroup>>
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @m16n8k4_tf32_f32_row_row_row(%arg0: memref<20x20xf32, #gpu.address_space<workgroup>>, %arg1: memref<20x20xf32, #gpu.address_space<workgroup>>, %arg2: memref<20x20xf32>) {
    %cst = arith.constant dense<0.000000e+00> : vector<16x8xf32>
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %cst_0 = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c1, %c3], %cst_0 {in_bounds = [true, true]} : memref<20x20xf32, #gpu.address_space<workgroup>>, vector<16x4xf32>
    %1 = vector.transfer_read %arg1[%c3, %c3], %cst_0 {in_bounds = [true, true], permutation_map = #map} : memref<20x20xf32, #gpu.address_space<workgroup>>, vector<8x4xf32>
    %2 = vector.contract {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %cst : vector<16x4xf32>, vector<8x4xf32> into vector<16x8xf32>
    vector.transfer_write %2, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<16x8xf32>, memref<20x20xf32>
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @m16n8k8_tf32_f32_row_row_row(%arg0: memref<20x20xf32, #gpu.address_space<workgroup>>, %arg1: memref<20x20xf32, #gpu.address_space<workgroup>>, %arg2: memref<20x20xf32>) {
    %cst = arith.constant dense<0.000000e+00> : vector<16x8xf32>
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %cst_0 = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c1, %c3], %cst_0 {in_bounds = [true, true]} : memref<20x20xf32, #gpu.address_space<workgroup>>, vector<16x8xf32>
    %1 = vector.transfer_read %arg1[%c3, %c3], %cst_0 {in_bounds = [true, true], permutation_map = #map} : memref<20x20xf32, #gpu.address_space<workgroup>>, vector<8x8xf32>
    %2 = vector.contract {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %cst : vector<16x8xf32>, vector<8x8xf32> into vector<16x8xf32>
    vector.transfer_write %2, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<16x8xf32>, memref<20x20xf32>
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @m16n8k8_tf32_f32_col_col_row(%arg0: memref<20x20xf32, #gpu.address_space<workgroup>>, %arg1: memref<20x20xf32, #gpu.address_space<workgroup>>, %arg2: memref<20x20xf32>) {
    %cst = arith.constant dense<0.000000e+00> : vector<16x8xf32>
    %c0 = arith.constant 0 : index
    %c16 = arith.constant 16 : index
    %c8 = arith.constant 8 : index
    %cst_0 = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst_0 {in_bounds = [true, true], permutation_map = #map} : memref<20x20xf32, #gpu.address_space<workgroup>>, vector<16x8xf32>
    %1 = vector.transfer_read %arg1[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<20x20xf32, #gpu.address_space<workgroup>>, vector<8x8xf32>
    %2 = vector.contract {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %cst : vector<16x8xf32>, vector<8x8xf32> into vector<16x8xf32>
    vector.transfer_write %2, %arg2[%c16, %c8] {in_bounds = [true, true]} : vector<16x8xf32>, memref<20x20xf32>
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @m16n8k64_int4_row_col_row(%arg0: memref<128x128xi4, #gpu.address_space<workgroup>>, %arg1: memref<128x128xi4, #gpu.address_space<workgroup>>, %arg2: memref<128x128xi32>) {
    %c0_i4 = arith.constant 0 : i4
    %c0_i32 = arith.constant 0 : i32
    %cst = arith.constant dense<0> : vector<32x8xi4>
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_read %arg0[%c0, %c0], %c0_i4 {in_bounds = [true, true]} : memref<128x128xi4, #gpu.address_space<workgroup>>, vector<16x64xi4>
    %1 = vector.transfer_read %arg1[%c0, %c0], %c0_i4 {in_bounds = [true, true]} : memref<128x128xi4, #gpu.address_space<workgroup>>, vector<8x64xi4>
    %2 = vector.transfer_read %arg2[%c0, %c0], %c0_i32 {in_bounds = [true, true]} : memref<128x128xi32>, vector<16x8xi32>
    %3 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %2 : vector<16x64xi4>, vector<8x64xi4> into vector<16x8xi32>
    vector.transfer_write %3, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<16x8xi32>, memref<128x128xi32>
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @m16n8k32_int8_row_col_row(%arg0: memref<128x128xi8, #gpu.address_space<workgroup>>, %arg1: memref<128x128xi8, #gpu.address_space<workgroup>>, %arg2: memref<128x128xi32>) {
    %cst = arith.constant dense<0> : vector<32x8xi8>
    %c0 = arith.constant 0 : index
    %c0_i8 = arith.constant 0 : i8
    %c0_i32 = arith.constant 0 : i32
    %0 = vector.transfer_read %arg0[%c0, %c0], %c0_i8 {in_bounds = [true, true]} : memref<128x128xi8, #gpu.address_space<workgroup>>, vector<16x32xi8>
    %1 = vector.transfer_read %arg1[%c0, %c0], %c0_i8 {in_bounds = [true, true]} : memref<128x128xi8, #gpu.address_space<workgroup>>, vector<8x32xi8>
    %2 = vector.transfer_read %arg2[%c0, %c0], %c0_i32 {in_bounds = [true, true]} : memref<128x128xi32>, vector<16x8xi32>
    %3 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %2 : vector<16x32xi8>, vector<8x32xi8> into vector<16x8xi32>
    vector.transfer_write %3, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<16x8xi32>, memref<128x128xi32>
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @strided_memref_read_write(%arg0: memref<20x20xf16, strided<[?, 1], offset: ?>, #gpu.address_space<workgroup>>, %arg1: memref<20x20xf16, strided<[?, 1], offset: ?>, #gpu.address_space<workgroup>>, %arg2: memref<20x20xf16, strided<[?, 1], offset: ?>, #gpu.address_space<workgroup>>) {
    %cst = arith.constant dense<0.000000e+00> : vector<16x8xf16>
    %c0 = arith.constant 0 : index
    %cst_0 = arith.constant 0.000000e+00 : f16
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<20x20xf16, strided<[?, 1], offset: ?>, #gpu.address_space<workgroup>>, vector<16x16xf16>
    %1 = vector.transfer_read %arg1[%c0, %c0], %cst_0 {in_bounds = [true, true], permutation_map = #map} : memref<20x20xf16, strided<[?, 1], offset: ?>, #gpu.address_space<workgroup>>, vector<8x16xf16>
    %2 = vector.transfer_read %arg2[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<20x20xf16, strided<[?, 1], offset: ?>, #gpu.address_space<workgroup>>, vector<16x8xf16>
    %3 = vector.contract {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %2 : vector<16x16xf16>, vector<8x16xf16> into vector<16x8xf16>
    vector.transfer_write %3, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<16x8xf16>, memref<20x20xf16, strided<[?, 1], offset: ?>, #gpu.address_space<workgroup>>
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d0, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
module {
  func.func @unsupported_non_2d_load_store(%arg0: memref<20x20x20xf16, strided<[?, ?, 1], offset: ?>, #gpu.address_space<workgroup>>, %arg1: memref<20x20x20xf16, strided<[?, ?, 1], offset: ?>, #gpu.address_space<workgroup>>, %arg2: memref<20x20x20xf16, strided<[?, ?, 1], offset: ?>, #gpu.address_space<workgroup>>) {
    %cst = arith.constant dense<0.000000e+00> : vector<16x8xf16>
    %c0 = arith.constant 0 : index
    %cst_0 = arith.constant 0.000000e+00 : f16
    %0 = vector.transfer_read %arg0[%c0, %c0, %c0], %cst_0 {in_bounds = [true, true, true]} : memref<20x20x20xf16, strided<[?, ?, 1], offset: ?>, #gpu.address_space<workgroup>>, vector<1x16x16xf16>
    %1 = vector.transfer_read %arg1[%c0, %c0, %c0], %cst_0 {in_bounds = [true, true, true]} : memref<20x20x20xf16, strided<[?, ?, 1], offset: ?>, #gpu.address_space<workgroup>>, vector<8x1x16xf16>
    %2 = vector.transfer_read %arg2[%c0, %c0, %c0], %cst_0 {in_bounds = [true, true, true]} : memref<20x20x20xf16, strided<[?, ?, 1], offset: ?>, #gpu.address_space<workgroup>>, vector<1x16x8xf16>
    %3 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %2 : vector<1x16x16xf16>, vector<8x1x16xf16> into vector<1x16x8xf16>
    vector.transfer_write %3, %arg2[%c0, %c0, %c0] {in_bounds = [true, true, true]} : vector<1x16x8xf16>, memref<20x20x20xf16, strided<[?, ?, 1], offset: ?>, #gpu.address_space<workgroup>>
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @unsupported_fully_dynamic_strides(%arg0: memref<20x20xf16, strided<[?, ?], offset: ?>, #gpu.address_space<workgroup>>, %arg1: memref<20x20xf16, strided<[?, ?], offset: ?>, #gpu.address_space<workgroup>>, %arg2: memref<20x20xf16, strided<[?, ?], offset: ?>, #gpu.address_space<workgroup>>) {
    %cst = arith.constant dense<0.000000e+00> : vector<16x8xf16>
    %c0 = arith.constant 0 : index
    %cst_0 = arith.constant 0.000000e+00 : f16
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<20x20xf16, strided<[?, ?], offset: ?>, #gpu.address_space<workgroup>>, vector<16x16xf16>
    %1 = vector.transfer_read %arg1[%c0, %c0], %cst_0 {in_bounds = [true, true], permutation_map = #map} : memref<20x20xf16, strided<[?, ?], offset: ?>, #gpu.address_space<workgroup>>, vector<8x16xf16>
    %2 = vector.transfer_read %arg2[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<20x20xf16, strided<[?, ?], offset: ?>, #gpu.address_space<workgroup>>, vector<16x8xf16>
    %3 = vector.contract {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %2 : vector<16x16xf16>, vector<8x16xf16> into vector<16x8xf16>
    vector.transfer_write %3, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<16x8xf16>, memref<20x20xf16, strided<[?, ?], offset: ?>, #gpu.address_space<workgroup>>
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @unsupported_transposed_store(%arg0: memref<20x20xf16, strided<[?, 1], offset: ?>, #gpu.address_space<workgroup>>, %arg1: memref<20x20xf16, strided<[?, 1], offset: ?>, #gpu.address_space<workgroup>>, %arg2: memref<20x20xf16, strided<[?, 1], offset: ?>, #gpu.address_space<workgroup>>) {
    %cst = arith.constant dense<0.000000e+00> : vector<16x8xf16>
    %c0 = arith.constant 0 : index
    %cst_0 = arith.constant 0.000000e+00 : f16
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<20x20xf16, strided<[?, 1], offset: ?>, #gpu.address_space<workgroup>>, vector<16x16xf16>
    %1 = vector.transfer_read %arg1[%c0, %c0], %cst_0 {in_bounds = [true, true], permutation_map = #map} : memref<20x20xf16, strided<[?, 1], offset: ?>, #gpu.address_space<workgroup>>, vector<8x16xf16>
    %2 = vector.transfer_read %arg2[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<20x20xf16, strided<[?, 1], offset: ?>, #gpu.address_space<workgroup>>, vector<16x8xf16>
    %3 = vector.contract {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %2 : vector<16x16xf16>, vector<8x16xf16> into vector<16x8xf16>
    vector.transfer_write %3, %arg2[%c0, %c0] {in_bounds = [true, true], permutation_map = #map} : vector<16x8xf16>, memref<20x20xf16, strided<[?, 1], offset: ?>, #gpu.address_space<workgroup>>
    return
  }
}

