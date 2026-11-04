#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1) -> (0, d1)>
#map2 = affine_map<(d0, d1) -> (d1, 0)>
module {
  memref.global "private" @gv : memref<3x4xf32> = dense<[[0.000000e+00, 1.000000e+00, 2.000000e+00, 3.000000e+00], [1.000000e+01, 1.100000e+01, 1.200000e+01, 1.300000e+01], [2.000000e+01, 2.100000e+01, 2.200000e+01, 2.300000e+01]]>
  func.func @transfer_read_2d(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index) {
    %cst = arith.constant -4.200000e+01 : f32
    %0 = vector.transfer_read %arg0[%arg1, %arg2], %cst : memref<?x?xf32>, vector<4x9xf32>
    vector.print %0 : vector<4x9xf32>
    return
  }
  func.func @transfer_read_2d_mask(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index) {
    %cst = arith.constant -4.200000e+01 : f32
    %cst_0 = arith.constant dense<[[true, false, true, false, true, true, true, false, true], [false, false, true, true, true, true, true, false, true], [true, true, true, true, true, true, true, false, true], [false, false, true, false, true, true, true, false, true]]> : vector<4x9xi1>
    %0 = vector.transfer_read %arg0[%arg1, %arg2], %cst, %cst_0 : memref<?x?xf32>, vector<4x9xf32>
    vector.print %0 : vector<4x9xf32>
    return
  }
  func.func @transfer_read_2d_mask_transposed(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index) {
    %cst = arith.constant -4.200000e+01 : f32
    %cst_0 = arith.constant dense<[[true, false, true, false, true, true, true, false, true], [false, false, true, true, true, true, true, false, true], [true, true, true, true, true, true, true, false, true], [false, false, true, false, true, true, true, false, true]]> : vector<4x9xi1>
    %0 = vector.transfer_read %arg0[%arg1, %arg2], %cst, %cst_0 {permutation_map = #map} : memref<?x?xf32>, vector<9x4xf32>
    vector.print %0 : vector<9x4xf32>
    return
  }
  func.func @transfer_read_2d_mask_broadcast(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index) {
    %cst = arith.constant -4.200000e+01 : f32
    %cst_0 = arith.constant dense<[true, false, true, false, true, true, true, false, true]> : vector<9xi1>
    %0 = vector.transfer_read %arg0[%arg1, %arg2], %cst, %cst_0 {permutation_map = #map1} : memref<?x?xf32>, vector<4x9xf32>
    vector.print %0 : vector<4x9xf32>
    return
  }
  func.func @transfer_read_2d_mask_transpose_broadcast_last_dim(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index) {
    %cst = arith.constant -4.200000e+01 : f32
    %cst_0 = arith.constant dense<[true, false, true, true]> : vector<4xi1>
    %0 = vector.transfer_read %arg0[%arg1, %arg2], %cst, %cst_0 {permutation_map = #map2} : memref<?x?xf32>, vector<4x9xf32>
    vector.print %0 : vector<4x9xf32>
    return
  }
  func.func @transfer_read_2d_transposed(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index) {
    %cst = arith.constant -4.200000e+01 : f32
    %0 = vector.transfer_read %arg0[%arg1, %arg2], %cst {permutation_map = #map} : memref<?x?xf32>, vector<4x9xf32>
    vector.print %0 : vector<4x9xf32>
    return
  }
  func.func @transfer_read_2d_broadcast(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index) {
    %cst = arith.constant -4.200000e+01 : f32
    %0 = vector.transfer_read %arg0[%arg1, %arg2], %cst {permutation_map = #map2} : memref<?x?xf32>, vector<4x9xf32>
    vector.print %0 : vector<4x9xf32>
    return
  }
  func.func @transfer_write_2d(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index) {
    %cst = arith.constant -1.000000e+00 : f32
    %0 = vector.broadcast %cst : f32 to vector<1x4xf32>
    vector.transfer_write %0, %arg0[%arg1, %arg2] : vector<1x4xf32>, memref<?x?xf32>
    return
  }
  func.func @transfer_write_2d_mask(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index) {
    %cst = arith.constant -2.000000e+00 : f32
    %cst_0 = arith.constant dense<[[true, false, true, false]]> : vector<1x4xi1>
    %0 = vector.broadcast %cst : f32 to vector<1x4xf32>
    vector.transfer_write %0, %arg0[%arg1, %arg2], %cst_0 : vector<1x4xf32>, memref<?x?xf32>
    return
  }
  func.func @entry() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c10 = arith.constant 10 : index
    %0 = memref.get_global @gv : memref<3x4xf32>
    %cast = memref.cast %0 : memref<3x4xf32> to memref<?x?xf32>
    call @transfer_read_2d(%cast, %c1, %c2) : (memref<?x?xf32>, index, index) -> ()
    call @transfer_read_2d(%cast, %c3, %c2) : (memref<?x?xf32>, index, index) -> ()
    call @transfer_read_2d(%cast, %c1, %c10) : (memref<?x?xf32>, index, index) -> ()
    call @transfer_read_2d_transposed(%cast, %c1, %c2) : (memref<?x?xf32>, index, index) -> ()
    call @transfer_read_2d_mask(%cast, %c0, %c0) : (memref<?x?xf32>, index, index) -> ()
    call @transfer_read_2d_mask_transposed(%cast, %c0, %c0) : (memref<?x?xf32>, index, index) -> ()
    call @transfer_read_2d_broadcast(%cast, %c1, %c2) : (memref<?x?xf32>, index, index) -> ()
    call @transfer_read_2d_mask_broadcast(%cast, %c2, %c1) : (memref<?x?xf32>, index, index) -> ()
    call @transfer_read_2d_mask_transpose_broadcast_last_dim(%cast, %c0, %c1) : (memref<?x?xf32>, index, index) -> ()
    call @transfer_write_2d(%cast, %c1, %c2) : (memref<?x?xf32>, index, index) -> ()
    call @transfer_read_2d(%cast, %c0, %c0) : (memref<?x?xf32>, index, index) -> ()
    call @transfer_write_2d_mask(%cast, %c0, %c2) : (memref<?x?xf32>, index, index) -> ()
    call @transfer_read_2d(%cast, %c0, %c0) : (memref<?x?xf32>, index, index) -> ()
    return
  }
}

