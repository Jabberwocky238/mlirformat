module {
  func.func @vector_loop() {
    %c128 = arith.constant 128 : index
    acc.kernel_environment {
      %0 = acc.par_width %c128 {par_dim = #acc.par_dim<thread_x>}
      acc.compute_region launch(%arg0 = %0) {
        %c0 = arith.constant 0 : index
        %c1 = arith.constant 1 : index
        %c128_0 = arith.constant 128 : index
        scf.parallel (%arg1) = (%c0) to (%c128_0) step (%c1) {
          scf.reduce 
        } {acc.par_dims = #acc<par_dims[thread_x]>}
        acc.yield
      } {origin = "acc.parallel"}
    }
    return
  }
}

// -----
module {
  func.func @gang_loop() {
    %c8 = arith.constant 8 : index
    acc.kernel_environment {
      %0 = acc.par_width %c8 {par_dim = #acc.par_dim<block_x>}
      acc.compute_region launch(%arg0 = %0) {
        %c0 = arith.constant 0 : index
        %c1 = arith.constant 1 : index
        %c8_0 = arith.constant 8 : index
        scf.parallel (%arg1) = (%c0) to (%c8_0) step (%c1) {
          scf.reduce 
        } {acc.par_dims = #acc<par_dims[block_x]>}
        acc.yield
      } {origin = "acc.parallel"}
    }
    return
  }
}

// -----
module {
  func.func @worker_loop() {
    %c4 = arith.constant 4 : index
    acc.kernel_environment {
      %0 = acc.par_width %c4 {par_dim = #acc.par_dim<thread_y>}
      acc.compute_region launch(%arg0 = %0) {
        %c0 = arith.constant 0 : index
        %c1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.parallel (%arg1) = (%c0) to (%c8) step (%c1) {
          scf.reduce 
        } {acc.par_dims = #acc<par_dims[thread_y]>}
        acc.yield
      } {origin = "acc.parallel"}
    }
    return
  }
}

// -----
module {
  func.func @sequential_loop() {
    acc.kernel_environment {
      acc.compute_region {
        %c0 = arith.constant 0 : index
        %c1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.parallel (%arg0) = (%c0) to (%c4) step (%c1) {
          scf.reduce 
        } {acc.par_dims = #acc<par_dims[sequential]>}
        acc.yield
      } {origin = "acc.kernels"}
    }
    return
  }
}

// -----
module {
  func.func @block_and_vector() {
    %c8 = arith.constant 8 : index
    %c128 = arith.constant 128 : index
    acc.kernel_environment {
      %0 = acc.par_width %c8 {par_dim = #acc.par_dim<block_x>}
      %1 = acc.par_width %c128 {par_dim = #acc.par_dim<thread_x>}
      acc.compute_region launch(%arg0 = %0, %arg1 = %1) {
        %c0 = arith.constant 0 : index
        %c1 = arith.constant 1 : index
        %c8_0 = arith.constant 8 : index
        %c128_1 = arith.constant 128 : index
        scf.parallel (%arg2, %arg3) = (%c0, %c0) to (%c8_0, %c128_1) step (%c1, %c1) {
          scf.reduce 
        } {acc.par_dims = #acc<par_dims[block_x, thread_x]>}
        acc.yield
      } {origin = "acc.parallel"}
    }
    return
  }
}

// -----
module {
  func.func @scf_for_sequential() {
    acc.kernel_environment {
      acc.compute_region {
        %c0 = arith.constant 0 : index
        %c1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg0 = %c0 to %c4 step %c1 {
        }
        acc.yield
      } {origin = "acc.parallel"}
    }
    return
  }
}

// -----
module {
  func.func @collapse_loop() {
    acc.kernel_environment {
      acc.compute_region {
        %c0 = arith.constant 0 : index
        %c1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg0 = %c0 to %c4 step %c1 {
        } {acc.collapse_count = 2 : i64, acc.par_dims = #acc<par_dims[sequential]>}
        acc.yield
      } {origin = "acc.parallel"}
    }
    return
  }
}

// -----
module {
  func.func @percent_separator() {
    %c128 = arith.constant 128 : index
    acc.kernel_environment {
      %0 = acc.par_width %c128 {par_dim = #acc.par_dim<thread_x>}
      acc.compute_region launch(%arg0 = %0) {
        %c0 = arith.constant 0 : index
        %c1 = arith.constant 1 : index
        %c128_0 = arith.constant 128 : index
        scf.parallel (%arg1) = (%c0) to (%c128_0) step (%c1) {
          scf.reduce 
        } {acc.par_dims = #acc<par_dims[thread_x]>}
        acc.yield
      } {origin = "acc.parallel"}
    }
    return
  }
}

