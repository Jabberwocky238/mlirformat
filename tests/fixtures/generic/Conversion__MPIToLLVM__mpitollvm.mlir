"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_init_finalize_mpich"}> ({
    %16 = "mpi.init"() : () -> !mpi.retval
    %17 = "mpi.finalize"() : () -> !mpi.retval
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_comm_rank_mpich"}> ({
    %14 = "mpi.comm_world"() : () -> !mpi.comm
    %15:2 = "mpi.comm_rank"(%14) : (!mpi.comm) -> (!mpi.retval, i32)
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<100xf32>) -> (), sym_name = "test_send_mpich"}> ({
  ^bb0(%arg4: memref<100xf32>):
    %11 = "mpi.comm_world"() : () -> !mpi.comm
    %12:2 = "mpi.comm_rank"(%11) : (!mpi.comm) -> (!mpi.retval, i32)
    "mpi.send"(%arg4, %12#1, %12#1, %11) : (memref<100xf32>, i32, i32, !mpi.comm) -> ()
    %13 = "mpi.send"(%arg4, %12#1, %12#1, %11) : (memref<100xf32>, i32, i32, !mpi.comm) -> !mpi.retval
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<100xf32>) -> (), sym_name = "test_recv_mpich"}> ({
  ^bb0(%arg3: memref<100xf32>):
    %8 = "mpi.comm_world"() : () -> !mpi.comm
    %9:2 = "mpi.comm_rank"(%8) : (!mpi.comm) -> (!mpi.retval, i32)
    "mpi.recv"(%arg3, %9#1, %9#1, %8) : (memref<100xf32>, i32, i32, !mpi.comm) -> ()
    %10 = "mpi.recv"(%arg3, %9#1, %9#1, %8) : (memref<100xf32>, i32, i32, !mpi.comm) -> !mpi.retval
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_comm_split_mpich"}> ({
    %4 = "mpi.comm_world"() : () -> !mpi.comm
    %5 = "arith.constant"() <{value = 10 : i32}> : () -> i32
    %6 = "arith.constant"() <{value = 22 : i32}> : () -> i32
    %7 = "mpi.comm_split"(%4, %5, %6) : (!mpi.comm, i32, i32) -> !mpi.comm
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<100xf32>) -> (), sym_name = "test_allgather_mpich"}> ({
  ^bb0(%arg2: memref<100xf32>):
    %2 = "mpi.comm_world"() : () -> !mpi.comm
    %3 = "mpi.allgather"(%arg2, %arg2, %2) : (memref<100xf32>, memref<100xf32>, !mpi.comm) -> !mpi.retval
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<100xf32>) -> (), sym_name = "test_allreduce_mpich"}> ({
  ^bb0(%arg1: memref<100xf32>):
    %1 = "mpi.comm_world"() : () -> !mpi.comm
    "mpi.allreduce"(%arg1, %arg1, %1) <{op = 3 : i32}> : (memref<100xf32>, memref<100xf32>, !mpi.comm) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<100xf32>) -> (), sym_name = "test_reduce_scatter_block_mpich"}> ({
  ^bb0(%arg0: memref<100xf32>):
    %0 = "mpi.comm_world"() : () -> !mpi.comm
    "mpi.reduce_scatter_block"(%arg0, %arg0, %0) <{op = 3 : i32}> : (memref<100xf32>, memref<100xf32>, !mpi.comm) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) {dlti.map = #dlti.map<"MPI:Implementation" = "MPICH">} : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_init_finalize_openmpi"}> ({
    %15 = "mpi.init"() : () -> !mpi.retval
    %16 = "mpi.finalize"() : () -> !mpi.retval
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_comm_rank_openmpi"}> ({
    %13 = "mpi.comm_world"() : () -> !mpi.comm
    %14:2 = "mpi.comm_rank"(%13) : (!mpi.comm) -> (!mpi.retval, i32)
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<100xf32>) -> (), sym_name = "test_send_openmpi"}> ({
  ^bb0(%arg4: memref<100xf32>):
    %10 = "mpi.comm_world"() : () -> !mpi.comm
    %11:2 = "mpi.comm_rank"(%10) : (!mpi.comm) -> (!mpi.retval, i32)
    "mpi.send"(%arg4, %11#1, %11#1, %10) : (memref<100xf32>, i32, i32, !mpi.comm) -> ()
    %12 = "mpi.send"(%arg4, %11#1, %11#1, %10) : (memref<100xf32>, i32, i32, !mpi.comm) -> !mpi.retval
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<100xf32>) -> (), sym_name = "test_recv_openmpi"}> ({
  ^bb0(%arg3: memref<100xf32>):
    %7 = "mpi.comm_world"() : () -> !mpi.comm
    %8:2 = "mpi.comm_rank"(%7) : (!mpi.comm) -> (!mpi.retval, i32)
    "mpi.recv"(%arg3, %8#1, %8#1, %7) : (memref<100xf32>, i32, i32, !mpi.comm) -> ()
    %9 = "mpi.recv"(%arg3, %8#1, %8#1, %7) : (memref<100xf32>, i32, i32, !mpi.comm) -> !mpi.retval
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_comm_split_openmpi"}> ({
    %3 = "mpi.comm_world"() : () -> !mpi.comm
    %4 = "arith.constant"() <{value = 10 : i32}> : () -> i32
    %5 = "arith.constant"() <{value = 22 : i32}> : () -> i32
    %6 = "mpi.comm_split"(%3, %4, %5) : (!mpi.comm, i32, i32) -> !mpi.comm
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<100xf32>) -> (), sym_name = "test_allgather_openmpi"}> ({
  ^bb0(%arg2: memref<100xf32>):
    %2 = "mpi.comm_world"() : () -> !mpi.comm
    "mpi.allgather"(%arg2, %arg2, %2) : (memref<100xf32>, memref<100xf32>, !mpi.comm) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<100xf32>) -> (), sym_name = "test_allreduce_openmpi"}> ({
  ^bb0(%arg1: memref<100xf32>):
    %1 = "mpi.comm_world"() : () -> !mpi.comm
    "mpi.allreduce"(%arg1, %arg1, %1) <{op = 3 : i32}> : (memref<100xf32>, memref<100xf32>, !mpi.comm) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<100xf32>) -> (), sym_name = "test_reduce_scatter_block_openmpi"}> ({
  ^bb0(%arg0: memref<100xf32>):
    %0 = "mpi.comm_world"() : () -> !mpi.comm
    "mpi.reduce_scatter_block"(%arg0, %arg0, %0) <{op = 3 : i32}> : (memref<100xf32>, memref<100xf32>, !mpi.comm) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) {dlti.map = #dlti.map<"MPI:Implementation" = "OpenMPI">} : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<100xf32>) -> (), sym_name = "test_fold"}> ({
  ^bb0(%arg0: memref<100xf32>):
    %0 = "mpi.comm_world"() : () -> !mpi.comm
    %1 = "mpi.allgather"(%arg0, %arg0, %0) : (memref<100xf32>, memref<100xf32>, !mpi.comm) -> !mpi.retval
    "func.return"() : () -> ()
  }) : () -> ()
}) {mpi.dlti = #dlti.map<"MPI:Implementation" = "MPICH", "MPI:comm_world_size" = 4 : i64, "MPI:comm_world_rank" = 1 : i64>} : () -> ()

