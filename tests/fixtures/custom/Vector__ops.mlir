#map = affine_map<(d0, d1) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d0, 0)>
#map3 = affine_map<(d0) -> (d0)>
#map4 = affine_map<(d0) -> ()>
#map5 = affine_map<(d0, d1, d2, d3, d4) -> (d3, d0, d4, d1)>
#map6 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d4, d3, d2)>
#map7 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2)>
#map8 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d0, d5, d2)>
#map9 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d1, d5, d4, d3)>
#map10 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
#map11 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map12 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map13 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map14 = affine_map<(d0, d1) -> (0, 0, 0)>
module {
  func.func @vector_transfer_ops_0d(%arg0: tensor<f32>, %arg1: memref<f32>) -> tensor<f32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[], %cst : tensor<f32>, vector<f32>
    %1 = vector.transfer_write %0, %arg0[] : vector<f32>, tensor<f32>
    %2 = vector.transfer_read %arg1[], %cst : memref<f32>, vector<f32>
    vector.transfer_write %2, %arg1[] : vector<f32>, memref<f32>
    return %1 : tensor<f32>
  }
  func.func @vector_transfer_ops_0d_from_higher_d(%arg0: tensor<?xf32>, %arg1: memref<?x?xf32>) -> tensor<?xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c0], %cst : tensor<?xf32>, vector<f32>
    %1 = vector.transfer_write %0, %arg0[%c0] : vector<f32>, tensor<?xf32>
    %2 = vector.transfer_read %arg1[%c0, %c0], %cst : memref<?x?xf32>, vector<f32>
    vector.transfer_write %2, %arg1[%c0, %c0] : vector<f32>, memref<?x?xf32>
    return %1 : tensor<?xf32>
  }
  func.func @vector_transfer_ops(%arg0: memref<?x?xf32>, %arg1: memref<?x?xvector<4x3xf32>>, %arg2: memref<?x?xvector<4x3xi32>>, %arg3: memref<?x?xvector<4x3xindex>>, %arg4: memref<?x?x?xf32>) {
    %c3 = arith.constant 3 : index
    %cst = arith.constant 3.000000e+00 : f32
    %cst_0 = arith.constant 0.000000e+00 : f32
    %c0_i32 = arith.constant 0 : i32
    %c0 = arith.constant 0 : index
    %true = arith.constant true
    %0 = vector.broadcast %cst_0 : f32 to vector<4x3xf32>
    %1 = vector.broadcast %c0_i32 : i32 to vector<4x3xi32>
    %2 = vector.broadcast %c0 : index to vector<4x3xindex>
    %cst_1 = arith.constant dense<[false, false, true, false, true]> : vector<5xi1>
    %3 = vector.broadcast %true : i1 to vector<4x5xi1>
    %4 = vector.transfer_read %arg0[%c3, %c3], %cst_0 {permutation_map = #map} : memref<?x?xf32>, vector<128xf32>
    %5 = vector.transfer_read %arg0[%c3, %c3], %cst_0 {permutation_map = #map1} : memref<?x?xf32>, vector<3x7xf32>
    %6 = vector.transfer_read %arg0[%c3, %c3], %cst {permutation_map = #map} : memref<?x?xf32>, vector<128xf32>
    %7 = vector.transfer_read %arg0[%c3, %c3], %cst : memref<?x?xf32>, vector<128xf32>
    %8 = vector.transfer_read %arg1[%c3, %c3], %0 : memref<?x?xvector<4x3xf32>>, vector<1x1x4x3xf32>
    %9 = vector.transfer_read %arg1[%c3, %c3], %0 {in_bounds = [false, true]} : memref<?x?xvector<4x3xf32>>, vector<1x1x4x3xf32>
    %10 = vector.transfer_read %arg2[%c3, %c3], %1 : memref<?x?xvector<4x3xi32>>, vector<5x24xi8>
    %11 = vector.transfer_read %arg3[%c3, %c3], %2 : memref<?x?xvector<4x3xindex>>, vector<5x48xi8>
    %12 = vector.transfer_read %arg0[%c3, %c3], %cst_0, %cst_1 : memref<?x?xf32>, vector<5xf32>
    %13 = vector.transfer_read %arg4[%c3, %c3, %c3], %cst_0, %3 {permutation_map = #map2} : memref<?x?x?xf32>, vector<5x4x8xf32>
    vector.transfer_write %4, %arg0[%c3, %c3] {permutation_map = #map} : vector<128xf32>, memref<?x?xf32>
    vector.transfer_write %5, %arg0[%c3, %c3] {permutation_map = #map1} : vector<3x7xf32>, memref<?x?xf32>
    vector.transfer_write %8, %arg1[%c3, %c3] : vector<1x1x4x3xf32>, memref<?x?xvector<4x3xf32>>
    vector.transfer_write %9, %arg1[%c3, %c3] : vector<1x1x4x3xf32>, memref<?x?xvector<4x3xf32>>
    vector.transfer_write %10, %arg2[%c3, %c3] : vector<5x24xi8>, memref<?x?xvector<4x3xi32>>
    vector.transfer_write %11, %arg3[%c3, %c3] : vector<5x48xi8>, memref<?x?xvector<4x3xindex>>
    vector.transfer_write %12, %arg0[%c3, %c3], %cst_1 : vector<5xf32>, memref<?x?xf32>
    return
  }
  func.func @vector_transfer_ops_tensor(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xvector<4x3xf32>>, %arg2: tensor<?x?xvector<4x3xi32>>, %arg3: tensor<?x?xvector<4x3xindex>>) -> (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xvector<4x3xf32>>, tensor<?x?xvector<4x3xf32>>, tensor<?x?xvector<4x3xi32>>, tensor<?x?xvector<4x3xindex>>) {
    %c3 = arith.constant 3 : index
    %cst = arith.constant 3.000000e+00 : f32
    %cst_0 = arith.constant 0.000000e+00 : f32
    %c0_i32 = arith.constant 0 : i32
    %c0 = arith.constant 0 : index
    %0 = vector.broadcast %cst_0 : f32 to vector<4x3xf32>
    %1 = vector.broadcast %c0_i32 : i32 to vector<4x3xi32>
    %2 = vector.broadcast %c0 : index to vector<4x3xindex>
    %3 = vector.transfer_read %arg0[%c3, %c3], %cst_0 {permutation_map = #map} : tensor<?x?xf32>, vector<128xf32>
    %4 = vector.transfer_read %arg0[%c3, %c3], %cst_0 {permutation_map = #map1} : tensor<?x?xf32>, vector<3x7xf32>
    %5 = vector.transfer_read %arg0[%c3, %c3], %cst {permutation_map = #map} : tensor<?x?xf32>, vector<128xf32>
    %6 = vector.transfer_read %arg0[%c3, %c3], %cst : tensor<?x?xf32>, vector<128xf32>
    %7 = vector.transfer_read %arg1[%c3, %c3], %0 : tensor<?x?xvector<4x3xf32>>, vector<1x1x4x3xf32>
    %8 = vector.transfer_read %arg1[%c3, %c3], %0 {in_bounds = [false, true]} : tensor<?x?xvector<4x3xf32>>, vector<1x1x4x3xf32>
    %9 = vector.transfer_read %arg2[%c3, %c3], %1 : tensor<?x?xvector<4x3xi32>>, vector<5x24xi8>
    %10 = vector.transfer_read %arg3[%c3, %c3], %2 : tensor<?x?xvector<4x3xindex>>, vector<5x48xi8>
    %11 = vector.transfer_write %3, %arg0[%c3, %c3] {permutation_map = #map} : vector<128xf32>, tensor<?x?xf32>
    %12 = vector.transfer_write %4, %arg0[%c3, %c3] {permutation_map = #map1} : vector<3x7xf32>, tensor<?x?xf32>
    %13 = vector.transfer_write %7, %arg1[%c3, %c3] : vector<1x1x4x3xf32>, tensor<?x?xvector<4x3xf32>>
    %14 = vector.transfer_write %8, %arg1[%c3, %c3] : vector<1x1x4x3xf32>, tensor<?x?xvector<4x3xf32>>
    %15 = vector.transfer_write %9, %arg2[%c3, %c3] : vector<5x24xi8>, tensor<?x?xvector<4x3xi32>>
    %16 = vector.transfer_write %10, %arg3[%c3, %c3] : vector<5x48xi8>, tensor<?x?xvector<4x3xindex>>
    return %11, %12, %13, %14, %15, %16 : tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xvector<4x3xf32>>, tensor<?x?xvector<4x3xf32>>, tensor<?x?xvector<4x3xi32>>, tensor<?x?xvector<4x3xindex>>
  }
  func.func @vector_broadcast(%arg0: f32, %arg1: vector<f32>, %arg2: vector<16xf32>, %arg3: vector<1x16xf32>, %arg4: vector<8x1xf32>, %arg5: vector<8x1x!llvm.ptr<1>>, %arg6: !llvm.ptr<1>) {
    %0 = vector.broadcast %arg0 : f32 to vector<f32>
    %1 = vector.broadcast %arg1 : vector<f32> to vector<4xf32>
    %2 = vector.broadcast %arg0 : f32 to vector<16xf32>
    %3 = vector.broadcast %arg2 : vector<16xf32> to vector<8x16xf32>
    %4 = vector.broadcast %arg3 : vector<1x16xf32> to vector<8x16xf32>
    %5 = vector.broadcast %arg4 : vector<8x1xf32> to vector<8x16xf32>
    %6 = vector.broadcast %arg5 : vector<8x1x!llvm.ptr<1>> to vector<8x16x!llvm.ptr<1>>
    %7 = vector.broadcast %arg6 : !llvm.ptr<1> to vector<8x16x!llvm.ptr<1>>
    return
  }
  func.func @shuffle0D(%arg0: vector<f32>) -> vector<3xf32> {
    %0 = vector.shuffle %arg0, %arg0 [0, 1, 0] : vector<f32>, vector<f32>
    return %0 : vector<3xf32>
  }
  func.func @shuffle1D(%arg0: vector<2xf32>, %arg1: vector<4xf32>) -> vector<2xf32> {
    %0 = vector.shuffle %arg0, %arg0 [0, 1, 2, 3] : vector<2xf32>, vector<2xf32>
    %1 = vector.shuffle %0, %arg1 [0, 1, 2] : vector<4xf32>, vector<4xf32>
    %2 = vector.shuffle %1, %arg1 [0, 6] : vector<3xf32>, vector<4xf32>
    return %2 : vector<2xf32>
  }
  func.func @shuffle2D(%arg0: vector<1x4xf32>, %arg1: vector<2x4xf32>) -> vector<3x4xf32> {
    %0 = vector.shuffle %arg0, %arg1 [0, 1, 2] : vector<1x4xf32>, vector<2x4xf32>
    return %0 : vector<3x4xf32>
  }
  func.func @shuffle_poison_mask(%arg0: vector<4xf32>, %arg1: vector<4xf32>) -> vector<4xf32> {
    %0 = vector.shuffle %arg0, %arg0 [1, -1, 6, -1] : vector<4xf32>, vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @extract_const_idx(%arg0: vector<4x8x16xf32>) -> (vector<4x8x16xf32>, vector<8x16xf32>, vector<16xf32>, f32) {
    %0 = vector.extract %arg0[] : vector<4x8x16xf32> from vector<4x8x16xf32>
    %1 = vector.extract %arg0[3] : vector<8x16xf32> from vector<4x8x16xf32>
    %2 = vector.extract %arg0[3, 3] : vector<16xf32> from vector<4x8x16xf32>
    %3 = vector.extract %arg0[3, 3, 3] : f32 from vector<4x8x16xf32>
    return %0, %1, %2, %3 : vector<4x8x16xf32>, vector<8x16xf32>, vector<16xf32>, f32
  }
  func.func @extract_val_idx(%arg0: vector<4x8x16xf32>, %arg1: index) -> (vector<8x16xf32>, vector<16xf32>, f32) {
    %0 = vector.extract %arg0[%arg1] : vector<8x16xf32> from vector<4x8x16xf32>
    %1 = vector.extract %arg0[%arg1, %arg1] : vector<16xf32> from vector<4x8x16xf32>
    %2 = vector.extract %arg0[%arg1, 5, %arg1] : f32 from vector<4x8x16xf32>
    return %0, %1, %2 : vector<8x16xf32>, vector<16xf32>, f32
  }
  func.func @extract_0d(%arg0: vector<f32>) -> f32 {
    %0 = vector.extract %arg0[] : f32 from vector<f32>
    return %0 : f32
  }
  func.func @extract_poison_idx(%arg0: vector<4x5xf32>) -> f32 {
    %0 = vector.extract %arg0[-1, 0] : f32 from vector<4x5xf32>
    return %0 : f32
  }
  func.func @insert_const_idx(%arg0: f32, %arg1: vector<16xf32>, %arg2: vector<8x16xf32>, %arg3: vector<4x8x16xf32>) -> vector<4x8x16xf32> {
    %0 = vector.insert %arg2, %arg3 [3] : vector<8x16xf32> into vector<4x8x16xf32>
    %1 = vector.insert %arg1, %arg3 [3, 3] : vector<16xf32> into vector<4x8x16xf32>
    %2 = vector.insert %arg0, %arg3 [3, 3, 3] : f32 into vector<4x8x16xf32>
    %3 = vector.insert %2, %2 [] : vector<4x8x16xf32> into vector<4x8x16xf32>
    return %3 : vector<4x8x16xf32>
  }
  func.func @insert_val_idx(%arg0: f32, %arg1: vector<16xf32>, %arg2: vector<8x16xf32>, %arg3: index, %arg4: vector<4x8x16xf32>) -> vector<4x8x16xf32> {
    %0 = vector.insert %arg2, %arg4 [%arg3] : vector<8x16xf32> into vector<4x8x16xf32>
    %1 = vector.insert %arg1, %arg4 [%arg3, %arg3] : vector<16xf32> into vector<4x8x16xf32>
    %2 = vector.insert %arg0, %arg4 [%arg3, 5, %arg3] : f32 into vector<4x8x16xf32>
    return %2 : vector<4x8x16xf32>
  }
  func.func @insert_0d(%arg0: f32, %arg1: vector<f32>) -> vector<f32> {
    %0 = vector.insert %arg0, %arg1 [] : f32 into vector<f32>
    return %0 : vector<f32>
  }
  func.func @insert_poison_idx(%arg0: vector<4x5xf32>, %arg1: f32) {
    %0 = vector.insert %arg1, %arg0 [-1, 0] : f32 into vector<4x5xf32>
    return
  }
  func.func @outerproduct(%arg0: vector<4xf32>, %arg1: vector<8xf32>, %arg2: vector<4x8xf32>) -> vector<4x8xf32> {
    %0 = vector.outerproduct %arg0, %arg1 : vector<4xf32>, vector<8xf32>
    %1 = vector.outerproduct %arg0, %arg1, %arg2 {kind = #vector.kind<add>} : vector<4xf32>, vector<8xf32>
    return %1 : vector<4x8xf32>
  }
  func.func @outerproduct_scalable(%arg0: vector<[4]xf32>, %arg1: vector<[8]xf32>) {
    %0 = vector.outerproduct %arg0, %arg1 : vector<[4]xf32>, vector<[8]xf32>
    %cst = arith.constant 1.000000e+00 : f32
    %1 = vector.outerproduct %arg0, %cst : vector<[4]xf32>, f32
    return
  }
  func.func @insert_strided_slice(%arg0: vector<4x4xf32>, %arg1: vector<4x8x16xf32>) {
    %0 = vector.insert_strided_slice %arg0, %arg1 {offsets = [2, 2, 2], strides = [1, 1]} : vector<4x4xf32> into vector<4x8x16xf32>
    return
  }
  func.func @insert_strided_slice_scalable(%arg0: vector<4x[16]xf32>, %arg1: vector<4x8x[16]xf32>) {
    %0 = vector.insert_strided_slice %arg0, %arg1 {offsets = [2, 2, 0], strides = [1, 1]} : vector<4x[16]xf32> into vector<4x8x[16]xf32>
    return
  }
  func.func @extract_strided_slice(%arg0: vector<4x8x16xf32>) -> vector<2x2x16xf32> {
    %0 = vector.extract_strided_slice %arg0 {offsets = [2, 2], sizes = [2, 2], strides = [1, 1]} : vector<4x8x16xf32> to vector<2x2x16xf32>
    return %0 : vector<2x2x16xf32>
  }
  func.func @extract_strided_slice_scalable(%arg0: vector<4x[8]x16xf32>) -> vector<2x[8]x16xf32> {
    %0 = vector.extract_strided_slice %arg0 {offsets = [2, 0], sizes = [2, 8], strides = [1, 1]} : vector<4x[8]x16xf32> to vector<2x[8]x16xf32>
    return %0 : vector<2x[8]x16xf32>
  }
  func.func @contraction_to_scalar(%arg0: vector<10xf32>, %arg1: vector<10xf32>) -> f32 {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.contract {indexing_maps = [#map3, #map3, #map4], iterator_types = ["reduction"], kind = #vector.kind<add>} %arg0, %arg1, %cst : vector<10xf32>, vector<10xf32> into f32
    return %0 : f32
  }
  func.func @contraction_to_scalar_scalable(%arg0: vector<[10]xf32>, %arg1: vector<[10]xf32>) -> f32 {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.contract {indexing_maps = [#map3, #map3, #map4], iterator_types = ["reduction"], kind = #vector.kind<add>} %arg0, %arg1, %cst : vector<[10]xf32>, vector<[10]xf32> into f32
    return %0 : f32
  }
  func.func @contraction_extra_attrs(%arg0: vector<10xf32>, %arg1: vector<10xf32>) -> f32 {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.contract {indexing_maps = [#map3, #map3, #map4], iterator_types = ["reduction"], kind = #vector.kind<add>} %arg0, %arg1, %cst {first_attr = 1 : i32, second_attr = "string"} : vector<10xf32>, vector<10xf32> into f32
    return %0 : f32
  }
  func.func @contraction_to_scalar_with_max(%arg0: vector<10xf32>, %arg1: vector<10xf32>) -> f32 {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.contract {indexing_maps = [#map3, #map3, #map4], iterator_types = ["reduction"], kind = #vector.kind<maxnumf>} %arg0, %arg1, %cst : vector<10xf32>, vector<10xf32> into f32
    return %0 : f32
  }
  func.func @contraction(%arg0: vector<7x8x16x15xf32>, %arg1: vector<8x16x7x5xf32>, %arg2: vector<8x15x5xf32>, %arg3: vector<8x8x15x5xf32>, %arg4: vector<7x8x16x15xf16>, %arg5: vector<8x16x7x5xf16>) {
    %0 = vector.contract {indexing_maps = [#map5, #map6, #map7], iterator_types = ["parallel", "parallel", "parallel", "reduction", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<7x8x16x15xf32>, vector<8x16x7x5xf32> into vector<8x15x5xf32>
    %1 = vector.contract {indexing_maps = [#map8, #map9, #map10], iterator_types = ["parallel", "parallel", "parallel", "parallel", "reduction", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg3 : vector<7x8x16x15xf32>, vector<8x16x7x5xf32> into vector<8x8x15x5xf32>
    %2 = vector.contract {indexing_maps = [#map8, #map9, #map10], iterator_types = ["parallel", "parallel", "parallel", "parallel", "reduction", "reduction"], kind = #vector.kind<add>} %arg4, %arg5, %arg3 : vector<7x8x16x15xf16>, vector<8x16x7x5xf16> into vector<8x8x15x5xf32>
    %3 = vector.contract {indexing_maps = [#map8, #map9, #map10], iterator_types = ["parallel", "parallel", "parallel", "parallel", "reduction", "reduction"], kind = #vector.kind<maxnumf>} %arg0, %arg1, %arg3 : vector<7x8x16x15xf32>, vector<8x16x7x5xf32> into vector<8x8x15x5xf32>
    return
  }
  func.func @contraction_matmul_scalable(%arg0: vector<8x1xf32>, %arg1: vector<1x[32]xf32>, %arg2: vector<8x[32]xf32>) -> vector<8x[32]xf32> {
    %0 = vector.contract {indexing_maps = [#map11, #map12, #map13], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<8x1xf32>, vector<1x[32]xf32> into vector<8x[32]xf32>
    return %0 : vector<8x[32]xf32>
  }
  func.func @create_vector_mask() {
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %0 = vector.create_mask %c3, %c2 : vector<4x3xi1>
    return
  }
  func.func @constant_vector_mask_0d() {
    %0 = vector.constant_mask [0] : vector<i1>
    %1 = vector.constant_mask [1] : vector<i1>
    return
  }
  func.func @constant_vector_mask() {
    %0 = vector.constant_mask [3, 2] : vector<4x3xi1>
    %1 = vector.constant_mask [0] : vector<[4]xi1>
    %2 = vector.constant_mask [4] : vector<[4]xi1>
    %3 = vector.constant_mask [1, 4] : vector<2x[4]xi1>
    return
  }
  func.func @vector_print_on_vector(%arg0: vector<8x4xf32>) {
    vector.print %arg0 : vector<8x4xf32>
    return
  }
  func.func @vector_print_on_scalar(%arg0: i64) {
    vector.print %arg0 : i64
    return
  }
  func.func @shape_cast(%arg0: vector<5x1x3x2xf32>, %arg1: vector<8x1xf32>, %arg2: vector<16x1x1xf32>) -> (vector<15x2xf32>, vector<8xf32>, vector<16xf32>, vector<16x1xf32>) {
    %0 = vector.shape_cast %arg0 : vector<5x1x3x2xf32> to vector<15x2xf32>
    %1 = vector.shape_cast %arg1 : vector<8x1xf32> to vector<8xf32>
    %2 = vector.shape_cast %arg2 : vector<16x1x1xf32> to vector<16xf32>
    %3 = vector.shape_cast %arg2 : vector<16x1x1xf32> to vector<16x1xf32>
    return %0, %1, %2, %3 : vector<15x2xf32>, vector<8xf32>, vector<16xf32>, vector<16x1xf32>
  }
  func.func @shape_cast_general_reshape(%arg0: vector<2x3xf32>) -> vector<3x1x2xf32> {
    %0 = vector.shape_cast %arg0 : vector<2x3xf32> to vector<3x1x2xf32>
    return %0 : vector<3x1x2xf32>
  }
  func.func @shape_cast_0d(%arg0: vector<1x1x1x1xf32>) -> vector<1x1x1x1xf32> {
    %0 = vector.shape_cast %arg0 : vector<1x1x1x1xf32> to vector<f32>
    %1 = vector.shape_cast %0 : vector<f32> to vector<1x1x1x1xf32>
    return %1 : vector<1x1x1x1xf32>
  }
  func.func @bitcast(%arg0: vector<5x1x3x2xf32>, %arg1: vector<8x1xi32>, %arg2: vector<16x1x8xi8>, %arg3: vector<8x2x1xindex>, %arg4: vector<f32>) -> (vector<5x1x3x4xf16>, vector<5x1x3x8xi8>, vector<8x4xi8>, vector<8x1xf32>, vector<16x1x2xi32>, vector<16x1x4xi16>, vector<16x1x1xindex>, vector<8x2x2xf32>, vector<i32>) {
    %0 = vector.bitcast %arg0 : vector<5x1x3x2xf32> to vector<5x1x3x4xf16>
    %1 = vector.bitcast %arg0 : vector<5x1x3x2xf32> to vector<5x1x3x8xi8>
    %2 = vector.bitcast %arg1 : vector<8x1xi32> to vector<8x4xi8>
    %3 = vector.bitcast %arg1 : vector<8x1xi32> to vector<8x1xf32>
    %4 = vector.bitcast %arg2 : vector<16x1x8xi8> to vector<16x1x2xi32>
    %5 = vector.bitcast %arg2 : vector<16x1x8xi8> to vector<16x1x4xi16>
    %6 = vector.bitcast %arg2 : vector<16x1x8xi8> to vector<16x1x1xindex>
    %7 = vector.bitcast %arg3 : vector<8x2x1xindex> to vector<8x2x2xf32>
    %8 = vector.bitcast %arg4 : vector<f32> to vector<i32>
    return %0, %1, %2, %3, %4, %5, %6, %7, %8 : vector<5x1x3x4xf16>, vector<5x1x3x8xi8>, vector<8x4xi8>, vector<8x1xf32>, vector<16x1x2xi32>, vector<16x1x4xi16>, vector<16x1x1xindex>, vector<8x2x2xf32>, vector<i32>
  }
  func.func @vector_fma(%arg0: vector<8xf32>, %arg1: vector<8x4xf32>, %arg2: vector<f32>) {
    %0 = vector.fma %arg0, %arg0, %arg0 : vector<8xf32>
    %1 = vector.fma %arg1, %arg1, %arg1 : vector<8x4xf32>
    %2 = vector.fma %arg2, %arg2, %arg2 : vector<f32>
    return
  }
  func.func @reduce_fp(%arg0: vector<16xf32>, %arg1: f32) -> f32 {
    %0 = vector.reduction <add>, %arg0 : vector<16xf32> into f32
    %1 = vector.reduction <add>, %arg0, %arg1 : vector<16xf32> into f32
    %2 = vector.reduction <mul>, %arg0 : vector<16xf32> into f32
    %3 = vector.reduction <mul>, %arg0, %arg1 : vector<16xf32> into f32
    %4 = vector.reduction <minnumf>, %arg0 : vector<16xf32> into f32
    %5 = vector.reduction <maxnumf>, %arg0 : vector<16xf32> into f32
    %6 = vector.reduction <minimumf>, %arg0 : vector<16xf32> into f32
    %7 = vector.reduction <maximumf>, %arg0 : vector<16xf32> into f32
    return %5 : f32
  }
  func.func @reduce_int(%arg0: vector<16xi32>) -> i32 {
    %0 = vector.reduction <add>, %arg0 : vector<16xi32> into i32
    %1 = vector.reduction <mul>, %arg0 : vector<16xi32> into i32
    %2 = vector.reduction <minui>, %arg0 : vector<16xi32> into i32
    %3 = vector.reduction <minsi>, %arg0 : vector<16xi32> into i32
    %4 = vector.reduction <maxui>, %arg0 : vector<16xi32> into i32
    %5 = vector.reduction <maxsi>, %arg0 : vector<16xi32> into i32
    %6 = vector.reduction <and>, %arg0 : vector<16xi32> into i32
    %7 = vector.reduction <or>, %arg0 : vector<16xi32> into i32
    %8 = vector.reduction <xor>, %arg0 : vector<16xi32> into i32
    return %8 : i32
  }
  func.func @reduce_int_0d(%arg0: vector<i32>) -> i32 {
    %0 = vector.reduction <add>, %arg0 : vector<i32> into i32
    %1 = vector.reduction <mul>, %arg0 : vector<i32> into i32
    %2 = vector.reduction <minui>, %arg0 : vector<i32> into i32
    %3 = vector.reduction <minsi>, %arg0 : vector<i32> into i32
    %4 = vector.reduction <maxui>, %arg0 : vector<i32> into i32
    %5 = vector.reduction <maxsi>, %arg0 : vector<i32> into i32
    %6 = vector.reduction <and>, %arg0 : vector<i32> into i32
    %7 = vector.reduction <or>, %arg0 : vector<i32> into i32
    %8 = vector.reduction <xor>, %arg0 : vector<i32> into i32
    return %8 : i32
  }
  func.func @transpose_fp(%arg0: vector<3x7xf32>) -> vector<7x3xf32> {
    %0 = vector.transpose %arg0, [1, 0] : vector<3x7xf32> to vector<7x3xf32>
    return %0 : vector<7x3xf32>
  }
  func.func @transpose_int(%arg0: vector<11x7x3x2xi32>) -> vector<2x11x7x3xi32> {
    %0 = vector.transpose %arg0, [3, 0, 1, 2] : vector<11x7x3x2xi32> to vector<2x11x7x3xi32>
    return %0 : vector<2x11x7x3xi32>
  }
  func.func @transpose_fp_0d(%arg0: vector<f32>) -> vector<f32> {
    %0 = vector.transpose %arg0, [] : vector<f32> to vector<f32>
    return %0 : vector<f32>
  }
  func.func @transpose_int_0d(%arg0: vector<i32>) -> vector<i32> {
    %0 = vector.transpose %arg0, [] : vector<i32> to vector<i32>
    return %0 : vector<i32>
  }
  func.func @vector_load_and_store_0d_scalar_memref(%arg0: memref<200x100xf32>, %arg1: index, %arg2: index) {
    %0 = vector.load %arg0[%arg1, %arg2] : memref<200x100xf32>, vector<f32>
    vector.store %0, %arg0[%arg1, %arg2] : memref<200x100xf32>, vector<f32>
    return
  }
  func.func @vector_load_and_store_0d_scalar_strided_memref(%arg0: memref<200x100xf32, strided<[?, ?], offset: ?>>, %arg1: index, %arg2: index) {
    %0 = vector.load %arg0[%arg1, %arg2] : memref<200x100xf32, strided<[?, ?], offset: ?>>, vector<f32>
    vector.store %0, %arg0[%arg1, %arg2] : memref<200x100xf32, strided<[?, ?], offset: ?>>, vector<f32>
    return
  }
  func.func @vector_load_and_store_unit_vec_strided_memref(%arg0: memref<200x100xf32, strided<[?, ?], offset: ?>>, %arg1: index, %arg2: index) {
    %0 = vector.load %arg0[%arg1, %arg2] : memref<200x100xf32, strided<[?, ?], offset: ?>>, vector<1xf32>
    vector.store %0, %arg0[%arg1, %arg2] : memref<200x100xf32, strided<[?, ?], offset: ?>>, vector<1xf32>
    return
  }
  func.func @vector_load_and_store_1d_scalar_memref(%arg0: memref<200x100xf32>, %arg1: index, %arg2: index) {
    %0 = vector.load %arg0[%arg1, %arg2] : memref<200x100xf32>, vector<8xf32>
    vector.store %0, %arg0[%arg1, %arg2] : memref<200x100xf32>, vector<8xf32>
    return
  }
  func.func @vector_load_and_store_1d_vector_memref(%arg0: memref<200x100xvector<8xf32>>, %arg1: index, %arg2: index) {
    %0 = vector.load %arg0[%arg1, %arg2] : memref<200x100xvector<8xf32>>, vector<8xf32>
    vector.store %0, %arg0[%arg1, %arg2] : memref<200x100xvector<8xf32>>, vector<8xf32>
    return
  }
  func.func @vector_load_and_store_scalable_vector_memref(%arg0: vector<[4]xi32>, %arg1: memref<?xi32>) -> vector<[4]xi32> {
    %c0 = arith.constant 0 : index
    %0 = vector.load %arg1[%c0] : memref<?xi32>, vector<[4]xi32>
    vector.store %arg0, %arg1[%c0] : memref<?xi32>, vector<[4]xi32>
    return %0 : vector<[4]xi32>
  }
  func.func @vector_load_and_store_1d_scalable_vector_memref(%arg0: memref<200x100xvector<8xf32>>, %arg1: index, %arg2: index) {
    %0 = vector.load %arg0[%arg1, %arg2] : memref<200x100xvector<8xf32>>, vector<8xf32>
    vector.store %0, %arg0[%arg1, %arg2] : memref<200x100xvector<8xf32>>, vector<8xf32>
    return
  }
  func.func @vector_load_and_store_out_of_bounds(%arg0: memref<7xf32>) {
    %c0 = arith.constant 0 : index
    %0 = vector.load %arg0[%c0] : memref<7xf32>, vector<8xf32>
    vector.store %0, %arg0[%c0] : memref<7xf32>, vector<8xf32>
    return
  }
  func.func @vector_load_and_store_2d_scalar_memref(%arg0: memref<200x100xf32>, %arg1: index, %arg2: index) {
    %0 = vector.load %arg0[%arg1, %arg2] : memref<200x100xf32>, vector<4x8xf32>
    vector.store %0, %arg0[%arg1, %arg2] : memref<200x100xf32>, vector<4x8xf32>
    return
  }
  func.func @vector_load_and_store_2d_vector_memref(%arg0: memref<200x100xvector<4x8xf32>>, %arg1: index, %arg2: index) {
    %0 = vector.load %arg0[%arg1, %arg2] : memref<200x100xvector<4x8xf32>>, vector<4x8xf32>
    vector.store %0, %arg0[%arg1, %arg2] : memref<200x100xvector<4x8xf32>>, vector<4x8xf32>
    return
  }
  func.func @load_store_alignment(%arg0: memref<4xi32>) {
    %c0 = arith.constant 0 : index
    %0 = vector.load %arg0[%c0] {alignment = 16 : i64} : memref<4xi32>, vector<4xi32>
    vector.store %0, %arg0[%c0] {alignment = 16 : i64} : memref<4xi32>, vector<4xi32>
    return
  }
  func.func @masked_load_and_store(%arg0: memref<?xf32>, %arg1: vector<16xi1>, %arg2: vector<16xf32>) {
    %c0 = arith.constant 0 : index
    %0 = vector.maskedload %arg0[%c0], %arg1, %arg2 : memref<?xf32>, vector<16xi1>, vector<16xf32> into vector<16xf32>
    vector.maskedstore %arg0[%c0], %arg1, %0 : memref<?xf32>, vector<16xi1>, vector<16xf32>
    return
  }
  func.func @masked_load_and_store2d(%arg0: memref<?x?xf32>, %arg1: vector<16xi1>, %arg2: vector<16xf32>) {
    %c0 = arith.constant 0 : index
    %0 = vector.maskedload %arg0[%c0, %c0], %arg1, %arg2 : memref<?x?xf32>, vector<16xi1>, vector<16xf32> into vector<16xf32>
    vector.maskedstore %arg0[%c0, %c0], %arg1, %0 : memref<?x?xf32>, vector<16xi1>, vector<16xf32>
    return
  }
  func.func @gather_and_scatter(%arg0: memref<?xf32>, %arg1: vector<16xi32>, %arg2: vector<16xi1>, %arg3: vector<16xf32>) {
    %c0 = arith.constant 0 : index
    %0 = vector.gather %arg0[%c0] [%arg1], %arg2, %arg3 : memref<?xf32>, vector<16xi32>, vector<16xi1>, vector<16xf32> into vector<16xf32>
    vector.scatter %arg0[%c0] [%arg1], %arg2, %0 : memref<?xf32>, vector<16xi32>, vector<16xi1>, vector<16xf32>
    return
  }
  func.func @gather_and_scatter2d(%arg0: memref<?x?xf32>, %arg1: vector<16xi32>, %arg2: vector<16xi1>, %arg3: vector<16xf32>) {
    %c0 = arith.constant 0 : index
    %0 = vector.gather %arg0[%c0, %c0] [%arg1], %arg2, %arg3 : memref<?x?xf32>, vector<16xi32>, vector<16xi1>, vector<16xf32> into vector<16xf32>
    vector.scatter %arg0[%c0, %c0] [%arg1], %arg2, %0 : memref<?x?xf32>, vector<16xi32>, vector<16xi1>, vector<16xf32>
    return
  }
  func.func @gather_and_scatter_multi_dims(%arg0: memref<?xf32>, %arg1: vector<2x16xi32>, %arg2: vector<2x16xi1>, %arg3: vector<2x16xf32>) -> vector<2x16xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.gather %arg0[%c0] [%arg1], %arg2, %arg3 : memref<?xf32>, vector<2x16xi32>, vector<2x16xi1>, vector<2x16xf32> into vector<2x16xf32>
    vector.scatter %arg0[%c0] [%arg1], %arg2, %0 : memref<?xf32>, vector<2x16xi32>, vector<2x16xi1>, vector<2x16xf32>
    return %0 : vector<2x16xf32>
  }
  func.func @gather_on_tensor(%arg0: tensor<?xf32>, %arg1: vector<16xi32>, %arg2: vector<16xi1>, %arg3: vector<16xf32>) -> vector<16xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.gather %arg0[%c0] [%arg1], %arg2, %arg3 : tensor<?xf32>, vector<16xi32>, vector<16xi1>, vector<16xf32> into vector<16xf32>
    return %0 : vector<16xf32>
  }
  func.func @expand_and_compress(%arg0: memref<?xf32>, %arg1: vector<16xi1>, %arg2: vector<16xf32>) {
    %c0 = arith.constant 0 : index
    %0 = vector.expandload %arg0[%c0], %arg1, %arg2 : memref<?xf32>, vector<16xi1>, vector<16xf32> into vector<16xf32>
    vector.compressstore %arg0[%c0], %arg1, %0 : memref<?xf32>, vector<16xi1>, vector<16xf32>
    return
  }
  func.func @expand_and_compress2d(%arg0: memref<?x?xf32>, %arg1: vector<16xi1>, %arg2: vector<16xf32>) {
    %c0 = arith.constant 0 : index
    %0 = vector.expandload %arg0[%c0, %c0], %arg1, %arg2 : memref<?x?xf32>, vector<16xi1>, vector<16xf32> into vector<16xf32>
    vector.compressstore %arg0[%c0, %c0], %arg1, %0 : memref<?x?xf32>, vector<16xi1>, vector<16xf32>
    return
  }
  func.func @multi_reduction(%arg0: vector<4x8x16x32xf32>, %arg1: vector<4x16xf32>, %arg2: f32) -> f32 {
    %0 = vector.multi_reduction <add>, %arg0, %arg1 [1, 3] : vector<4x8x16x32xf32> to vector<4x16xf32>
    %1 = vector.multi_reduction <add>, %0, %arg2 [0, 1] : vector<4x16xf32> to f32
    return %1 : f32
  }
  func.func @get_vector_scale() -> index {
    %vscale = vector.vscale
    return %vscale : index
  }
  func.func @vector_scan(%arg0: vector<4x8x16x32xf32>) -> vector<4x8x16x32xf32> {
    %cst = arith.constant dense<0.000000e+00> : vector<4x16x32xf32>
    %dest, %accumulated_value = vector.scan <add>, %arg0, %cst {inclusive = true, reduction_dim = 1 : i64} : vector<4x8x16x32xf32>, vector<4x16x32xf32>
    return %dest : vector<4x8x16x32xf32>
  }
  func.func @vector_mask(%arg0: vector<8xi32>, %arg1: vector<8xi1>) -> i32 {
    %0 = vector.mask %arg1 { vector.reduction <add>, %arg0 : vector<8xi32> into i32 } : vector<8xi1> -> i32
    return %0 : i32
  }
  func.func @vector_mask_passthru(%arg0: tensor<?xf32>, %arg1: index, %arg2: vector<16xi1>, %arg3: vector<16xf32>) -> vector<16xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.mask %arg2, %arg3 { vector.transfer_read %arg0[%arg1], %cst : tensor<?xf32>, vector<16xf32> } : vector<16xi1> -> vector<16xf32>
    return %0 : vector<16xf32>
  }
  func.func @vector_mask_no_return(%arg0: vector<16xf32>, %arg1: memref<?xf32>, %arg2: index, %arg3: vector<16xi1>) {
    vector.mask %arg3 { vector.transfer_write %arg0, %arg1[%arg2] : vector<16xf32>, memref<?xf32> } : vector<16xi1>
    return
  }
  func.func @vector_mask_tensor_return(%arg0: vector<16xf32>, %arg1: tensor<?xf32>, %arg2: index, %arg3: vector<16xi1>) {
    %0 = vector.mask %arg3 { vector.transfer_write %arg0, %arg1[%arg2] : vector<16xf32>, tensor<?xf32> } : vector<16xi1> -> tensor<?xf32>
    return
  }
  func.func @vector_mask_empty(%arg0: vector<16xi1>) {
    vector.mask %arg0 { vector.yield } : vector<16xi1>
    return
  }
  func.func @vector_mask_empty_with_yield(%arg0: vector<16xi1>) {
    vector.mask %arg0 { vector.yield } : vector<16xi1>
    return
  }
  func.func @vector_mask_empty_return(%arg0: vector<16xi1>, %arg1: vector<16xf32>) -> vector<16xf32> {
    %0 = vector.mask %arg0 { vector.yield %arg1 : vector<16xf32> } : vector<16xi1> -> vector<16xf32>
    return %0 : vector<16xf32>
  }
  func.func @vector_mask_scalar_broadcast_transfer(%arg0: tensor<2x4xi32>, %arg1: index, %arg2: index, %arg3: vector<1xi1>) -> vector<1x1x4xi32> {
    %c0_i32 = arith.constant 0 : i32
    %0 = vector.mask %arg3 { vector.transfer_read %arg0[%arg1, %arg2], %c0_i32 {permutation_map = #map14} : tensor<2x4xi32>, vector<1x1x4xi32> } : vector<1xi1> -> vector<1x1x4xi32>
    return %0 : vector<1x1x4xi32>
  }
  func.func @vector_scalable_insert(%arg0: vector<4xi32>, %arg1: vector<8xi32>, %arg2: vector<[4]xi32>, %arg3: vector<[8]xi32>) {
    %0 = vector.scalable.insert %arg0, %arg3[12] : vector<4xi32> into vector<[8]xi32>
    %1 = vector.scalable.insert %arg1, %arg3[0] : vector<8xi32> into vector<[8]xi32>
    %2 = vector.scalable.insert %arg2, %arg3[0] : vector<[4]xi32> into vector<[8]xi32>
    return
  }
  func.func @vector_scalable_extract(%arg0: vector<[8]xi32>) {
    %0 = vector.scalable.extract %arg0[0] : vector<16xi32> from vector<[8]xi32>
    %1 = vector.scalable.extract %arg0[0] : vector<[4]xi32> from vector<[8]xi32>
    %2 = vector.scalable.extract %arg0[4] : vector<4xi32> from vector<[8]xi32>
    return
  }
  func.func @contraction_masked_scalable(%arg0: vector<3x4xf32>, %arg1: vector<4x[8]xf32>, %arg2: vector<3x[8]xf32>, %arg3: vector<3x[8]x4xi1>) -> vector<3x[8]xf32> {
    %0 = vector.mask %arg3 { vector.contract {indexing_maps = [#map11, #map12, #map13], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<3x4xf32>, vector<4x[8]xf32> into vector<3x[8]xf32> } : vector<3x[8]x4xi1> -> vector<3x[8]xf32>
    return %0 : vector<3x[8]xf32>
  }
  func.func @fastmath(%arg0: vector<42xf32>) -> f32 {
    %0 = vector.reduction <minnumf>, %arg0 fastmath<reassoc,nnan,ninf> : vector<42xf32> into f32
    return %0 : f32
  }
  func.func @interleave_0d(%arg0: vector<f32>, %arg1: vector<f32>) -> vector<2xf32> {
    %0 = vector.interleave %arg0, %arg1 : vector<f32> -> vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @interleave_1d(%arg0: vector<4xf32>, %arg1: vector<4xf32>) -> vector<8xf32> {
    %0 = vector.interleave %arg0, %arg1 : vector<4xf32> -> vector<8xf32>
    return %0 : vector<8xf32>
  }
  func.func @interleave_1d_scalable(%arg0: vector<[8]xi16>, %arg1: vector<[8]xi16>) -> vector<[16]xi16> {
    %0 = vector.interleave %arg0, %arg1 : vector<[8]xi16> -> vector<[16]xi16>
    return %0 : vector<[16]xi16>
  }
  func.func @interleave_2d(%arg0: vector<2x8xf32>, %arg1: vector<2x8xf32>) -> vector<2x16xf32> {
    %0 = vector.interleave %arg0, %arg1 : vector<2x8xf32> -> vector<2x16xf32>
    return %0 : vector<2x16xf32>
  }
  func.func @interleave_2d_scalable(%arg0: vector<2x[2]xf64>, %arg1: vector<2x[2]xf64>) -> vector<2x[4]xf64> {
    %0 = vector.interleave %arg0, %arg1 : vector<2x[2]xf64> -> vector<2x[4]xf64>
    return %0 : vector<2x[4]xf64>
  }
  func.func @deinterleave_1d(%arg0: vector<4xf32>) -> (vector<2xf32>, vector<2xf32>) {
    %res1, %res2 = vector.deinterleave %arg0 : vector<4xf32> -> vector<2xf32>
    return %res1, %res2 : vector<2xf32>, vector<2xf32>
  }
  func.func @deinterleave_1d_scalable(%arg0: vector<[4]xf32>) -> (vector<[2]xf32>, vector<[2]xf32>) {
    %res1, %res2 = vector.deinterleave %arg0 : vector<[4]xf32> -> vector<[2]xf32>
    return %res1, %res2 : vector<[2]xf32>, vector<[2]xf32>
  }
  func.func @deinterleave_2d(%arg0: vector<3x4xf32>) -> (vector<3x2xf32>, vector<3x2xf32>) {
    %res1, %res2 = vector.deinterleave %arg0 : vector<3x4xf32> -> vector<3x2xf32>
    return %res1, %res2 : vector<3x2xf32>, vector<3x2xf32>
  }
  func.func @deinterleave_2d_scalable(%arg0: vector<3x[4]xf32>) -> (vector<3x[2]xf32>, vector<3x[2]xf32>) {
    %res1, %res2 = vector.deinterleave %arg0 : vector<3x[4]xf32> -> vector<3x[2]xf32>
    return %res1, %res2 : vector<3x[2]xf32>, vector<3x[2]xf32>
  }
  func.func @deinterleave_nd(%arg0: vector<2x3x4x6xf32>) -> (vector<2x3x4x3xf32>, vector<2x3x4x3xf32>) {
    %res1, %res2 = vector.deinterleave %arg0 : vector<2x3x4x6xf32> -> vector<2x3x4x3xf32>
    return %res1, %res2 : vector<2x3x4x3xf32>, vector<2x3x4x3xf32>
  }
  func.func @deinterleave_nd_scalable(%arg0: vector<2x3x4x[6]xf32>) -> (vector<2x3x4x[3]xf32>, vector<2x3x4x[3]xf32>) {
    %res1, %res2 = vector.deinterleave %arg0 : vector<2x3x4x[6]xf32> -> vector<2x3x4x[3]xf32>
    return %res1, %res2 : vector<2x3x4x[3]xf32>, vector<2x3x4x[3]xf32>
  }
  func.func @to_elements(%arg0: vector<f32>, %arg1: vector<1xf32>, %arg2: vector<1x2xf32>, %arg3: vector<2x2xf32>) -> (f32, f32, f32, f32, f32, f32, f32, f32) {
    %0 = vector.to_elements %arg0 : vector<f32>
    %1 = vector.to_elements %arg1 : vector<1xf32>
    %2:2 = vector.to_elements %arg2 : vector<1x2xf32>
    %3:4 = vector.to_elements %arg3 : vector<2x2xf32>
    return %0, %1, %2#0, %2#1, %3#0, %3#1, %3#2, %3#3 : f32, f32, f32, f32, f32, f32, f32, f32
  }
  func.func @from_elements(%arg0: f32, %arg1: f32) -> (vector<f32>, vector<1xf32>, vector<1x2xf32>, vector<2x2xf32>) {
    %0 = vector.from_elements %arg0 : vector<f32>
    %1 = vector.from_elements %arg0 : vector<1xf32>
    %2 = vector.from_elements %arg0, %arg1 : vector<1x2xf32>
    %3 = vector.from_elements %arg1, %arg1, %arg0, %arg0 : vector<2x2xf32>
    return %0, %1, %2, %3 : vector<f32>, vector<1xf32>, vector<1x2xf32>, vector<2x2xf32>
  }
  func.func @step() {
    %0 = vector.step : vector<2xindex>
    %1 = vector.step : vector<[4]xindex>
    return
  }
  func.func @scatter_tensor(%arg0: tensor<16x16xf32>, %arg1: vector<16xi32>, %arg2: vector<16xi1>, %arg3: vector<16xf32>) -> tensor<16x16xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.scatter %arg0[%c0, %c0] [%arg1], %arg2, %arg3 : tensor<16x16xf32>, vector<16xi32>, vector<16xi1>, vector<16xf32> -> tensor<16x16xf32>
    return %0 : tensor<16x16xf32>
  }
}

