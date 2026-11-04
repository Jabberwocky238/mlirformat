#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: 2>, sym_name = "grid_2"}> : () -> ()
  "shard.grid"() <{shape = array<i64: -9223372036854775808>, sym_name = "grid_1d"}> : () -> ()
  "shard.grid"() <{shape = array<i64: 2, 4>, sym_name = "grid_2d"}> : () -> ()
  "shard.grid"() <{shape = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, sym_name = "grid_3d"}> : () -> ()
  "func.func"() <{function_type = (tensor<8x16xf32>) -> tensor<8x16xf32>, sym_name = "element_wise_empty_sharding_info"}> ({
  ^bb0(%arg34: tensor<8x16xf32>):
    %64 = "tosa.sigmoid"(%arg34) : (tensor<8x16xf32>) -> tensor<8x16xf32>
    "func.return"(%64) : (tensor<8x16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x16xf32>) -> tensor<8x16xf32>, sym_name = "element_wise_on_def"}> ({
  ^bb0(%arg33: tensor<8x16xf32>):
    %61 = "tosa.sigmoid"(%arg33) : (tensor<8x16xf32>) -> tensor<8x16xf32>
    %62 = "shard.sharding"() <{grid = @grid_2d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0], [1]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %63 = "shard.shard"(%61, %62) : (tensor<8x16xf32>, !shard.sharding) -> tensor<8x16xf32>
    "func.return"(%63) : (tensor<8x16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x16xf32>) -> tensor<8x16xf32>, sym_name = "element_wise_on_use"}> ({
  ^bb0(%arg32: tensor<8x16xf32>):
    %58 = "shard.sharding"() <{grid = @grid_2d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0], [1]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %59 = "shard.shard"(%arg32, %58) <{annotate_for_users}> : (tensor<8x16xf32>, !shard.sharding) -> tensor<8x16xf32>
    %60 = "tosa.sigmoid"(%59) : (tensor<8x16xf32>) -> tensor<8x16xf32>
    "func.return"(%60) : (tensor<8x16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x16xf32>) -> tensor<8x16xf32>, sym_name = "element_wise_on_graph_output"}> ({
  ^bb0(%arg31: tensor<8x16xf32>):
    %55 = "tosa.sigmoid"(%arg31) : (tensor<8x16xf32>) -> tensor<8x16xf32>
    %56 = "shard.sharding"() <{grid = @grid_2d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0], [1]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %57 = "shard.shard"(%55, %56) <{annotate_for_users}> : (tensor<8x16xf32>, !shard.sharding) -> tensor<8x16xf32>
    "func.return"(%57) : (tensor<8x16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x16xf32>) -> tensor<8x16xf32>, sym_name = "element_wise_on_graph_input"}> ({
  ^bb0(%arg30: tensor<8x16xf32>):
    %52 = "shard.sharding"() <{grid = @grid_2d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0], [1]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %53 = "shard.shard"(%arg30, %52) : (tensor<8x16xf32>, !shard.sharding) -> tensor<8x16xf32>
    %54 = "tosa.sigmoid"(%53) : (tensor<8x16xf32>) -> tensor<8x16xf32>
    "func.return"(%54) : (tensor<8x16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x16xf32>, tensor<1xf32>, tensor<1xf32>) -> (tensor<8x16xf32>, tensor<8x16xf32>), sym_name = "arrow_structure"}> ({
  ^bb0(%arg27: tensor<8x16xf32>, %arg28: tensor<1xf32>, %arg29: tensor<1xf32>):
    %47 = "tosa.tanh"(%arg27) : (tensor<8x16xf32>) -> tensor<8x16xf32>
    %48 = "tosa.abs"(%47) : (tensor<8x16xf32>) -> tensor<8x16xf32>
    %49 = "tosa.negate"(%47, %arg28, %arg29) : (tensor<8x16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<8x16xf32>
    %50 = "shard.sharding"() <{grid = @grid_2d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0], [1]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %51 = "shard.shard"(%49, %50) : (tensor<8x16xf32>, !shard.sharding) -> tensor<8x16xf32>
    "func.return"(%48, %51) : (tensor<8x16xf32>, tensor<8x16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x16x8xf32>, tensor<2x8x32xf32>, tensor<1xf32>) -> tensor<2x16x32xf32>, sym_name = "matmul_on_def_shard_batch_and_m"}> ({
  ^bb0(%arg24: tensor<2x16x8xf32>, %arg25: tensor<2x8x32xf32>, %arg26: tensor<1xf32>):
    %44 = "tosa.matmul"(%arg24, %arg25, %arg26, %arg26) : (tensor<2x16x8xf32>, tensor<2x8x32xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<2x16x32xf32>
    %45 = "shard.sharding"() <{grid = @grid_2d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0], [1]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %46 = "shard.shard"(%44, %45) : (tensor<2x16x32xf32>, !shard.sharding) -> tensor<2x16x32xf32>
    "func.return"(%46) : (tensor<2x16x32xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x16x8xf32>, tensor<2x8x32xf32>, tensor<1xf32>) -> tensor<2x16x32xf32>, sym_name = "matmul_on_def_shard_m_and_n"}> ({
  ^bb0(%arg21: tensor<2x16x8xf32>, %arg22: tensor<2x8x32xf32>, %arg23: tensor<1xf32>):
    %41 = "tosa.matmul"(%arg21, %arg22, %arg23, %arg23) : (tensor<2x16x8xf32>, tensor<2x8x32xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<2x16x32xf32>
    %42 = "shard.sharding"() <{grid = @grid_2d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[], [0], [1]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %43 = "shard.shard"(%41, %42) : (tensor<2x16x32xf32>, !shard.sharding) -> tensor<2x16x32xf32>
    "func.return"(%43) : (tensor<2x16x32xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x16x8xf32>, tensor<2x8x32xf32>, tensor<1xf32>) -> tensor<2x16x32xf32>, sym_name = "matmul_on_use_shard_m_and_k"}> ({
  ^bb0(%arg18: tensor<2x16x8xf32>, %arg19: tensor<2x8x32xf32>, %arg20: tensor<1xf32>):
    %38 = "shard.sharding"() <{grid = @grid_2d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[], [0], [1]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %39 = "shard.shard"(%arg18, %38) : (tensor<2x16x8xf32>, !shard.sharding) -> tensor<2x16x8xf32>
    %40 = "tosa.matmul"(%39, %arg19, %arg20, %arg20) : (tensor<2x16x8xf32>, tensor<2x8x32xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<2x16x32xf32>
    "func.return"(%40) : (tensor<2x16x32xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x16x8xf32>, tensor<2x8x32xf32>, tensor<1xf32>) -> tensor<2x16x32xf32>, sym_name = "matmul_on_use_shard_m_and_duplicted_k"}> ({
  ^bb0(%arg15: tensor<2x16x8xf32>, %arg16: tensor<2x8x32xf32>, %arg17: tensor<1xf32>):
    %33 = "shard.sharding"() <{grid = @grid_2d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[], [1], [0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %34 = "shard.shard"(%arg15, %33) <{annotate_for_users}> : (tensor<2x16x8xf32>, !shard.sharding) -> tensor<2x16x8xf32>
    %35 = "shard.sharding"() <{grid = @grid_2d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[], [0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %36 = "shard.shard"(%arg16, %35) <{annotate_for_users}> : (tensor<2x8x32xf32>, !shard.sharding) -> tensor<2x8x32xf32>
    %37 = "tosa.matmul"(%34, %36, %arg17, %arg17) : (tensor<2x16x8xf32>, tensor<2x8x32xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<2x16x32xf32>
    "func.return"(%37) : (tensor<2x16x32xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x3xf32>, tensor<3x2xf32>, tensor<2x2xf32>) -> tensor<2x2xf32>, sym_name = "resolve_conflicting_annotations"}> ({
  ^bb0(%arg9: tensor<2x3xf32>, %arg10: tensor<3x2xf32>, %arg11: tensor<2x2xf32>):
    %26 = "shard.sharding"() <{grid = @grid_2, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %27 = "shard.shard"(%arg9, %26) : (tensor<2x3xf32>, !shard.sharding) -> tensor<2x3xf32>
    %28 = "linalg.matmul"(%27, %arg10, %arg11) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg12: f32, %arg13: f32, %arg14: f32):
      %31 = "arith.mulf"(%arg12, %arg13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %32 = "arith.addf"(%arg14, %31) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%32) : (f32) -> ()
    }) : (tensor<2x3xf32>, tensor<3x2xf32>, tensor<2x2xf32>) -> tensor<2x2xf32>
    %29 = "shard.sharding"() <{grid = @grid_2, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %30 = "shard.shard"(%28, %29) : (tensor<2x2xf32>, !shard.sharding) -> tensor<2x2xf32>
    "func.return"(%30) : (tensor<2x2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x4x8xf32>, tensor<2x8x32xf32>, tensor<2x32x8xf32>, tensor<1xf32>) -> tensor<2x4x8xf32>, sym_name = "mlp_1d_weight_stationary"}> ({
  ^bb0(%arg5: tensor<2x4x8xf32>, %arg6: tensor<2x8x32xf32>, %arg7: tensor<2x32x8xf32>, %arg8: tensor<1xf32>):
    %16 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[], [], [0, 1, 2]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %17 = "shard.shard"(%arg5, %16) : (tensor<2x4x8xf32>, !shard.sharding) -> tensor<2x4x8xf32>
    %18 = "shard.shard"(%arg6, %16) : (tensor<2x8x32xf32>, !shard.sharding) -> tensor<2x8x32xf32>
    %19 = "tosa.matmul"(%17, %18, %arg8, %arg8) : (tensor<2x4x8xf32>, tensor<2x8x32xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<2x4x32xf32>
    %20 = "tosa.sigmoid"(%19) : (tensor<2x4x32xf32>) -> tensor<2x4x32xf32>
    %21 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[], [0, 1, 2]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %22 = "shard.shard"(%arg7, %21) : (tensor<2x32x8xf32>, !shard.sharding) -> tensor<2x32x8xf32>
    %23 = "tosa.matmul"(%20, %22, %arg8, %arg8) : (tensor<2x4x32xf32>, tensor<2x32x8xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<2x4x8xf32>
    %24 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[], [], [0, 1, 2]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %25 = "shard.shard"(%23, %24) : (tensor<2x4x8xf32>, !shard.sharding) -> tensor<2x4x8xf32>
    "func.return"(%25) : (tensor<2x4x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x4x8xf32>, tensor<2x8x32xf32>, tensor<2x32x8xf32>, tensor<1xf32>) -> tensor<2x4x8xf32>, sym_name = "mlp_2d_weight_stationary"}> ({
  ^bb0(%arg1: tensor<2x4x8xf32>, %arg2: tensor<2x8x32xf32>, %arg3: tensor<2x32x8xf32>, %arg4: tensor<1xf32>):
    %4 = "shard.sharding"() <{grid = @grid_3d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[], [], [0, 1, 2]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %5 = "shard.shard"(%arg1, %4) : (tensor<2x4x8xf32>, !shard.sharding) -> tensor<2x4x8xf32>
    %6 = "shard.sharding"() <{grid = @grid_3d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[], [0], [1, 2]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %7 = "shard.shard"(%arg2, %6) : (tensor<2x8x32xf32>, !shard.sharding) -> tensor<2x8x32xf32>
    %8 = "tosa.matmul"(%5, %7, %arg4, %arg4) : (tensor<2x4x8xf32>, tensor<2x8x32xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<2x4x32xf32>
    %9 = "shard.shard"(%8, %4) : (tensor<2x4x32xf32>, !shard.sharding) -> tensor<2x4x32xf32>
    %10 = "tosa.sigmoid"(%9) : (tensor<2x4x32xf32>) -> tensor<2x4x32xf32>
    %11 = "shard.sharding"() <{grid = @grid_3d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[], [1, 2], [0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %12 = "shard.shard"(%arg3, %11) : (tensor<2x32x8xf32>, !shard.sharding) -> tensor<2x32x8xf32>
    %13 = "tosa.matmul"(%10, %12, %arg4, %arg4) : (tensor<2x4x32xf32>, tensor<2x32x8xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<2x4x8xf32>
    %14 = "shard.shard"(%13, %4) : (tensor<2x4x8xf32>, !shard.sharding) -> tensor<2x4x8xf32>
    %15 = "shard.shard"(%14, %4) <{annotate_for_users}> : (tensor<2x4x8xf32>, !shard.sharding) -> tensor<2x4x8xf32>
    "func.return"(%15) : (tensor<2x4x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x16xf32>) -> tensor<8x16xf32>, sym_name = "elementwise_duplicated_chain"}> ({
  ^bb0(%arg0: tensor<8x16xf32>):
    %0 = "tosa.sigmoid"(%arg0) : (tensor<8x16xf32>) -> tensor<8x16xf32>
    %1 = "tosa.sigmoid"(%0) : (tensor<8x16xf32>) -> tensor<8x16xf32>
    %2 = "shard.sharding"() <{grid = @grid_2d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %3 = "shard.shard"(%1, %2) : (tensor<8x16xf32>, !shard.sharding) -> tensor<8x16xf32>
    "func.return"(%3) : (tensor<8x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

