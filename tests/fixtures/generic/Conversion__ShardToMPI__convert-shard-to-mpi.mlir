"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: 3, 4, 5>, sym_name = "grid0"}> : () -> ()
  "func.func"() <{function_type = () -> (index, index, index), sym_name = "process_multi_index"}> ({
    %13:3 = "shard.process_multi_index"() <{axes = array<i16>, grid = @grid0}> : () -> (index, index, index)
    "func.return"(%13#0, %13#1, %13#2) : (index, index, index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "process_linear_index"}> ({
    %12 = "shard.process_linear_index"() <{grid = @grid0}> : () -> index
    "func.return"(%12) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<120x120x120xi8>) -> (index, index), sym_name = "neighbors_dim0"}> ({
  ^bb0(%arg2: tensor<120x120x120xi8>):
    %8 = "arith.constant"() <{value = 0 : index}> : () -> index
    %9 = "arith.constant"() <{value = 1 : index}> : () -> index
    %10 = "arith.constant"() <{value = 4 : index}> : () -> index
    %11:2 = "shard.neighbors_linear_indices"(%9, %8, %10) <{grid = @grid0, split_axes = array<i16: 0>}> : (index, index, index) -> (index, index)
    "func.return"(%11#0, %11#1) : (index, index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<120x120x120xi8>) -> (index, index), sym_name = "neighbors_dim1"}> ({
  ^bb0(%arg1: tensor<120x120x120xi8>):
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5 = "arith.constant"() <{value = 1 : index}> : () -> index
    %6 = "arith.constant"() <{value = 4 : index}> : () -> index
    %7:2 = "shard.neighbors_linear_indices"(%5, %4, %6) <{grid = @grid0, split_axes = array<i16: 1>}> : (index, index, index) -> (index, index)
    "func.return"(%7#0, %7#1) : (index, index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<120x120x120xi8>) -> (index, index), sym_name = "neighbors_dim2"}> ({
  ^bb0(%arg0: tensor<120x120x120xi8>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3:2 = "shard.neighbors_linear_indices"(%1, %0, %2) <{grid = @grid0, split_axes = array<i16: 2>}> : (index, index, index) -> (index, index)
    "func.return"(%3#0, %3#1) : (index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: 3, 4, 5>, sym_name = "grid0"}> : () -> ()
  "func.func"() <{function_type = () -> (index, index, index), sym_name = "process_multi_index"}> ({
    %1:3 = "shard.process_multi_index"() <{axes = array<i16>, grid = @grid0}> : () -> (index, index, index)
    "func.return"(%1#0, %1#1, %1#2) : (index, index, index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "process_linear_index"}> ({
    %0 = "shard.process_linear_index"() <{grid = @grid0}> : () -> index
    "func.return"(%0) : (index) -> ()
  }) : () -> ()
}) {mpi.dlti = #dlti.map<"MPI:comm_world_rank" = 24 : i64>} : () -> ()

// -----
"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: 3, 4, 5>, sym_name = "grid0"}> : () -> ()
  "func.func"() <{function_type = (tensor<3x4xf32>) -> tensor<3x4xf32>, sym_name = "allreduce_tensor"}> ({
  ^bb0(%arg2: tensor<3x4xf32>):
    %2 = "shard.all_reduce"(%arg2) <{grid = @grid0, grid_axes = array<i16: 0, 1>, reduction = #shard<partial max>}> : (tensor<3x4xf32>) -> tensor<3x4xf32>
    "func.return"(%2) : (tensor<3x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<3x4xf32>) -> memref<3x4xf32>, sym_name = "allreduce_memref"}> ({
  ^bb0(%arg1: memref<3x4xf32>):
    %1 = "shard.all_reduce"(%arg1) <{grid = @grid0, grid_axes = array<i16: 0, 1>, reduction = #shard<partial max>}> : (memref<3x4xf32>) -> memref<3x4xf32>
    "func.return"(%1) : (memref<3x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<3x4xf32>) -> memref<3x4xf64>, sym_name = "allreduce_new_type"}> ({
  ^bb0(%arg0: memref<3x4xf32>):
    %0 = "shard.all_reduce"(%arg0) <{grid = @grid0, grid_axes = array<i16: 0, 1>, reduction = #shard<partial max>}> : (memref<3x4xf32>) -> memref<3x4xf64>
    "func.return"(%0) : (memref<3x4xf64>) -> ()
  }) : () -> ()
}) {mpi.dlti = #dlti.map<"MPI:comm_world_rank" = 7 : i64>} : () -> ()

// -----
"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: 3, 4, 5>, sym_name = "grid0"}> : () -> ()
  "func.func"() <{function_type = (memref<120x120x120xi8>) -> memref<120x120x120xi8>, sym_name = "update_halo_1d_first"}> ({
  ^bb0(%arg0: memref<120x120x120xi8>):
    %0 = "shard.update_halo"(%arg0) <{grid = @grid0, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64: 2, 3>}> : (memref<120x120x120xi8>) -> memref<120x120x120xi8>
    "func.return"(%0) : (memref<120x120x120xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: 4>, sym_name = "grid0"}> : () -> ()
  "func.func"() <{function_type = (memref<120x120x120xi8>) -> memref<120x120x120xi8>, sym_name = "update_halo_1d_with_zero"}> ({
  ^bb0(%arg0: memref<120x120x120xi8>):
    %0 = "shard.update_halo"(%arg0) <{grid = @grid0, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64: 2, 0>}> : (memref<120x120x120xi8>) -> memref<120x120x120xi8>
    "func.return"(%0) : (memref<120x120x120xi8>) -> ()
  }) : () -> ()
}) {mpi.dlti = #dlti.map<"MPI:comm_world_rank" = 1 : i64>} : () -> ()

// -----
"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: 3, 4, 5>, sym_name = "grid0"}> : () -> ()
  "func.func"() <{function_type = (memref<120x120x120xi8>) -> memref<120x120x120xi8>, sym_name = "update_halo_3d"}> ({
  ^bb0(%arg1: memref<120x120x120xi8>):
    %1 = "shard.update_halo"(%arg1) <{grid = @grid0, split_axes = #shard<axisarray[[2], [1], [0]]>, static_halo_sizes = array<i64: 1, 2, 3, 4, 5, 6>}> : (memref<120x120x120xi8>) -> memref<120x120x120xi8>
    "func.return"(%1) : (memref<120x120x120xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<120x120x120xi8>) -> tensor<120x120x120xi8>, sym_name = "update_halo_3d_tensor"}> ({
  ^bb0(%arg0: tensor<120x120x120xi8>):
    %0 = "shard.update_halo"(%arg0) <{grid = @grid0, split_axes = #shard<axisarray[[2], [1], [0]]>, static_halo_sizes = array<i64: 1, 2, 3, 4, 5, 6>}> : (tensor<120x120x120xi8>) -> tensor<120x120x120xi8>
    "func.return"(%0) : (tensor<120x120x120xi8>) -> ()
  }) : () -> ()
}) {mpi.dlti = #dlti.map<"MPI:comm_world_rank" = 24 : i64>} : () -> ()

// -----
"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: 2, 2, 4>, sym_name = "grid0"}> : () -> ()
  "func.func"() <{function_type = (tensor<2x4xf32>) -> (tensor<2x4xf32>, !shard.sharding), sym_name = "return_sharding"}> ({
  ^bb0(%arg2: tensor<2x4xf32>):
    %2 = "shard.sharding"() <{grid = @grid0, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0, 1], [2]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    "func.return"(%arg2, %2) : (tensor<2x4xf32>, !shard.sharding) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<6x8xf32>) -> (tensor<6x8xf32>, !shard.sharding), sym_name = "return_sharding_halos"}> ({
  ^bb0(%arg1: tensor<6x8xf32>):
    %1 = "shard.sharding"() <{grid = @grid0, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0, 1], [2]]>, static_halo_sizes = array<i64: 0, 4, 3, 1>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    "func.return"(%arg1, %1) : (tensor<6x8xf32>, !shard.sharding) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf32>) -> (tensor<?x?xf32>, !shard.sharding), sym_name = "return_sharding_offs"}> ({
  ^bb0(%arg0: tensor<?x?xf32>):
    %0 = "shard.sharding"() <{grid = @grid0, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0, 1], [2]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64: 0, 3, 5, 7, 8, 0, 0, 5, 10, 16>}> : () -> !shard.sharding
    "func.return"(%arg0, %0) : (tensor<?x?xf32>, !shard.sharding) -> ()
  }) : () -> ()
}) : () -> ()

