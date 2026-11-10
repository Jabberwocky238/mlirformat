"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: 2>, sym_name = "grid_1d"}> : () -> ()
  "shard.grid"() <{shape = array<i64: -9223372036854775808>, sym_name = "grid_1d_dynamic"}> : () -> ()
  "shard.grid"() <{shape = array<i64: 2, 2, 2>, sym_name = "grid_3d"}> : () -> ()
  "func.func"() <{function_type = (tensor<2xf32>) -> tensor<2xf32>, sym_name = "same_source_and_target_sharding"}> ({
  ^bb0(%arg13: tensor<2xf32>):
    %51 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %52 = "shard.shard"(%arg13, %51) : (tensor<2xf32>, !shard.sharding) -> tensor<2xf32>
    %53 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %54 = "shard.shard"(%52, %53) <{annotate_for_users}> : (tensor<2xf32>, !shard.sharding) -> tensor<2xf32>
    "func.return"(%54) : (tensor<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2xf32>) -> tensor<2xf32>, sym_name = "identical_source_and_target_sharding"}> ({
  ^bb0(%arg12: tensor<2xf32>):
    %48 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %49 = "shard.shard"(%arg12, %48) : (tensor<2xf32>, !shard.sharding) -> tensor<2xf32>
    %50 = "shard.shard"(%49, %48) <{annotate_for_users}> : (tensor<2xf32>, !shard.sharding) -> tensor<2xf32>
    "func.return"(%50) : (tensor<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<3x14xf32>) -> tensor<3x14xf32>, sym_name = "split_replicated_tensor_axis"}> ({
  ^bb0(%arg11: tensor<3x14xf32>):
    %44 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %45 = "shard.shard"(%arg11, %44) : (tensor<3x14xf32>, !shard.sharding) -> tensor<3x14xf32>
    %46 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[], [0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %47 = "shard.shard"(%45, %46) <{annotate_for_users}> : (tensor<3x14xf32>, !shard.sharding) -> tensor<3x14xf32>
    "func.return"(%47) : (tensor<3x14xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x3x?xf32>) -> tensor<?x3x?xf32>, sym_name = "split_replicated_tensor_axis_dynamic"}> ({
  ^bb0(%arg10: tensor<?x3x?xf32>):
    %40 = "shard.sharding"() <{grid = @grid_1d_dynamic, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[], [], []]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %41 = "shard.shard"(%arg10, %40) : (tensor<?x3x?xf32>, !shard.sharding) -> tensor<?x3x?xf32>
    %42 = "shard.sharding"() <{grid = @grid_1d_dynamic, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %43 = "shard.shard"(%41, %42) <{annotate_for_users}> : (tensor<?x3x?xf32>, !shard.sharding) -> tensor<?x3x?xf32>
    "func.return"(%43) : (tensor<?x3x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<10x14xf32>) -> tensor<10x14xf32>, sym_name = "move_split_axis"}> ({
  ^bb0(%arg9: tensor<10x14xf32>):
    %36 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %37 = "shard.shard"(%arg9, %36) : (tensor<10x14xf32>, !shard.sharding) -> tensor<10x14xf32>
    %38 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[], [0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %39 = "shard.shard"(%37, %38) <{annotate_for_users}> : (tensor<10x14xf32>, !shard.sharding) -> tensor<10x14xf32>
    "func.return"(%39) : (tensor<10x14xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<10x14xf32>) -> tensor<10x14xf32>, sym_name = "move_split_axis_dynamic_grid"}> ({
  ^bb0(%arg8: tensor<10x14xf32>):
    %32 = "shard.sharding"() <{grid = @grid_1d_dynamic, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %33 = "shard.shard"(%arg8, %32) : (tensor<10x14xf32>, !shard.sharding) -> tensor<10x14xf32>
    %34 = "shard.sharding"() <{grid = @grid_1d_dynamic, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[], [0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %35 = "shard.shard"(%33, %34) <{annotate_for_users}> : (tensor<10x14xf32>, !shard.sharding) -> tensor<10x14xf32>
    "func.return"(%35) : (tensor<10x14xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x14xf32>) -> tensor<?x14xf32>, sym_name = "move_split_dynamic_axis"}> ({
  ^bb0(%arg7: tensor<?x14xf32>):
    %28 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %29 = "shard.shard"(%arg7, %28) : (tensor<?x14xf32>, !shard.sharding) -> tensor<?x14xf32>
    %30 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[], [0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %31 = "shard.shard"(%29, %30) <{annotate_for_users}> : (tensor<?x14xf32>, !shard.sharding) -> tensor<?x14xf32>
    "func.return"(%31) : (tensor<?x14xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<10x14xf32>) -> tensor<10x14xf32>, sym_name = "unshard_static_axis"}> ({
  ^bb0(%arg6: tensor<10x14xf32>):
    %24 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %25 = "shard.shard"(%arg6, %24) : (tensor<10x14xf32>, !shard.sharding) -> tensor<10x14xf32>
    %26 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %27 = "shard.shard"(%25, %26) <{annotate_for_users}> : (tensor<10x14xf32>, !shard.sharding) -> tensor<10x14xf32>
    "func.return"(%27) : (tensor<10x14xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<10x14xf32>) -> tensor<10x14xf32>, sym_name = "unshard_static_last_axis"}> ({
  ^bb0(%arg5: tensor<10x14xf32>):
    %20 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[], [0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %21 = "shard.shard"(%arg5, %20) : (tensor<10x14xf32>, !shard.sharding) -> tensor<10x14xf32>
    %22 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[], []]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %23 = "shard.shard"(%21, %22) <{annotate_for_users}> : (tensor<10x14xf32>, !shard.sharding) -> tensor<10x14xf32>
    "func.return"(%23) : (tensor<10x14xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x14xf32>) -> tensor<?x14xf32>, sym_name = "unshard_dynamic_axis"}> ({
  ^bb0(%arg4: tensor<?x14xf32>):
    %16 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %17 = "shard.shard"(%arg4, %16) : (tensor<?x14xf32>, !shard.sharding) -> tensor<?x14xf32>
    %18 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %19 = "shard.shard"(%17, %18) <{annotate_for_users}> : (tensor<?x14xf32>, !shard.sharding) -> tensor<?x14xf32>
    "func.return"(%19) : (tensor<?x14xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<10x14xf32>) -> tensor<10x14xf32>, sym_name = "unshard_static_axis_on_dynamic_grid_axis"}> ({
  ^bb0(%arg3: tensor<10x14xf32>):
    %12 = "shard.sharding"() <{grid = @grid_1d_dynamic, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %13 = "shard.shard"(%arg3, %12) : (tensor<10x14xf32>, !shard.sharding) -> tensor<10x14xf32>
    %14 = "shard.sharding"() <{grid = @grid_1d_dynamic, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %15 = "shard.shard"(%13, %14) <{annotate_for_users}> : (tensor<10x14xf32>, !shard.sharding) -> tensor<10x14xf32>
    "func.return"(%15) : (tensor<10x14xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x16xf32>) -> tensor<8x16xf32>, sym_name = "move_last_split_axis_to_front_of_target_dim"}> ({
  ^bb0(%arg2: tensor<8x16xf32>):
    %8 = "shard.sharding"() <{grid = @grid_3d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0, 1], [2]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %9 = "shard.shard"(%arg2, %8) : (tensor<8x16xf32>, !shard.sharding) -> tensor<8x16xf32>
    %10 = "shard.sharding"() <{grid = @grid_3d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0], [1, 2]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %11 = "shard.shard"(%9, %10) <{annotate_for_users}> : (tensor<8x16xf32>, !shard.sharding) -> tensor<8x16xf32>
    "func.return"(%11) : (tensor<8x16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x16xf32>) -> tensor<8x16xf32>, sym_name = "move_last_split_axis_to_lower_dim"}> ({
  ^bb0(%arg1: tensor<8x16xf32>):
    %4 = "shard.sharding"() <{grid = @grid_3d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0], [1, 2]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %5 = "shard.shard"(%arg1, %4) : (tensor<8x16xf32>, !shard.sharding) -> tensor<8x16xf32>
    %6 = "shard.sharding"() <{grid = @grid_3d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[2, 0], [1]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %7 = "shard.shard"(%5, %6) <{annotate_for_users}> : (tensor<8x16xf32>, !shard.sharding) -> tensor<8x16xf32>
    "func.return"(%7) : (tensor<8x16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x16xf32>) -> tensor<8x16xf32>, sym_name = "move_last_split_axis_empty_source_at_target_dim"}> ({
  ^bb0(%arg0: tensor<8x16xf32>):
    %0 = "shard.sharding"() <{grid = @grid_3d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0, 1]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %1 = "shard.shard"(%arg0, %0) : (tensor<8x16xf32>, !shard.sharding) -> tensor<8x16xf32>
    %2 = "shard.sharding"() <{grid = @grid_3d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0], [1]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %3 = "shard.shard"(%1, %2) <{annotate_for_users}> : (tensor<8x16xf32>, !shard.sharding) -> tensor<8x16xf32>
    "func.return"(%3) : (tensor<8x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

