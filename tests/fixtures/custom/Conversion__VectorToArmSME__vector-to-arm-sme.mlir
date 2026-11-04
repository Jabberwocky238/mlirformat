module {
  func.func @transfer_read_2d_i8(%arg0: memref<?x?xi8>) {
    %c0 = arith.constant 0 : index
    %c0_i8 = arith.constant 0 : i8
    %0 = vector.transfer_read %arg0[%c0, %c0], %c0_i8 {in_bounds = [true, true]} : memref<?x?xi8>, vector<[16]x[16]xi8>
    "prevent.dce"(%0) : (vector<[16]x[16]xi8>) -> ()
    return
  }
}

// -----
module {
  func.func @transfer_read_2d_i16(%arg0: memref<?x?xi16>) {
    %c0 = arith.constant 0 : index
    %c0_i16 = arith.constant 0 : i16
    %0 = vector.transfer_read %arg0[%c0, %c0], %c0_i16 {in_bounds = [true, true]} : memref<?x?xi16>, vector<[8]x[8]xi16>
    "prevent.dce"(%0) : (vector<[8]x[8]xi16>) -> ()
    return
  }
}

// -----
module {
  func.func @transfer_read_2d_i32(%arg0: memref<?x?xi32>) {
    %c0 = arith.constant 0 : index
    %c0_i32 = arith.constant 0 : i32
    %0 = vector.transfer_read %arg0[%c0, %c0], %c0_i32 {in_bounds = [true, true]} : memref<?x?xi32>, vector<[4]x[4]xi32>
    "prevent.dce"(%0) : (vector<[4]x[4]xi32>) -> ()
    return
  }
}

// -----
module {
  func.func @transfer_read_2d_i64(%arg0: memref<?x?xi64>) {
    %c0 = arith.constant 0 : index
    %c0_i64 = arith.constant 0 : i64
    %0 = vector.transfer_read %arg0[%c0, %c0], %c0_i64 {in_bounds = [true, true]} : memref<?x?xi64>, vector<[2]x[2]xi64>
    "prevent.dce"(%0) : (vector<[2]x[2]xi64>) -> ()
    return
  }
}

// -----
module {
  func.func @transfer_read_2d_i128(%arg0: memref<?x?xi128>) {
    %c0 = arith.constant 0 : index
    %c0_i128 = arith.constant 0 : i128
    %0 = vector.transfer_read %arg0[%c0, %c0], %c0_i128 {in_bounds = [true, true]} : memref<?x?xi128>, vector<[1]x[1]xi128>
    "prevent.dce"(%0) : (vector<[1]x[1]xi128>) -> ()
    return
  }
}

// -----
module {
  func.func @transfer_read_2d_f16(%arg0: memref<?x?xf16>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f16
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<?x?xf16>, vector<[8]x[8]xf16>
    "prevent.dce"(%0) : (vector<[8]x[8]xf16>) -> ()
    return
  }
}

// -----
module {
  func.func @transfer_read_2d_bf16(%arg0: memref<?x?xbf16>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : bf16
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<?x?xbf16>, vector<[8]x[8]xbf16>
    "prevent.dce"(%0) : (vector<[8]x[8]xbf16>) -> ()
    return
  }
}

// -----
module {
  func.func @transfer_read_2d_f32(%arg0: memref<?x?xf32>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<?x?xf32>, vector<[4]x[4]xf32>
    "prevent.dce"(%0) : (vector<[4]x[4]xf32>) -> ()
    return
  }
}

// -----
module {
  func.func @transfer_read_2d_f64(%arg0: memref<?x?xf64>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f64
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<?x?xf64>, vector<[2]x[2]xf64>
    "prevent.dce"(%0) : (vector<[2]x[2]xf64>) -> ()
    return
  }
}

