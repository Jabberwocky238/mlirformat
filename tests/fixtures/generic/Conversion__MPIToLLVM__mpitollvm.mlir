"builtin.module"() ({
  "func.func"() <{function_type = (memref<100xf32>) -> (), sym_name = "mpi_test_mpich"}> ({
  ^bb0(%arg0: memref<100xf32>):
    %0 = "mpi.init"() : () -> !mpi.retval
    %1 = "mpi.comm_world"() : () -> !mpi.comm
    %2:2 = "mpi.comm_rank"(%1) : (!mpi.comm) -> (!mpi.retval, i32)
    "mpi.send"(%arg0, %2#1, %2#1, %1) : (memref<100xf32>, i32, i32, !mpi.comm) -> ()
    %3 = "mpi.send"(%arg0, %2#1, %2#1, %1) : (memref<100xf32>, i32, i32, !mpi.comm) -> !mpi.retval
    "mpi.recv"(%arg0, %2#1, %2#1, %1) : (memref<100xf32>, i32, i32, !mpi.comm) -> ()
    %4 = "mpi.recv"(%arg0, %2#1, %2#1, %1) : (memref<100xf32>, i32, i32, !mpi.comm) -> !mpi.retval
    %5 = "arith.constant"() <{value = 10 : i32}> : () -> i32
    %6 = "arith.constant"() <{value = 22 : i32}> : () -> i32
    %7 = "mpi.comm_split"(%1, %5, %6) : (!mpi.comm, i32, i32) -> !mpi.comm
    "mpi.allreduce"(%arg0, %arg0, %1) <{op = 3 : i32}> : (memref<100xf32>, memref<100xf32>, !mpi.comm) -> ()
    %8 = "mpi.finalize"() : () -> !mpi.retval
    "func.return"() : () -> ()
  }) : () -> ()
}) {dlti.map = #dlti.map<"MPI:Implementation" = "MPICH">} : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<100xf32>) -> (), sym_name = "mpi_test_openmpi"}> ({
  ^bb0(%arg0: memref<100xf32>):
    %0 = "mpi.init"() : () -> !mpi.retval
    %1 = "mpi.comm_world"() : () -> !mpi.comm
    %2:2 = "mpi.comm_rank"(%1) : (!mpi.comm) -> (!mpi.retval, i32)
    "mpi.send"(%arg0, %2#1, %2#1, %1) : (memref<100xf32>, i32, i32, !mpi.comm) -> ()
    %3 = "mpi.send"(%arg0, %2#1, %2#1, %1) : (memref<100xf32>, i32, i32, !mpi.comm) -> !mpi.retval
    "mpi.recv"(%arg0, %2#1, %2#1, %1) : (memref<100xf32>, i32, i32, !mpi.comm) -> ()
    %4 = "mpi.recv"(%arg0, %2#1, %2#1, %1) : (memref<100xf32>, i32, i32, !mpi.comm) -> !mpi.retval
    "mpi.allreduce"(%arg0, %arg0, %1) <{op = 3 : i32}> : (memref<100xf32>, memref<100xf32>, !mpi.comm) -> ()
    %5 = "arith.constant"() <{value = 10 : i32}> : () -> i32
    %6 = "arith.constant"() <{value = 22 : i32}> : () -> i32
    %7 = "mpi.comm_split"(%1, %5, %6) : (!mpi.comm, i32, i32) -> !mpi.comm
    %8 = "mpi.finalize"() : () -> !mpi.retval
    "func.return"() : () -> ()
  }) : () -> ()
}) {dlti.map = #dlti.map<"MPI:Implementation" = "OpenMPI">} : () -> ()

