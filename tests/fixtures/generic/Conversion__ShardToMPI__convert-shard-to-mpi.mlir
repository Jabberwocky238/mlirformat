"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: 3, 4, 5>, sym_name = "grid0"}> : () -> ()
  "func.func"() <{function_type = () -> (index, index, index), sym_name = "process_multi_index"}> ({
    %14:3 = "shard.process_multi_index"() <{axes = array<i16>, grid = @grid0}> : () -> (index, index, index)
    "func.return"(%14#0, %14#1, %14#2) : (index, index, index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (index, index), sym_name = "process_multi_index_reorder"}> ({
    %13:2 = "shard.process_multi_index"() <{axes = array<i16: 2, 0>, grid = @grid0}> : () -> (index, index)
    "func.return"(%13#0, %13#1) : (index, index) -> ()
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
  "func.func"() <{function_type = (tensor<3x5xf32>) -> tensor<3x1xf32>, sym_name = "all_slice"}> ({
  ^bb0(%arg0: tensor<3x5xf32>):
    %0 = "shard.all_slice"(%arg0) <{grid = @grid0, grid_axes = array<i16: 2>, slice_axis = 1 : index}> : (tensor<3x5xf32>) -> tensor<3x1xf32>
    "func.return"(%0) : (tensor<3x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: 3, 4, 5>, sym_name = "grid0"}> : () -> ()
  "func.func"() <{function_type = (tensor<3x4xf32>) -> tensor<3x4xf32>, sym_name = "allreduce_tensor"}> ({
  ^bb0(%arg7: tensor<3x4xf32>):
    %7 = "shard.all_reduce"(%arg7) <{grid = @grid0, grid_axes = array<i16: 0, 1>, reduction = #shard<partial max>}> : (tensor<3x4xf32>) -> tensor<3x4xf32>
    "func.return"(%7) : (tensor<3x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<3x4xf32>) -> memref<3x4xf32>, sym_name = "allreduce_memref"}> ({
  ^bb0(%arg6: memref<3x4xf32>):
    %6 = "shard.all_reduce"(%arg6) <{grid = @grid0, grid_axes = array<i16: 0, 1>, reduction = #shard<partial max>}> : (memref<3x4xf32>) -> memref<3x4xf32>
    "func.return"(%6) : (memref<3x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<3x4xf32>) -> memref<3x4xf64>, sym_name = "allreduce_new_type"}> ({
  ^bb0(%arg5: memref<3x4xf32>):
    %5 = "shard.all_reduce"(%arg5) <{grid = @grid0, grid_axes = array<i16: 0, 1>, reduction = #shard<partial max>}> : (memref<3x4xf32>) -> memref<3x4xf64>
    "func.return"(%5) : (memref<3x4xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<3x4xf32>) -> memref<1x4xf32>, sym_name = "reduce_scatter_memref"}> ({
  ^bb0(%arg4: memref<3x4xf32>):
    %4 = "shard.reduce_scatter"(%arg4) <{grid = @grid0, grid_axes = array<i16: 0>, reduction = #shard<partial sum>, scatter_dim = 0 : index}> : (memref<3x4xf32>) -> memref<1x4xf32>
    "func.return"(%4) : (memref<1x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x12xf32>) -> tensor<2x4xf32>, sym_name = "reduce_scatter_tensor_dim1"}> ({
  ^bb0(%arg3: tensor<2x12xf32>):
    %3 = "shard.reduce_scatter"(%arg3) <{grid = @grid0, grid_axes = array<i16: 0>, reduction = #shard<partial sum>, scatter_dim = 1 : index}> : (tensor<2x12xf32>) -> tensor<2x4xf32>
    "func.return"(%3) : (tensor<2x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<3x4xf32>) -> tensor<12x4xf32>, sym_name = "allgather_tensor_0"}> ({
  ^bb0(%arg2: tensor<3x4xf32>):
    %2 = "shard.all_gather"(%arg2) <{gather_axis = 0 : index, grid = @grid0, grid_axes = array<i16: 1>}> : (tensor<3x4xf32>) -> tensor<12x4xf32>
    "func.return"(%2) : (tensor<12x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<3x4xf32>) -> tensor<3x20xf32>, sym_name = "allgather_tensor"}> ({
  ^bb0(%arg1: tensor<3x4xf32>):
    %1 = "shard.all_gather"(%arg1) <{gather_axis = 1 : index, grid = @grid0, grid_axes = array<i16: 2>}> : (tensor<3x4xf32>) -> tensor<3x20xf32>
    "func.return"(%1) : (tensor<3x20xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<3x4xf32>) -> memref<3x20xf32>, sym_name = "allgather_memref"}> ({
  ^bb0(%arg0: memref<3x4xf32>):
    %0 = "shard.all_gather"(%arg0) <{gather_axis = 1 : index, grid = @grid0, grid_axes = array<i16: 2>}> : (memref<3x4xf32>) -> memref<3x20xf32>
    "func.return"(%0) : (memref<3x20xf32>) -> ()
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

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: 4>, sym_name = "grid_1d_4"}> : () -> ()
  "func.func"() <{function_type = (tensor<512x512xf32>, tensor<2048x256xf32>, tensor<256x2048xf32>) -> tensor<512x2048xf32>, sym_name = "mlp_1dgrid"}> ({
  ^bb0(%arg0: tensor<512x512xf32>, %arg1: tensor<2048x256xf32>, %arg2: tensor<256x2048xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "shard.all_gather"(%arg0) <{gather_axis = 1 : index, grid = @grid_1d_4, grid_axes = array<i16: 0>}> : (tensor<512x512xf32>) -> tensor<512x2048xf32>
    %3 = "tensor.empty"() : () -> tensor<512x256xf32>
    %4 = "linalg.fill"(%0, %3) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg13: f32, %arg14: f32):
      "linalg.yield"(%arg13) : (f32) -> ()
    }) : (f32, tensor<512x256xf32>) -> tensor<512x256xf32>
    %5 = "linalg.matmul"(%2, %arg1, %4) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg10: f32, %arg11: f32, %arg12: f32):
      %19 = "arith.mulf"(%arg10, %arg11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %20 = "arith.addf"(%arg12, %19) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%20) : (f32) -> ()
    }) : (tensor<512x2048xf32>, tensor<2048x256xf32>, tensor<512x256xf32>) -> tensor<512x256xf32>
    %6 = "tosa.sigmoid"(%5) : (tensor<512x256xf32>) -> tensor<512x256xf32>
    %7 = "tensor.empty"() : () -> tensor<512x2048xf32>
    %8 = "linalg.fill"(%0, %7) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg8: f32, %arg9: f32):
      "linalg.yield"(%arg8) : (f32) -> ()
    }) : (f32, tensor<512x2048xf32>) -> tensor<512x2048xf32>
    %9 = "shard.process_multi_index"() <{axes = array<i16: 0>, grid = @grid_1d_4}> : () -> index
    %10 = "shard.grid_shape"() <{axes = array<i16: 0>, grid = @grid_1d_4}> : () -> index
    %11 = "arith.cmpi"(%9, %1) <{predicate = 0 : i64}> : (index, index) -> i1
    %12 = "scf.if"(%11) ({
      "scf.yield"(%8) : (tensor<512x2048xf32>) -> ()
    }, {
      %17 = "tensor.empty"() : () -> tensor<512x2048xf32>
      %18 = "linalg.fill"(%0, %17) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg6: f32, %arg7: f32):
        "linalg.yield"(%arg6) : (f32) -> ()
      }) : (f32, tensor<512x2048xf32>) -> tensor<512x2048xf32>
      "scf.yield"(%18) : (tensor<512x2048xf32>) -> ()
    }) : (i1) -> tensor<512x2048xf32>
    %13 = "linalg.matmul"(%6, %arg2, %12) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %15 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %16 = "arith.addf"(%arg5, %15) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%16) : (f32) -> ()
    }) : (tensor<512x256xf32>, tensor<256x2048xf32>, tensor<512x2048xf32>) -> tensor<512x2048xf32>
    %14 = "shard.all_reduce"(%13) <{grid = @grid_1d_4, grid_axes = array<i16: 0>, reduction = #shard<partial sum>}> : (tensor<512x2048xf32>) -> tensor<512x2048xf32>
    "func.return"(%14) : (tensor<512x2048xf32>) -> ()
  }) {llvm.emit_c_interface} : () -> ()
}) : () -> ()