// -----
module {
  func.func @transfer_read_2d_with_mask_i16(%arg0: memref<?x?xi16>, %arg1: vector<[8]x[8]xi1>) {
    %c0 = arith.constant 0 : index
    %c0_i16 = arith.constant 0 : i16
    %0 = vector.transfer_read %arg0[%c0, %c0], %c0_i16, %arg1 {in_bounds = [true, true]} : memref<?x?xi16>, vector<[8]x[8]xi16>
    "prevent.dce"(%0) : (vector<[8]x[8]xi16>) -> ()
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func @transfer_read_2d_transpose_i8(%arg0: memref<?x?xi8>) {
    %c0 = arith.constant 0 : index
    %c0_i8 = arith.constant 0 : i8
    %0 = vector.transfer_read %arg0[%c0, %c0], %c0_i8 {in_bounds = [true, true], permutation_map = #map} : memref<?x?xi8>, vector<[16]x[16]xi8>
    "prevent.dce"(%0) : (vector<[16]x[16]xi8>) -> ()
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func @transfer_read_2d_transpose_with_mask_f32(%arg0: memref<?x?xf32>, %arg1: vector<[4]x[4]xi1>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst, %arg1 {in_bounds = [true, true], permutation_map = #map} : memref<?x?xf32>, vector<[4]x[4]xf32>
    "prevent.dce"(%0) : (vector<[4]x[4]xf32>) -> ()
    return
  }
}

// -----
module {
  func.func @fold_transpose_into_load(%arg0: memref<?x?xf32>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<?x?xf32>, vector<[4]x[4]xf32>
    %1 = vector.transpose %0, [1, 0] : vector<[4]x[4]xf32> to vector<[4]x[4]xf32>
    "prevent.dce"(%1) : (vector<[4]x[4]xf32>) -> ()
  }
}

// -----
module {
  func.func @fold_transpose_into_load_multi_use(%arg0: memref<?x?xf32>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<?x?xf32>, vector<[4]x[4]xf32>
    "test.some_use"(%0) : (vector<[4]x[4]xf32>) -> ()
    %1 = vector.transpose %0, [1, 0] : vector<[4]x[4]xf32> to vector<[4]x[4]xf32>
    "prevent.dce"(%1) : (vector<[4]x[4]xf32>) -> ()
  }
}

// -----
module {
  func.func @transfer_write_2d_i8(%arg0: vector<[16]x[16]xi8>, %arg1: memref<?x?xi8>) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg0, %arg1[%c0, %c0] {in_bounds = [true, true]} : vector<[16]x[16]xi8>, memref<?x?xi8>
    return
  }
}

// -----
module {
  func.func @transfer_write_2d_i16(%arg0: vector<[8]x[8]xi16>, %arg1: memref<?x?xi16>) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg0, %arg1[%c0, %c0] {in_bounds = [true, true]} : vector<[8]x[8]xi16>, memref<?x?xi16>
    return
  }
}

// -----
module {
  func.func @transfer_write_2d_i32(%arg0: vector<[4]x[4]xi32>, %arg1: memref<?x?xi32>) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg0, %arg1[%c0, %c0] {in_bounds = [true, true]} : vector<[4]x[4]xi32>, memref<?x?xi32>
    return
  }
}

// -----
module {
  func.func @transfer_write_2d_i64(%arg0: vector<[2]x[2]xi64>, %arg1: memref<?x?xi64>) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg0, %arg1[%c0, %c0] {in_bounds = [true, true]} : vector<[2]x[2]xi64>, memref<?x?xi64>
    return
  }
}

// -----
module {
  func.func @transfer_write_2d_f16(%arg0: vector<[8]x[8]xf16>, %arg1: memref<?x?xf16>) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg0, %arg1[%c0, %c0] {in_bounds = [true, true]} : vector<[8]x[8]xf16>, memref<?x?xf16>
    return
  }
}

// -----
module {
  func.func @transfer_write_2d_bf16(%arg0: vector<[8]x[8]xbf16>, %arg1: memref<?x?xbf16>) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg0, %arg1[%c0, %c0] {in_bounds = [true, true]} : vector<[8]x[8]xbf16>, memref<?x?xbf16>
    return
  }
}

// -----
module {
  func.func @transfer_write_2d_f32(%arg0: vector<[4]x[4]xf32>, %arg1: memref<?x?xf32>) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg0, %arg1[%c0, %c0] {in_bounds = [true, true]} : vector<[4]x[4]xf32>, memref<?x?xf32>
    return
  }
}

// -----
module {
  func.func @transfer_write_2d_f64(%arg0: vector<[2]x[2]xf64>, %arg1: memref<?x?xf64>) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg0, %arg1[%c0, %c0] {in_bounds = [true, true]} : vector<[2]x[2]xf64>, memref<?x?xf64>
    return
  }
}

// -----
module {
  func.func @transfer_write_2d_with_mask_f64(%arg0: vector<[2]x[2]xf64>, %arg1: memref<?x?xf64>, %arg2: vector<[2]x[2]xi1>) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg0, %arg1[%c0, %c0], %arg2 {in_bounds = [true, true]} : vector<[2]x[2]xf64>, memref<?x?xf64>
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func @transfer_write_2d_transpose_i64(%arg0: vector<[2]x[2]xi64>, %arg1: memref<?x?xi64>) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg0, %arg1[%c0, %c0] {in_bounds = [true, true], permutation_map = #map} : vector<[2]x[2]xi64>, memref<?x?xi64>
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func @transfer_write_2d_transpose_with_mask_bf16(%arg0: vector<[8]x[8]xbf16>, %arg1: memref<?x?xbf16>, %arg2: vector<[8]x[8]xi1>) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg0, %arg1[%c0, %c0], %arg2 {in_bounds = [true, true], permutation_map = #map} : vector<[8]x[8]xbf16>, memref<?x?xbf16>
    return
  }
}

// -----
module {
  func.func @transfer_write_slice(%arg0: vector<[4]x[4]xf32>, %arg1: memref<?x?xf32>, %arg2: index) {
    %c0 = arith.constant 0 : index
    %0 = vector.extract %arg0[%arg2] : vector<[4]xf32> from vector<[4]x[4]xf32>
    vector.transfer_write %0, %arg1[%arg2, %c0] {in_bounds = [true]} : vector<[4]xf32>, memref<?x?xf32>
    return
  }
}

// -----
module {
  func.func @transfer_write_slice_with_mask(%arg0: vector<[4]x[4]xf32>, %arg1: memref<?x?xf32>, %arg2: vector<[4]xi1>, %arg3: index) {
    %c0 = arith.constant 0 : index
    %0 = vector.extract %arg0[%arg3] : vector<[4]xf32> from vector<[4]x[4]xf32>
    vector.transfer_write %0, %arg1[%arg3, %c0], %arg2 {in_bounds = [true]} : vector<[4]xf32>, memref<?x?xf32>
    return
  }
}

// -----
module {
  func.func @transfer_write_vertical_slice(%arg0: vector<[4]x[4]xf32>, %arg1: memref<?x?xf32>, %arg2: index) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.extract_tile_slice %arg0[%arg2] layout<vertical> : vector<[4]xf32> from vector<[4]x[4]xf32>
    vector.transfer_write %0, %arg1[%arg2, %c0] {in_bounds = [true]} : vector<[4]xf32>, memref<?x?xf32>
    return
  }
}

