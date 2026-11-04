module attributes {dlti.map = #dlti.map<"MPI:Implementation" = "MPICH">} {
  func.func @mpi_test_mpich(%arg0: memref<100xf32>) {
    %0 = mpi.init : !mpi.retval
    %1 = mpi.comm_world : !mpi.comm
    %retval, %rank = mpi.comm_rank(%1) : !mpi.retval, i32
    mpi.send(%arg0, %rank, %rank, %1) : memref<100xf32>, i32, i32
    %2 = mpi.send(%arg0, %rank, %rank, %1) : memref<100xf32>, i32, i32 -> !mpi.retval
    mpi.recv(%arg0, %rank, %rank, %1) : memref<100xf32>, i32, i32
    %3 = mpi.recv(%arg0, %rank, %rank, %1) : memref<100xf32>, i32, i32 -> !mpi.retval
    %c10_i32 = arith.constant 10 : i32
    %c22_i32 = arith.constant 22 : i32
    %newcomm = mpi.comm_split(%1, %c10_i32, %c22_i32) : !mpi.comm
    mpi.allreduce(%arg0, %arg0, MPI_SUM, %1) : memref<100xf32>, memref<100xf32>
    %4 = mpi.finalize : !mpi.retval
    return
  }
}

// -----
module attributes {dlti.map = #dlti.map<"MPI:Implementation" = "OpenMPI">} {
  func.func @mpi_test_openmpi(%arg0: memref<100xf32>) {
    %0 = mpi.init : !mpi.retval
    %1 = mpi.comm_world : !mpi.comm
    %retval, %rank = mpi.comm_rank(%1) : !mpi.retval, i32
    mpi.send(%arg0, %rank, %rank, %1) : memref<100xf32>, i32, i32
    %2 = mpi.send(%arg0, %rank, %rank, %1) : memref<100xf32>, i32, i32 -> !mpi.retval
    mpi.recv(%arg0, %rank, %rank, %1) : memref<100xf32>, i32, i32
    %3 = mpi.recv(%arg0, %rank, %rank, %1) : memref<100xf32>, i32, i32 -> !mpi.retval
    mpi.allreduce(%arg0, %arg0, MPI_SUM, %1) : memref<100xf32>, memref<100xf32>
    %c10_i32 = arith.constant 10 : i32
    %c22_i32 = arith.constant 22 : i32
    %newcomm = mpi.comm_split(%1, %c10_i32, %c22_i32) : !mpi.comm
    %4 = mpi.finalize : !mpi.retval
    return
  }
}

