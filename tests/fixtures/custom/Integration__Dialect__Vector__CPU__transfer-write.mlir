#map = affine_map<(d0, d1, d2) -> (d2, d0, d1)>
module {
  func.func @transfer_write16_inbounds_1d(%arg0: memref<?xf32>, %arg1: index) {
    %cst = arith.constant 1.600000e+01 : f32
    %0 = vector.broadcast %cst : f32 to vector<16xf32>
    vector.transfer_write %0, %arg0[%arg1] {in_bounds = [true]} : vector<16xf32>, memref<?xf32>
    return
  }
  func.func @transfer_write13_1d(%arg0: memref<?xf32>, %arg1: index) {
    %cst = arith.constant 1.300000e+01 : f32
    %0 = vector.broadcast %cst : f32 to vector<13xf32>
    vector.transfer_write %0, %arg0[%arg1] : vector<13xf32>, memref<?xf32>
    return
  }
  func.func @transfer_write17_1d(%arg0: memref<?xf32>, %arg1: index) {
    %cst = arith.constant 1.700000e+01 : f32
    %0 = vector.broadcast %cst : f32 to vector<17xf32>
    vector.transfer_write %0, %arg0[%arg1] : vector<17xf32>, memref<?xf32>
    return
  }
  func.func @transfer_read_1d(%arg0: memref<?xf32>) -> vector<32xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c0], %cst : memref<?xf32>, vector<32xf32>
    return %0 : vector<32xf32>
  }
  func.func @transfer_write_inbounds_3d(%arg0: memref<4x4x4xf32>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.broadcast %cst : f32 to vector<2x3x4xf32>
    %cst_0 = arith.constant 1.000000e+00 : f32
    %cst_1 = arith.constant 2.000000e+00 : f32
    %cst_2 = arith.constant 3.000000e+00 : f32
    %cst_3 = arith.constant 4.000000e+00 : f32
    %cst_4 = arith.constant 5.000000e+00 : f32
    %cst_5 = arith.constant 6.000000e+00 : f32
    %cst_6 = arith.constant 7.000000e+00 : f32
    %cst_7 = arith.constant 8.000000e+00 : f32
    %1 = vector.insert %cst_0, %0 [0, 0, 0] : f32 into vector<2x3x4xf32>
    %2 = vector.insert %cst_1, %1 [0, 0, 3] : f32 into vector<2x3x4xf32>
    %3 = vector.insert %cst_2, %2 [0, 2, 0] : f32 into vector<2x3x4xf32>
    %4 = vector.insert %cst_3, %3 [0, 2, 3] : f32 into vector<2x3x4xf32>
    %5 = vector.insert %cst_4, %4 [1, 0, 0] : f32 into vector<2x3x4xf32>
    %6 = vector.insert %cst_5, %5 [1, 0, 3] : f32 into vector<2x3x4xf32>
    %7 = vector.insert %cst_6, %6 [1, 2, 0] : f32 into vector<2x3x4xf32>
    %8 = vector.insert %cst_7, %7 [1, 2, 3] : f32 into vector<2x3x4xf32>
    vector.transfer_write %8, %arg0[%c0, %c0, %c0] {in_bounds = [true, true, true], permutation_map = #map} : vector<2x3x4xf32>, memref<4x4x4xf32>
    return
  }
  func.func @entry() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %alloc = memref.alloc(%c32) {alignment = 64 : i64} : memref<?xf32>
    scf.for %arg0 = %c0 to %c32 step %c1 {
      %cst_1 = arith.constant 0.000000e+00 : f32
      memref.store %cst_1, %alloc[%arg0] : memref<?xf32>
    }
    %0 = call @transfer_read_1d(%alloc) : (memref<?xf32>) -> vector<32xf32>
    vector.print %0 : vector<32xf32>
    %c3 = arith.constant 3 : index
    call @transfer_write16_inbounds_1d(%alloc, %c3) : (memref<?xf32>, index) -> ()
    %1 = call @transfer_read_1d(%alloc) : (memref<?xf32>) -> vector<32xf32>
    vector.print %1 : vector<32xf32>
    call @transfer_write13_1d(%alloc, %c3) : (memref<?xf32>, index) -> ()
    %2 = call @transfer_read_1d(%alloc) : (memref<?xf32>) -> vector<32xf32>
    vector.print %2 : vector<32xf32>
    %c7 = arith.constant 7 : index
    call @transfer_write17_1d(%alloc, %c3) : (memref<?xf32>, index) -> ()
    %3 = call @transfer_read_1d(%alloc) : (memref<?xf32>) -> vector<32xf32>
    vector.print %3 : vector<32xf32>
    %c8 = arith.constant 8 : index
    call @transfer_write13_1d(%alloc, %c8) : (memref<?xf32>, index) -> ()
    %4 = call @transfer_read_1d(%alloc) : (memref<?xf32>) -> vector<32xf32>
    vector.print %4 : vector<32xf32>
    %c14 = arith.constant 14 : index
    call @transfer_write17_1d(%alloc, %c14) : (memref<?xf32>, index) -> ()
    %5 = call @transfer_read_1d(%alloc) : (memref<?xf32>) -> vector<32xf32>
    vector.print %5 : vector<32xf32>
    %c19 = arith.constant 19 : index
    call @transfer_write13_1d(%alloc, %c19) : (memref<?xf32>, index) -> ()
    %6 = call @transfer_read_1d(%alloc) : (memref<?xf32>) -> vector<32xf32>
    vector.print %6 : vector<32xf32>
    memref.dealloc %alloc : memref<?xf32>
    %c4 = arith.constant 4 : index
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<4x4x4xf32>
    scf.for %arg0 = %c0 to %c4 step %c1 {
      scf.for %arg1 = %c0 to %c4 step %c1 {
        scf.for %arg2 = %c0 to %c4 step %c1 {
          %cst_1 = arith.constant 0.000000e+00 : f32
          memref.store %cst_1, %alloc_0[%arg0, %arg1, %arg2] : memref<4x4x4xf32>
        }
      }
    }
    call @transfer_write_inbounds_3d(%alloc_0) : (memref<4x4x4xf32>) -> ()
    %cst = arith.constant 0.000000e+00 : f32
    %7 = vector.transfer_read %alloc_0[%c0, %c0, %c0], %cst : memref<4x4x4xf32>, vector<4x4x4xf32>
    vector.print %7 : vector<4x4x4xf32>
    memref.dealloc %alloc_0 : memref<4x4x4xf32>
    return
  }
}

