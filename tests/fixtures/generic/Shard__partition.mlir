"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: 2>, sym_name = "grid_1d"}> : () -> ()
  "func.func"() <{function_type = (tensor<2xf32>) -> (tensor<2xf32>, !shard.sharding), sym_name = "return_sharding"}> ({
  ^bb0(%arg21: tensor<2xf32>):
    %114 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %115 = "shard.shard"(%arg21, %114) : (tensor<2xf32>, !shard.sharding) -> tensor<2xf32>
    %116 = "shard.get_sharding"(%115) : (tensor<2xf32>) -> !shard.sharding
    "func.return"(%115, %116) : (tensor<2xf32>, !shard.sharding) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2xi8>) -> tensor<2xi8>, sym_name = "full_replication"}> ({
  ^bb0(%arg20: tensor<2xi8>):
    %110 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %111 = "shard.shard"(%arg20, %110) : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    %112 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %113 = "shard.shard"(%111, %112) <{annotate_for_users}> : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    "func.return"(%113) : (tensor<2xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2xf32>) -> tensor<2xf32>, sym_name = "sharding_triplet"}> ({
  ^bb0(%arg19: tensor<2xf32>):
    %104 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %105 = "shard.shard"(%arg19, %104) : (tensor<2xf32>, !shard.sharding) -> tensor<2xf32>
    %106 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %107 = "shard.shard"(%105, %106) <{annotate_for_users}> : (tensor<2xf32>, !shard.sharding) -> tensor<2xf32>
    %108 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %109 = "shard.shard"(%107, %108) : (tensor<2xf32>, !shard.sharding) -> tensor<2xf32>
    "func.return"(%109) : (tensor<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x2xi8>) -> tensor<2x2xi8>, sym_name = "move_split_axis"}> ({
  ^bb0(%arg18: tensor<2x2xi8>):
    %100 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %101 = "shard.shard"(%arg18, %100) : (tensor<2x2xi8>, !shard.sharding) -> tensor<2x2xi8>
    %102 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[], [0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %103 = "shard.shard"(%101, %102) <{annotate_for_users}> : (tensor<2x2xi8>, !shard.sharding) -> tensor<2x2xi8>
    "func.return"(%103) : (tensor<2x2xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i8) -> i8, sym_name = "non_tensor_value"}> ({
  ^bb0(%arg17: i8):
    %99 = "arith.addi"(%arg17, %arg17) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8
    "func.return"(%99) : (i8) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2xi8>) -> tensor<2xi8>, sym_name = "unary_elementwise"}> ({
  ^bb0(%arg16: tensor<2xi8>):
    %90 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %91 = "shard.shard"(%arg16, %90) : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    %92 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %93 = "shard.shard"(%91, %92) <{annotate_for_users}> : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    %94 = "tosa.abs"(%93) : (tensor<2xi8>) -> tensor<2xi8>
    %95 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %96 = "shard.shard"(%94, %95) : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    %97 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %98 = "shard.shard"(%96, %97) <{annotate_for_users}> : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    "func.return"(%98) : (tensor<2xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2xi8>) -> tensor<2xi8>, sym_name = "unary_elementwise_with_resharding"}> ({
  ^bb0(%arg15: tensor<2xi8>):
    %81 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %82 = "shard.shard"(%arg15, %81) : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    %83 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %84 = "shard.shard"(%82, %83) <{annotate_for_users}> : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    %85 = "tosa.abs"(%84) : (tensor<2xi8>) -> tensor<2xi8>
    %86 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %87 = "shard.shard"(%85, %86) : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    %88 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %89 = "shard.shard"(%87, %88) <{annotate_for_users}> : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    "func.return"(%89) : (tensor<2xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2xi8>, tensor<2xi8>) -> tensor<2xi8>, sym_name = "binary_elementwise"}> ({
  ^bb0(%arg13: tensor<2xi8>, %arg14: tensor<2xi8>):
    %68 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %69 = "shard.shard"(%arg13, %68) : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    %70 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %71 = "shard.shard"(%69, %70) <{annotate_for_users}> : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    %72 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %73 = "shard.shard"(%arg14, %72) : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    %74 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %75 = "shard.shard"(%73, %74) <{annotate_for_users}> : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    %76 = "tosa.add"(%71, %75) : (tensor<2xi8>, tensor<2xi8>) -> tensor<2xi8>
    %77 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %78 = "shard.shard"(%76, %77) : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    %79 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %80 = "shard.shard"(%78, %79) <{annotate_for_users}> : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    "func.return"(%80) : (tensor<2xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2xi8>) -> tensor<2xi8>, sym_name = "multiple_chained_ops"}> ({
  ^bb0(%arg12: tensor<2xi8>):
    %54 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %55 = "shard.shard"(%arg12, %54) : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    %56 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %57 = "shard.shard"(%55, %56) <{annotate_for_users}> : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    %58 = "tosa.abs"(%57) : (tensor<2xi8>) -> tensor<2xi8>
    %59 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %60 = "shard.shard"(%58, %59) : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    %61 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %62 = "shard.shard"(%60, %61) <{annotate_for_users}> : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    %63 = "tosa.abs"(%62) : (tensor<2xi8>) -> tensor<2xi8>
    %64 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %65 = "shard.shard"(%63, %64) : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    %66 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %67 = "shard.shard"(%65, %66) <{annotate_for_users}> : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    "func.return"(%67) : (tensor<2xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x16xf32>) -> tensor<8x16xf32>, sym_name = "incomplete_sharding"}> ({
  ^bb0(%arg11: tensor<8x16xf32>):
    %49 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %50 = "shard.shard"(%arg11, %49) <{annotate_for_users}> : (tensor<8x16xf32>, !shard.sharding) -> tensor<8x16xf32>
    %51 = "tosa.sigmoid"(%50) : (tensor<8x16xf32>) -> tensor<8x16xf32>
    %52 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %53 = "shard.shard"(%51, %52) : (tensor<8x16xf32>, !shard.sharding) -> tensor<8x16xf32>
    "func.return"(%53) : (tensor<8x16xf32>) -> ()
  }) : () -> ()
  "shard.grid"() <{shape = array<i64: 4>, sym_name = "grid_1d_4"}> : () -> ()
  "func.func"() <{function_type = (tensor<8x16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<8x16xf32>, sym_name = "ew_chain_with_halo"}> ({
  ^bb0(%arg8: tensor<8x16xf32>, %arg9: tensor<1xf32>, %arg10: tensor<1xf32>):
    %29 = "shard.sharding"() <{grid = @grid_1d_4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64: 2, 1>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %30 = "shard.shard"(%arg8, %29) <{annotate_for_users}> : (tensor<8x16xf32>, !shard.sharding) -> tensor<8x16xf32>
    %31 = "tosa.tanh"(%30) : (tensor<8x16xf32>) -> tensor<8x16xf32>
    %32 = "shard.sharding"() <{grid = @grid_1d_4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64: 2, 1>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %33 = "shard.shard"(%31, %32) : (tensor<8x16xf32>, !shard.sharding) -> tensor<8x16xf32>
    %34 = "shard.sharding"() <{grid = @grid_1d_4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64: 2, 1>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %35 = "shard.shard"(%33, %34) <{annotate_for_users}> : (tensor<8x16xf32>, !shard.sharding) -> tensor<8x16xf32>
    %36 = "tosa.abs"(%35) : (tensor<8x16xf32>) -> tensor<8x16xf32>
    %37 = "shard.sharding"() <{grid = @grid_1d_4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64: 2, 1>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %38 = "shard.shard"(%36, %37) : (tensor<8x16xf32>, !shard.sharding) -> tensor<8x16xf32>
    %39 = "shard.sharding"() <{grid = @grid_1d_4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64: 2, 1>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %40 = "shard.shard"(%38, %39) <{annotate_for_users}> : (tensor<8x16xf32>, !shard.sharding) -> tensor<8x16xf32>
    %41 = "shard.sharding"() <{grid = @grid_1d_4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %42 = "shard.shard"(%arg9, %41) <{annotate_for_users}> : (tensor<1xf32>, !shard.sharding) -> tensor<1xf32>
    %43 = "shard.shard"(%arg10, %41) <{annotate_for_users}> : (tensor<1xf32>, !shard.sharding) -> tensor<1xf32>
    %44 = "tosa.negate"(%40, %42, %43) : (tensor<8x16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<8x16xf32>
    %45 = "shard.sharding"() <{grid = @grid_1d_4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64: 2, 1>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %46 = "shard.shard"(%44, %45) : (tensor<8x16xf32>, !shard.sharding) -> tensor<8x16xf32>
    %47 = "shard.sharding"() <{grid = @grid_1d_4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64: 2, 1>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %48 = "shard.shard"(%46, %47) <{annotate_for_users}> : (tensor<8x16xf32>, !shard.sharding) -> tensor<8x16xf32>
    "func.return"(%48) : (tensor<8x16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1200x1200xi64>) -> tensor<1200x1200xi64>, sym_name = "test_shard_update_halo"}> ({
  ^bb0(%arg7: tensor<1200x1200xi64>):
    %24 = "shard.sharding"() <{grid = @grid_1d_4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %25 = "shard.shard"(%arg7, %24) : (tensor<1200x1200xi64>, !shard.sharding) -> tensor<1200x1200xi64>
    %26 = "shard.sharding"() <{grid = @grid_1d_4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64: 2, 2>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %27 = "shard.shard"(%25, %26) : (tensor<1200x1200xi64>, !shard.sharding) -> tensor<1200x1200xi64>
    %28 = "shard.shard"(%27, %26) <{annotate_for_users}> : (tensor<1200x1200xi64>, !shard.sharding) -> tensor<1200x1200xi64>
    "func.return"(%28) : (tensor<1200x1200xi64>) -> ()
  }) : () -> ()
  "shard.grid"() <{shape = array<i64: 4, 4>, sym_name = "grid4x4"}> : () -> ()
  "func.func"() <{function_type = (tensor<1200x1200xi64>) -> tensor<1200x1200xi64>, sym_name = "test_shard_update_halo2d"}> ({
  ^bb0(%arg6: tensor<1200x1200xi64>):
    %19 = "shard.sharding"() <{grid = @grid4x4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0], [1]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %20 = "shard.shard"(%arg6, %19) : (tensor<1200x1200xi64>, !shard.sharding) -> tensor<1200x1200xi64>
    %21 = "shard.sharding"() <{grid = @grid4x4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0], [1]]>, static_halo_sizes = array<i64: 1, 2, 3, 4>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %22 = "shard.shard"(%20, %21) : (tensor<1200x1200xi64>, !shard.sharding) -> tensor<1200x1200xi64>
    %23 = "shard.shard"(%22, %21) <{annotate_for_users}> : (tensor<1200x1200xi64>, !shard.sharding) -> tensor<1200x1200xi64>
    "func.return"(%23) : (tensor<1200x1200xi64>) -> ()
  }) : () -> ()
  "shard.grid"() <{shape = array<i64: 2>, sym_name = "grid"}> : () -> ()
  "func.func"() <{function_type = (tensor<6x6xi32>) -> tensor<i32>, sym_name = "test_reduce_0d"}> ({
  ^bb0(%arg3: tensor<6x6xi32>):
    %9 = "shard.sharding"() <{grid = @grid, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %10 = "shard.shard"(%arg3, %9) <{annotate_for_users}> : (tensor<6x6xi32>, !shard.sharding) -> tensor<6x6xi32>
    %11 = "tensor.empty"() : () -> tensor<i32>
    %12 = "shard.sharding"() <{grid = @grid, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %13 = "shard.shard"(%11, %12) : (tensor<i32>, !shard.sharding) -> tensor<i32>
    %14 = "shard.shard"(%10, %9) <{annotate_for_users}> : (tensor<6x6xi32>, !shard.sharding) -> tensor<6x6xi32>
    %15 = "linalg.reduce"(%14, %13) <{dimensions = array<i64: 0, 1>}> ({
    ^bb0(%arg4: i32, %arg5: i32):
      %18 = "arith.addi"(%arg4, %arg5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%18) : (i32) -> ()
    }) : (tensor<6x6xi32>, tensor<i32>) -> tensor<i32>
    %16 = "shard.shard"(%15, %12) : (tensor<i32>, !shard.sharding) -> tensor<i32>
    %17 = "shard.shard"(%16, %12) <{annotate_for_users}> : (tensor<i32>, !shard.sharding) -> tensor<i32>
    "func.return"(%17) : (tensor<i32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<6x6xi32>) -> tensor<6xi32>, sym_name = "test_reduce_1d"}> ({
  ^bb0(%arg0: tensor<6x6xi32>):
    %0 = "shard.sharding"() <{grid = @grid, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %1 = "shard.shard"(%arg0, %0) <{annotate_for_users}> : (tensor<6x6xi32>, !shard.sharding) -> tensor<6x6xi32>
    %2 = "tensor.empty"() : () -> tensor<6xi32>
    %3 = "shard.shard"(%2, %0) : (tensor<6xi32>, !shard.sharding) -> tensor<6xi32>
    %4 = "shard.shard"(%1, %0) <{annotate_for_users}> : (tensor<6x6xi32>, !shard.sharding) -> tensor<6x6xi32>
    %5 = "linalg.reduce"(%4, %3) <{dimensions = array<i64: 1>}> ({
    ^bb0(%arg1: i32, %arg2: i32):
      %8 = "arith.addi"(%arg1, %arg2) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%8) : (i32) -> ()
    }) : (tensor<6x6xi32>, tensor<6xi32>) -> tensor<6xi32>
    %6 = "shard.shard"(%5, %0) : (tensor<6xi32>, !shard.sharding) -> tensor<6xi32>
    %7 = "shard.shard"(%6, %0) <{annotate_for_users}> : (tensor<6xi32>, !shard.sharding) -> tensor<6xi32>
    "func.return"(%7) : (tensor<6xi32>) -> ()
  }) : () -> ()
}) : () -> ()

