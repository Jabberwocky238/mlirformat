"builtin.module"() ({
  "func.func"() <{function_type = (memref<100xf32>) -> (i32, i32), sym_name = "mpi_test"}> ({
  ^bb0(%arg0: memref<100xf32> loc("<stdin>":3:8)):
    %0 = "mpi.comm_world"() : () -> !mpi.comm loc("<stdin>":4:10)
    %1 = "mpi.comm_size"(%0) : (!mpi.comm) -> i32 loc("<stdin>":5:10)
    %2 = "mpi.comm_rank"(%0) : (!mpi.comm) -> i32 loc("<stdin>":6:10)
    "func.return"(%1, %2) : (i32, i32) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
}) {mpi.dlti = #dlti.map<"MPI:comm_world_size" = 12 : i64, "MPI:comm_world_rank" = 5 : i64>} : () -> () loc("<stdin>":1:1)
