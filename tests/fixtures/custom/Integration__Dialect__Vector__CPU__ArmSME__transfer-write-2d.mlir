#map = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func @transfer_write_2d(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index) {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.broadcast %cst : f32 to vector<[4]x[4]xf32>
    vector.transfer_write %0, %arg0[%arg1, %arg2] {in_bounds = [true, true]} : vector<[4]x[4]xf32>, memref<?x?xf32>
    return
  }
  func.func @transfer_write_2d_mask(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index) {
    %cst = arith.constant 0.000000e+00 : f32
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %0 = vector.create_mask %c2, %c3 : vector<[4]x[4]xi1>
    %1 = vector.broadcast %cst : f32 to vector<[4]x[4]xf32>
    vector.transfer_write %1, %arg0[%arg1, %arg2], %0 {in_bounds = [true, true]} : vector<[4]x[4]xf32>, memref<?x?xf32>
    return
  }
  func.func @transfer_write_2d_transposed(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index) {
    %0 = vector.load %arg0[%arg1, %arg2] : memref<?x?xf32>, vector<[4]x[4]xf32>
    vector.transfer_write %0, %arg0[%arg1, %arg2] {in_bounds = [true, true], permutation_map = #map} : vector<[4]x[4]xf32>, memref<?x?xf32>
    return
  }
  func.func @transfer_write_2d_mask_transposed(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index) {
    %c2 = arith.constant 2 : index
    %c4 = arith.constant 4 : index
    %0 = vector.create_mask %c4, %c2 : vector<[4]x[4]xi1>
    %1 = vector.load %arg0[%arg1, %arg2] : memref<?x?xf32>, vector<[4]x[4]xf32>
    vector.transfer_write %1, %arg0[%arg1, %arg2], %0 {in_bounds = [true, true], permutation_map = #map} : vector<[4]x[4]xf32>, memref<?x?xf32>
    return
  }
  func.func @load_and_print(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index) {
    %0 = vector.load %arg0[%arg1, %arg2] : memref<?x?xf32>, vector<[4]x[4]xf32>
    vector.print str "TILE BEGIN:\0A"
    vector.print %0 : vector<[4]x[4]xf32>
    return
  }
  func.func @initialize_memory(%arg0: index, %arg1: index) -> memref<?x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 1.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+01 : f32
    %alloc = memref.alloc(%arg0, %arg1) : memref<?x?xf32>
    %cst_1 = arith.constant 0.000000e+00 : f32
    %0 = scf.for %arg2 = %c0 to %arg0 step %c1 iter_args(%arg3 = %cst_1) -> (f32) {
      %1 = scf.for %arg4 = %c0 to %arg1 step %c1 iter_args(%arg5 = %arg3) -> (f32) {
        memref.store %arg5, %alloc[%arg2, %arg4] : memref<?x?xf32>
        %3 = arith.addf %arg5, %cst : f32
        scf.yield %3 : f32
      }
      %2 = arith.addf %arg3, %cst_0 : f32
      scf.yield %2 : f32
    }
    return %alloc : memref<?x?xf32>
  }
  func.func @entry() {
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %c4 = arith.constant 4 : index
    %0 = arm_sme.streaming_vl <word>
    %1 = arith.addi %0, %c2 : index
    %2 = call @initialize_memory(%1, %1) : (index, index) -> memref<?x?xf32>
    call @load_and_print(%2, %c0, %c0) : (memref<?x?xf32>, index, index) -> ()
    call @transfer_write_2d(%2, %c2, %c2) : (memref<?x?xf32>, index, index) -> ()
    call @load_and_print(%2, %c0, %c0) : (memref<?x?xf32>, index, index) -> ()
    call @transfer_write_2d_mask(%2, %c0, %c0) : (memref<?x?xf32>, index, index) -> ()
    call @load_and_print(%2, %c0, %c0) : (memref<?x?xf32>, index, index) -> ()
    call @transfer_write_2d_transposed(%2, %c0, %c0) : (memref<?x?xf32>, index, index) -> ()
    call @load_and_print(%2, %c0, %c0) : (memref<?x?xf32>, index, index) -> ()
    call @transfer_write_2d_mask_transposed(%2, %c0, %c0) : (memref<?x?xf32>, index, index) -> ()
    call @load_and_print(%2, %c0, %c0) : (memref<?x?xf32>, index, index) -> ()
    memref.dealloc %2 : memref<?x?xf32>
    return
  }
}

