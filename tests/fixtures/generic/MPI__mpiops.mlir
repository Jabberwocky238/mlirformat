"builtin.module"() ({
  "func.func"() <{function_type = (memref<100xf32>) -> (), sym_name = "mpi_test"}> ({
  ^bb0(%arg0: memref<100xf32>):
    %0 = "mpi.init"() : () -> !mpi.retval
    %1 = "mpi.comm_world"() : () -> !mpi.comm
    %2 = "mpi.comm_rank"(%1) : (!mpi.comm) -> i32
    %3:2 = "mpi.comm_rank"(%1) : (!mpi.comm) -> (!mpi.retval, i32)
    %4 = "mpi.comm_size"(%1) : (!mpi.comm) -> i32
    %5:2 = "mpi.comm_size"(%1) : (!mpi.comm) -> (!mpi.retval, i32)
    %6 = "mpi.comm_split"(%1, %2, %2) : (!mpi.comm, i32, i32) -> !mpi.comm
    %7:2 = "mpi.comm_split"(%1, %2, %2) : (!mpi.comm, i32, i32) -> (!mpi.retval, !mpi.comm)
    "mpi.send"(%arg0, %2, %2, %1) : (memref<100xf32>, i32, i32, !mpi.comm) -> ()
    %8 = "mpi.send"(%arg0, %2, %2, %1) : (memref<100xf32>, i32, i32, !mpi.comm) -> !mpi.retval
    "mpi.recv"(%arg0, %2, %2, %1) : (memref<100xf32>, i32, i32, !mpi.comm) -> ()
    %9 = "mpi.recv"(%arg0, %2, %2, %1) : (memref<100xf32>, i32, i32, !mpi.comm) -> !mpi.retval
    %10:2 = "mpi.isend"(%arg0, %2, %2, %1) : (memref<100xf32>, i32, i32, !mpi.comm) -> (!mpi.retval, !mpi.request)
    %11 = "mpi.isend"(%arg0, %2, %2, %1) : (memref<100xf32>, i32, i32, !mpi.comm) -> !mpi.request
    %12 = "mpi.irecv"(%arg0, %2, %2, %1) : (memref<100xf32>, i32, i32, !mpi.comm) -> !mpi.request
    %13:2 = "mpi.irecv"(%arg0, %2, %2, %1) : (memref<100xf32>, i32, i32, !mpi.comm) -> (!mpi.retval, !mpi.request)
    "mpi.wait"(%13#1) : (!mpi.request) -> ()
    %14 = "mpi.wait"(%10#1) : (!mpi.request) -> !mpi.retval
    "mpi.barrier"(%1) : (!mpi.comm) -> ()
    %15 = "mpi.barrier"(%1) : (!mpi.comm) -> !mpi.retval
    %16 = "mpi.allreduce"(%arg0, %arg0, %1) <{op = 3 : i32}> : (memref<100xf32>, memref<100xf32>, !mpi.comm) -> !mpi.retval
    "mpi.allreduce"(%arg0, %arg0, %1) <{op = 3 : i32}> : (memref<100xf32>, memref<100xf32>, !mpi.comm) -> ()
    %17 = "mpi.finalize"() : () -> !mpi.retval
    %18 = "mpi.retval_check"(%3#0) <{errclass = #mpi.errclass<MPI_SUCCESS>}> : (!mpi.retval) -> i1
    %19 = "mpi.error_class"(%0) : (!mpi.retval) -> !mpi.retval
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

