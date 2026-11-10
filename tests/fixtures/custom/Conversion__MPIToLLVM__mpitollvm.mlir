module attributes {dlti.map = #dlti.map<"MPI:Implementation" = "MPICH">} {
  func.func @test_init_finalize_mpich() {
    %0 = mpi.init : !mpi.retval
    %1 = mpi.finalize : !mpi.retval
    return
  }
  func.func @test_comm_rank_mpich() {
    %0 = mpi.comm_world : !mpi.comm
    %retval, %rank = mpi.comm_rank(%0) : !mpi.retval, i32
    return
  }
  func.func @test_send_mpich(%arg0: memref<100xf32>) {
    %0 = mpi.comm_world : !mpi.comm
    %retval, %rank = mpi.comm_rank(%0) : !mpi.retval, i32
    mpi.send(%arg0, %rank, %rank, %0) : memref<100xf32>, i32, i32
    %1 = mpi.send(%arg0, %rank, %rank, %0) : memref<100xf32>, i32, i32 -> !mpi.retval
    return
  }
  func.func @test_recv_mpich(%arg0: memref<100xf32>) {
    %0 = mpi.comm_world : !mpi.comm
    %retval, %rank = mpi.comm_rank(%0) : !mpi.retval, i32
    mpi.recv(%arg0, %rank, %rank, %0) : memref<100xf32>, i32, i32
    %1 = mpi.recv(%arg0, %rank, %rank, %0) : memref<100xf32>, i32, i32 -> !mpi.retval
    return
  }
  func.func @test_comm_split_mpich() {
    %0 = mpi.comm_world : !mpi.comm
    %c10_i32 = arith.constant 10 : i32
    %c22_i32 = arith.constant 22 : i32
    %newcomm = mpi.comm_split(%0, %c10_i32, %c22_i32) : !mpi.comm
    return
  }
  func.func @test_allgather_mpich(%arg0: memref<100xf32>) {
    %0 = mpi.comm_world : !mpi.comm
    %1 = mpi.allgather(%arg0, %arg0, %0) : memref<100xf32>, memref<100xf32> -> !mpi.retval
    return
  }
  func.func @test_allreduce_mpich(%arg0: memref<100xf32>) {
    %0 = mpi.comm_world : !mpi.comm
    mpi.allreduce(%arg0, %arg0, MPI_SUM, %0) : memref<100xf32>, memref<100xf32>
    return
  }
  func.func @test_reduce_scatter_block_mpich(%arg0: memref<100xf32>) {
    %0 = mpi.comm_world : !mpi.comm
    mpi.reduce_scatter_block(%arg0, %arg0, MPI_SUM, %0) : memref<100xf32>, memref<100xf32>
    return
  }
}

// -----
module attributes {dlti.map = #dlti.map<"MPI:Implementation" = "OpenMPI">} {
  func.func @test_init_finalize_openmpi() {
    %0 = mpi.init : !mpi.retval
    %1 = mpi.finalize : !mpi.retval
    return
  }
  func.func @test_comm_rank_openmpi() {
    %0 = mpi.comm_world : !mpi.comm
    %retval, %rank = mpi.comm_rank(%0) : !mpi.retval, i32
    return
  }
  func.func @test_send_openmpi(%arg0: memref<100xf32>) {
    %0 = mpi.comm_world : !mpi.comm
    %retval, %rank = mpi.comm_rank(%0) : !mpi.retval, i32
    mpi.send(%arg0, %rank, %rank, %0) : memref<100xf32>, i32, i32
    %1 = mpi.send(%arg0, %rank, %rank, %0) : memref<100xf32>, i32, i32 -> !mpi.retval
    return
  }
  func.func @test_recv_openmpi(%arg0: memref<100xf32>) {
    %0 = mpi.comm_world : !mpi.comm
    %retval, %rank = mpi.comm_rank(%0) : !mpi.retval, i32
    mpi.recv(%arg0, %rank, %rank, %0) : memref<100xf32>, i32, i32
    %1 = mpi.recv(%arg0, %rank, %rank, %0) : memref<100xf32>, i32, i32 -> !mpi.retval
    return
  }
  func.func @test_comm_split_openmpi() {
    %0 = mpi.comm_world : !mpi.comm
    %c10_i32 = arith.constant 10 : i32
    %c22_i32 = arith.constant 22 : i32
    %newcomm = mpi.comm_split(%0, %c10_i32, %c22_i32) : !mpi.comm
    return
  }
  func.func @test_allgather_openmpi(%arg0: memref<100xf32>) {
    %0 = mpi.comm_world : !mpi.comm
    mpi.allgather(%arg0, %arg0, %0) : memref<100xf32>, memref<100xf32>
    return
  }
  func.func @test_allreduce_openmpi(%arg0: memref<100xf32>) {
    %0 = mpi.comm_world : !mpi.comm
    mpi.allreduce(%arg0, %arg0, MPI_SUM, %0) : memref<100xf32>, memref<100xf32>
    return
  }
  func.func @test_reduce_scatter_block_openmpi(%arg0: memref<100xf32>) {
    %0 = mpi.comm_world : !mpi.comm
    mpi.reduce_scatter_block(%arg0, %arg0, MPI_SUM, %0) : memref<100xf32>, memref<100xf32>
    return
  }
}

// -----
module attributes {mpi.dlti = #dlti.map<"MPI:Implementation" = "MPICH", "MPI:comm_world_size" = 4 : i64, "MPI:comm_world_rank" = 1 : i64>} {
  func.func @test_fold(%arg0: memref<100xf32>) {
    %0 = mpi.comm_world : !mpi.comm
    %1 = mpi.allgather(%arg0, %arg0, %0) : memref<100xf32>, memref<100xf32> -> !mpi.retval
    return
  }
}

