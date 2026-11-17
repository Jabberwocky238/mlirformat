"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_init_finalize_mpich"}> ({
    %16 = "mpi.init"() : () -> !mpi.retval loc("<stdin>":3:11)
    %17 = "mpi.finalize"() : () -> !mpi.retval loc("<stdin>":4:11)
    "func.return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "test_comm_rank_mpich"}> ({
    %14 = "mpi.comm_world"() : () -> !mpi.comm loc("<stdin>":8:11)
    %15:2 = "mpi.comm_rank"(%14) : (!mpi.comm) -> (!mpi.retval, i32) loc("<stdin>":9:13)
    "func.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (memref<100xf32>) -> (), sym_name = "test_send_mpich"}> ({
  ^bb0(%arg4: memref<100xf32> loc("<stdin>":13:8)):
    %11 = "mpi.comm_world"() : () -> !mpi.comm loc("<stdin>":14:11)
    %12:2 = "mpi.comm_rank"(%11) : (!mpi.comm) -> (!mpi.retval, i32) loc("<stdin>":15:13)
    "mpi.send"(%arg4, %12#1, %12#1, %11) : (memref<100xf32>, i32, i32, !mpi.comm) -> () loc("<stdin>":16:5)
    %13 = "mpi.send"(%arg4, %12#1, %12#1, %11) : (memref<100xf32>, i32, i32, !mpi.comm) -> !mpi.retval loc("<stdin>":17:11)
    "func.return"() : () -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (memref<100xf32>) -> (), sym_name = "test_recv_mpich"}> ({
  ^bb0(%arg3: memref<100xf32> loc("<stdin>":21:8)):
    %8 = "mpi.comm_world"() : () -> !mpi.comm loc("<stdin>":22:10)
    %9:2 = "mpi.comm_rank"(%8) : (!mpi.comm) -> (!mpi.retval, i32) loc("<stdin>":23:12)
    "mpi.recv"(%arg3, %9#1, %9#1, %8) : (memref<100xf32>, i32, i32, !mpi.comm) -> () loc("<stdin>":24:5)
    %10 = "mpi.recv"(%arg3, %9#1, %9#1, %8) : (memref<100xf32>, i32, i32, !mpi.comm) -> !mpi.retval loc("<stdin>":25:11)
    "func.return"() : () -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":20:3)
  "func.func"() <{function_type = () -> (), sym_name = "test_comm_split_mpich"}> ({
    %4 = "mpi.comm_world"() : () -> !mpi.comm loc("<stdin>":29:10)
    %5 = "arith.constant"() <{value = 10 : i32}> : () -> i32 loc("<stdin>":30:10)
    %6 = "arith.constant"() <{value = 22 : i32}> : () -> i32 loc("<stdin>":31:10)
    %7 = "mpi.comm_split"(%4, %5, %6) : (!mpi.comm, i32, i32) -> !mpi.comm loc("<stdin>":32:10)
    "func.return"() : () -> () loc("<stdin>":33:5)
  }) : () -> () loc("<stdin>":28:3)
  "func.func"() <{function_type = (memref<100xf32>) -> (), sym_name = "test_allgather_mpich"}> ({
  ^bb0(%arg2: memref<100xf32> loc("<stdin>":36:8)):
    %2 = "mpi.comm_world"() : () -> !mpi.comm loc("<stdin>":37:10)
    %3 = "mpi.allgather"(%arg2, %arg2, %2) : (memref<100xf32>, memref<100xf32>, !mpi.comm) -> !mpi.retval loc("<stdin>":38:10)
    "func.return"() : () -> () loc("<stdin>":39:5)
  }) : () -> () loc("<stdin>":35:3)
  "func.func"() <{function_type = (memref<100xf32>) -> (), sym_name = "test_allreduce_mpich"}> ({
  ^bb0(%arg1: memref<100xf32> loc("<stdin>":42:8)):
    %1 = "mpi.comm_world"() : () -> !mpi.comm loc("<stdin>":43:10)
    "mpi.allreduce"(%arg1, %arg1, %1) <{op = 3 : i32}> : (memref<100xf32>, memref<100xf32>, !mpi.comm) -> () loc("<stdin>":44:5)
    "func.return"() : () -> () loc("<stdin>":45:5)
  }) : () -> () loc("<stdin>":41:3)
  "func.func"() <{function_type = (memref<100xf32>) -> (), sym_name = "test_reduce_scatter_block_mpich"}> ({
  ^bb0(%arg0: memref<100xf32> loc("<stdin>":48:8)):
    %0 = "mpi.comm_world"() : () -> !mpi.comm loc("<stdin>":49:10)
    "mpi.reduce_scatter_block"(%arg0, %arg0, %0) <{op = 3 : i32}> : (memref<100xf32>, memref<100xf32>, !mpi.comm) -> () loc("<stdin>":50:5)
    "func.return"() : () -> () loc("<stdin>":51:5)
  }) : () -> () loc("<stdin>":47:3)
}) {dlti.map = #dlti.map<"MPI:Implementation" = "MPICH">} : () -> () loc("<stdin>":1:1)
