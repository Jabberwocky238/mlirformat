module {
}

// -----
module {
  func.func @privatize_static_scalar() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c128 = arith.constant 128 : index
    %0 = acc.privatize : () -> !acc.private_type<memref<f32>>
    scf.parallel (%arg0) = (%c0) to (%c128) step (%c1) {
      %1 = acc.private_local %0 : (!acc.private_type<memref<f32>>) -> memref<f32>
      %cst = arith.constant 0.000000e+00 : f32
      memref.store %cst, %1[] : memref<f32>
      scf.reduce 
    } {acc.par_dims = #acc<par_dims[thread_x]>}
    return
  }
}

// -----
module {
  func.func @privatize_with_par_dims_attr() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    %c128 = arith.constant 128 : index
    %0 = acc.privatize [#acc<par_dims[block_x, thread_x]>] : () -> !acc.private_type<memref<i32>>
    scf.parallel (%arg0, %arg1) = (%c0, %c0) to (%c8, %c128) step (%c1, %c1) {
      %1 = acc.private_local %0 : (!acc.private_type<memref<i32>>) -> memref<i32>
      %c0_i32 = arith.constant 0 : i32
      memref.store %c0_i32, %1[] : memref<i32>
      scf.reduce 
    } {acc.par_dims = #acc<par_dims[block_x, thread_x]>}
    return
  }
}

// -----
module {
  func.func @privatize_dynamic_row(%arg0: index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %0 = acc.privatize(%arg0) : (index) -> !acc.private_type<memref<?xf32>>
    scf.parallel (%arg1) = (%c0) to (%c32) step (%c1) {
      %1 = acc.private_local %0 : (!acc.private_type<memref<?xf32>>) -> memref<?xf32>
      %cst = arith.constant 0.000000e+00 : f32
      memref.store %cst, %1[%c0] : memref<?xf32>
      scf.reduce 
    } {acc.par_dims = #acc<par_dims[thread_x]>}
    return
  }
}

// -----
module {
  func.func @privatize_dynamic_and_par_dims(%arg0: index, %arg1: index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c16 = arith.constant 16 : index
    %0 = acc.privatize(%arg0, %arg1) [#acc<par_dims[block_x, thread_x]>] : (index, index) -> !acc.private_type<memref<?x?xi32>>
    scf.parallel (%arg2, %arg3) = (%c0, %c0) to (%c4, %c16) step (%c1, %c1) {
      %1 = acc.private_local %0 : (!acc.private_type<memref<?x?xi32>>) -> memref<?x?xi32>
      %c0_i32 = arith.constant 0 : i32
      memref.store %c0_i32, %1[%c0, %c0] : memref<?x?xi32>
      scf.reduce 
    } {acc.par_dims = #acc<par_dims[block_x, thread_x]>}
    return
  }
}

// -----
module {
  func.func @privatize_inside_compute_region(%arg0: memref<64xf32>) {
    %0 = acc.copyin varPtr(%arg0 : memref<64xf32>) -> memref<64xf32>
    acc.kernel_environment dataOperands(%0 : memref<64xf32>) {
      %c64 = arith.constant 64 : index
      %1 = acc.par_width %c64 {par_dim = #acc.par_dim<thread_x>}
      acc.compute_region launch(%arg1 = %1) ins(%arg2 = %0) : (memref<64xf32>) {
        %2 = acc.privatize [#acc<par_dims[thread_x]>] : () -> !acc.private_type<memref<f32>>
        %c0 = arith.constant 0 : index
        %c1 = arith.constant 1 : index
        %c64_0 = arith.constant 64 : index
        scf.parallel (%arg3) = (%c0) to (%c64_0) step (%c1) {
          %3 = acc.private_local %2 : (!acc.private_type<memref<f32>>) -> memref<f32>
          %4 = memref.load %arg2[%arg3] : memref<64xf32>
          memref.store %4, %3[] : memref<f32>
          scf.reduce 
        } {acc.par_dims = #acc<par_dims[thread_x]>}
        acc.yield
      } {origin = "acc.parallel"}
    }
    acc.delete accPtr(%0 : memref<64xf32>)
    return
  }
}

// -----
module {
  func.func @unwrap_private_to_memref() {
    %0 = acc.privatize : () -> !acc.private_type<memref<i32>>
    %1 = acc.unwrap_private %0 : !acc.private_type<memref<i32>> to memref<i32>
    %c0_i32 = arith.constant 0 : i32
    memref.store %c0_i32, %1[] : memref<i32>
    return
  }
}

// -----
module {
  func.func @unwrap_private_to_byte_memref() {
    %0 = acc.privatize : () -> !acc.private_type<memref<f64>>
    %1 = acc.unwrap_private %0 : !acc.private_type<memref<f64>> to memref<?xi8>
    return
  }
}

