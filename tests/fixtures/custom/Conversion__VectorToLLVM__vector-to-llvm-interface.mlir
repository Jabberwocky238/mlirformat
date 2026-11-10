module {
  func.func @bitcast_f32_to_i32_vector_0d(%arg0: vector<f32>) -> vector<i32> {
    %0 = vector.bitcast %arg0 : vector<f32> to vector<i32>
    return %0 : vector<i32>
  }
}

// -----
module {
  func.func @bitcast_f32_to_i32_vector(%arg0: vector<16xf32>) -> vector<16xi32> {
    %0 = vector.bitcast %arg0 : vector<16xf32> to vector<16xi32>
    return %0 : vector<16xi32>
  }
}

// -----
module {
  func.func @bitcast_f32_to_i32_vector_scalable(%arg0: vector<[16]xf32>) -> vector<[16]xi32> {
    %0 = vector.bitcast %arg0 : vector<[16]xf32> to vector<[16]xi32>
    return %0 : vector<[16]xi32>
  }
}

// -----
module {
  func.func @bitcast_i8_to_f32_vector(%arg0: vector<64xi8>) -> vector<16xf32> {
    %0 = vector.bitcast %arg0 : vector<64xi8> to vector<16xf32>
    return %0 : vector<16xf32>
  }
}

// -----
module {
  func.func @bitcast_i8_to_f32_vector_scalable(%arg0: vector<[64]xi8>) -> vector<[16]xf32> {
    %0 = vector.bitcast %arg0 : vector<[64]xi8> to vector<[16]xf32>
    return %0 : vector<[16]xf32>
  }
}

// -----
module {
  func.func @bitcast_index_to_i8_vector(%arg0: vector<16xindex>) -> vector<128xi8> {
    %0 = vector.bitcast %arg0 : vector<16xindex> to vector<128xi8>
    return %0 : vector<128xi8>
  }
}

// -----
module {
  func.func @bitcast_index_to_i8_vector_scalable(%arg0: vector<[16]xindex>) -> vector<[128]xi8> {
    %0 = vector.bitcast %arg0 : vector<[16]xindex> to vector<[128]xi8>
    return %0 : vector<[128]xi8>
  }
}

// -----
module {
  func.func @broadcast_vec0d_from_vec0d(%arg0: vector<f32>) -> vector<f32> {
    %0 = vector.broadcast %arg0 : vector<f32> to vector<f32>
    return %0 : vector<f32>
  }
}

// -----
module {
  func.func @broadcast_vec1d_from_vec1d(%arg0: vector<2xf32>) -> vector<2xf32> {
    %0 = vector.broadcast %arg0 : vector<2xf32> to vector<2xf32>
    return %0 : vector<2xf32>
  }
}

// -----
module {
  func.func @broadcast_vec1d_from_vec1d_scalable(%arg0: vector<[2]xf32>) -> vector<[2]xf32> {
    %0 = vector.broadcast %arg0 : vector<[2]xf32> to vector<[2]xf32>
    return %0 : vector<[2]xf32>
  }
}

// -----
module {
  func.func @broadcast_vec0d_from_scalar(%arg0: f32) -> vector<f32> {
    %0 = vector.broadcast %arg0 : f32 to vector<f32>
    return %0 : vector<f32>
  }
}

