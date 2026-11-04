module {
  func.func @mpi_test(%arg0: memref<100xf32>) {
    %0 = mpi.init : !mpi.retval
    %1 = mpi.comm_world : !mpi.comm
    %rank = mpi.comm_rank(%1) : i32
    %retval, %rank_0 = mpi.comm_rank(%1) : !mpi.retval, i32
    %size = mpi.comm_size(%1) : i32
    %retval_1, %size_2 = mpi.comm_size(%1) : !mpi.retval, i32
    %newcomm = mpi.comm_split(%1, %rank, %rank) : !mpi.comm
    %retval_3, %newcomm_4 = mpi.comm_split(%1, %rank, %rank) : !mpi.retval, !mpi.comm
    mpi.send(%arg0, %rank, %rank, %1) : memref<100xf32>, i32, i32
    %2 = mpi.send(%arg0, %rank, %rank, %1) : memref<100xf32>, i32, i32 -> !mpi.retval
    mpi.recv(%arg0, %rank, %rank, %1) : memref<100xf32>, i32, i32
    %3 = mpi.recv(%arg0, %rank, %rank, %1) : memref<100xf32>, i32, i32 -> !mpi.retval
    %retval_5, %req = mpi.isend(%arg0, %rank, %rank, %1) : memref<100xf32>, i32, i32 -> !mpi.retval, !mpi.request
    %req_6 = mpi.isend(%arg0, %rank, %rank, %1) : memref<100xf32>, i32, i32 -> !mpi.request
    %req_7 = mpi.irecv(%arg0, %rank, %rank, %1) : memref<100xf32>, i32, i32 -> !mpi.request
    %retval_8, %req_9 = mpi.irecv(%arg0, %rank, %rank, %1) : memref<100xf32>, i32, i32 -> !mpi.retval, !mpi.request
    mpi.wait(%req_9) : !mpi.request
    %4 = mpi.wait(%req) : !mpi.request -> !mpi.retval
    mpi.barrier(%1)
    %5 = mpi.barrier(%1) -> !mpi.retval
    %6 = mpi.allreduce(%arg0, %arg0, MPI_SUM, %1) : memref<100xf32>, memref<100xf32> -> !mpi.retval
    mpi.allreduce(%arg0, %arg0, MPI_SUM, %1) : memref<100xf32>, memref<100xf32>
    %7 = mpi.finalize : !mpi.retval
    %8 = mpi.retval_check %retval = <MPI_SUCCESS> : i1
    %9 = mpi.error_class %0 : !mpi.retval
    return
  }
}

