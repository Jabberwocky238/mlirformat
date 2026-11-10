module attributes {mpi.dlti = #dlti.map<"MPI:comm_world_size" = 12 : i64, "MPI:comm_world_rank" = 5 : i64>} {
  func.func @mpi_test(%arg0: memref<100xf32>) -> (i32, i32) {
    %0 = mpi.comm_world : !mpi.comm
    %size = mpi.comm_size(%0) : i32
    %rank = mpi.comm_rank(%0) : i32
    return %size, %rank : i32, i32
  }
}

