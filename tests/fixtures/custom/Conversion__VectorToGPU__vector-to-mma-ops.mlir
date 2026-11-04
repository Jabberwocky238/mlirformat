#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @matmul(%arg0: memref<16x16xf16>, %arg1: memref<16x16xf16>, %arg2: memref<16x16xf16>) {
    %cst = arith.constant dense<0.000000e+00> : vector<16x16xf16>
    %c0 = arith.constant 0 : index
    %cst_0 = arith.constant 0.000000e+00 : f16
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<16x16xf16>, vector<16x16xf16>
    %1 = vector.transfer_read %arg1[%c0, %c0], %cst_0 {in_bounds = [true, true], permutation_map = #map} : memref<16x16xf16>, vector<16x16xf16>
    %2 = vector.transfer_read %arg2[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<16x16xf16>, vector<16x16xf16>
    %3 = vector.contract {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %2 : vector<16x16xf16>, vector<16x16xf16> into vector<16x16xf16>
    vector.transfer_write %3, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<16x16xf16>, memref<16x16xf16>
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @matmul_cst(%arg0: memref<16x16xf16>, %arg1: memref<16x16xf16>, %arg2: memref<16x16xf16>) {
    %cst = arith.constant dense<0.000000e+00> : vector<16x16xf16>
    %c0 = arith.constant 0 : index
    %cst_0 = arith.constant 0.000000e+00 : f16
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<16x16xf16>, vector<16x16xf16>
    %1 = vector.transfer_read %arg1[%c0, %c0], %cst_0 {in_bounds = [true, true], permutation_map = #map} : memref<16x16xf16>, vector<16x16xf16>
    %2 = vector.contract {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %cst : vector<16x16xf16>, vector<16x16xf16> into vector<16x16xf16>
    vector.transfer_write %2, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<16x16xf16>, memref<16x16xf16>
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @matmul_broadcast(%arg0: memref<16x16xf16>, %arg1: memref<16x16xf16>, %arg2: memref<16x16xf16>, %arg3: f16) {
    %0 = vector.broadcast %arg3 : f16 to vector<16x16xf16>
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f16
    %1 = vector.transfer_read %arg0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<16x16xf16>, vector<16x16xf16>
    %2 = vector.transfer_read %arg1[%c0, %c0], %cst {in_bounds = [true, true], permutation_map = #map} : memref<16x16xf16>, vector<16x16xf16>
    %3 = vector.contract {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %1, %2, %0 : vector<16x16xf16>, vector<16x16xf16> into vector<16x16xf16>
    vector.transfer_write %3, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<16x16xf16>, memref<16x16xf16>
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @matmul_loop(%arg0: memref<128x128xf16>, %arg1: memref<128x128xf16>, %arg2: memref<128x128xf16>) {
    %c0 = arith.constant 0 : index
    %c128 = arith.constant 128 : index
    %c32 = arith.constant 32 : index
    %cst = arith.constant 0.000000e+00 : f16
    %0 = vector.transfer_read %arg2[%c0, %c0], %cst {in_bounds = [true, true]} : memref<128x128xf16>, vector<16x16xf16>
    %1 = scf.for %arg3 = %c0 to %c128 step %c32 iter_args(%arg4 = %0) -> (vector<16x16xf16>) {
      %2 = vector.transfer_read %arg0[%c0, %arg3], %cst {in_bounds = [true, true]} : memref<128x128xf16>, vector<16x16xf16>
      %3 = vector.transfer_read %arg1[%arg3, %c0], %cst {in_bounds = [true, true], permutation_map = #map} : memref<128x128xf16>, vector<16x16xf16>
      %4 = vector.contract {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %3, %arg4 : vector<16x16xf16>, vector<16x16xf16> into vector<16x16xf16>
      scf.yield %4 : vector<16x16xf16>
    }
    vector.transfer_write %1, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<16x16xf16>, memref<128x128xf16>
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @matmul_fused_elementwise(%arg0: memref<16x16xf16>, %arg1: memref<16x16xf16>, %arg2: memref<16x16xf16>) {
    %cst = arith.constant dense<0.000000e+00> : vector<16x16xf16>
    %cst_0 = arith.constant dense<1.000000e+00> : vector<16x16xf16>
    %c0 = arith.constant 0 : index
    %cst_1 = arith.constant 0.000000e+00 : f16
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst_1 {in_bounds = [true, true]} : memref<16x16xf16>, vector<16x16xf16>
    %1 = vector.transfer_read %arg1[%c0, %c0], %cst_1 {in_bounds = [true, true], permutation_map = #map} : memref<16x16xf16>, vector<16x16xf16>
    %2 = vector.contract {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %cst : vector<16x16xf16>, vector<16x16xf16> into vector<16x16xf16>
    %3 = arith.addf %2, %cst_0 : vector<16x16xf16>
    vector.transfer_write %3, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<16x16xf16>, memref<16x16xf16>
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map4 = affine_map<(d0, d1, d2, d3) -> (0, d3)>
module {
  func.func @matmul_fused_broadcast(%arg0: memref<16x16xf16>, %arg1: memref<16x16xf16>, %arg2: memref<16x16xf16>, %arg3: memref<16x16x16x16xf16>) {
    %cst = arith.constant dense<0.000000e+00> : vector<16x16xf16>
    %c0 = arith.constant 0 : index
    %cst_0 = arith.constant 0.000000e+00 : f16
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<16x16xf16>, vector<16x16xf16>
    %1 = vector.transfer_read %arg1[%c0, %c0], %cst_0 {in_bounds = [true, true], permutation_map = #map} : memref<16x16xf16>, vector<16x16xf16>
    %2 = vector.contract {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %cst : vector<16x16xf16>, vector<16x16xf16> into vector<16x16xf16>
    %3 = vector.transfer_read %arg3[%c0, %c0, %c0, %c0], %cst_0 {in_bounds = [true, true], permutation_map = #map4} : memref<16x16x16x16xf16>, vector<16x16xf16>
    %4 = arith.divf %2, %3 : vector<16x16xf16>
    vector.transfer_write %4, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<16x16xf16>, memref<16x16xf16>
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0, 0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @matmul_3Dmemref(%arg0: memref<2x16x16xf16>, %arg1: memref<16xf16>, %arg2: memref<2x16x16xf16>) {
    %cst = arith.constant dense<0.000000e+00> : vector<16x16xf16>
    %c0 = arith.constant 0 : index
    %cst_0 = arith.constant 0.000000e+00 : f16
    %0 = vector.transfer_read %arg0[%c0, %c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<2x16x16xf16>, vector<16x16xf16>
    %1 = vector.transfer_read %arg1[%c0], %cst_0 {in_bounds = [true, true], permutation_map = #map} : memref<16xf16>, vector<16x16xf16>
    %2 = vector.transfer_read %arg2[%c0, %c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<2x16x16xf16>, vector<16x16xf16>
    %3 = vector.contract {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %2 : vector<16x16xf16>, vector<16x16xf16> into vector<16x16xf16>
    vector.transfer_write %3, %arg2[%c0, %c0, %c0] {in_bounds = [true, true]} : vector<16x16xf16>, memref<2x16x16xf16>
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0 * 512 + d1 * 32 + d2)>
#map1 = affine_map<(d0) -> (d0, 0)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map4 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @matmul_memref_strided(%arg0: memref<2x16x16xf16, #map>, %arg1: memref<16xf16>, %arg2: memref<2x16x16xf16>) {
    %cst = arith.constant dense<0.000000e+00> : vector<16x16xf16>
    %c0 = arith.constant 0 : index
    %cst_0 = arith.constant 0.000000e+00 : f16
    %0 = vector.transfer_read %arg0[%c0, %c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<2x16x16xf16, #map>, vector<16x16xf16>
    %1 = vector.transfer_read %arg1[%c0], %cst_0 {in_bounds = [true, true], permutation_map = #map1} : memref<16xf16>, vector<16x16xf16>
    %2 = vector.transfer_read %arg2[%c0, %c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<2x16x16xf16>, vector<16x16xf16>
    %3 = vector.contract {indexing_maps = [#map2, #map3, #map4], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %2 : vector<16x16xf16>, vector<16x16xf16> into vector<16x16xf16>
    vector.transfer_write %3, %arg2[%c0, %c0, %c0] {in_bounds = [true, true]} : vector<16x16xf16>, memref<2x16x16xf16>
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @matmul_transposed(%arg0: memref<16x16xf16>, %arg1: memref<16x16xf16>, %arg2: memref<16x16xf16>) {
    %cst = arith.constant dense<0.000000e+00> : vector<16x16xf16>
    %c0 = arith.constant 0 : index
    %cst_0 = arith.constant 0.000000e+00 : f16
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<16x16xf16>, vector<16x16xf16>
    %1 = vector.transfer_read %arg1[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<16x16xf16>, vector<16x16xf16>
    %2 = vector.transfer_read %arg2[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<16x16xf16>, vector<16x16xf16>
    %3 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %2 : vector<16x16xf16>, vector<16x16xf16> into vector<16x16xf16>
    vector.transfer_write %3, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<16x16xf16>, memref<16x16xf16>
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0, 0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @matmul_transposed_broadcasted_1d(%arg0: memref<16xf16>, %arg1: memref<16xf16>, %arg2: memref<16x16xf16>) {
    %cst = arith.constant dense<0.000000e+00> : vector<16x16xf16>
    %c0 = arith.constant 0 : index
    %cst_0 = arith.constant 0.000000e+00 : f16
    %0 = vector.transfer_read %arg0[%c0], %cst_0 {in_bounds = [true, true], permutation_map = #map} : memref<16xf16>, vector<16x16xf16>
    %1 = vector.transfer_read %arg1[%c0], %cst_0 {in_bounds = [true, true], permutation_map = #map} : memref<16xf16>, vector<16x16xf16>
    %2 = vector.transfer_read %arg2[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<16x16xf16>, vector<16x16xf16>
    %3 = vector.contract {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %2 : vector<16x16xf16>, vector<16x16xf16> into vector<16x16xf16>
    vector.transfer_write %3, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<16x16xf16>, memref<16x16xf16>
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, 0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @matmul_transposed_broadcasted_2d(%arg0: memref<32x32xf16>, %arg1: memref<32x32xf16>, %arg2: memref<16x16xf16>) {
    %cst = arith.constant dense<0.000000e+00> : vector<16x16xf16>
    %c0 = arith.constant 0 : index
    %cst_0 = arith.constant 0.000000e+00 : f16
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst_0 {in_bounds = [true, true], permutation_map = #map} : memref<32x32xf16>, vector<16x16xf16>
    %1 = vector.transfer_read %arg1[%c0, %c0], %cst_0 {in_bounds = [true, true], permutation_map = #map} : memref<32x32xf16>, vector<16x16xf16>
    %2 = vector.transfer_read %arg2[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<16x16xf16>, vector<16x16xf16>
    %3 = vector.contract {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %2 : vector<16x16xf16>, vector<16x16xf16> into vector<16x16xf16>
    vector.transfer_write %3, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<16x16xf16>, memref<16x16xf16>
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @matmul_no_extend_int8(%arg0: memref<16x16xi8>, %arg1: memref<16x16xi8>, %arg2: memref<16x16xi32>) {
    %cst = arith.constant dense<0> : vector<16x16xi8>
    %c0 = arith.constant 0 : index
    %c0_i8 = arith.constant 0 : i8
    %c0_i32 = arith.constant 0 : i32
    %0 = vector.transfer_read %arg0[%c0, %c0], %c0_i8 {in_bounds = [true, true]} : memref<16x16xi8>, vector<16x16xi8>
    %1 = vector.transfer_read %arg1[%c0, %c0], %c0_i8 {in_bounds = [true, true], permutation_map = #map} : memref<16x16xi8>, vector<16x16xi8>
    %2 = vector.transfer_read %arg2[%c0, %c0], %c0_i32 {in_bounds = [true, true]} : memref<16x16xi32>, vector<16x16xi32>
    %3 = vector.contract {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %2 : vector<16x16xi8>, vector<16x16xi8> into vector<16x16xi32>
    vector.transfer_write %3, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<16x16xi32>, memref<16x16xi32>
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @matmul_int8(%arg0: memref<16x16xi8>, %arg1: memref<16x16xi8>, %arg2: memref<16x16xi32>) {
    %cst = arith.constant dense<0> : vector<16x16xi8>
    %c0 = arith.constant 0 : index
    %c0_i8 = arith.constant 0 : i8
    %c0_i32 = arith.constant 0 : i32
    %0 = vector.transfer_read %arg0[%c0, %c0], %c0_i8 {in_bounds = [true, true]} : memref<16x16xi8>, vector<16x16xi8>
    %1 = vector.transfer_read %arg1[%c0, %c0], %c0_i8 {in_bounds = [true, true], permutation_map = #map} : memref<16x16xi8>, vector<16x16xi8>
    %2 = vector.transfer_read %arg2[%c0, %c0], %c0_i32 {in_bounds = [true, true]} : memref<16x16xi32>, vector<16x16xi32>
    %3 = arith.extsi %0 : vector<16x16xi8> to vector<16x16xi32>
    %4 = arith.extsi %1 : vector<16x16xi8> to vector<16x16xi32>
    %5 = vector.contract {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %3, %4, %2 : vector<16x16xi32>, vector<16x16xi32> into vector<16x16xi32>
    vector.transfer_write %5, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<16x16xi32>, memref<16x16xi32>
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @matmul_mixed_signedness_int8(%arg0: memref<16x16xi8>, %arg1: memref<16x16xi8>, %arg2: memref<16x16xi32>) {
    %cst = arith.constant dense<0> : vector<16x16xi8>
    %c0 = arith.constant 0 : index
    %c0_i8 = arith.constant 0 : i8
    %c0_i32 = arith.constant 0 : i32
    %0 = vector.transfer_read %arg0[%c0, %c0], %c0_i8 {in_bounds = [true, true]} : memref<16x16xi8>, vector<16x16xi8>
    %1 = vector.transfer_read %arg1[%c0, %c0], %c0_i8 {in_bounds = [true, true], permutation_map = #map} : memref<16x16xi8>, vector<16x16xi8>
    %2 = vector.transfer_read %arg2[%c0, %c0], %c0_i32 {in_bounds = [true, true]} : memref<16x16xi32>, vector<16x16xi32>
    %3 = arith.extui %0 : vector<16x16xi8> to vector<16x16xi32>
    %4 = arith.extsi %1 : vector<16x16xi8> to vector<16x16xi32>
    %5 = vector.contract {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %3, %4, %2 : vector<16x16xi32>, vector<16x16xi32> into vector<16x16xi32>
    vector.transfer_write %5, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<16x16xi32>, memref<16x16xi32>
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @matmul_mixed_signedness_int8(%arg0: memref<16x32xi8>, %arg1: memref<16x32xi8>, %arg2: memref<16x16xi32>) {
    %cst = arith.constant dense<0> : vector<16x16xi8>
    %c0 = arith.constant 0 : index
    %c0_i8 = arith.constant 0 : i8
    %c0_i32 = arith.constant 0 : i32
    %0 = vector.transfer_read %arg0[%c0, %c0], %c0_i8 {in_bounds = [true, true]} : memref<16x32xi8>, vector<16x32xi8>
    %1 = vector.transfer_read %arg1[%c0, %c0], %c0_i8 {in_bounds = [true, true], permutation_map = #map} : memref<16x32xi8>, vector<16x32xi8>
    %2 = vector.transfer_read %arg2[%c0, %c0], %c0_i32 {in_bounds = [true, true]} : memref<16x16xi32>, vector<16x16xi32>
    %3 = arith.extui %0 : vector<16x32xi8> to vector<16x32xi32>
    %4 = arith.extsi %1 : vector<16x32xi8> to vector<16x32xi32>
    %5 = vector.contract {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %3, %4, %2 : vector<16x32xi32>, vector<16x32xi32> into vector<16x16xi32>
    vector.transfer_write %5, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<16x16xi32>, memref<16x16xi32>
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @cast_f16_to_f32_write(%arg0: memref<16x16xf16>, %arg1: memref<16x16xf16>, %arg2: memref<16x16xf16>, %arg3: memref<16x16xf32>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f16
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<16x16xf16>, vector<16x16xf16>
    %1 = vector.transfer_read %arg1[%c0, %c0], %cst {in_bounds = [true, true]} : memref<16x16xf16>, vector<16x16xf16>
    %2 = vector.transfer_read %arg2[%c0, %c0], %cst {in_bounds = [true, true]} : memref<16x16xf16>, vector<16x16xf16>
    %3 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %2 : vector<16x16xf16>, vector<16x16xf16> into vector<16x16xf16>
    %4 = arith.extf %3 : vector<16x16xf16> to vector<16x16xf32>
    vector.transfer_write %4, %arg3[%c0, %c0] {in_bounds = [true, true]} : vector<16x16xf32>, memref<16x16xf32>
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @fold_transpose_into_transfer_read(%arg0: memref<64x128xf16>, %arg1: vector<32x128xf16>, %arg2: memref<32x64xf32>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f16
    %cst_0 = arith.constant dense<0.000000e+00> : vector<32x64xf32>
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<64x128xf16>, vector<64x128xf16>
    %1 = arith.extf %0 : vector<64x128xf16> to vector<64x128xf32>
    %2 = arith.extf %arg1 : vector<32x128xf16> to vector<32x128xf32>
    %3 = vector.transpose %1, [1, 0] : vector<64x128xf32> to vector<128x64xf32>
    %4 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %3, %cst_0 : vector<32x128xf32>, vector<128x64xf32> into vector<32x64xf32>
    vector.transfer_write %4, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<32x64xf32>, memref<32x64xf32>
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @cast_f16_to_f32_read(%arg0: memref<16x16xf16>, %arg1: memref<16x16xf16>, %arg2: memref<16x16xf16>, %arg3: memref<16x16xf32>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f16
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<16x16xf16>, vector<16x16xf16>
    %1 = vector.transfer_read %arg1[%c0, %c0], %cst {in_bounds = [true, true]} : memref<16x16xf16>, vector<16x16xf16>
    %2 = vector.transfer_read %arg2[%c0, %c0], %cst {in_bounds = [true, true]} : memref<16x16xf16>, vector<16x16xf16>
    %3 = arith.extf %0 : vector<16x16xf16> to vector<16x16xf32>
    %4 = arith.extf %1 : vector<16x16xf16> to vector<16x16xf32>
    %5 = arith.extf %2 : vector<16x16xf16> to vector<16x16xf32>
    %6 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %3, %4, %5 : vector<16x16xf32>, vector<16x16xf32> into vector<16x16xf32>
    vector.transfer_write %6, %arg3[%c0, %c0] {in_bounds = [true, true]} : vector<16x16xf32>, memref<16x16xf32>
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @test_unsupported(%arg0: vector<4x4xi32>, %arg1: vector<4x4xi32>, %arg2: vector<4x4xi64>) -> vector<4x4xi64> {
    %0 = arith.extui %arg0 : vector<4x4xi32> to vector<4x4xi64>
    %1 = arith.extui %arg1 : vector<4x4xi32> to vector<4x4xi64>
    %2 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %arg2 : vector<4x4xi64>, vector<4x4xi64> into vector<4x4xi64>
    return %2 : vector<4x4xi64>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func @addf(%arg0: memref<16x16xf16>, %arg1: memref<16x16xf16>, %arg2: memref<16x16xf16>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f16
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<16x16xf16>, vector<16x16xf16>
    %1 = vector.transfer_read %arg1[%c0, %c0], %cst {in_bounds = [true, true], permutation_map = #map} : memref<16x16xf16>, vector<16x16xf16>
    %2 = arith.addf %0, %1 : vector<16x16xf16>
    vector.transfer_write %2, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<16x16xf16>, memref<16x16xf16>
    return
  }
}

