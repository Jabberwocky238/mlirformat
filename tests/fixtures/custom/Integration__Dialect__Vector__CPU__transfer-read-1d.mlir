#map = affine_map<(d0, d1) -> (d0)>
#map1 = affine_map<(d0, d1) -> (0)>
module {
  memref.global "private" @gv : memref<5x6xf32> = dense<[[0.000000e+00, 1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00], [1.000000e+01, 1.100000e+01, 1.200000e+01, 1.300000e+01, 1.400000e+01, 1.500000e+01], [2.000000e+01, 2.100000e+01, 2.200000e+01, 2.300000e+01, 2.400000e+01, 2.500000e+01], [3.000000e+01, 3.100000e+01, 3.200000e+01, 3.300000e+01, 3.400000e+01, 3.500000e+01], [4.000000e+01, 4.100000e+01, 4.200000e+01, 4.300000e+01, 4.400000e+01, 4.500000e+01]]>
  func.func @transfer_read_1d(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index) {
    %cst = arith.constant -4.200000e+01 : f32
    %0 = vector.transfer_read %arg0[%arg1, %arg2], %cst {permutation_map = #map} : memref<?x?xf32>, vector<9xf32>
    vector.print %0 : vector<9xf32>
    return
  }
  func.func @transfer_read_1d_unit_stride(%arg0: memref<?x?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c4 = arith.constant 4 : index
    %c5 = arith.constant 5 : index
    %c6 = arith.constant 6 : index
    %cst = arith.constant -4.200000e+01 : f32
    scf.for %arg1 = %c1 to %c5 step %c2 {
      scf.for %arg2 = %c0 to %c6 step %c3 {
        %subview = memref.subview %arg0[%arg1, %arg2] [1, 2] [1, 1] : memref<?x?xf32> to memref<1x2xf32, strided<[?, 1], offset: ?>>
        %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true]} : memref<1x2xf32, strided<[?, 1], offset: ?>>, vector<2xf32>
        vector.print %0 : vector<2xf32>
      }
    }
    return
  }
  func.func @transfer_read_1d_non_static_unit_stride(%arg0: memref<?x?xf32>) {
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c4 = arith.constant 4 : index
    %c6 = arith.constant 6 : index
    %cst = arith.constant -4.200000e+01 : f32
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%c6], sizes: [%c4, %c6], strides: [%c6, %c1] : memref<?x?xf32> to memref<?x?xf32, strided<[?, ?], offset: ?>>
    %0 = vector.transfer_read %reinterpret_cast[%c2, %c1], %cst {in_bounds = [true]} : memref<?x?xf32, strided<[?, ?], offset: ?>>, vector<4xf32>
    vector.print %0 : vector<4xf32>
    return
  }
  func.func @transfer_read_1d_non_unit_stride(%arg0: memref<?x?xf32>) {
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [0], sizes: [4, 3], strides: [6, 2] : memref<?x?xf32> to memref<4x3xf32, strided<[6, 2]>>
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %cst = arith.constant -4.200000e+01 : f32
    %0 = vector.transfer_read %reinterpret_cast[%c2, %c1], %cst : memref<4x3xf32, strided<[6, 2]>>, vector<3xf32>
    vector.print %0 : vector<3xf32>
    return
  }
  func.func @transfer_read_1d_broadcast(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index) {
    %cst = arith.constant -4.200000e+01 : f32
    %0 = vector.transfer_read %arg0[%arg1, %arg2], %cst {permutation_map = #map1} : memref<?x?xf32>, vector<9xf32>
    vector.print %0 : vector<9xf32>
    return
  }
  func.func @transfer_read_1d_in_bounds(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index) {
    %cst = arith.constant -4.200000e+01 : f32
    %0 = vector.transfer_read %arg0[%arg1, %arg2], %cst {in_bounds = [true], permutation_map = #map} : memref<?x?xf32>, vector<3xf32>
    vector.print %0 : vector<3xf32>
    return
  }
  func.func @transfer_read_1d_mask(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index) {
    %cst = arith.constant -4.200000e+01 : f32
    %cst_0 = arith.constant dense<[true, false, true, false, true, true, true, false, true]> : vector<9xi1>
    %0 = vector.transfer_read %arg0[%arg1, %arg2], %cst, %cst_0 {permutation_map = #map} : memref<?x?xf32>, vector<9xf32>
    vector.print %0 : vector<9xf32>
    return
  }
  func.func @transfer_read_1d_out_of_bounds(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index) {
    %cst = arith.constant -4.200000e+01 : f32
    %0 = vector.transfer_read %arg0[%arg1, %arg2], %cst {permutation_map = #map} : memref<?x?xf32>, vector<3xf32>
    vector.print %0 : vector<3xf32>
    return
  }
  func.func @transfer_read_1d_mask_in_bounds(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index) {
    %cst = arith.constant -4.200000e+01 : f32
    %cst_0 = arith.constant dense<[true, false, true]> : vector<3xi1>
    %0 = vector.transfer_read %arg0[%arg1, %arg2], %cst, %cst_0 {in_bounds = [true], permutation_map = #map} : memref<?x?xf32>, vector<3xf32>
    vector.print %0 : vector<3xf32>
    return
  }
  func.func @transfer_write_1d(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index) {
    %cst = arith.constant -1.000000e+00 : f32
    %0 = vector.broadcast %cst : f32 to vector<7xf32>
    vector.transfer_write %0, %arg0[%arg1, %arg2] {permutation_map = #map} : vector<7xf32>, memref<?x?xf32>
    return
  }
  func.func @transfer_write_1d_mask(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index) {
    %cst = arith.constant -2.000000e+00 : f32
    %0 = vector.broadcast %cst : f32 to vector<7xf32>
    %cst_0 = arith.constant dense<[true, false, true, false, true, true, true]> : vector<7xi1>
    vector.transfer_write %0, %arg0[%arg1, %arg2], %cst_0 {permutation_map = #map} : vector<7xf32>, memref<?x?xf32>
    return
  }
  func.func @entry() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c10 = arith.constant 10 : index
    %0 = memref.get_global @gv : memref<5x6xf32>
    %cast = memref.cast %0 : memref<5x6xf32> to memref<?x?xf32>
    call @transfer_read_1d(%cast, %c1, %c2) : (memref<?x?xf32>, index, index) -> ()
    call @transfer_read_1d_unit_stride(%cast) : (memref<?x?xf32>) -> ()
    call @transfer_read_1d_non_static_unit_stride(%cast) : (memref<?x?xf32>) -> ()
    call @transfer_read_1d_out_of_bounds(%cast, %c10, %c1) : (memref<?x?xf32>, index, index) -> ()
    call @transfer_read_1d_non_unit_stride(%cast) : (memref<?x?xf32>) -> ()
    call @transfer_write_1d(%cast, %c3, %c2) : (memref<?x?xf32>, index, index) -> ()
    call @transfer_read_1d(%cast, %c0, %c2) : (memref<?x?xf32>, index, index) -> ()
    call @transfer_read_1d_broadcast(%cast, %c1, %c2) : (memref<?x?xf32>, index, index) -> ()
    call @transfer_read_1d_in_bounds(%cast, %c1, %c2) : (memref<?x?xf32>, index, index) -> ()
    call @transfer_read_1d_mask(%cast, %c1, %c2) : (memref<?x?xf32>, index, index) -> ()
    call @transfer_read_1d_mask_in_bounds(%cast, %c1, %c2) : (memref<?x?xf32>, index, index) -> ()
    call @transfer_write_1d_mask(%cast, %c1, %c0) : (memref<?x?xf32>, index, index) -> ()
    call @transfer_read_1d(%cast, %c0, %c0) : (memref<?x?xf32>, index, index) -> ()
    return
  }
}

