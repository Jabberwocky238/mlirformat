module {
}

// -----
module {
  func.func @par_dim_sequential() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    scf.parallel (%arg0) = (%c0) to (%c4) step (%c1) {
      scf.reduce 
    } {acc.par_dims = #acc<par_dims[sequential]>}
    return
  }
}

// -----
module {
  func.func @par_dim_single_thread_x() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c128 = arith.constant 128 : index
    scf.parallel (%arg0) = (%c0) to (%c128) step (%c1) {
      scf.reduce 
    } {acc.par_dims = #acc<par_dims[thread_x]>}
    return
  }
}

// -----
module {
  func.func @par_dims_block_thread() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    %c128 = arith.constant 128 : index
    scf.parallel (%arg0, %arg1) = (%c0, %c0) to (%c8, %c128) step (%c1, %c1) {
      scf.reduce 
    } {acc.par_dims = #acc<par_dims[block_x, thread_x]>}
    return
  }
}

// -----
module {
  func.func @par_dims_all_dims() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    scf.parallel (%arg0) = (%c0) to (%c1) step (%c1) {
      scf.reduce 
    } {acc.par_dims = #acc<par_dims[block_x, block_y, block_z, thread_x, thread_y, thread_z]>}
    return
  }
}

// -----
module {
  func.func @par_dims_2d_grid() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c32 = arith.constant 32 : index
    scf.parallel (%arg0, %arg1) = (%c0, %c0) to (%c4, %c32) step (%c1, %c1) {
      scf.reduce 
    } {acc.par_dims = #acc<par_dims[block_y, thread_y]>}
    return
  }
}