// -----
module {
  func.func @broadcast_vec2d_from_i32(%arg0: i32) {
    %0 = vector.broadcast %arg0 : i32 to vector<[4]x[4]xi32>
    "prevent.dce"(%0) : (vector<[4]x[4]xi32>) -> ()
    return
  }
}

// -----
module {
  func.func @broadcast_vec2d_from_vec0d(%arg0: vector<f32>) {
    %0 = vector.broadcast %arg0 : vector<f32> to vector<[4]x[4]xf32>
    "prevent.dce"(%0) : (vector<[4]x[4]xf32>) -> ()
    return
  }
}

// -----
module {
  func.func @broadcast_vec2d_from_vec1d(%arg0: vector<[8]xi16>) {
    %0 = vector.broadcast %arg0 : vector<[8]xi16> to vector<[8]x[8]xi16>
    "prevent.dce"(%0) : (vector<[8]x[8]xi16>) -> ()
    return
  }
}

// -----
module {
  func.func @transpose_i8(%arg0: vector<[16]x[16]xi8>) {
    %0 = vector.transpose %arg0, [1, 0] : vector<[16]x[16]xi8> to vector<[16]x[16]xi8>
    "prevent.dce"(%0) : (vector<[16]x[16]xi8>) -> ()
    return
  }
}

// -----
module {
  func.func @transpose_i16(%arg0: vector<[8]x[8]xi16>) {
    %0 = vector.transpose %arg0, [1, 0] : vector<[8]x[8]xi16> to vector<[8]x[8]xi16>
    "prevent.dce"(%0) : (vector<[8]x[8]xi16>) -> ()
    return
  }
}

// -----
module {
  func.func @transpose_i32(%arg0: vector<[4]x[4]xi32>) {
    %0 = vector.transpose %arg0, [1, 0] : vector<[4]x[4]xi32> to vector<[4]x[4]xi32>
    "prevent.dce"(%0) : (vector<[4]x[4]xi32>) -> ()
    return
  }
}

// -----
module {
  func.func @transpose_i64(%arg0: vector<[2]x[2]xi64>) {
    %0 = vector.transpose %arg0, [1, 0] : vector<[2]x[2]xi64> to vector<[2]x[2]xi64>
    "prevent.dce"(%0) : (vector<[2]x[2]xi64>) -> ()
    return
  }
}

// -----
module {
  func.func @transpose_i128(%arg0: vector<[1]x[1]xi128>) {
    %0 = vector.transpose %arg0, [1, 0] : vector<[1]x[1]xi128> to vector<[1]x[1]xi128>
    "prevent.dce"(%0) : (vector<[1]x[1]xi128>) -> ()
    return
  }
}

// -----
module {
  func.func @transpose_f16(%arg0: vector<[8]x[8]xf16>) {
    %0 = vector.transpose %arg0, [1, 0] : vector<[8]x[8]xf16> to vector<[8]x[8]xf16>
    "prevent.dce"(%0) : (vector<[8]x[8]xf16>) -> ()
    return
  }
}

// -----
module {
  func.func @transpose_bf16(%arg0: vector<[8]x[8]xbf16>) {
    %0 = vector.transpose %arg0, [1, 0] : vector<[8]x[8]xbf16> to vector<[8]x[8]xbf16>
    "prevent.dce"(%0) : (vector<[8]x[8]xbf16>) -> ()
    return
  }
}

// -----
module {
  func.func @transpose_f32(%arg0: vector<[4]x[4]xf32>) {
    %0 = vector.transpose %arg0, [1, 0] : vector<[4]x[4]xf32> to vector<[4]x[4]xf32>
    "prevent.dce"(%0) : (vector<[4]x[4]xf32>) -> ()
    return
  }
}

// -----
module {
  func.func @transpose_f64(%arg0: vector<[2]x[2]xf64>) {
    %0 = vector.transpose %arg0, [1, 0] : vector<[2]x[2]xf64> to vector<[2]x[2]xf64>
    "prevent.dce"(%0) : (vector<[2]x[2]xf64>) -> ()
    return
  }
}