// -----
module {
  func.func @broadcast_vec1d_from_scalar(%arg0: vector<4xf32>, %arg1: f32) -> vector<4xf32> {
    %0 = vector.broadcast %arg1 : f32 to vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @broadcast_scalable_vec1d_from_scalar(%arg0: vector<[4]xf32>, %arg1: f32) -> vector<[4]xf32> {
    %0 = vector.broadcast %arg1 : f32 to vector<[4]xf32>
    return %0 : vector<[4]xf32>
  }
  func.func @shuffle_0D_direct(%arg0: vector<f32>) -> vector<3xf32> {
    %0 = vector.shuffle %arg0, %arg0 [0, 1, 0] : vector<f32>, vector<f32>
    return %0 : vector<3xf32>
  }
}

// -----
module {
  func.func @shuffle_1D_direct(%arg0: vector<2xf32>, %arg1: vector<2xf32>) -> vector<2xf32> {
    %0 = vector.shuffle %arg0, %arg1 [0, 1] : vector<2xf32>, vector<2xf32>
    return %0 : vector<2xf32>
  }
}

// -----
module {
  func.func @shuffle_1D_index_direct(%arg0: vector<2xindex>, %arg1: vector<2xindex>) -> vector<2xindex> {
    %0 = vector.shuffle %arg0, %arg1 [0, 1] : vector<2xindex>, vector<2xindex>
    return %0 : vector<2xindex>
  }
}

// -----
module {
  func.func @shuffle_poison_mask(%arg0: vector<2xf32>, %arg1: vector<2xf32>) -> vector<4xf32> {
    %0 = vector.shuffle %arg0, %arg1 [0, -1, 3, -1] : vector<2xf32>, vector<2xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @shuffle_1D(%arg0: vector<2xf32>, %arg1: vector<3xf32>) -> vector<5xf32> {
    %0 = vector.shuffle %arg0, %arg1 [4, 3, 2, 1, 0] : vector<2xf32>, vector<3xf32>
    return %0 : vector<5xf32>
  }
}

// -----
module {
  func.func @shuffle_2D(%arg0: vector<1x4xf32>, %arg1: vector<2x4xf32>) -> vector<3x4xf32> {
    %0 = vector.shuffle %arg0, %arg1 [1, 0, 2] : vector<1x4xf32>, vector<2x4xf32>
    return %0 : vector<3x4xf32>
  }
}

// -----
module {
  func.func @extract_scalar_from_vec_1d_f32(%arg0: vector<16xf32>) -> f32 {
    %0 = vector.extract %arg0[15] : f32 from vector<16xf32>
    return %0 : f32
  }
}

// -----
module {
  func.func @extract_scalar_from_vec_1d_f32_scalable(%arg0: vector<[16]xf32>) -> f32 {
    %0 = vector.extract %arg0[15] : f32 from vector<[16]xf32>
    return %0 : f32
  }
}

// -----
module {
  func.func @extract_vec_1e_from_vec_1d_f32_scalable(%arg0: vector<[16]xf32>) -> f32 {
    %0 = vector.extract %arg0[15] : f32 from vector<[16]xf32>
    return %0 : f32
  }
}

// -----
module {
  func.func @extract_scalar_from_vec_1d_index(%arg0: vector<16xindex>) -> index {
    %0 = vector.extract %arg0[15] : index from vector<16xindex>
    return %0 : index
  }
}

// -----
module {
  func.func @extract_scalar_from_vec_1d_index_scalable(%arg0: vector<[16]xindex>) -> index {
    %0 = vector.extract %arg0[15] : index from vector<[16]xindex>
    return %0 : index
  }
}

// -----
module {
  func.func @extract_vec_2d_from_vec_3d_f32(%arg0: vector<4x3x16xf32>) -> vector<3x16xf32> {
    %0 = vector.extract %arg0[0] : vector<3x16xf32> from vector<4x3x16xf32>
    return %0 : vector<3x16xf32>
  }
}

// -----
module {
  func.func @extract_vec_2d_from_vec_3d_f32_scalable(%arg0: vector<4x3x[16]xf32>) -> vector<3x[16]xf32> {
    %0 = vector.extract %arg0[0] : vector<3x[16]xf32> from vector<4x3x[16]xf32>
    return %0 : vector<3x[16]xf32>
  }
}

// -----
module {
  func.func @extract_vec_1d_from_vec_3d_f32(%arg0: vector<4x3x16xf32>) -> vector<16xf32> {
    %0 = vector.extract %arg0[0, 0] : vector<16xf32> from vector<4x3x16xf32>
    return %0 : vector<16xf32>
  }
}

// -----
module {
  func.func @extract_vec_1d_from_vec_3d_f32_scalable(%arg0: vector<4x3x[16]xf32>) -> vector<[16]xf32> {
    %0 = vector.extract %arg0[0, 0] : vector<[16]xf32> from vector<4x3x[16]xf32>
    return %0 : vector<[16]xf32>
  }
}

// -----
module {
  func.func @extract_scalar_from_vec_3d_f32(%arg0: vector<4x3x16xf32>) -> f32 {
    %0 = vector.extract %arg0[0, 0, 0] : f32 from vector<4x3x16xf32>
    return %0 : f32
  }
}

// -----
module {
  func.func @extract_scalar_from_vec_3d_f32_scalable(%arg0: vector<4x3x[16]xf32>) -> f32 {
    %0 = vector.extract %arg0[0, 0, 0] : f32 from vector<4x3x[16]xf32>
    return %0 : f32
  }
}

// -----
module {
  func.func @extract_scalar_from_vec_1d_f32_dynamic_idx(%arg0: vector<16xf32>, %arg1: index) -> f32 {
    %0 = vector.extract %arg0[%arg1] : f32 from vector<16xf32>
    return %0 : f32
  }
}

// -----
module {
  func.func @extract_scalar_from_vec_1d_f32_dynamic_idx_scalable(%arg0: vector<[16]xf32>, %arg1: index) -> f32 {
    %0 = vector.extract %arg0[%arg1] : f32 from vector<[16]xf32>
    return %0 : f32
  }
}

// -----
module {
  func.func @extract_scalar_from_vec_2d_f32_inner_dynamic_idx(%arg0: vector<1x16xf32>, %arg1: index) -> f32 {
    %0 = vector.extract %arg0[0, %arg1] : f32 from vector<1x16xf32>
    return %0 : f32
  }
  func.func @extract_scalar_from_vec_2d_f32_inner_dynamic_idx_scalable(%arg0: vector<1x[16]xf32>, %arg1: index) -> f32 {
    %0 = vector.extract %arg0[0, %arg1] : f32 from vector<1x[16]xf32>
    return %0 : f32
  }
}

// -----
module {
  func.func @extract_scalar_from_vec_2d_f32_outer_dynamic_idx(%arg0: vector<1x16xf32>, %arg1: index) -> f32 {
    %0 = vector.extract %arg0[%arg1, 0] : f32 from vector<1x16xf32>
    return %0 : f32
  }
  func.func @extract_scalar_from_vec_2d_f32_outer_dynamic_idx_scalable(%arg0: vector<1x[16]xf32>, %arg1: index) -> f32 {
    %0 = vector.extract %arg0[%arg1, 0] : f32 from vector<1x[16]xf32>
    return %0 : f32
  }
}

// -----
module {
  func.func @extract_scalar_from_vec_0d_index(%arg0: vector<index>) -> index {
    %0 = vector.extract %arg0[] : index from vector<index>
    return %0 : index
  }
}

// -----
module {
  func.func @extract_scalar_from_vec_2d_f32_dynamic_idxs_compile_time_const(%arg0: vector<32x1xf32>) -> f32 {
    %c0 = arith.constant 0 : index
    %0 = vector.extract %arg0[%c0, %c0] : f32 from vector<32x1xf32>
    return %0 : f32
  }
}

// -----
module {
  func.func @insert_scalar_into_vec_0d(%arg0: f32, %arg1: vector<f32>) -> vector<f32> {
    %0 = vector.insert %arg0, %arg1 [] : f32 into vector<f32>
    return %0 : vector<f32>
  }
}

// -----
module {
  func.func @insert_scalar_into_vec_1d_f32(%arg0: f32, %arg1: vector<4xf32>) -> vector<4xf32> {
    %0 = vector.insert %arg0, %arg1 [3] : f32 into vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @insert_scalar_into_vec_1d_f32_scalable(%arg0: f32, %arg1: vector<[4]xf32>) -> vector<[4]xf32> {
    %0 = vector.insert %arg0, %arg1 [3] : f32 into vector<[4]xf32>
    return %0 : vector<[4]xf32>
  }
}

// -----
module {
  func.func @insert_scalar_into_vec_1d_index(%arg0: index, %arg1: vector<4xindex>) -> vector<4xindex> {
    %0 = vector.insert %arg0, %arg1 [3] : index into vector<4xindex>
    return %0 : vector<4xindex>
  }
}

// -----
module {
  func.func @insert_scalar_into_vec_1d_index_scalable(%arg0: index, %arg1: vector<[4]xindex>) -> vector<[4]xindex> {
    %0 = vector.insert %arg0, %arg1 [3] : index into vector<[4]xindex>
    return %0 : vector<[4]xindex>
  }
}

// -----
module {
  func.func @insert_vec_2d_into_vec_3d_f32(%arg0: vector<8x16xf32>, %arg1: vector<4x8x16xf32>) -> vector<4x8x16xf32> {
    %0 = vector.insert %arg0, %arg1 [3] : vector<8x16xf32> into vector<4x8x16xf32>
    return %0 : vector<4x8x16xf32>
  }
}

// -----
module {
  func.func @insert_vec_2d_into_vec_3d_f32_scalable(%arg0: vector<8x[16]xf32>, %arg1: vector<4x8x[16]xf32>) -> vector<4x8x[16]xf32> {
    %0 = vector.insert %arg0, %arg1 [3] : vector<8x[16]xf32> into vector<4x8x[16]xf32>
    return %0 : vector<4x8x[16]xf32>
  }
}

// -----
module {
  func.func @insert_vec_1d_into_vec_3d_f32(%arg0: vector<16xf32>, %arg1: vector<4x8x16xf32>) -> vector<4x8x16xf32> {
    %0 = vector.insert %arg0, %arg1 [3, 7] : vector<16xf32> into vector<4x8x16xf32>
    return %0 : vector<4x8x16xf32>
  }
}

// -----
module {
  func.func @insert_vec_1d_into_vec_3d_f32_scalable(%arg0: vector<[16]xf32>, %arg1: vector<4x8x[16]xf32>) -> vector<4x8x[16]xf32> {
    %0 = vector.insert %arg0, %arg1 [3, 7] : vector<[16]xf32> into vector<4x8x[16]xf32>
    return %0 : vector<4x8x[16]xf32>
  }
}

// -----
module {
  func.func @insert_scalar_into_vec_3d_f32(%arg0: f32, %arg1: vector<4x8x16xf32>) -> vector<4x8x16xf32> {
    %0 = vector.insert %arg0, %arg1 [3, 7, 15] : f32 into vector<4x8x16xf32>
    return %0 : vector<4x8x16xf32>
  }
}

// -----
module {
  func.func @insert_scalar_into_vec_3d_f32_scalable(%arg0: f32, %arg1: vector<4x8x[16]xf32>) -> vector<4x8x[16]xf32> {
    %0 = vector.insert %arg0, %arg1 [3, 7, 15] : f32 into vector<4x8x[16]xf32>
    return %0 : vector<4x8x[16]xf32>
  }
}

// -----
module {
  func.func @insert_scalar_into_vec_1d_f32_dynamic_idx(%arg0: vector<16xf32>, %arg1: f32, %arg2: index) -> vector<16xf32> {
    %0 = vector.insert %arg1, %arg0 [%arg2] : f32 into vector<16xf32>
    return %0 : vector<16xf32>
  }
}

// -----
module {
  func.func @insert_scalar_into_vec_1d_f32_dynamic_idx_scalable(%arg0: vector<[16]xf32>, %arg1: f32, %arg2: index) -> vector<[16]xf32> {
    %0 = vector.insert %arg1, %arg0 [%arg2] : f32 into vector<[16]xf32>
    return %0 : vector<[16]xf32>
  }
}

// -----
module {
  func.func @insert_scalar_into_vec_2d_f32_dynamic_idx(%arg0: vector<1x16xf32>, %arg1: f32, %arg2: index) -> vector<1x16xf32> {
    %0 = vector.insert %arg1, %arg0 [0, %arg2] : f32 into vector<1x16xf32>
    return %0 : vector<1x16xf32>
  }
}

// -----
module {
  func.func @insert_scalar_into_vec_2d_f32_dynamic_idx_scalable(%arg0: vector<1x[16]xf32>, %arg1: f32, %arg2: index) -> vector<1x[16]xf32> {
    %0 = vector.insert %arg1, %arg0 [0, %arg2] : f32 into vector<1x[16]xf32>
    return %0 : vector<1x[16]xf32>
  }
}

// -----
module {
  func.func @insert_scalar_into_vec_2d_f32_dynamic_idx_fail(%arg0: vector<2x16xf32>, %arg1: f32, %arg2: index) -> vector<2x16xf32> {
    %0 = vector.insert %arg1, %arg0 [%arg2, 0] : f32 into vector<2x16xf32>
    return %0 : vector<2x16xf32>
  }
}

// -----
module {
  func.func @insert_vec_1d_into_vec_2d_dynamic_idx_fail(%arg0: vector<4xi1>, %arg1: vector<2x4xi1>, %arg2: index) -> vector<2x4xi1> {
    %0 = vector.insert %arg0, %arg1 [%arg2] : vector<4xi1> into vector<2x4xi1>
    return %0 : vector<2x4xi1>
  }
}

// -----
module {
  func.func @insert_scalar_from_vec_2d_f32_dynamic_idxs_compile_time_const(%arg0: vector<4x1xf32>) -> vector<4x1xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 1.000000e+00 : f32
    %0 = vector.insert %cst, %arg0 [%c0, %c0] : f32 into vector<4x1xf32>
    return %0 : vector<4x1xf32>
  }
}

// -----
module {
  func.func @type_cast_f32(%arg0: memref<8x8x8xf32>) -> memref<vector<8x8x8xf32>> {
    %0 = vector.type_cast %arg0 : memref<8x8x8xf32> to memref<vector<8x8x8xf32>>
    return %0 : memref<vector<8x8x8xf32>>
  }
}

// -----
module {
  func.func @type_cast_index(%arg0: memref<8x8x8xindex>) -> memref<vector<8x8x8xindex>> {
    %0 = vector.type_cast %arg0 : memref<8x8x8xindex> to memref<vector<8x8x8xindex>>
    return %0 : memref<vector<8x8x8xindex>>
  }
}

// -----
module {
  func.func @type_cast_non_zero_addrspace(%arg0: memref<8x8x8xf32, 3>) -> memref<vector<8x8x8xf32>, 3> {
    %0 = vector.type_cast %arg0 : memref<8x8x8xf32, 3> to memref<vector<8x8x8xf32>, 3>
    return %0 : memref<vector<8x8x8xf32>, 3>
  }
}

// -----
module {
  func.func @print_scalar_i64(%arg0: i64) {
    vector.print %arg0 : i64
    return
  }
}

// -----
module {
  func.func @print_scalar_ui64(%arg0: ui64) {
    vector.print %arg0 : ui64
    return
  }
}

// -----
module {
  func.func @print_scalar_index(%arg0: index) {
    vector.print %arg0 : index
    return
  }
}

// -----
module {
  func.func @print_scalar_f32(%arg0: f32) {
    vector.print %arg0 : f32
    return
  }
}

// -----
module {
  func.func @print_scalar_f64(%arg0: f64) {
    vector.print %arg0 : f64
    return
  }
}

// -----
module {
  func.func @print_string() {
    vector.print str "Hello, World!"
    return
  }
}

// -----
module {
  func.func @reduce_0d_f32(%arg0: vector<f32>) -> f32 {
    %0 = vector.reduction <add>, %arg0 : vector<f32> into f32
    return %0 : f32
  }
}

// -----
module {
  func.func @reduce_f16(%arg0: vector<16xf16>) -> f16 {
    %0 = vector.reduction <add>, %arg0 : vector<16xf16> into f16
    return %0 : f16
  }
}

// -----
module {
  func.func @reduce_f16_scalable(%arg0: vector<[16]xf16>) -> f16 {
    %0 = vector.reduction <add>, %arg0 : vector<[16]xf16> into f16
    return %0 : f16
  }
}

// -----
module {
  func.func @reduce_f32(%arg0: vector<16xf32>) -> f32 {
    %0 = vector.reduction <add>, %arg0 : vector<16xf32> into f32
    return %0 : f32
  }
}

// -----
module {
  func.func @reduce_f32_scalable(%arg0: vector<[16]xf32>) -> f32 {
    %0 = vector.reduction <add>, %arg0 : vector<[16]xf32> into f32
    return %0 : f32
  }
}

// -----
module {
  func.func @reduce_f64(%arg0: vector<16xf64>) -> f64 {
    %0 = vector.reduction <add>, %arg0 : vector<16xf64> into f64
    return %0 : f64
  }
}

// -----
module {
  func.func @reduce_f64_scalable(%arg0: vector<[16]xf64>) -> f64 {
    %0 = vector.reduction <add>, %arg0 : vector<[16]xf64> into f64
    return %0 : f64
  }
}

// -----
module {
  func.func @reduce_i8(%arg0: vector<16xi8>) -> i8 {
    %0 = vector.reduction <add>, %arg0 : vector<16xi8> into i8
    return %0 : i8
  }
}

// -----
module {
  func.func @reduce_i8_scalable(%arg0: vector<[16]xi8>) -> i8 {
    %0 = vector.reduction <add>, %arg0 : vector<[16]xi8> into i8
    return %0 : i8
  }
}

// -----
module {
  func.func @reduce_i32(%arg0: vector<16xi32>) -> i32 {
    %0 = vector.reduction <add>, %arg0 : vector<16xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduce_i32_scalable(%arg0: vector<[16]xi32>) -> i32 {
    %0 = vector.reduction <add>, %arg0 : vector<[16]xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduce_acc_i32(%arg0: vector<16xi32>, %arg1: i32) -> i32 {
    %0 = vector.reduction <add>, %arg0, %arg1 : vector<16xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduce_acc_i32_scalable(%arg0: vector<[16]xi32>, %arg1: i32) -> i32 {
    %0 = vector.reduction <add>, %arg0, %arg1 : vector<[16]xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduce_mul_i32(%arg0: vector<16xi32>) -> i32 {
    %0 = vector.reduction <mul>, %arg0 : vector<16xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduce_mul_i32_scalable(%arg0: vector<[16]xi32>) -> i32 {
    %0 = vector.reduction <mul>, %arg0 : vector<[16]xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduce_mul_acc_i32(%arg0: vector<16xi32>, %arg1: i32) -> i32 {
    %0 = vector.reduction <mul>, %arg0, %arg1 : vector<16xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduce_mul_acc_i32_scalable(%arg0: vector<[16]xi32>, %arg1: i32) -> i32 {
    %0 = vector.reduction <mul>, %arg0, %arg1 : vector<[16]xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduce_fmaximum_f32(%arg0: vector<16xf32>, %arg1: f32) -> f32 {
    %0 = vector.reduction <maximumf>, %arg0, %arg1 : vector<16xf32> into f32
    return %0 : f32
  }
}

// -----
module {
  func.func @reduce_fmaximum_f32_scalable(%arg0: vector<[16]xf32>, %arg1: f32) -> f32 {
    %0 = vector.reduction <maximumf>, %arg0, %arg1 : vector<[16]xf32> into f32
    return %0 : f32
  }
}

// -----
module {
  func.func @reduce_fminimum_f32(%arg0: vector<16xf32>, %arg1: f32) -> f32 {
    %0 = vector.reduction <minimumf>, %arg0, %arg1 : vector<16xf32> into f32
    return %0 : f32
  }
}

// -----
module {
  func.func @reduce_fminimum_f32_scalable(%arg0: vector<[16]xf32>, %arg1: f32) -> f32 {
    %0 = vector.reduction <minimumf>, %arg0, %arg1 : vector<[16]xf32> into f32
    return %0 : f32
  }
}

// -----
module {
  func.func @reduce_fmax_f32(%arg0: vector<16xf32>, %arg1: f32) -> f32 {
    %0 = vector.reduction <maxnumf>, %arg0, %arg1 : vector<16xf32> into f32
    return %0 : f32
  }
}

// -----
module {
  func.func @reduce_fmax_f32_scalable(%arg0: vector<[16]xf32>, %arg1: f32) -> f32 {
    %0 = vector.reduction <maxnumf>, %arg0, %arg1 : vector<[16]xf32> into f32
    return %0 : f32
  }
}

// -----
module {
  func.func @reduce_fmin_f32(%arg0: vector<16xf32>, %arg1: f32) -> f32 {
    %0 = vector.reduction <minnumf>, %arg0, %arg1 : vector<16xf32> into f32
    return %0 : f32
  }
}

// -----
module {
  func.func @reduce_fmin_f32_scalable(%arg0: vector<[16]xf32>, %arg1: f32) -> f32 {
    %0 = vector.reduction <minnumf>, %arg0, %arg1 : vector<[16]xf32> into f32
    return %0 : f32
  }
}

// -----
module {
  func.func @reduce_minui_i32(%arg0: vector<16xi32>) -> i32 {
    %0 = vector.reduction <minui>, %arg0 : vector<16xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduce_minui_i32_scalable(%arg0: vector<[16]xi32>) -> i32 {
    %0 = vector.reduction <minui>, %arg0 : vector<[16]xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduce_minui_acc_i32(%arg0: vector<16xi32>, %arg1: i32) -> i32 {
    %0 = vector.reduction <minui>, %arg0, %arg1 : vector<16xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduce_minui_acc_i32_scalable(%arg0: vector<[16]xi32>, %arg1: i32) -> i32 {
    %0 = vector.reduction <minui>, %arg0, %arg1 : vector<[16]xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduce_maxui_i32(%arg0: vector<16xi32>) -> i32 {
    %0 = vector.reduction <maxui>, %arg0 : vector<16xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduce_maxui_i32_scalable(%arg0: vector<[16]xi32>) -> i32 {
    %0 = vector.reduction <maxui>, %arg0 : vector<[16]xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduce_maxui_acc_i32(%arg0: vector<16xi32>, %arg1: i32) -> i32 {
    %0 = vector.reduction <maxui>, %arg0, %arg1 : vector<16xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduce_maxui_acc_i32_scalable(%arg0: vector<[16]xi32>, %arg1: i32) -> i32 {
    %0 = vector.reduction <maxui>, %arg0, %arg1 : vector<[16]xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduce_minsi_i32(%arg0: vector<16xi32>) -> i32 {
    %0 = vector.reduction <minsi>, %arg0 : vector<16xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduce_minsi_i32_scalable(%arg0: vector<[16]xi32>) -> i32 {
    %0 = vector.reduction <minsi>, %arg0 : vector<[16]xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduce_minsi_acc_i32(%arg0: vector<16xi32>, %arg1: i32) -> i32 {
    %0 = vector.reduction <minsi>, %arg0, %arg1 : vector<16xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduce_minsi_acc_i32_scalable(%arg0: vector<[16]xi32>, %arg1: i32) -> i32 {
    %0 = vector.reduction <minsi>, %arg0, %arg1 : vector<[16]xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduce_maxsi_i32(%arg0: vector<16xi32>) -> i32 {
    %0 = vector.reduction <maxsi>, %arg0 : vector<16xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduce_maxsi_i32_scalable(%arg0: vector<[16]xi32>) -> i32 {
    %0 = vector.reduction <maxsi>, %arg0 : vector<[16]xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduce_maxsi_acc_i32(%arg0: vector<16xi32>, %arg1: i32) -> i32 {
    %0 = vector.reduction <maxsi>, %arg0, %arg1 : vector<16xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduce_maxsi_acc_i32_scalable(%arg0: vector<[16]xi32>, %arg1: i32) -> i32 {
    %0 = vector.reduction <maxsi>, %arg0, %arg1 : vector<[16]xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduce_and_i32(%arg0: vector<16xi32>) -> i32 {
    %0 = vector.reduction <and>, %arg0 : vector<16xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduce_and_i32_scalable(%arg0: vector<[16]xi32>) -> i32 {
    %0 = vector.reduction <and>, %arg0 : vector<[16]xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduce_and_acc_i32(%arg0: vector<16xi32>, %arg1: i32) -> i32 {
    %0 = vector.reduction <and>, %arg0, %arg1 : vector<16xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduce_and_acc_i32_scalable(%arg0: vector<[16]xi32>, %arg1: i32) -> i32 {
    %0 = vector.reduction <and>, %arg0, %arg1 : vector<[16]xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduce_or_i32(%arg0: vector<16xi32>) -> i32 {
    %0 = vector.reduction <or>, %arg0 : vector<16xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduce_or_i32_scalable(%arg0: vector<[16]xi32>) -> i32 {
    %0 = vector.reduction <or>, %arg0 : vector<[16]xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduce_or_acc_i32(%arg0: vector<16xi32>, %arg1: i32) -> i32 {
    %0 = vector.reduction <or>, %arg0, %arg1 : vector<16xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduce_or_acc_i32_scalable(%arg0: vector<[16]xi32>, %arg1: i32) -> i32 {
    %0 = vector.reduction <or>, %arg0, %arg1 : vector<[16]xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduce_xor_i32(%arg0: vector<16xi32>) -> i32 {
    %0 = vector.reduction <xor>, %arg0 : vector<16xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduce_xor_i32_scalable(%arg0: vector<[16]xi32>) -> i32 {
    %0 = vector.reduction <xor>, %arg0 : vector<[16]xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduce_xor_acc_i32(%arg0: vector<16xi32>, %arg1: i32) -> i32 {
    %0 = vector.reduction <xor>, %arg0, %arg1 : vector<16xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduce_xor_acc_i32_scalable(%arg0: vector<[16]xi32>, %arg1: i32) -> i32 {
    %0 = vector.reduction <xor>, %arg0, %arg1 : vector<[16]xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduce_i64(%arg0: vector<16xi64>) -> i64 {
    %0 = vector.reduction <add>, %arg0 : vector<16xi64> into i64
    return %0 : i64
  }
}

// -----
module {
  func.func @reduce_i64_scalable(%arg0: vector<[16]xi64>) -> i64 {
    %0 = vector.reduction <add>, %arg0 : vector<[16]xi64> into i64
    return %0 : i64
  }
}

// -----
module {
  func.func @reduce_index(%arg0: vector<16xindex>) -> index {
    %0 = vector.reduction <add>, %arg0 : vector<16xindex> into index
    return %0 : index
  }
}

// -----
module {
  func.func @reduce_index_scalable(%arg0: vector<[16]xindex>) -> index {
    %0 = vector.reduction <add>, %arg0 : vector<[16]xindex> into index
    return %0 : index
  }
}

// -----
module {
  func.func @transpose_0d(%arg0: vector<f32>) -> vector<f32> {
    %0 = vector.transpose %arg0, [] : vector<f32> to vector<f32>
    return %0 : vector<f32>
  }
}

// -----
module {
  func.func @masked_load(%arg0: memref<?xf32>, %arg1: vector<16xi1>, %arg2: vector<16xf32>) -> vector<16xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.maskedload %arg0[%c0], %arg1, %arg2 : memref<?xf32>, vector<16xi1>, vector<16xf32> into vector<16xf32>
    return %0 : vector<16xf32>
  }
}

// -----
module {
  func.func @masked_load_scalable(%arg0: memref<?xf32>, %arg1: vector<[16]xi1>, %arg2: vector<[16]xf32>) -> vector<[16]xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.maskedload %arg0[%c0], %arg1, %arg2 : memref<?xf32>, vector<[16]xi1>, vector<[16]xf32> into vector<[16]xf32>
    return %0 : vector<[16]xf32>
  }
}

// -----
module {
  func.func @masked_load_index(%arg0: memref<?xindex>, %arg1: vector<16xi1>, %arg2: vector<16xindex>) -> vector<16xindex> {
    %c0 = arith.constant 0 : index
    %0 = vector.maskedload %arg0[%c0], %arg1, %arg2 : memref<?xindex>, vector<16xi1>, vector<16xindex> into vector<16xindex>
    return %0 : vector<16xindex>
  }
}

// -----
module {
  func.func @masked_load_index_scalable(%arg0: memref<?xindex>, %arg1: vector<[16]xi1>, %arg2: vector<[16]xindex>) -> vector<[16]xindex> {
    %c0 = arith.constant 0 : index
    %0 = vector.maskedload %arg0[%c0], %arg1, %arg2 : memref<?xindex>, vector<[16]xi1>, vector<[16]xindex> into vector<[16]xindex>
    return %0 : vector<[16]xindex>
  }
}

// -----
module {
  func.func @masked_load_with_alignment(%arg0: memref<?xf32>, %arg1: vector<16xi1>, %arg2: vector<16xf32>, %arg3: index) -> vector<16xf32> {
    %0 = vector.maskedload %arg0[%arg3], %arg1, %arg2 {alignment = 2 : i64} : memref<?xf32>, vector<16xi1>, vector<16xf32> into vector<16xf32>
    return %0 : vector<16xf32>
  }
}

// -----
module {
  func.func @masked_store(%arg0: memref<?xf32>, %arg1: vector<16xi1>, %arg2: vector<16xf32>) {
    %c0 = arith.constant 0 : index
    vector.maskedstore %arg0[%c0], %arg1, %arg2 : memref<?xf32>, vector<16xi1>, vector<16xf32>
    return
  }
}

// -----
module {
  func.func @masked_store_scalable(%arg0: memref<?xf32>, %arg1: vector<[16]xi1>, %arg2: vector<[16]xf32>) {
    %c0 = arith.constant 0 : index
    vector.maskedstore %arg0[%c0], %arg1, %arg2 : memref<?xf32>, vector<[16]xi1>, vector<[16]xf32>
    return
  }
}

// -----
module {
  func.func @masked_store_index(%arg0: memref<?xindex>, %arg1: vector<16xi1>, %arg2: vector<16xindex>) {
    %c0 = arith.constant 0 : index
    vector.maskedstore %arg0[%c0], %arg1, %arg2 : memref<?xindex>, vector<16xi1>, vector<16xindex>
    return
  }
}

// -----
module {
  func.func @masked_store_index_scalable(%arg0: memref<?xindex>, %arg1: vector<[16]xi1>, %arg2: vector<[16]xindex>) {
    %c0 = arith.constant 0 : index
    vector.maskedstore %arg0[%c0], %arg1, %arg2 : memref<?xindex>, vector<[16]xi1>, vector<[16]xindex>
    return
  }
}

// -----
module {
  func.func @masked_store_with_alignment(%arg0: memref<?xf32>, %arg1: vector<16xi1>, %arg2: vector<16xf32>, %arg3: index) {
    vector.maskedstore %arg0[%arg3], %arg1, %arg2 {alignment = 2 : i64} : memref<?xf32>, vector<16xi1>, vector<16xf32>
    return
  }
}

// -----
module {
  func.func @gather(%arg0: memref<?xf32>, %arg1: vector<3xi32>, %arg2: vector<3xi1>, %arg3: vector<3xf32>) -> vector<3xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.gather %arg0[%c0] [%arg1], %arg2, %arg3 : memref<?xf32>, vector<3xi32>, vector<3xi1>, vector<3xf32> into vector<3xf32>
    return %0 : vector<3xf32>
  }
}

// -----
module {
  func.func @gather_scalable(%arg0: memref<?xf32>, %arg1: vector<[3]xi32>, %arg2: vector<[3]xi1>, %arg3: vector<[3]xf32>) -> vector<[3]xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.gather %arg0[%c0] [%arg1], %arg2, %arg3 : memref<?xf32>, vector<[3]xi32>, vector<[3]xi1>, vector<[3]xf32> into vector<[3]xf32>
    return %0 : vector<[3]xf32>
  }
}

// -----
module {
  func.func @gather_global_memory(%arg0: memref<?xf32, 1>, %arg1: vector<3xi32>, %arg2: vector<3xi1>, %arg3: vector<3xf32>) -> vector<3xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.gather %arg0[%c0] [%arg1], %arg2, %arg3 : memref<?xf32, 1>, vector<3xi32>, vector<3xi1>, vector<3xf32> into vector<3xf32>
    return %0 : vector<3xf32>
  }
}

// -----
module {
  func.func @gather_global_memory_scalable(%arg0: memref<?xf32, 1>, %arg1: vector<[3]xi32>, %arg2: vector<[3]xi1>, %arg3: vector<[3]xf32>) -> vector<[3]xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.gather %arg0[%c0] [%arg1], %arg2, %arg3 : memref<?xf32, 1>, vector<[3]xi32>, vector<[3]xi1>, vector<[3]xf32> into vector<[3]xf32>
    return %0 : vector<[3]xf32>
  }
}

// -----
module {
  func.func @gather_index(%arg0: memref<?xindex>, %arg1: vector<3xindex>, %arg2: vector<3xi1>, %arg3: vector<3xindex>) -> vector<3xindex> {
    %c0 = arith.constant 0 : index
    %0 = vector.gather %arg0[%c0] [%arg1], %arg2, %arg3 : memref<?xindex>, vector<3xindex>, vector<3xi1>, vector<3xindex> into vector<3xindex>
    return %0 : vector<3xindex>
  }
}

// -----
module {
  func.func @gather_index_scalable(%arg0: memref<?xindex>, %arg1: vector<[3]xindex>, %arg2: vector<[3]xi1>, %arg3: vector<[3]xindex>) -> vector<[3]xindex> {
    %c0 = arith.constant 0 : index
    %0 = vector.gather %arg0[%c0] [%arg1], %arg2, %arg3 : memref<?xindex>, vector<[3]xindex>, vector<[3]xi1>, vector<[3]xindex> into vector<[3]xindex>
    return %0 : vector<[3]xindex>
  }
}

// -----
module {
  func.func @gather_1d_from_2d(%arg0: memref<4x4xf32>, %arg1: vector<4xi32>, %arg2: vector<4xi1>, %arg3: vector<4xf32>) -> vector<4xf32> {
    %c3 = arith.constant 3 : index
    %0 = vector.gather %arg0[%c3, %c3] [%arg1], %arg2, %arg3 : memref<4x4xf32>, vector<4xi32>, vector<4xi1>, vector<4xf32> into vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @gather_1d_from_2d_scalable(%arg0: memref<4x?xf32>, %arg1: vector<[4]xi32>, %arg2: vector<[4]xi1>, %arg3: vector<[4]xf32>) -> vector<[4]xf32> {
    %c3 = arith.constant 3 : index
    %0 = vector.gather %arg0[%c3, %c3] [%arg1], %arg2, %arg3 : memref<4x?xf32>, vector<[4]xi32>, vector<[4]xi1>, vector<[4]xf32> into vector<[4]xf32>
    return %0 : vector<[4]xf32>
  }
}

// -----
module {
  func.func @gather_with_alignment(%arg0: memref<?xf32>, %arg1: vector<3xi32>, %arg2: vector<3xi1>, %arg3: vector<3xf32>, %arg4: index) -> vector<3xf32> {
    %0 = vector.gather %arg0[%arg4] [%arg1], %arg2, %arg3 {alignment = 8 : i64} : memref<?xf32>, vector<3xi32>, vector<3xi1>, vector<3xf32> into vector<3xf32>
    return %0 : vector<3xf32>
  }
}

// -----
module {
  func.func @negative_gather_on_strided_memref(%arg0: memref<?xf32, strided<[2], offset: ?>>, %arg1: vector<3xi32>, %arg2: vector<3xi1>, %arg3: vector<3xf32>) -> vector<3xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.gather %arg0[%c0] [%arg1], %arg2, %arg3 : memref<?xf32, strided<[2], offset: ?>>, vector<3xi32>, vector<3xi1>, vector<3xf32> into vector<3xf32>
    return %0 : vector<3xf32>
  }
}

// -----
module {
  func.func @scatter(%arg0: memref<?xf32>, %arg1: vector<3xi32>, %arg2: vector<3xi1>, %arg3: vector<3xf32>) {
    %c0 = arith.constant 0 : index
    vector.scatter %arg0[%c0] [%arg1], %arg2, %arg3 : memref<?xf32>, vector<3xi32>, vector<3xi1>, vector<3xf32>
    return
  }
}

// -----
module {
  func.func @scatter_scalable(%arg0: memref<?xf32>, %arg1: vector<[3]xi32>, %arg2: vector<[3]xi1>, %arg3: vector<[3]xf32>) {
    %c0 = arith.constant 0 : index
    vector.scatter %arg0[%c0] [%arg1], %arg2, %arg3 : memref<?xf32>, vector<[3]xi32>, vector<[3]xi1>, vector<[3]xf32>
    return
  }
}

// -----
module {
  func.func @scatter_index(%arg0: memref<?xindex>, %arg1: vector<3xindex>, %arg2: vector<3xi1>, %arg3: vector<3xindex>) {
    %c0 = arith.constant 0 : index
    vector.scatter %arg0[%c0] [%arg1], %arg2, %arg3 : memref<?xindex>, vector<3xindex>, vector<3xi1>, vector<3xindex>
    return
  }
}

// -----
module {
  func.func @scatter_index_scalable(%arg0: memref<?xindex>, %arg1: vector<[3]xindex>, %arg2: vector<[3]xi1>, %arg3: vector<[3]xindex>) {
    %c0 = arith.constant 0 : index
    vector.scatter %arg0[%c0] [%arg1], %arg2, %arg3 : memref<?xindex>, vector<[3]xindex>, vector<[3]xi1>, vector<[3]xindex>
    return
  }
}

// -----
module {
  func.func @scatter_1d_into_2d(%arg0: memref<4x4xf32>, %arg1: vector<4xi32>, %arg2: vector<4xi1>, %arg3: vector<4xf32>) {
    %c3 = arith.constant 3 : index
    vector.scatter %arg0[%c3, %c3] [%arg1], %arg2, %arg3 : memref<4x4xf32>, vector<4xi32>, vector<4xi1>, vector<4xf32>
    return
  }
}

// -----
module {
  func.func @scatter_1d_into_2d_scalable(%arg0: memref<4x?xf32>, %arg1: vector<[4]xi32>, %arg2: vector<[4]xi1>, %arg3: vector<[4]xf32>) {
    %c3 = arith.constant 3 : index
    vector.scatter %arg0[%c3, %c3] [%arg1], %arg2, %arg3 : memref<4x?xf32>, vector<[4]xi32>, vector<[4]xi1>, vector<[4]xf32>
    return
  }
}

// -----
module {
  func.func @scatter_with_alignment(%arg0: memref<?xf32>, %arg1: vector<3xi32>, %arg2: vector<3xi1>, %arg3: vector<3xf32>, %arg4: index) {
    vector.scatter %arg0[%arg4] [%arg1], %arg2, %arg3 {alignment = 8 : i64} : memref<?xf32>, vector<3xi32>, vector<3xi1>, vector<3xf32>
    return
  }
}

// -----
module {
  func.func @negative_scatter_on_strided_memref(%arg0: memref<?xf32, strided<[2], offset: ?>>, %arg1: vector<3xi32>, %arg2: vector<3xi1>, %arg3: vector<3xf32>) {
    %c0 = arith.constant 0 : index
    vector.scatter %arg0[%c0] [%arg1], %arg2, %arg3 : memref<?xf32, strided<[2], offset: ?>>, vector<3xi32>, vector<3xi1>, vector<3xf32>
    return
  }
}

// -----
module {
  func.func @expand_load_op(%arg0: memref<?xf32>, %arg1: vector<11xi1>, %arg2: vector<11xf32>) -> vector<11xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.expandload %arg0[%c0], %arg1, %arg2 : memref<?xf32>, vector<11xi1>, vector<11xf32> into vector<11xf32>
    return %0 : vector<11xf32>
  }
}

// -----
module {
  func.func @expand_load_op_index(%arg0: memref<?xindex>, %arg1: vector<11xi1>, %arg2: vector<11xindex>) -> vector<11xindex> {
    %c0 = arith.constant 0 : index
    %0 = vector.expandload %arg0[%c0], %arg1, %arg2 : memref<?xindex>, vector<11xi1>, vector<11xindex> into vector<11xindex>
    return %0 : vector<11xindex>
  }
}

// -----
module {
  func.func @expand_load_op_with_alignment(%arg0: memref<?xindex>, %arg1: vector<11xi1>, %arg2: vector<11xindex>, %arg3: index) -> vector<11xindex> {
    %0 = vector.expandload %arg0[%arg3], %arg1, %arg2 {alignment = 8 : i64} : memref<?xindex>, vector<11xi1>, vector<11xindex> into vector<11xindex>
    return %0 : vector<11xindex>
  }
}

// -----
module {
  func.func @compress_store_op(%arg0: memref<?xf32>, %arg1: vector<11xi1>, %arg2: vector<11xf32>) {
    %c0 = arith.constant 0 : index
    vector.compressstore %arg0[%c0], %arg1, %arg2 : memref<?xf32>, vector<11xi1>, vector<11xf32>
    return
  }
}

// -----
module {
  func.func @compress_store_op_index(%arg0: memref<?xindex>, %arg1: vector<11xi1>, %arg2: vector<11xindex>) {
    %c0 = arith.constant 0 : index
    vector.compressstore %arg0[%c0], %arg1, %arg2 : memref<?xindex>, vector<11xi1>, vector<11xindex>
    return
  }
}

// -----
module {
  func.func @compress_store_op_with_alignment(%arg0: memref<?xindex>, %arg1: vector<11xi1>, %arg2: vector<11xindex>, %arg3: index) {
    vector.compressstore %arg0[%arg3], %arg1, %arg2 {alignment = 8 : i64} : memref<?xindex>, vector<11xi1>, vector<11xindex>
    return
  }
}

// -----
module {
  func.func @scalable_insert(%arg0: vector<4xf32>, %arg1: vector<[4]xf32>) -> vector<[4]xf32> {
    %0 = vector.scalable.insert %arg0, %arg1[0] : vector<4xf32> into vector<[4]xf32>
    %1 = vector.scalable.insert %arg0, %0[4] : vector<4xf32> into vector<[4]xf32>
    return %1 : vector<[4]xf32>
  }
}

// -----
module {
  func.func @scalable_extract(%arg0: vector<[4]xf32>) -> vector<8xf32> {
    %0 = vector.scalable.extract %arg0[0] : vector<8xf32> from vector<[4]xf32>
    return %0 : vector<8xf32>
  }
}

// -----
module {
  func.func @interleave_0d(%arg0: vector<i8>, %arg1: vector<i8>) -> vector<2xi8> {
    %0 = vector.interleave %arg0, %arg1 : vector<i8> -> vector<2xi8>
    return %0 : vector<2xi8>
  }
}

// -----
module {
  func.func @interleave_1d(%arg0: vector<8xf32>, %arg1: vector<8xf32>) -> vector<16xf32> {
    %0 = vector.interleave %arg0, %arg1 : vector<8xf32> -> vector<16xf32>
    return %0 : vector<16xf32>
  }
}

// -----
module {
  func.func @interleave_1d_scalable(%arg0: vector<[4]xi32>, %arg1: vector<[4]xi32>) -> vector<[8]xi32> {
    %0 = vector.interleave %arg0, %arg1 : vector<[4]xi32> -> vector<[8]xi32>
    return %0 : vector<[8]xi32>
  }
}

// -----
module {
  func.func @deinterleave_1d(%arg0: vector<4xi32>) -> (vector<2xi32>, vector<2xi32>) {
    %res1, %res2 = vector.deinterleave %arg0 : vector<4xi32> -> vector<2xi32>
    return %res1, %res2 : vector<2xi32>, vector<2xi32>
  }
}

// -----
module {
  func.func @deinterleave_1d_scalable(%arg0: vector<[4]xi32>) -> (vector<[2]xi32>, vector<[2]xi32>) {
    %res1, %res2 = vector.deinterleave %arg0 : vector<[4]xi32> -> vector<[2]xi32>
    return %res1, %res2 : vector<[2]xi32>, vector<[2]xi32>
  }
}

// -----
module {
  func.func @from_elements_1d(%arg0: f32, %arg1: f32) -> vector<3xf32> {
    %0 = vector.from_elements %arg0, %arg1, %arg0 : vector<3xf32>
    return %0 : vector<3xf32>
  }
}

// -----
module {
  func.func @from_elements_0d(%arg0: f32) -> vector<f32> {
    %0 = vector.from_elements %arg0 : vector<f32>
    return %0 : vector<f32>
  }
}

// -----
module {
  func.func @to_elements_no_dead_elements(%arg0: vector<4xf32>) -> (f32, f32, f32, f32) {
    %0:4 = vector.to_elements %arg0 : vector<4xf32>
    return %0#0, %0#1, %0#2, %0#3 : f32, f32, f32, f32
  }
}

// -----
module {
  func.func @to_elements_dead_elements(%arg0: vector<4xf32>) -> (f32, f32) {
    %0:4 = vector.to_elements %arg0 : vector<4xf32>
    return %0#1, %0#3 : f32, f32
  }
}

// -----
module {
  func.func @step() -> vector<4xindex> {
    %0 = vector.step : vector<4xindex>
    return %0 : vector<4xindex>
  }
  func.func @step_i8() -> vector<4xi8> {
    %0 = vector.step : vector<4xi8>
    return %0 : vector<4xi8>
  }
  func.func @step_scalable() -> vector<[4]xindex> {
    %0 = vector.step : vector<[4]xindex>
    return %0 : vector<[4]xindex>
  }
  func.func @step_scalable_i8() -> vector<[4]xi8> {
    %0 = vector.step : vector<[4]xi8>
    return %0 : vector<[4]xi8>
  }
}

