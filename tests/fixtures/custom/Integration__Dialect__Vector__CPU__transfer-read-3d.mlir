#map = affine_map<(d0, d1, d2, d3) -> (d1, 0, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d1, 0, 0)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d3, d0, d1)>
module {
  func.func @transfer_read_3d(%arg0: memref<?x?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) {
    %cst = arith.constant -4.200000e+01 : f32
    %0 = vector.transfer_read %arg0[%arg1, %arg2, %arg3, %arg4], %cst : memref<?x?x?x?xf32>, vector<2x5x3xf32>
    vector.print %0 : vector<2x5x3xf32>
    return
  }
  func.func @transfer_read_3d_and_extract(%arg0: memref<?x?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) {
    %cst = arith.constant -4.200000e+01 : f32
    %0 = vector.transfer_read %arg0[%arg1, %arg2, %arg3, %arg4], %cst {in_bounds = [true, true, true]} : memref<?x?x?x?xf32>, vector<2x5x3xf32>
    %1 = vector.extract %0[0] : vector<5x3xf32> from vector<2x5x3xf32>
    vector.print %1 : vector<5x3xf32>
    return
  }
  func.func @transfer_read_3d_broadcast(%arg0: memref<?x?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) {
    %cst = arith.constant -4.200000e+01 : f32
    %0 = vector.transfer_read %arg0[%arg1, %arg2, %arg3, %arg4], %cst {permutation_map = #map} : memref<?x?x?x?xf32>, vector<2x5x3xf32>
    vector.print %0 : vector<2x5x3xf32>
    return
  }
  func.func @transfer_read_3d_mask_broadcast(%arg0: memref<?x?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) {
    %cst = arith.constant -4.200000e+01 : f32
    %cst_0 = arith.constant dense<[false, true]> : vector<2xi1>
    %0 = vector.transfer_read %arg0[%arg1, %arg2, %arg3, %arg4], %cst, %cst_0 {permutation_map = #map1} : memref<?x?x?x?xf32>, vector<2x5x3xf32>
    vector.print %0 : vector<2x5x3xf32>
    return
  }
  func.func @transfer_read_3d_transposed(%arg0: memref<?x?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) {
    %cst = arith.constant -4.200000e+01 : f32
    %0 = vector.transfer_read %arg0[%arg1, %arg2, %arg3, %arg4], %cst {permutation_map = #map2} : memref<?x?x?x?xf32>, vector<3x5x3xf32>
    vector.print %0 : vector<3x5x3xf32>
    return
  }
  func.func @transfer_write_3d(%arg0: memref<?x?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) {
    %cst = arith.constant -1.000000e+00 : f32
    %0 = vector.broadcast %cst : f32 to vector<2x9x3xf32>
    vector.transfer_write %0, %arg0[%arg1, %arg2, %arg3, %arg4] : vector<2x9x3xf32>, memref<?x?x?x?xf32>
    return
  }
  func.func @entry() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %cst = arith.constant 2.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+01 : f32
    %c5 = arith.constant 5 : index
    %c4 = arith.constant 4 : index
    %c2_1 = arith.constant 2 : index
    %c10 = arith.constant 10 : index
    %alloc = memref.alloc(%c10, %c5, %c4, %c2_1) : memref<?x?x?x?xf32>
    scf.for %arg0 = %c0 to %c10 step %c1 {
      scf.for %arg1 = %c0 to %c5 step %c1 {
        %0 = arith.index_cast %arg1 : index to i32
        %1 = arith.sitofp %0 : i32 to f32
        %2 = arith.mulf %1, %cst_0 : f32
        scf.for %arg2 = %c0 to %c4 step %c1 {
          %3 = arith.index_cast %arg2 : index to i32
          %4 = arith.sitofp %3 : i32 to f32
          %5 = arith.addf %2, %4 : f32
          scf.for %arg3 = %c0 to %c2_1 step %c1 {
            %6 = arith.index_cast %arg3 : index to i32
            %7 = arith.sitofp %6 : i32 to f32
            %8 = arith.addf %cst, %7 : f32
            %9 = arith.mulf %5, %8 : f32
            memref.store %9, %alloc[%arg0, %arg1, %arg2, %arg3] : memref<?x?x?x?xf32>
          }
        }
      }
    }
    call @transfer_read_3d(%alloc, %c0, %c0, %c0, %c0) : (memref<?x?x?x?xf32>, index, index, index, index) -> ()
    call @transfer_read_3d_and_extract(%alloc, %c0, %c0, %c0, %c0) : (memref<?x?x?x?xf32>, index, index, index, index) -> ()
    call @transfer_write_3d(%alloc, %c0, %c0, %c1, %c1) : (memref<?x?x?x?xf32>, index, index, index, index) -> ()
    call @transfer_read_3d(%alloc, %c0, %c0, %c0, %c0) : (memref<?x?x?x?xf32>, index, index, index, index) -> ()
    call @transfer_read_3d_transposed(%alloc, %c0, %c0, %c0, %c0) : (memref<?x?x?x?xf32>, index, index, index, index) -> ()
    call @transfer_read_3d_broadcast(%alloc, %c0, %c0, %c0, %c0) : (memref<?x?x?x?xf32>, index, index, index, index) -> ()
    call @transfer_read_3d_mask_broadcast(%alloc, %c0, %c0, %c0, %c0) : (memref<?x?x?x?xf32>, index, index, index, index) -> ()
    memref.dealloc %alloc : memref<?x?x?x?xf32>
    return
  }
}