// -----
module {
  func.func @vector_outerproduct_masked_f16(%arg0: vector<[8]xf16>, %arg1: vector<[8]xf16>, %arg2: vector<[8]x[8]xf16>, %arg3: index, %arg4: index) {
    %0 = vector.create_mask %arg3, %arg4 : vector<[8]x[8]xi1>
    %1 = vector.mask %0 { vector.outerproduct %arg0, %arg1, %arg2 {kind = #vector.kind<add>} : vector<[8]xf16>, vector<[8]xf16> } : vector<[8]x[8]xi1> -> vector<[8]x[8]xf16>
    "prevent.dce"(%1) : (vector<[8]x[8]xf16>) -> ()
  }
}

// -----
module {
  func.func @vector_outerproduct_masked_bf16(%arg0: vector<[8]xbf16>, %arg1: vector<[8]xbf16>, %arg2: vector<[8]x[8]xbf16>, %arg3: index, %arg4: index) {
    %0 = vector.create_mask %arg3, %arg4 : vector<[8]x[8]xi1>
    %1 = vector.mask %0 { vector.outerproduct %arg0, %arg1, %arg2 {kind = #vector.kind<add>} : vector<[8]xbf16>, vector<[8]xbf16> } : vector<[8]x[8]xi1> -> vector<[8]x[8]xbf16>
    "prevent.dce"(%1) : (vector<[8]x[8]xbf16>) -> ()
  }
}

// -----
module {
  func.func @vector_outerproduct_masked_f32(%arg0: vector<[4]xf32>, %arg1: vector<[4]xf32>, %arg2: vector<[4]x[4]xf32>, %arg3: index, %arg4: index) {
    %0 = vector.create_mask %arg3, %arg4 : vector<[4]x[4]xi1>
    %1 = vector.mask %0 { vector.outerproduct %arg0, %arg1, %arg2 {kind = #vector.kind<add>} : vector<[4]xf32>, vector<[4]xf32> } : vector<[4]x[4]xi1> -> vector<[4]x[4]xf32>
    "prevent.dce"(%1) : (vector<[4]x[4]xf32>) -> ()
  }
}

// -----
module {
  func.func @vector_outerproduct_masked_f64(%arg0: vector<[2]xf64>, %arg1: vector<[2]xf64>, %arg2: vector<[2]x[2]xf64>, %arg3: index, %arg4: index) {
    %0 = vector.create_mask %arg3, %arg4 : vector<[2]x[2]xi1>
    %1 = vector.mask %0 { vector.outerproduct %arg0, %arg1, %arg2 {kind = #vector.kind<add>} : vector<[2]xf64>, vector<[2]xf64> } : vector<[2]x[2]xi1> -> vector<[2]x[2]xf64>
    "prevent.dce"(%1) : (vector<[2]x[2]xf64>) -> ()
  }
}

// -----
module {
  func.func @vector_outerproduct_f16(%arg0: vector<[8]xf16>, %arg1: vector<[8]xf16>, %arg2: vector<[8]x[8]xf16>) {
    %0 = vector.outerproduct %arg0, %arg1, %arg2 {kind = #vector.kind<add>} : vector<[8]xf16>, vector<[8]xf16>
    "prevent.dce"(%0) : (vector<[8]x[8]xf16>) -> ()
  }
}

// -----
module {
  func.func @vector_outerproduct_bf16(%arg0: vector<[8]xbf16>, %arg1: vector<[8]xbf16>, %arg2: vector<[8]x[8]xbf16>) {
    %0 = vector.outerproduct %arg0, %arg1, %arg2 {kind = #vector.kind<add>} : vector<[8]xbf16>, vector<[8]xbf16>
    "prevent.dce"(%0) : (vector<[8]x[8]xbf16>) -> ()
  }
}

// -----
module {
  func.func @vector_outerproduct_f32(%arg0: vector<[4]xf32>, %arg1: vector<[4]xf32>, %arg2: vector<[4]x[4]xf32>) {
    %0 = vector.outerproduct %arg0, %arg1, %arg2 {kind = #vector.kind<add>} : vector<[4]xf32>, vector<[4]xf32>
    "prevent.dce"(%0) : (vector<[4]x[4]xf32>) -> ()
  }
}

// -----
module {
  func.func @vector_outerproduct_f64(%arg0: vector<[2]xf64>, %arg1: vector<[2]xf64>, %arg2: vector<[2]x[2]xf64>) {
    %0 = vector.outerproduct %arg0, %arg1, %arg2 {kind = #vector.kind<add>} : vector<[2]xf64>, vector<[2]xf64>
    "prevent.dce"(%0) : (vector<[2]x[2]xf64>) -> ()
  }
}

// -----
module {
  func.func @vector_print_tile(%arg0: vector<[4]x[4]xf32>) {
    vector.print %arg0 : vector<[4]x[4]xf32>
    return
  }
}

// -----
module {
  func.func @vector_load_i8_with_offset(%arg0: memref<?x?xi8>) -> vector<[16]x[16]xi8> {
    %c0 = arith.constant 0 : index
    %c123 = arith.constant 123 : index
    %0 = vector.load %arg0[%c123, %c0] : memref<?x?xi8>, vector<[16]x[16]xi8>
    return %0 : vector<[16]x[16]xi8>
  }
}

// -----
module {
  func.func @vector_load_i16(%arg0: memref<?x?xi16>) -> vector<[8]x[8]xi16> {
    %c0 = arith.constant 0 : index
    %0 = vector.load %arg0[%c0, %c0] : memref<?x?xi16>, vector<[8]x[8]xi16>
    return %0 : vector<[8]x[8]xi16>
  }
}

// -----
module {
  func.func @vector_load_i32(%arg0: memref<?x?xi32>) -> vector<[4]x[4]xi32> {
    %c0 = arith.constant 0 : index
    %0 = vector.load %arg0[%c0, %c0] : memref<?x?xi32>, vector<[4]x[4]xi32>
    return %0 : vector<[4]x[4]xi32>
  }
}

// -----
module {
  func.func @vector_load_i64(%arg0: memref<?x?xi64>) -> vector<[2]x[2]xi64> {
    %c0 = arith.constant 0 : index
    %0 = vector.load %arg0[%c0, %c0] : memref<?x?xi64>, vector<[2]x[2]xi64>
    return %0 : vector<[2]x[2]xi64>
  }
}

// -----
module {
  func.func @vector_load_f16(%arg0: memref<?x?xf16>) -> vector<[8]x[8]xf16> {
    %c0 = arith.constant 0 : index
    %0 = vector.load %arg0[%c0, %c0] : memref<?x?xf16>, vector<[8]x[8]xf16>
    return %0 : vector<[8]x[8]xf16>
  }
}

// -----
module {
  func.func @vector_load_bf16(%arg0: memref<?x?xbf16>) -> vector<[8]x[8]xbf16> {
    %c0 = arith.constant 0 : index
    %0 = vector.load %arg0[%c0, %c0] : memref<?x?xbf16>, vector<[8]x[8]xbf16>
    return %0 : vector<[8]x[8]xbf16>
  }
}

// -----
module {
  func.func @vector_load_f32(%arg0: memref<?x?xf32>) -> vector<[4]x[4]xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.load %arg0[%c0, %c0] : memref<?x?xf32>, vector<[4]x[4]xf32>
    return %0 : vector<[4]x[4]xf32>
  }
}

// -----
module {
  func.func @vector_load_f64(%arg0: memref<?x?xf64>) -> vector<[2]x[2]xf64> {
    %c0 = arith.constant 0 : index
    %0 = vector.load %arg0[%c0, %c0] : memref<?x?xf64>, vector<[2]x[2]xf64>
    return %0 : vector<[2]x[2]xf64>
  }
}

// -----
module {
  func.func @vector_load_i128(%arg0: memref<?x?xi128>) -> vector<[1]x[1]xi128> {
    %c0 = arith.constant 0 : index
    %0 = vector.load %arg0[%c0, %c0] : memref<?x?xi128>, vector<[1]x[1]xi128>
    return %0 : vector<[1]x[1]xi128>
  }
}

// -----
module {
  func.func @vector_store_i8(%arg0: memref<?x?xi8>) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[16]x[16]xi8>
    vector.store %0, %arg0[%c0, %c0] : memref<?x?xi8>, vector<[16]x[16]xi8>
    return
  }
}

// -----
module {
  func.func @vector_store_i16(%arg0: memref<?x?xi16>) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[8]x[8]xi16>
    vector.store %0, %arg0[%c0, %c0] : memref<?x?xi16>, vector<[8]x[8]xi16>
    return
  }
}

// -----
module {
  func.func @vector_store_i32(%arg0: memref<?x?xi32>) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[4]x[4]xi32>
    vector.store %0, %arg0[%c0, %c0] : memref<?x?xi32>, vector<[4]x[4]xi32>
    return
  }
}

// -----
module {
  func.func @vector_store_i64(%arg0: memref<?x?xi64>) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[2]x[2]xi64>
    vector.store %0, %arg0[%c0, %c0] : memref<?x?xi64>, vector<[2]x[2]xi64>
    return
  }
}

// -----
module {
  func.func @vector_store_f16(%arg0: memref<?x?xf16>) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[8]x[8]xf16>
    vector.store %0, %arg0[%c0, %c0] : memref<?x?xf16>, vector<[8]x[8]xf16>
    return
  }
}

// -----
module {
  func.func @vector_store_bf16(%arg0: memref<?x?xbf16>) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[8]x[8]xbf16>
    vector.store %0, %arg0[%c0, %c0] : memref<?x?xbf16>, vector<[8]x[8]xbf16>
    return
  }
}

// -----
module {
  func.func @vector_store_f32(%arg0: memref<?x?xf32>) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[4]x[4]xf32>
    vector.store %0, %arg0[%c0, %c0] : memref<?x?xf32>, vector<[4]x[4]xf32>
    return
  }
}

// -----
module {
  func.func @vector_store_f64(%arg0: memref<?x?xf64>) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[2]x[2]xf64>
    vector.store %0, %arg0[%c0, %c0] : memref<?x?xf64>, vector<[2]x[2]xf64>
    return
  }
}

// -----
module {
  func.func @vector_store_i128(%arg0: memref<?x?xi128>) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[1]x[1]xi128>
    vector.store %0, %arg0[%c0, %c0] : memref<?x?xi128>, vector<[1]x[1]xi128>
    return
  }
}

// -----
module {
  func.func @vector_insert_slice_i32(%arg0: vector<[4]xi32>, %arg1: index) -> vector<[4]x[4]xi32> {
    %0 = arm_sme.get_tile : vector<[4]x[4]xi32>
    %1 = vector.insert %arg0, %0 [%arg1] : vector<[4]xi32> into vector<[4]x[4]xi32>
    return %1 : vector<[4]x[4]xi32>
  }
}

// -----
module {
  func.func @vector_insert_slice_i8(%arg0: vector<[16]xi8>, %arg1: index) -> vector<[16]x[16]xi8> {
    %0 = arm_sme.get_tile : vector<[16]x[16]xi8>
    %1 = vector.insert %arg0, %0 [%arg1] : vector<[16]xi8> into vector<[16]x[16]xi8>
    return %1 : vector<[16]x[16]xi8>
  }
}

// -----
module {
  func.func @vector_insert_slice_i16(%arg0: vector<[8]xi16>, %arg1: index) -> vector<[8]x[8]xi16> {
    %0 = arm_sme.get_tile : vector<[8]x[8]xi16>
    %1 = vector.insert %arg0, %0 [%arg1] : vector<[8]xi16> into vector<[8]x[8]xi16>
    return %1 : vector<[8]x[8]xi16>
  }
}

// -----
module {
  func.func @vector_insert_slice_i64(%arg0: vector<[2]xi64>, %arg1: index) -> vector<[2]x[2]xi64> {
    %0 = arm_sme.get_tile : vector<[2]x[2]xi64>
    %1 = vector.insert %arg0, %0 [%arg1] : vector<[2]xi64> into vector<[2]x[2]xi64>
    return %1 : vector<[2]x[2]xi64>
  }
}

// -----
module {
  func.func @vector_insert_slice_i128(%arg0: vector<[1]xi128>, %arg1: index) -> vector<[1]x[1]xi128> {
    %0 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %1 = vector.insert %arg0, %0 [%arg1] : vector<[1]xi128> into vector<[1]x[1]xi128>
    return %1 : vector<[1]x[1]xi128>
  }
}

// -----
module {
  func.func @vector_insert_slice_f16(%arg0: vector<[8]xf16>, %arg1: index) -> vector<[8]x[8]xf16> {
    %0 = arm_sme.get_tile : vector<[8]x[8]xf16>
    %1 = vector.insert %arg0, %0 [%arg1] : vector<[8]xf16> into vector<[8]x[8]xf16>
    return %1 : vector<[8]x[8]xf16>
  }
}

// -----
module {
  func.func @vector_insert_slice_bf16(%arg0: vector<[8]xbf16>, %arg1: index) -> vector<[8]x[8]xbf16> {
    %0 = arm_sme.get_tile : vector<[8]x[8]xbf16>
    %1 = vector.insert %arg0, %0 [%arg1] : vector<[8]xbf16> into vector<[8]x[8]xbf16>
    return %1 : vector<[8]x[8]xbf16>
  }
}

// -----
module {
  func.func @vector_insert_slice_f32(%arg0: vector<[4]xf32>, %arg1: index) -> vector<[4]x[4]xf32> {
    %0 = arm_sme.get_tile : vector<[4]x[4]xf32>
    %1 = vector.insert %arg0, %0 [%arg1] : vector<[4]xf32> into vector<[4]x[4]xf32>
    return %1 : vector<[4]x[4]xf32>
  }
}

// -----
module {
  func.func @vector_insert_slice_f64(%arg0: vector<[2]xf64>, %arg1: index) -> vector<[2]x[2]xf64> {
    %0 = arm_sme.get_tile : vector<[2]x[2]xf64>
    %1 = vector.insert %arg0, %0 [%arg1] : vector<[2]xf64> into vector<[2]x[2]xf64>
    return %1 : vector<[2]x[2]xf64>
  }
}

// -----
module {
  func.func @vector_insert_element_i32(%arg0: i32, %arg1: index, %arg2: index) -> vector<[4]x[4]xi32> {
    %0 = arm_sme.get_tile : vector<[4]x[4]xi32>
    %1 = vector.insert %arg0, %0 [%arg1, %arg2] : i32 into vector<[4]x[4]xi32>
    return %1 : vector<[4]x[4]xi32>
  }
}

// -----
module {
  func.func @vector_insert_element_i8(%arg0: i8, %arg1: index, %arg2: index) -> vector<[16]x[16]xi8> {
    %0 = arm_sme.get_tile : vector<[16]x[16]xi8>
    %1 = vector.insert %arg0, %0 [%arg1, %arg2] : i8 into vector<[16]x[16]xi8>
    return %1 : vector<[16]x[16]xi8>
  }
}

// -----
module {
  func.func @vector_insert_element_i16(%arg0: i16, %arg1: index, %arg2: index) -> vector<[8]x[8]xi16> {
    %0 = arm_sme.get_tile : vector<[8]x[8]xi16>
    %1 = vector.insert %arg0, %0 [%arg1, %arg2] : i16 into vector<[8]x[8]xi16>
    return %1 : vector<[8]x[8]xi16>
  }
}

// -----
module {
  func.func @vector_insert_element_i64(%arg0: i64, %arg1: index, %arg2: index) -> vector<[2]x[2]xi64> {
    %0 = arm_sme.get_tile : vector<[2]x[2]xi64>
    %1 = vector.insert %arg0, %0 [%arg1, %arg2] : i64 into vector<[2]x[2]xi64>
    return %1 : vector<[2]x[2]xi64>
  }
}

// -----
module {
  func.func @vector_insert_element_i128(%arg0: i128, %arg1: index, %arg2: index) -> vector<[1]x[1]xi128> {
    %0 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %1 = vector.insert %arg0, %0 [%arg1, %arg2] : i128 into vector<[1]x[1]xi128>
    return %1 : vector<[1]x[1]xi128>
  }
}

// -----
module {
  func.func @vector_insert_element_f16(%arg0: f16, %arg1: index, %arg2: index) -> vector<[8]x[8]xf16> {
    %0 = arm_sme.get_tile : vector<[8]x[8]xf16>
    %1 = vector.insert %arg0, %0 [%arg1, %arg2] : f16 into vector<[8]x[8]xf16>
    return %1 : vector<[8]x[8]xf16>
  }
}

// -----
module {
  func.func @vector_insert_element_bf16(%arg0: bf16, %arg1: index, %arg2: index) -> vector<[8]x[8]xbf16> {
    %0 = arm_sme.get_tile : vector<[8]x[8]xbf16>
    %1 = vector.insert %arg0, %0 [%arg1, %arg2] : bf16 into vector<[8]x[8]xbf16>
    return %1 : vector<[8]x[8]xbf16>
  }
}

// -----
module {
  func.func @vector_insert_element_f32(%arg0: f32, %arg1: index, %arg2: index) -> vector<[4]x[4]xf32> {
    %0 = arm_sme.get_tile : vector<[4]x[4]xf32>
    %1 = vector.insert %arg0, %0 [%arg1, %arg2] : f32 into vector<[4]x[4]xf32>
    return %1 : vector<[4]x[4]xf32>
  }
}

// -----
module {
  func.func @vector_insert_element_f64(%arg0: f64, %arg1: index, %arg2: index) -> vector<[2]x[2]xf64> {
    %0 = arm_sme.get_tile : vector<[2]x[2]xf64>
    %1 = vector.insert %arg0, %0 [%arg1, %arg2] : f64 into vector<[2]x[2]xf64>
    return %1 : vector<[2]x[2]xf64>
  }
}

// -----
module {
  func.func @vector_extract_slice_i32(%arg0: index) -> vector<[4]xi32> {
    %0 = arm_sme.get_tile : vector<[4]x[4]xi32>
    %1 = vector.extract %0[%arg0] : vector<[4]xi32> from vector<[4]x[4]xi32>
    return %1 : vector<[4]xi32>
  }
}

// -----
module {
  func.func @vector_extract_slice_i8(%arg0: index) -> vector<[16]xi8> {
    %0 = arm_sme.get_tile : vector<[16]x[16]xi8>
    %1 = vector.extract %0[%arg0] : vector<[16]xi8> from vector<[16]x[16]xi8>
    return %1 : vector<[16]xi8>
  }
}

// -----
module {
  func.func @vector_extract_slice_i16(%arg0: index) -> vector<[8]xi16> {
    %0 = arm_sme.get_tile : vector<[8]x[8]xi16>
    %1 = vector.extract %0[%arg0] : vector<[8]xi16> from vector<[8]x[8]xi16>
    return %1 : vector<[8]xi16>
  }
}

// -----
module {
  func.func @vector_extract_slice_i64(%arg0: index) -> vector<[2]xi64> {
    %0 = arm_sme.get_tile : vector<[2]x[2]xi64>
    %1 = vector.extract %0[%arg0] : vector<[2]xi64> from vector<[2]x[2]xi64>
    return %1 : vector<[2]xi64>
  }
}

// -----
module {
  func.func @vector_extract_slice_i128(%arg0: index) -> vector<[1]xi128> {
    %0 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %1 = vector.extract %0[%arg0] : vector<[1]xi128> from vector<[1]x[1]xi128>
    return %1 : vector<[1]xi128>
  }
}

// -----
module {
  func.func @vector_extract_slice_f16(%arg0: index) -> vector<[8]xf16> {
    %0 = arm_sme.get_tile : vector<[8]x[8]xf16>
    %1 = vector.extract %0[%arg0] : vector<[8]xf16> from vector<[8]x[8]xf16>
    return %1 : vector<[8]xf16>
  }
}

// -----
module {
  func.func @vector_extract_slice_bf16(%arg0: index) -> vector<[8]xbf16> {
    %0 = arm_sme.get_tile : vector<[8]x[8]xbf16>
    %1 = vector.extract %0[%arg0] : vector<[8]xbf16> from vector<[8]x[8]xbf16>
    return %1 : vector<[8]xbf16>
  }
}

// -----
module {
  func.func @vector_extract_slice_f32(%arg0: index) -> vector<[4]xf32> {
    %0 = arm_sme.get_tile : vector<[4]x[4]xf32>
    %1 = vector.extract %0[%arg0] : vector<[4]xf32> from vector<[4]x[4]xf32>
    return %1 : vector<[4]xf32>
  }
}

// -----
module {
  func.func @vector_extract_slice_f64(%arg0: index) -> vector<[2]xf64> {
    %0 = arm_sme.get_tile : vector<[2]x[2]xf64>
    %1 = vector.extract %0[%arg0] : vector<[2]xf64> from vector<[2]x[2]xf64>
    return %1 : vector<[2]xf64>
  }
}

// -----
module {
  func.func @vector_extract_element(%arg0: index, %arg1: index) -> i32 {
    %0 = arm_sme.get_tile : vector<[4]x[4]xi32>
    %1 = vector.extract %0[%arg0, %arg1] : i32 from vector<[4]x[4]xi32>
    return %1 : i32
  }
}

// -----
module {
  func.func @vector_extract_element_i8(%arg0: index, %arg1: index) -> i8 {
    %0 = arm_sme.get_tile : vector<[16]x[16]xi8>
    %1 = vector.extract %0[%arg0, %arg1] : i8 from vector<[16]x[16]xi8>
    return %1 : i8
  }
}

// -----
module {
  func.func @vector_extract_element_i16(%arg0: index, %arg1: index) -> i16 {
    %0 = arm_sme.get_tile : vector<[8]x[8]xi16>
    %1 = vector.extract %0[%arg0, %arg1] : i16 from vector<[8]x[8]xi16>
    return %1 : i16
  }
}

// -----
module {
  func.func @vector_extract_element_i64(%arg0: index, %arg1: index) -> i64 {
    %0 = arm_sme.get_tile : vector<[2]x[2]xi64>
    %1 = vector.extract %0[%arg0, %arg1] : i64 from vector<[2]x[2]xi64>
    return %1 : i64
  }
}

// -----
module {
  func.func @vector_extract_element_i128(%arg0: index, %arg1: index) -> i128 {
    %0 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %1 = vector.extract %0[%arg0, %arg1] : i128 from vector<[1]x[1]xi128>
    return %1 : i128
  }
}

// -----
module {
  func.func @vector_extract_element_f16(%arg0: index, %arg1: index) -> f16 {
    %0 = arm_sme.get_tile : vector<[8]x[8]xf16>
    %1 = vector.extract %0[%arg0, %arg1] : f16 from vector<[8]x[8]xf16>
    return %1 : f16
  }
}

// -----
module {
  func.func @vector_extract_element_bf16(%arg0: index, %arg1: index) -> bf16 {
    %0 = arm_sme.get_tile : vector<[8]x[8]xbf16>
    %1 = vector.extract %0[%arg0, %arg1] : bf16 from vector<[8]x[8]xbf16>
    return %1 : bf16
  }
}

// -----
module {
  func.func @vector_extract_element_f32(%arg0: index, %arg1: index) -> f32 {
    %0 = arm_sme.get_tile : vector<[4]x[4]xf32>
    %1 = vector.extract %0[%arg0, %arg1] : f32 from vector<[4]x[4]xf32>
    return %1 : f32
  }
}

// -----
module {
  func.func @vector_extract_element_f64(%arg0: index, %arg1: index) -> f64 {
    %0 = arm_sme.get_tile : vector<[2]x[2]xf64>
    %1 = vector.extract %0[%arg0, %arg1] : f64 from vector<[2]x[2]xf64>
    return %1 : f64
  }
}

// -----
module {
  func.func @dynamic_vector_extract_mask_to_psel(%arg0: index, %arg1: index, %arg2: index) -> vector<[8]xi1> {
    %0 = vector.create_mask %arg0, %arg1 : vector<[4]x[8]xi1>
    %1 = vector.extract %0[%arg2] : vector<[8]xi1> from vector<[4]x[8]xi1>
    return %1 : vector<[8]xi1>
  }
}

// -----
module {
  func.func @vector_extract_mask_to_psel(%arg0: index, %arg1: index) -> vector<[2]xi1> {
    %0 = vector.create_mask %arg0, %arg1 : vector<[16]x[2]xi1>
    %1 = vector.extract %0[1] : vector<[2]xi1> from vector<[16]x[2]xi1>
    return %1 : vector<[2]xi1>
  }
}

