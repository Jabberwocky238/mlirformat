#map = affine_map<(d0, d1, d2) -> (d0, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d2)>
module {
  func.func @add4x2(%arg0: vector<4x2xf32>) -> vector<4x2xf32> {
    %0 = arith.addf %arg0, %arg0 : vector<4x2xf32>
    return %0 : vector<4x2xf32>
  }
  func.func @no_change(%arg0: vector<2x[4]x1xf32>, %arg1: vector<2x[4]x1xf32>) -> vector<2x[4]x1xf32> {
    %0 = arith.mulf %arg0, %arg1 : vector<2x[4]x1xf32>
    return %0 : vector<2x[4]x1xf32>
  }
  func.func @cast_away_leading_one_dim(%arg0: vector<1x4x1xf32>, %arg1: vector<1x4x1xf32>) -> vector<1x4x1xf32> {
    %0 = arith.mulf %arg0, %arg1 : vector<1x4x1xf32>
    return %0 : vector<1x4x1xf32>
  }
  func.func @cast_away_leading_one_dim_scalable(%arg0: vector<1x[4]x1xf32>, %arg1: vector<1x[4]x1xf32>) -> vector<1x[4]x1xf32> {
    %0 = arith.mulf %arg0, %arg1 : vector<1x[4]x1xf32>
    return %0 : vector<1x[4]x1xf32>
  }
  func.func @add4x4(%arg0: vector<4x4xf32>, %arg1: vector<4x4xf32>) -> vector<4x4xf32> {
    %0 = arith.addf %arg0, %arg1 : vector<4x4xf32>
    %1 = arith.addf %arg1, %0 : vector<4x4xf32>
    return %1 : vector<4x4xf32>
  }
  func.func @contraction4x4_ikj_xfer_read(%arg0: memref<4x2xf32>, %arg1: memref<2x4xf32>, %arg2: memref<4x4xf32>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst : memref<4x2xf32>, vector<4x2xf32>
    %1 = vector.transfer_read %arg1[%c0, %c0], %cst : memref<2x4xf32>, vector<2x4xf32>
    %2 = vector.transfer_read %arg2[%c0, %c0], %cst : memref<4x4xf32>, vector<4x4xf32>
    %3 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction", "parallel"], kind = #vector.kind<add>} %0, %1, %2 : vector<4x2xf32>, vector<2x4xf32> into vector<4x4xf32>
    vector.transfer_write %3, %arg2[%c0, %c0] : vector<4x4xf32>, memref<4x4xf32>
    return
  }
  func.func @vector_transfers(%arg0: index, %arg1: index) {
    %cst = arith.constant 0.000000e+00 : f32
    %alloc = memref.alloc(%arg0, %arg1) : memref<?x?xf32>
    %alloc_0 = memref.alloc(%arg0, %arg1) : memref<?x?xf32>
    %alloc_1 = memref.alloc(%arg0, %arg1) : memref<?x?xf32>
    %cst_2 = arith.constant 1.000000e+00 : f32
    %cst_3 = arith.constant 2.000000e+00 : f32
    affine.for %arg2 = 0 to %arg0 step 4 {
      affine.for %arg3 = 0 to %arg1 step 4 {
        %0 = vector.transfer_read %alloc[%arg2, %arg3], %cst : memref<?x?xf32>, vector<4x4xf32>
        %1 = vector.transfer_read %alloc_0[%arg2, %arg3], %cst : memref<?x?xf32>, vector<4x4xf32>
        %2 = arith.addf %0, %1 : vector<4x4xf32>
        vector.transfer_write %2, %alloc_1[%arg2, %arg3] : vector<4x4xf32>, memref<?x?xf32>
      }
    }
    return
  }
  func.func @elementwise_unroll(%arg0: memref<4x4xf32>, %arg1: memref<4x4xf32>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst : memref<4x4xf32>, vector<4x4xf32>
    %1 = vector.transfer_read %arg1[%c0, %c0], %cst : memref<4x4xf32>, vector<4x4xf32>
    %2 = arith.cmpf ult, %0, %1 : vector<4x4xf32>
    %3 = vector.transfer_read %arg0[%c0, %c0], %cst : memref<4x4xf32>, vector<4x4xf32>
    %4 = vector.transfer_read %arg1[%c0, %c0], %cst : memref<4x4xf32>, vector<4x4xf32>
    %5 = arith.select %2, %3, %4 : vector<4x4xi1>, vector<4x4xf32>
    vector.transfer_write %5, %arg0[%c0, %c0] : vector<4x4xf32>, memref<4x4xf32>
    return
  }
  func.func @contraction4x4_ikj_xfer_read_tensor(%arg0: tensor<4x2xf32>, %arg1: tensor<2x4xf32>, %arg2: tensor<4x4xf32>) -> tensor<4x4xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst : tensor<4x2xf32>, vector<4x2xf32>
    %1 = vector.transfer_read %arg1[%c0, %c0], %cst : tensor<2x4xf32>, vector<2x4xf32>
    %2 = vector.transfer_read %arg2[%c0, %c0], %cst : tensor<4x4xf32>, vector<4x4xf32>
    %3 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction", "parallel"], kind = #vector.kind<add>} %0, %1, %2 : vector<4x2xf32>, vector<2x4xf32> into vector<4x4xf32>
    %4 = vector.transfer_write %3, %arg2[%c0, %c0] : vector<4x4xf32>, tensor<4x4xf32>
    return %4 : tensor<4x4xf32>
  }
  func.func @bubble_down_bitcast_in_extract(%arg0: vector<4xf32>) -> (f16, f16) {
    %0 = vector.bitcast %arg0 : vector<4xf32> to vector<8xf16>
    %1 = vector.extract %0[3] : f16 from vector<8xf16>
    %2 = vector.extract %0[4] : f16 from vector<8xf16>
    return %1, %2 : f16, f16
  }
  func.func @bubble_down_bitcast_in_strided_slice_extract(%arg0: vector<4xf32>) -> vector<4xf16> {
    %0 = vector.bitcast %arg0 : vector<4xf32> to vector<8xf16>
    %1 = vector.extract_strided_slice %0 {offsets = [4], sizes = [4], strides = [1]} : vector<8xf16> to vector<4xf16>
    return %1 : vector<4xf16>
  }
  func.func @bubble_down_bitcast_in_strided_slice_extract_full_last_dim(%arg0: vector<4x2xf32>) -> vector<2x4xf16> {
    %0 = vector.bitcast %arg0 : vector<4x2xf32> to vector<4x4xf16>
    %1 = vector.extract_strided_slice %0 {offsets = [1], sizes = [2], strides = [1]} : vector<4x4xf16> to vector<2x4xf16>
    return %1 : vector<2x4xf16>
  }
  func.func @bubble_down_bitcast_in_strided_slice_extract_odd_offset(%arg0: vector<4xf32>) -> vector<4xf16> {
    %0 = vector.bitcast %arg0 : vector<4xf32> to vector<8xf16>
    %1 = vector.extract_strided_slice %0 {offsets = [3], sizes = [4], strides = [1]} : vector<8xf16> to vector<4xf16>
    return %1 : vector<4xf16>
  }
  func.func @bubble_down_bitcast_in_strided_slice_extract_odd_size(%arg0: vector<4xf32>) -> vector<3xf16> {
    %0 = vector.bitcast %arg0 : vector<4xf32> to vector<8xf16>
    %1 = vector.extract_strided_slice %0 {offsets = [0], sizes = [3], strides = [1]} : vector<8xf16> to vector<3xf16>
    return %1 : vector<3xf16>
  }
  func.func @bubble_up_bitcast_in_insert_i4_i8(%arg0: vector<32xi4>, %arg1: vector<8x32xi4>) -> vector<8x16xi8> {
    %0 = vector.insert %arg0, %arg1 [4] : vector<32xi4> into vector<8x32xi4>
    %1 = vector.bitcast %0 : vector<8x32xi4> to vector<8x16xi8>
    return %1 : vector<8x16xi8>
  }
  func.func @bubble_up_bitcast_in_insert_i8_i4(%arg0: vector<16xi8>, %arg1: vector<8x16xi8>) -> vector<8x32xi4> {
    %0 = vector.insert %arg0, %arg1 [4] : vector<16xi8> into vector<8x16xi8>
    %1 = vector.bitcast %0 : vector<8x16xi8> to vector<8x32xi4>
    return %1 : vector<8x32xi4>
  }
  func.func @bubble_up_bitcast_in_insert_i32_f32(%arg0: vector<16xi32>, %arg1: vector<8x16xi32>) -> vector<8x16xf32> {
    %0 = vector.insert %arg0, %arg1 [4] : vector<16xi32> into vector<8x16xi32>
    %1 = vector.bitcast %0 : vector<8x16xi32> to vector<8x16xf32>
    return %1 : vector<8x16xf32>
  }
  func.func @bubble_up_bitcast_in_insert_scalar(%arg0: i8, %arg1: vector<8x16xi8>) -> vector<8x32xi4> {
    %0 = vector.insert %arg0, %arg1 [4, 8] : i8 into vector<8x16xi8>
    %1 = vector.bitcast %0 : vector<8x16xi8> to vector<8x32xi4>
    return %1 : vector<8x32xi4>
  }
  func.func @bubble_up_bitcast_in_strided_slice_insert(%arg0: vector<8xf16>, %arg1: vector<4xf16>, %arg2: vector<4xf16>) -> vector<4xf32> {
    %0 = vector.insert_strided_slice %arg1, %arg0 {offsets = [0], strides = [1]} : vector<4xf16> into vector<8xf16>
    %1 = vector.insert_strided_slice %arg2, %0 {offsets = [4], strides = [1]} : vector<4xf16> into vector<8xf16>
    %2 = vector.bitcast %1 : vector<8xf16> to vector<4xf32>
    return %2 : vector<4xf32>
  }
  func.func @bubble_up_bitcast_in_strided_slice_insert_odd_offset(%arg0: vector<8xf16>, %arg1: vector<4xf16>) -> vector<4xf32> {
    %0 = vector.insert_strided_slice %arg1, %arg0 {offsets = [3], strides = [1]} : vector<4xf16> into vector<8xf16>
    %1 = vector.bitcast %0 : vector<8xf16> to vector<4xf32>
    return %1 : vector<4xf32>
  }
  func.func @bubble_up_bitcast_in_strided_slice_insert_different_rank(%arg0: vector<16x4x8xf16>, %arg1: vector<2x4xf16>) -> vector<16x4x4xf32> {
    %0 = vector.insert_strided_slice %arg1, %arg0 {offsets = [0, 0, 2], strides = [1, 1]} : vector<2x4xf16> into vector<16x4x8xf16>
    %1 = vector.bitcast %0 : vector<16x4x8xf16> to vector<16x4x4xf32>
    return %1 : vector<16x4x4xf32>
  }
  func.func @bubble_up_bitcast_in_strided_slice_insert_odd_shape(%arg0: vector<2xf16>, %arg1: vector<1xf16>) -> vector<1xf32> {
    %0 = vector.insert_strided_slice %arg1, %arg0 {offsets = [0], strides = [1]} : vector<1xf16> into vector<2xf16>
    %1 = vector.bitcast %0 : vector<2xf16> to vector<1xf32>
    return %1 : vector<1xf32>
  }
  func.func @bubble_up_bitcast_in_strided_slice_insert_larger_odd_shape(%arg0: vector<8xf16>, %arg1: vector<3xf16>) -> vector<4xf32> {
    %0 = vector.insert_strided_slice %arg1, %arg0 {offsets = [0], strides = [1]} : vector<3xf16> into vector<8xf16>
    %1 = vector.bitcast %0 : vector<8xf16> to vector<4xf32>
    return %1 : vector<4xf32>
  }
  func.func @vec_0D(%arg0: vector<f32>) -> vector<i32> {
    %0 = vector.bitcast %arg0 : vector<f32> to vector<i32>
    return %0 : vector<i32>
  }
  func.func @vector_extract_dynamic_index(%arg0: vector<4xi32>, %arg1: index) -> i16 {
    %0 = vector.bitcast %arg0 : vector<4xi32> to vector<8xi16>
    %1 = vector.extract %0[%arg1] : i16 from vector<8xi16>
    return %1 : i16
  }
}

