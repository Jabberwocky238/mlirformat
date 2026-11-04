"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: 2, 2, 4>, sym_name = "grid0"}> : () -> ()
  "shard.grid"() <{shape = array<i64: 4, -9223372036854775808>, sym_name = "grid1"}> : () -> ()
  "shard.grid"() <{shape = array<i64: -9223372036854775808, 4>, sym_name = "grid2"}> : () -> ()
  "shard.grid"() <{shape = array<i64: -9223372036854775808, -9223372036854775808>, sym_name = "grid3"}> : () -> ()
  "shard.grid"() <{shape = array<i64: 3>, sym_name = "grid4"}> : () -> ()
  "shard.grid"() <{shape = array<i64: -9223372036854775808>, sym_name = "grid5"}> : () -> ()
  "func.func"() <{function_type = (tensor<4x8xf32>) -> tensor<4x8xf32>, sym_name = "grid_shard_op_fully_replicated"}> ({
  ^bb0(%arg40: tensor<4x8xf32>):
    %61 = "shard.sharding"() <{grid = @grid0, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %62 = "shard.shard"(%arg40, %61) : (tensor<4x8xf32>, !shard.sharding) -> tensor<4x8xf32>
    "func.return"(%62) : (tensor<4x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4x8xf32>) -> tensor<4x8xf32>, sym_name = "grid_shard_op_1st_dim"}> ({
  ^bb0(%arg39: tensor<4x8xf32>):
    %59 = "shard.sharding"() <{grid = @grid0, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %60 = "shard.shard"(%arg39, %59) : (tensor<4x8xf32>, !shard.sharding) -> tensor<4x8xf32>
    "func.return"(%60) : (tensor<4x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4x8xf32>) -> tensor<4x8xf32>, sym_name = "grid_shard_op_2nd_dim"}> ({
  ^bb0(%arg38: tensor<4x8xf32>):
    %57 = "shard.sharding"() <{grid = @grid1, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[], [0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %58 = "shard.shard"(%arg38, %57) : (tensor<4x8xf32>, !shard.sharding) -> tensor<4x8xf32>
    "func.return"(%58) : (tensor<4x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4x8x16xf32>) -> tensor<4x8x16xf32>, sym_name = "grid_shard_op_1st_and_3rd_dim"}> ({
  ^bb0(%arg37: tensor<4x8x16xf32>):
    %55 = "shard.sharding"() <{grid = @grid3, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0], [], [1]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %56 = "shard.shard"(%arg37, %55) : (tensor<4x8x16xf32>, !shard.sharding) -> tensor<4x8x16xf32>
    "func.return"(%56) : (tensor<4x8x16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4x8xf32>) -> (tensor<4x8xf32>, tensor<4x8xf32>), sym_name = "grid_shard_op_two_users"}> ({
  ^bb0(%arg36: tensor<4x8xf32>):
    %49 = "shard.sharding"() <{grid = @grid0, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %50 = "shard.shard"(%arg36, %49) : (tensor<4x8xf32>, !shard.sharding) -> tensor<4x8xf32>
    %51 = "shard.sharding"() <{grid = @grid0, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[1]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %52 = "shard.shard"(%50, %51) <{annotate_for_users}> : (tensor<4x8xf32>, !shard.sharding) -> tensor<4x8xf32>
    %53 = "shard.sharding"() <{grid = @grid0, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[2]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %54 = "shard.shard"(%50, %53) <{annotate_for_users}> : (tensor<4x8xf32>, !shard.sharding) -> tensor<4x8xf32>
    "func.return"(%52, %54) : (tensor<4x8xf32>, tensor<4x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "grid_shard_halo_sizes"}> ({
    %46 = "arith.constant"() <{value = 3 : i64}> : () -> i64
    %47 = "shard.sharding"() <{grid = @grid4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64: 1, 4>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %48 = "shard.sharding"(%46) <{grid = @grid4, operandSegmentSizes = array<i32: 0, 1>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64: 4, -9223372036854775808>, static_sharded_dims_offsets = array<i64>}> : (i64) -> !shard.sharding
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "grid_shard_dims_sizes"}> ({
    %43 = "arith.constant"() <{value = 3 : i64}> : () -> i64
    %44 = "shard.sharding"() <{grid = @grid4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64: 0, 1, 4, 6>}> : () -> !shard.sharding
    %45 = "shard.sharding"(%43) <{grid = @grid4, operandSegmentSizes = array<i32: 1, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64: 0, 2, -9223372036854775808, 5>}> : (i64) -> !shard.sharding
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "grid_shard_shape"}> ({
    %39 = "arith.constant"() <{value = 3 : index}> : () -> index
    %40 = "shard.sharding"() <{grid = @grid0, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %41:2 = "shard.shard_shape"(%39, %40, %39) <{device = array<i64: -9223372036854775808>, dims = array<i64: 8, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 1, 1>}> : (index, !shard.sharding, index) -> (index, index)
    %42:2 = "shard.shard_shape"(%40) <{device = array<i64: 3>, dims = array<i64: 8, 4>, operandSegmentSizes = array<i32: 0, 1, 0>}> : (!shard.sharding) -> (index, index)
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4x8xf32>) -> !shard.sharding, sym_name = "grid_get_sharding"}> ({
  ^bb0(%arg35: tensor<4x8xf32>):
    %38 = "shard.get_sharding"(%arg35) : (tensor<4x8xf32>) -> !shard.sharding
    "func.return"(%38) : (!shard.sharding) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (index, index), sym_name = "grid_shape"}> ({
    %37:2 = "shard.grid_shape"() <{axes = array<i16: 0, 1>, grid = @grid0}> : () -> (index, index)
    "func.return"(%37#0, %37#1) : (index, index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (index, index, index), sym_name = "grid_shape_default_axes"}> ({
    %36:3 = "shard.grid_shape"() <{axes = array<i16>, grid = @grid0}> : () -> (index, index, index)
    "func.return"(%36#0, %36#1, %36#2) : (index, index, index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (index, index, index), sym_name = "grid_shape_empty_axes"}> ({
    %35:3 = "shard.grid_shape"() <{axes = array<i16>, grid = @grid0}> : () -> (index, index, index)
    "func.return"(%35#0, %35#1, %35#2) : (index, index, index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (index, index), sym_name = "process_multi_index"}> ({
    %34:2 = "shard.process_multi_index"() <{axes = array<i16: 0, 1>, grid = @grid0}> : () -> (index, index)
    "func.return"(%34#0, %34#1) : (index, index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (index, index, index), sym_name = "process_multi_index_default_axes"}> ({
    %33:3 = "shard.process_multi_index"() <{axes = array<i16>, grid = @grid0}> : () -> (index, index, index)
    "func.return"(%33#0, %33#1, %33#2) : (index, index, index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (index, index, index), sym_name = "process_multi_index_empty_axes"}> ({
    %32:3 = "shard.process_multi_index"() <{axes = array<i16>, grid = @grid0}> : () -> (index, index, index)
    "func.return"(%32#0, %32#1, %32#2) : (index, index, index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "process_linear_index"}> ({
    %31 = "shard.process_linear_index"() <{grid = @grid0}> : () -> index
    "func.return"(%31) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<3x4xf32>) -> tensor<3x4xf64>, sym_name = "all_reduce"}> ({
  ^bb0(%arg34: tensor<3x4xf32>):
    %30 = "shard.all_reduce"(%arg34) <{grid = @grid0, grid_axes = array<i16: 1, 0>, reduction = #shard<partial max>}> : (tensor<3x4xf32>) -> tensor<3x4xf64>
    "func.return"(%30) : (tensor<3x4xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<3x4xf32>) -> tensor<3x16xf32>, sym_name = "all_gather"}> ({
  ^bb0(%arg33: tensor<3x4xf32>):
    %29 = "shard.all_gather"(%arg33) <{gather_axis = 1 : index, grid = @grid0, grid_axes = array<i16: 2>}> : (tensor<3x4xf32>) -> tensor<3x16xf32>
    "func.return"(%29) : (tensor<3x16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "all_gather_dynamic_dims_in_tensor"}> ({
  ^bb0(%arg32: tensor<?x?xf32>):
    %28 = "shard.all_gather"(%arg32) <{gather_axis = 1 : index, grid = @grid0, grid_axes = array<i16: 2>}> : (tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%28) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<5x6xf32>) -> tensor<5x?xf32>, sym_name = "all_gather_dynamic_dims_in_grid"}> ({
  ^bb0(%arg31: tensor<5x6xf32>):
    %27 = "shard.all_gather"(%arg31) <{gather_axis = 1 : index, grid = @grid3, grid_axes = array<i16: 1>}> : (tensor<5x6xf32>) -> tensor<5x?xf32>
    "func.return"(%27) : (tensor<5x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<3x4xf32>) -> tensor<3x1xf32>, sym_name = "all_slice_static_dimensions"}> ({
  ^bb0(%arg30: tensor<3x4xf32>):
    %26 = "shard.all_slice"(%arg30) <{grid = @grid0, grid_axes = array<i16: 2>, slice_axis = 1 : index}> : (tensor<3x4xf32>) -> tensor<3x1xf32>
    "func.return"(%26) : (tensor<3x1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf32>) -> tensor<?xf32>, sym_name = "all_slice_dynamic_dimensions"}> ({
  ^bb0(%arg29: tensor<?xf32>):
    %25 = "shard.all_slice"(%arg29) <{grid = @grid3, grid_axes = array<i16: 0, 1>, slice_axis = 0 : index}> : (tensor<?xf32>) -> tensor<?xf32>
    "func.return"(%25) : (tensor<?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<3x6xi8>) -> tensor<3x6xi8>, sym_name = "all_to_all"}> ({
  ^bb0(%arg28: tensor<3x6xi8>):
    %24 = "shard.all_to_all"(%arg28) <{concat_axis = 0 : index, grid = @grid4, grid_axes = array<i16>, split_axis = 1 : index}> : (tensor<3x6xi8>) -> tensor<3x6xi8>
    "func.return"(%24) : (tensor<3x6xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<3x6xi8>) -> tensor<3x?xi8>, sym_name = "all_to_all_dynamic_dims_in_result"}> ({
  ^bb0(%arg27: tensor<3x6xi8>):
    %23 = "shard.all_to_all"(%arg27) <{concat_axis = 0 : index, grid = @grid4, grid_axes = array<i16>, split_axis = 1 : index}> : (tensor<3x6xi8>) -> tensor<3x?xi8>
    "func.return"(%23) : (tensor<3x?xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<3xi8>) -> tensor<3xi8>, sym_name = "all_to_all_same_split_concat_dim_with_dynamic_device_group_size"}> ({
  ^bb0(%arg26: tensor<3xi8>):
    %22 = "shard.all_to_all"(%arg26) <{concat_axis = 0 : index, grid = @grid4, grid_axes = array<i16>, split_axis = 0 : index}> : (tensor<3xi8>) -> tensor<3xi8>
    "func.return"(%22) : (tensor<3xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x3xi8>) -> tensor<?x12xi8>, sym_name = "all_to_all_non_divisible_split_axis_size"}> ({
  ^bb0(%arg25: tensor<2x3xi8>):
    %21 = "shard.all_to_all"(%arg25) <{concat_axis = 1 : index, grid = @grid0, grid_axes = array<i16: 0, 1>, split_axis = 0 : index}> : (tensor<2x3xi8>) -> tensor<?x12xi8>
    "func.return"(%21) : (tensor<?x12xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<3x6xi8>) -> tensor<3x6xi8>, sym_name = "broadcast_static_root"}> ({
  ^bb0(%arg24: tensor<3x6xi8>):
    %20 = "shard.broadcast"(%arg24) <{grid = @grid0, grid_axes = array<i16: 0, 2>, root = array<i64: 0, 1>}> : (tensor<3x6xi8>) -> tensor<3x6xi8>
    "func.return"(%20) : (tensor<3x6xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<3x6xi8>, index) -> tensor<3x6xi8>, sym_name = "broadcast_dynamic_root"}> ({
  ^bb0(%arg22: tensor<3x6xi8>, %arg23: index):
    %19 = "shard.broadcast"(%arg22, %arg23) <{grid = @grid0, grid_axes = array<i16: 0, 2>, root = array<i64: 1, -9223372036854775808>}> : (tensor<3x6xi8>, index) -> tensor<3x6xi8>
    "func.return"(%19) : (tensor<3x6xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<3x6xi8>) -> tensor<24x6xi8>, sym_name = "gather_static_root"}> ({
  ^bb0(%arg21: tensor<3x6xi8>):
    %18 = "shard.gather"(%arg21) <{gather_axis = 0 : index, grid = @grid0, grid_axes = array<i16: 0, 2>, root = array<i64: 0, 1>}> : (tensor<3x6xi8>) -> tensor<24x6xi8>
    "func.return"(%18) : (tensor<24x6xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<3x6xi8>, index) -> tensor<24x6xi8>, sym_name = "gather_dynamic_root"}> ({
  ^bb0(%arg19: tensor<3x6xi8>, %arg20: index):
    %17 = "shard.gather"(%arg19, %arg20) <{gather_axis = 0 : index, grid = @grid0, grid_axes = array<i16: 0, 2>, root = array<i64: 1, -9223372036854775808>}> : (tensor<3x6xi8>, index) -> tensor<24x6xi8>
    "func.return"(%17) : (tensor<24x6xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2xi8>) -> tensor<2xi8>, sym_name = "receive_static_source"}> ({
  ^bb0(%arg18: tensor<2xi8>):
    %16 = "shard.recv"(%arg18) <{grid = @grid0, grid_axes = array<i16: 0, 2>, source = array<i64: 0, 1>}> : (tensor<2xi8>) -> tensor<2xi8>
    "func.return"(%16) : (tensor<2xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2xi8>, index) -> tensor<2xi8>, sym_name = "receive_dynamic_source"}> ({
  ^bb0(%arg16: tensor<2xi8>, %arg17: index):
    %15 = "shard.recv"(%arg16, %arg17) <{grid = @grid0, grid_axes = array<i16: 0, 2>, source = array<i64: 1, -9223372036854775808>}> : (tensor<2xi8>, index) -> tensor<2xi8>
    "func.return"(%15) : (tensor<2xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2xi8>) -> tensor<2xi8>, sym_name = "receive_no_source"}> ({
  ^bb0(%arg15: tensor<2xi8>):
    %14 = "shard.recv"(%arg15) <{grid = @grid0, grid_axes = array<i16: 0, 2>}> : (tensor<2xi8>) -> tensor<2xi8>
    "func.return"(%14) : (tensor<2xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2xi8>) -> tensor<2xi8>, sym_name = "reduce_static_root"}> ({
  ^bb0(%arg14: tensor<2xi8>):
    %13 = "shard.reduce"(%arg14) <{grid = @grid0, grid_axes = array<i16: 0, 2>, reduction = #shard<partial sum>, root = array<i64: 0, 1>}> : (tensor<2xi8>) -> tensor<2xi8>
    "func.return"(%13) : (tensor<2xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2xi8>, index) -> tensor<2xi8>, sym_name = "reduce_dynamic_root"}> ({
  ^bb0(%arg12: tensor<2xi8>, %arg13: index):
    %12 = "shard.reduce"(%arg12, %arg13) <{grid = @grid0, grid_axes = array<i16: 0, 2>, reduction = #shard<partial sum>, root = array<i64: 1, -9223372036854775808>}> : (tensor<2xi8>, index) -> tensor<2xi8>
    "func.return"(%12) : (tensor<2xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2xi8>) -> tensor<2xi16>, sym_name = "reduce_different_return_element_type"}> ({
  ^bb0(%arg11: tensor<2xi8>):
    %11 = "shard.reduce"(%arg11) <{grid = @grid0, grid_axes = array<i16: 0, 2>, reduction = #shard<partial sum>, root = array<i64: 0, 1>}> : (tensor<2xi8>) -> tensor<2xi16>
    "func.return"(%11) : (tensor<2xi16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<3x4xf32>) -> tensor<3x1xf64>, sym_name = "reduce_scatter_static_dimensions"}> ({
  ^bb0(%arg10: tensor<3x4xf32>):
    %10 = "shard.reduce_scatter"(%arg10) <{grid = @grid0, grid_axes = array<i16: 2>, reduction = #shard<partial max>, scatter_axis = 1 : index}> : (tensor<3x4xf32>) -> tensor<3x1xf64>
    "func.return"(%10) : (tensor<3x1xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf32>) -> tensor<?xf64>, sym_name = "reduce_scatter_dynamic_dimensions"}> ({
  ^bb0(%arg9: tensor<?xf32>):
    %9 = "shard.reduce_scatter"(%arg9) <{grid = @grid3, grid_axes = array<i16: 0, 1>, reduction = #shard<partial sum>, scatter_axis = 0 : index}> : (tensor<?xf32>) -> tensor<?xf64>
    "func.return"(%9) : (tensor<?xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<3x4xf32>) -> tensor<3x1xf32>, sym_name = "scatter_static_dimensions"}> ({
  ^bb0(%arg8: tensor<3x4xf32>):
    %8 = "shard.scatter"(%arg8) <{grid = @grid0, grid_axes = array<i16: 2>, root = array<i64: 1>, scatter_axis = 1 : index}> : (tensor<3x4xf32>) -> tensor<3x1xf32>
    "func.return"(%8) : (tensor<3x1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf32>) -> tensor<?xf32>, sym_name = "scatter_dynamic_dimensions"}> ({
  ^bb0(%arg7: tensor<?xf32>):
    %7 = "shard.scatter"(%arg7) <{grid = @grid3, grid_axes = array<i16: 0, 1>, root = array<i64: 1, 2>, scatter_axis = 0 : index}> : (tensor<?xf32>) -> tensor<?xf32>
    "func.return"(%7) : (tensor<?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8xi8>, index) -> tensor<1xi8>, sym_name = "scatter_dynamic_root"}> ({
  ^bb0(%arg5: tensor<8xi8>, %arg6: index):
    %6 = "shard.scatter"(%arg5, %arg6) <{grid = @grid0, grid_axes = array<i16: 0, 2>, root = array<i64: 1, -9223372036854775808>, scatter_axis = 0 : index}> : (tensor<8xi8>, index) -> tensor<1xi8>
    "func.return"(%6) : (tensor<1xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2xi8>) -> tensor<2xi8>, sym_name = "send_static_destination"}> ({
  ^bb0(%arg4: tensor<2xi8>):
    %5 = "shard.send"(%arg4) <{destination = array<i64: 0, 1>, grid = @grid0, grid_axes = array<i16: 0, 2>}> : (tensor<2xi8>) -> tensor<2xi8>
    "func.return"(%5) : (tensor<2xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2xi8>, index) -> tensor<2xi8>, sym_name = "send_dynamic_destination"}> ({
  ^bb0(%arg2: tensor<2xi8>, %arg3: index):
    %4 = "shard.send"(%arg2, %arg3) <{destination = array<i64: 1, -9223372036854775808>, grid = @grid0, grid_axes = array<i16: 0, 2>}> : (tensor<2xi8>, index) -> tensor<2xi8>
    "func.return"(%4) : (tensor<2xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2xi8>) -> tensor<2xi8>, sym_name = "shift"}> ({
  ^bb0(%arg1: tensor<2xi8>):
    %3 = "shard.shift"(%arg1) <{grid = @grid0, grid_axes = array<i16: 0, 2>, offset = -2 : i64, rotate, shift_axis = 2 : index}> : (tensor<2xi8>) -> tensor<2xi8>
    "func.return"(%3) : (tensor<2xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<12x12xi8>) -> (), sym_name = "update_halo"}> ({
  ^bb0(%arg0: memref<12x12xi8>):
    %0 = "arith.constant"() <{value = 2 : i64}> : () -> i64
    %1 = "shard.update_halo"(%arg0, %0) <{grid = @grid0, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64: 2, -9223372036854775808>}> : (memref<12x12xi8>, i64) -> memref<12x12xi8>
    %2 = "shard.update_halo"(%1, %0) <{grid = @grid0, split_axes = #shard<axisarray[[0], [1]]>, static_halo_sizes = array<i64: 2, 2, -9223372036854775808, 2>}> : (memref<12x12xi8>, i64) -> memref<12x12xi8>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

