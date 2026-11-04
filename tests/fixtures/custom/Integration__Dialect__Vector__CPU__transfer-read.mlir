module {
  func.func @transfer_read_1d(%arg0: memref<?xf32>, %arg1: index) {
    %cst = arith.constant -4.200000e+01 : f32
    %0 = vector.transfer_read %arg0[%arg1], %cst : memref<?xf32>, vector<13xf32>
    vector.print %0 : vector<13xf32>
    return
  }
  func.func @transfer_read_mask_1d(%arg0: memref<?xf32>, %arg1: index) {
    %cst = arith.constant -4.200000e+01 : f32
    %cst_0 = arith.constant dense<[false, false, true, true, true, true, true, true, true, true, false, false, false]> : vector<13xi1>
    %0 = vector.transfer_read %arg0[%arg1], %cst, %cst_0 : memref<?xf32>, vector<13xf32>
    vector.print %0 : vector<13xf32>
    return
  }
  func.func @transfer_read_inbounds_4(%arg0: memref<?xf32>, %arg1: index) {
    %cst = arith.constant -4.200000e+01 : f32
    %0 = vector.transfer_read %arg0[%arg1], %cst {in_bounds = [true]} : memref<?xf32>, vector<4xf32>
    vector.print %0 : vector<4xf32>
    return
  }
  func.func @transfer_read_mask_inbounds_4(%arg0: memref<?xf32>, %arg1: index) {
    %cst = arith.constant -4.200000e+01 : f32
    %cst_0 = arith.constant dense<[false, true, false, true]> : vector<4xi1>
    %0 = vector.transfer_read %arg0[%arg1], %cst, %cst_0 {in_bounds = [true]} : memref<?xf32>, vector<4xf32>
    vector.print %0 : vector<4xf32>
    return
  }
  func.func @transfer_write_1d(%arg0: memref<?xf32>, %arg1: index) {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.broadcast %cst : f32 to vector<4xf32>
    vector.transfer_write %0, %arg0[%arg1] : vector<4xf32>, memref<?xf32>
    return
  }
  func.func @entry() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c4 = arith.constant 4 : index
    %c5 = arith.constant 5 : index
    %alloc = memref.alloc(%c5) : memref<?xf32>
    scf.for %arg0 = %c0 to %c5 step %c1 {
      %0 = arith.index_cast %arg0 : index to i32
      %1 = arith.sitofp %0 : i32 to f32
      memref.store %1, %alloc[%arg0] : memref<?xf32>
    }
    call @transfer_read_1d(%alloc, %c2) : (memref<?xf32>, index) -> ()
    call @transfer_read_mask_1d(%alloc, %c2) : (memref<?xf32>, index) -> ()
    call @transfer_write_1d(%alloc, %c3) : (memref<?xf32>, index) -> ()
    call @transfer_read_1d(%alloc, %c0) : (memref<?xf32>, index) -> ()
    call @transfer_read_inbounds_4(%alloc, %c1) : (memref<?xf32>, index) -> ()
    call @transfer_read_mask_inbounds_4(%alloc, %c1) : (memref<?xf32>, index) -> ()
    memref.dealloc %alloc : memref<?xf32>
    return
  }
}