// -----
module {
  func.func @compute_region_single_dim(%arg0: memref<1024xf32>, %arg1: memref<f32>) {
    %c128 = arith.constant 128 : index
    %0 = acc.copyin varPtr(%arg0 : memref<1024xf32>) -> memref<1024xf32>
    %1 = acc.copyin varPtr(%arg1 : memref<f32>) -> memref<f32> {dataClause = #acc<data_clause acc_copy>}
    acc.kernel_environment dataOperands(%0, %1 : memref<1024xf32>, memref<f32>) {
      %2 = acc.par_width %c128 {par_dim = #acc.par_dim<thread_x>}
      acc.compute_region launch(%arg2 = %2) ins(%arg3 = %0, %arg4 = %1) : (memref<1024xf32>, memref<f32>) {
        %c0 = arith.constant 0 : index
        %c1 = arith.constant 1 : index
        %c128_0 = arith.constant 128 : index
        %cst = arith.constant 0.000000e+00 : f32
        memref.store %cst, %arg4[] : memref<f32>
        scf.parallel (%arg5) = (%c0) to (%c128_0) step (%c1) {
          %3 = memref.load %arg3[%arg5] : memref<1024xf32>
          %4 = memref.load %arg4[] : memref<f32>
          %5 = arith.addf %4, %3 : f32
          memref.store %5, %arg4[] : memref<f32>
          scf.reduce 
        } {acc.par_dims = #acc<par_dims[thread_x]>}
        acc.yield
      } {origin = "acc.parallel"}
    }
    acc.copyout accPtr(%1 : memref<f32>) to varPtr(%arg1 : memref<f32>) {dataClause = #acc<data_clause acc_copy>}
    acc.delete accPtr(%0 : memref<1024xf32>)
    return
  }
}

// -----
module {
  func.func @compute_region_two_dims(%arg0: memref<8xi32>, %arg1: memref<i32>) {
    %c8 = arith.constant 8 : index
    %c128 = arith.constant 128 : index
    %0 = acc.copyin varPtr(%arg0 : memref<8xi32>) -> memref<8xi32>
    %1 = acc.copyin varPtr(%arg1 : memref<i32>) -> memref<i32> {dataClause = #acc<data_clause acc_reduction>}
    acc.kernel_environment dataOperands(%0, %1 : memref<8xi32>, memref<i32>) {
      %2 = acc.par_width %c8 {par_dim = #acc.par_dim<block_x>}
      %3 = acc.par_width %c128 {par_dim = #acc.par_dim<thread_x>}
      acc.compute_region launch(%arg2 = %2, %arg3 = %3) ins(%arg4 = %0, %arg5 = %1) : (memref<8xi32>, memref<i32>) {
        %c0 = arith.constant 0 : index
        %c1 = arith.constant 1 : index
        %c8_0 = arith.constant 8 : index
        %c0_i32 = arith.constant 0 : i32
        %4 = acc.reduction_init %arg5 <add> : memref<i32> {
          %alloca = memref.alloca() : memref<i32>
          memref.store %c0_i32, %alloca[] : memref<i32>
          acc.yield %alloca : memref<i32>
        }
        scf.parallel (%arg6) = (%c0) to (%c8_0) step (%c1) {
          %5 = memref.load %arg4[%arg6] : memref<8xi32>
          %6 = memref.load %4[] : memref<i32>
          %7 = arith.addi %6, %5 : i32
          memref.store %7, %4[] : memref<i32>
          scf.reduce 
        } {acc.par_dims = #acc<par_dims[block_x, thread_x]>}
        acc.reduction_combine %4 into %arg5 <add> : memref<i32>
        acc.yield
      } {origin = "acc.parallel"}
    }
    acc.copyout accPtr(%1 : memref<i32>) to varPtr(%arg1 : memref<i32>) {dataClause = #acc<data_clause acc_reduction>}
    acc.delete accPtr(%0 : memref<8xi32>)
    return
  }
}

// -----
module {
  func.func @compute_region_unknown_width(%arg0: memref<100xf32>) {
    %0 = acc.copyin varPtr(%arg0 : memref<100xf32>) -> memref<100xf32>
    acc.kernel_environment dataOperands(%0 : memref<100xf32>) {
      %1 = acc.par_width {par_dim = #acc.par_dim<thread_x>}
      acc.compute_region launch(%arg1 = %1) ins(%arg2 = %0) : (memref<100xf32>) {
        %c0 = arith.constant 0 : index
        %c1 = arith.constant 1 : index
        %c100 = arith.constant 100 : index
        scf.parallel (%arg3) = (%c0) to (%c100) step (%c1) {
          scf.reduce 
        } {acc.par_dims = #acc<par_dims[thread_x]>}
        acc.yield
      } {origin = "acc.kernels"}
    }
    acc.delete accPtr(%0 : memref<100xf32>)
    return
  }
}

// -----
module {
  func.func @compute_region_no_launch(%arg0: memref<i32>, %arg1: memref<i32>) {
    %0 = acc.copyin varPtr(%arg0 : memref<i32>) -> memref<i32> {dataClause = #acc<data_clause acc_copy>}
    %1 = acc.copyin varPtr(%arg1 : memref<i32>) -> memref<i32> {dataClause = #acc<data_clause acc_copy>}
    acc.kernel_environment dataOperands(%0, %1 : memref<i32>, memref<i32>) {
      acc.compute_region ins(%arg2 = %0, %arg3 = %1) : (memref<i32>, memref<i32>) {
        %c1_i32 = arith.constant 1 : i32
        memref.store %c1_i32, %arg2[] : memref<i32>
        memref.store %c1_i32, %arg3[] : memref<i32>
        acc.yield
      } {origin = "acc.serial"}
    }
    acc.copyout accPtr(%0 : memref<i32>) to varPtr(%arg0 : memref<i32>) {dataClause = #acc<data_clause acc_copy>}
    acc.copyout accPtr(%1 : memref<i32>) to varPtr(%arg1 : memref<i32>) {dataClause = #acc<data_clause acc_copy>}
    return
  }
}

// -----
module {
  func.func @compute_region_launch_only() {
    %c32 = arith.constant 32 : index
    %0 = acc.par_width %c32 {par_dim = #acc.par_dim<thread_x>}
    acc.compute_region launch(%arg0 = %0) {
      acc.yield
    } {origin = "acc.parallel"}
    return
  }
}

// -----
module {
  func.func @compute_region_empty() {
    acc.compute_region {
      acc.yield
    } {origin = "acc.parallel"}
    return
  }
}

// -----
module {
  func.func @compute_region_all_fields(%arg0: memref<1024xf32>, %arg1: !gpu.async.token) {
    %c128 = arith.constant 128 : index
    %c8 = arith.constant 8 : index
    %0 = acc.copyin varPtr(%arg0 : memref<1024xf32>) -> memref<1024xf32>
    acc.kernel_environment dataOperands(%0 : memref<1024xf32>) {
      %1 = acc.par_width %c8 {par_dim = #acc.par_dim<block_x>}
      %2 = acc.par_width %c128 {par_dim = #acc.par_dim<thread_x>}
      acc.compute_region stream(%arg1 : !gpu.async.token) launch(%arg2 = %1, %arg3 = %2) ins(%arg4 = %0) : (memref<1024xf32>) {
        %c0 = arith.constant 0 : index
        %c1 = arith.constant 1 : index
        %c1024 = arith.constant 1024 : index
        scf.parallel (%arg5) = (%c0) to (%c1024) step (%c1) {
          scf.reduce 
        } {acc.par_dims = #acc<par_dims[block_x, thread_x]>}
        acc.yield
      } {kernel_func_name = @compute_kernel, kernel_module_name = @device_module, origin = "acc.parallel"}
    }
    acc.delete accPtr(%0 : memref<1024xf32>)
    return
  }
}

// -----
module {
  func.func @parallel_reduction_pattern(%arg0: memref<8xi32>, %arg1: memref<i32>) {
    %c0 = arith.constant 0 : index
    %c8 = arith.constant 8 : index
    %c1 = arith.constant 1 : index
    %c0_i32 = arith.constant 0 : i32
    %alloca = memref.alloca() {acc.par_dims = #acc<par_dims[thread_x]>} : memref<i32>
    memref.store %c0_i32, %alloca[] : memref<i32>
    %0 = scf.parallel (%arg2) = (%c0) to (%c8) step (%c1) init (%c0_i32) -> i32 {
      %1 = memref.load %arg0[%arg2] : memref<8xi32>
      scf.reduce(%1 : i32) {
      ^bb0(%arg3: i32, %arg4: i32):
        %2 = arith.addi %arg3, %arg4 : i32
        scf.reduce.return %2 : i32
      }
    } {acc.par_dims = #acc<par_dims[thread_x]>}
    acc.reduction_accumulate %0 to %alloca <add> : i32 -> memref<i32> {par_dims = #acc<par_dims[thread_x]>}
    acc.reduction_combine %alloca into %arg1 <add> : memref<i32> {acc.par_dims = #acc<par_dims[thread_x]>}
    return
  }
}

// -----
module {
  func.func @reduction_accumulate_thread_x(%arg0: f32, %arg1: memref<f32>) {
    acc.reduction_accumulate %arg0 to %arg1 <add> : f32 -> memref<f32> {par_dims = #acc<par_dims[thread_x]>}
    return
  }
}

// -----
module {
  func.func @reduction_accumulate_block_thread(%arg0: i32, %arg1: memref<i32>) {
    acc.reduction_accumulate %arg0 to %arg1 <add> : i32 -> memref<i32> {par_dims = #acc<par_dims[block_x, thread_x]>}
    return
  }
}

// -----
module {
  func.func @reduction_accumulate_array(%arg0: memref<4xi32>, %arg1: !acc.data_bounds_ty) {
    acc.reduction_accumulate_array %arg0 bounds(%arg1) <add> : memref<4xi32> {par_dims = #acc<par_dims[block_x, thread_x]>}
    return
  }
}

// -----
module {
  func.func @compute_region_with_results() -> i32 {
    %0 = acc.par_width {par_dim = #acc.par_dim<thread_x>}
    %1 = acc.compute_region launch(%arg0 = %0) -> i32 {
      %c0_i32 = arith.constant 0 : i32
      acc.yield %c0_i32 : i32
    } {origin = "acc.parallel"}
    return %1 : i32
  }
}

// -----
module {
  func.func @predicate_region_gang_vector_atomics(%arg0: memref<i32>, %arg1: memref<i32>) {
    %c3 = arith.constant 3 : index
    %c16 = arith.constant 16 : index
    %0 = acc.copyin varPtr(%arg0 : memref<i32>) -> memref<i32> {dataClause = #acc<data_clause acc_copy>}
    %1 = acc.copyin varPtr(%arg1 : memref<i32>) -> memref<i32> {dataClause = #acc<data_clause acc_copy>}
    acc.kernel_environment dataOperands(%0, %1 : memref<i32>, memref<i32>) {
      %2 = acc.par_width %c3 {par_dim = #acc.par_dim<block_x>}
      %3 = acc.par_width %c16 {par_dim = #acc.par_dim<thread_x>}
      acc.compute_region launch(%arg2 = %2, %arg3 = %3) ins(%arg4 = %0, %arg5 = %1) : (memref<i32>, memref<i32>) {
        %c1 = arith.constant 1 : index
        %c10 = arith.constant 10 : index
        scf.parallel (%arg6) = (%c1) to (%c10) step (%c1) {
          acc.predicate_region {
            acc.atomic.update %arg4 : memref<i32> {
            ^bb0(%arg7: i32):
              %c1_i32 = arith.constant 1 : i32
              %4 = arith.addi %arg7, %c1_i32 : i32
              acc.yield %4 : i32
            }
          }
          scf.parallel (%arg7) = (%c1) to (%c10) step (%c1) {
            acc.atomic.update %arg5 : memref<i32> {
            ^bb0(%arg8: i32):
              %c1_i32 = arith.constant 1 : i32
              %4 = arith.addi %arg8, %c1_i32 : i32
              acc.yield %4 : i32
            }
            scf.reduce 
          } {acc.par_dims = #acc<par_dims[thread_x]>}
          scf.reduce 
        } {acc.par_dims = #acc<par_dims[block_x]>}
        acc.yield
      } {origin = "acc.parallel"}
    }
    acc.copyout accPtr(%0 : memref<i32>) to varPtr(%arg0 : memref<i32>) {dataClause = #acc<data_clause acc_copy>}
    acc.copyout accPtr(%1 : memref<i32>) to varPtr(%arg1 : memref<i32>) {dataClause = #acc<data_clause acc_copy>}
    return
  }
}

// -----
module {
  func.func @predicate_region_gang_redundant_setup(%arg0: memref<i32>, %arg1: memref<10xi32>) {
    %c3 = arith.constant 3 : index
    %c16 = arith.constant 16 : index
    %0 = acc.copyin varPtr(%arg0 : memref<i32>) -> memref<i32> {dataClause = #acc<data_clause acc_copy>}
    %1 = acc.copyin varPtr(%arg1 : memref<10xi32>) -> memref<10xi32>
    acc.kernel_environment dataOperands(%0, %1 : memref<i32>, memref<10xi32>) {
      %2 = acc.par_width %c3 {par_dim = #acc.par_dim<block_x>}
      %3 = acc.par_width %c16 {par_dim = #acc.par_dim<thread_x>}
      acc.compute_region launch(%arg2 = %2, %arg3 = %3) ins(%arg4 = %0, %arg5 = %1) : (memref<i32>, memref<10xi32>) {
        %c0 = arith.constant 0 : index
        %c1 = arith.constant 1 : index
        %c10 = arith.constant 10 : index
        %4 = memref.load %arg5[%c0] : memref<10xi32>
        acc.predicate_region {
          memref.store %4, %arg4[] : memref<i32>
        }
        scf.parallel (%arg6) = (%c1) to (%c10) step (%c1) {
          %5 = memref.load %arg4[] : memref<i32>
          %6 = arith.addi %5, %5 : i32
          memref.store %6, %arg4[] : memref<i32>
          scf.parallel (%arg7) = (%c1) to (%c10) step (%c1) {
            scf.reduce 
          } {acc.par_dims = #acc<par_dims[thread_x]>}
          scf.reduce 
        } {acc.par_dims = #acc<par_dims[block_x]>}
        acc.yield
      } {origin = "acc.kernels"}
    }
    acc.copyout accPtr(%0 : memref<i32>) to varPtr(%arg0 : memref<i32>) {dataClause = #acc<data_clause acc_copy>}
    acc.delete accPtr(%1 : memref<10xi32>)
    return
  }
}

// -----
module {
  func.func @gpu_shared_memory_static() {
    %c1024 = arith.constant 1024 : index
    %0 = acc.gpu_shared_memory(%c1024) {num_copies = 1 : i64, static_upper_bound_bytes = 4096 : i64} : (index) -> memref<?xf32, #gpu.address_space<workgroup>>
    return
  }
}

// -----
module {
  func.func @gpu_shared_memory_runtime_sized() {
    %c128 = arith.constant 128 : index
    %0 = acc.gpu_shared_memory(%c128) {dynamic_shared_memory_fixed_bytes = 24 : i64, dynamic_shared_memory_scaling_bytes = 12 : i64, num_copies = 1 : i64, static_upper_bound_bytes = 1560 : i64} : (index) -> memref<?xf32, #gpu.address_space<workgroup>>
    return
  }
}

// -----
module {
  func.func @gpu_shared_memory_worker_copies() {
    %0 = acc.gpu_shared_memory {num_copies = 4 : i64, static_upper_bound_bytes = 256 : i64} : () -> memref<8xf32, #gpu.address_space<workgroup>>
    return
  }
}

