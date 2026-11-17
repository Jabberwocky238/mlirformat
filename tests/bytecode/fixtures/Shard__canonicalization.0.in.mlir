"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: 2, 4>, sym_name = "grid0"}> : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (tensor<4xf32>) -> tensor<4xf32>, sym_name = "all_reduce_empty_grid_axes"}> ({
  ^bb0(%arg14: tensor<4xf32> loc("<stdin>":4:8)):
    %36 = "shard.all_reduce"(%arg14) <{grid = @grid0, grid_axes = array<i16>, reduction = #shard<partial sum>}> : (tensor<4xf32>) -> tensor<4xf32> loc("<stdin>":5:11)
    "func.return"(%36) : (tensor<4xf32>) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = (tensor<4xf32>) -> tensor<4xf64>, sym_name = "all_reduce_empty_grid_axes_different_return_type"}> ({
  ^bb0(%arg13: tensor<4xf32> loc("<stdin>":9:8)):
    %35 = "shard.all_reduce"(%arg13) <{grid = @grid0, grid_axes = array<i16>, reduction = #shard<partial sum>}> : (tensor<4xf32>) -> tensor<4xf64> loc("<stdin>":10:11)
    "func.return"(%35) : (tensor<4xf64>) -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = (tensor<4xf32>) -> tensor<4xf64>, sym_name = "all_reduce_default_reduction"}> ({
  ^bb0(%arg12: tensor<4xf32> loc("<stdin>":14:8)):
    %34 = "shard.all_reduce"(%arg12) <{grid = @grid0, grid_axes = array<i16: 0>, reduction = #shard<partial sum>}> : (tensor<4xf32>) -> tensor<4xf64> loc("<stdin>":15:11)
    "func.return"(%34) : (tensor<4xf64>) -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":13:3)
  "func.func"() <{function_type = (tensor<8xf32>) -> tensor<8xf32>, sym_name = "all_to_all_empty_grid_axes"}> ({
  ^bb0(%arg11: tensor<8xf32> loc("<stdin>":19:8)):
    %33 = "shard.all_to_all"(%arg11) <{concat_axis = 0 : index, grid = @grid0, grid_axes = array<i16>, split_axis = 0 : index}> : (tensor<8xf32>) -> tensor<8xf32> loc("<stdin>":20:11)
    "func.return"(%33) : (tensor<8xf32>) -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":18:3)
  "func.func"() <{function_type = (tensor<4xf32>) -> tensor<4xf32>, sym_name = "all_gather_empty_grid_axes"}> ({
  ^bb0(%arg10: tensor<4xf32> loc("<stdin>":24:8)):
    %32 = "shard.all_gather"(%arg10) <{gather_axis = 0 : index, grid = @grid0, grid_axes = array<i16>}> : (tensor<4xf32>) -> tensor<4xf32> loc("<stdin>":25:11)
    "func.return"(%32) : (tensor<4xf32>) -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":23:3)
  "func.func"() <{function_type = (tensor<4xf32>) -> tensor<4xf32>, sym_name = "all_slice_empty_grid_axes"}> ({
  ^bb0(%arg9: tensor<4xf32> loc("<stdin>":29:8)):
    %31 = "shard.all_slice"(%arg9) <{grid = @grid0, grid_axes = array<i16>, slice_axis = 0 : index}> : (tensor<4xf32>) -> tensor<4xf32> loc("<stdin>":30:11)
    "func.return"(%31) : (tensor<4xf32>) -> () loc("<stdin>":31:5)
  }) : () -> () loc("<stdin>":28:3)
  "func.func"() <{function_type = (tensor<4xf32>) -> tensor<4xf32>, sym_name = "broadcast_empty_grid_axes"}> ({
  ^bb0(%arg8: tensor<4xf32> loc("<stdin>":34:8)):
    %30 = "shard.broadcast"(%arg8) <{grid = @grid0, grid_axes = array<i16>, root = array<i64>}> : (tensor<4xf32>) -> tensor<4xf32> loc("<stdin>":35:11)
    "func.return"(%30) : (tensor<4xf32>) -> () loc("<stdin>":36:5)
  }) : () -> () loc("<stdin>":33:3)
  "func.func"() <{function_type = (tensor<4xf32>) -> tensor<4xf32>, sym_name = "gather_empty_grid_axes"}> ({
  ^bb0(%arg7: tensor<4xf32> loc("<stdin>":39:8)):
    %29 = "shard.gather"(%arg7) <{gather_axis = 0 : index, grid = @grid0, grid_axes = array<i16>, root = array<i64>}> : (tensor<4xf32>) -> tensor<4xf32> loc("<stdin>":40:11)
    "func.return"(%29) : (tensor<4xf32>) -> () loc("<stdin>":41:5)
  }) : () -> () loc("<stdin>":38:3)
  "func.func"() <{function_type = (tensor<4xf32>) -> tensor<4xf32>, sym_name = "receive_empty_grid_axes"}> ({
  ^bb0(%arg6: tensor<4xf32> loc("<stdin>":44:8)):
    %28 = "shard.recv"(%arg6) <{grid = @grid0, grid_axes = array<i16>}> : (tensor<4xf32>) -> tensor<4xf32> loc("<stdin>":45:11)
    "func.return"(%28) : (tensor<4xf32>) -> () loc("<stdin>":46:5)
  }) : () -> () loc("<stdin>":43:3)
  "func.func"() <{function_type = (tensor<4xf32>) -> tensor<4xf32>, sym_name = "reduce_empty_grid_axes"}> ({
  ^bb0(%arg5: tensor<4xf32> loc("<stdin>":49:8)):
    %27 = "shard.reduce"(%arg5) <{grid = @grid0, grid_axes = array<i16>, reduction = #shard<partial sum>, root = array<i64>}> : (tensor<4xf32>) -> tensor<4xf32> loc("<stdin>":50:11)
    "func.return"(%27) : (tensor<4xf32>) -> () loc("<stdin>":51:5)
  }) : () -> () loc("<stdin>":48:3)
  "func.func"() <{function_type = (tensor<4xf32>) -> tensor<4xf32>, sym_name = "reduce_scatter_empty_grid_axes"}> ({
  ^bb0(%arg4: tensor<4xf32> loc("<stdin>":54:8)):
    %26 = "shard.reduce_scatter"(%arg4) <{grid = @grid0, grid_axes = array<i16>, reduction = #shard<partial sum>, scatter_dim = 0 : index}> : (tensor<4xf32>) -> tensor<4xf32> loc("<stdin>":55:11)
    "func.return"(%26) : (tensor<4xf32>) -> () loc("<stdin>":56:5)
  }) : () -> () loc("<stdin>":53:3)
  "func.func"() <{function_type = (tensor<4xf32>) -> tensor<4xf64>, sym_name = "reduce_scatter_empty_grid_axes_different_return_type"}> ({
  ^bb0(%arg3: tensor<4xf32> loc("<stdin>":59:8)):
    %25 = "shard.reduce_scatter"(%arg3) <{grid = @grid0, grid_axes = array<i16>, reduction = #shard<partial sum>, scatter_dim = 0 : index}> : (tensor<4xf32>) -> tensor<4xf64> loc("<stdin>":60:11)
    "func.return"(%25) : (tensor<4xf64>) -> () loc("<stdin>":61:5)
  }) : () -> () loc("<stdin>":58:3)
  "func.func"() <{function_type = (tensor<4xf32>) -> tensor<2xf64>, sym_name = "reduce_scatter_default_reduction"}> ({
  ^bb0(%arg2: tensor<4xf32> loc("<stdin>":64:8)):
    %24 = "shard.reduce_scatter"(%arg2) <{grid = @grid0, grid_axes = array<i16: 0>, reduction = #shard<partial sum>, scatter_dim = 0 : index}> : (tensor<4xf32>) -> tensor<2xf64> loc("<stdin>":65:11)
    "func.return"(%24) : (tensor<2xf64>) -> () loc("<stdin>":66:5)
  }) : () -> () loc("<stdin>":63:3)
  "func.func"() <{function_type = (tensor<4xf32>) -> tensor<4xf32>, sym_name = "scatter_empty_grid_axes"}> ({
  ^bb0(%arg1: tensor<4xf32> loc("<stdin>":69:8)):
    %23 = "shard.scatter"(%arg1) <{grid = @grid0, grid_axes = array<i16>, root = array<i64>, scatter_dim = 0 : index}> : (tensor<4xf32>) -> tensor<4xf32> loc("<stdin>":70:11)
    "func.return"(%23) : (tensor<4xf32>) -> () loc("<stdin>":71:5)
  }) : () -> () loc("<stdin>":68:3)
  "func.func"() <{function_type = (tensor<4xf32>) -> tensor<4xf32>, sym_name = "send_empty_grid_axes"}> ({
  ^bb0(%arg0: tensor<4xf32> loc("<stdin>":74:8)):
    %22 = "shard.send"(%arg0) <{destination = array<i64>, grid = @grid0, grid_axes = array<i16>}> : (tensor<4xf32>) -> tensor<4xf32> loc("<stdin>":75:11)
    "func.return"(%22) : (tensor<4xf32>) -> () loc("<stdin>":76:5)
  }) : () -> () loc("<stdin>":73:3)
  "shard.grid"() <{shape = array<i64: 4, 4>, sym_name = "grid4x4"}> : () -> () loc("<stdin>":78:3)
  "func.func"() <{function_type = () -> !shard.sharding, sym_name = "test_halo_sizes"}> ({
    %20 = "arith.constant"() <{value = 2 : i64}> : () -> i64 loc("<stdin>":80:11)
    %21 = "shard.sharding"(%20, %20) <{grid = @grid4x4, operandSegmentSizes = array<i32: 0, 2>, split_axes = #shard<axisarray[[0], [1]]>, static_halo_sizes = array<i64: 1, -9223372036854775808, -9223372036854775808, 22>, static_sharded_dims_offsets = array<i64>}> : (i64, i64) -> !shard.sharding loc("<stdin>":81:11)
    "func.return"(%21) : (!shard.sharding) -> () loc("<stdin>":82:5)
  }) : () -> () loc("<stdin>":79:3)
  "func.func"() <{function_type = () -> !shard.sharding, sym_name = "test_shard_offs"}> ({
    %18 = "arith.constant"() <{value = 2 : i64}> : () -> i64 loc("<stdin>":85:11)
    %19 = "shard.sharding"(%18, %18) <{grid = @grid4x4, operandSegmentSizes = array<i32: 2, 0>, split_axes = #shard<axisarray[[0], [1]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64: 0, 1, -9223372036854775808, 3, 4, 0, -9223372036854775808, 3, 4, 22>}> : (i64, i64) -> !shard.sharding loc("<stdin>":86:11)
    "func.return"(%19) : (!shard.sharding) -> () loc("<stdin>":87:5)
  }) : () -> () loc("<stdin>":84:3)
  "func.func"() <{function_type = () -> (tensor<1024x1024xf32>, tensor<1024x1024xf32>), sym_name = "test_duplicate_shardops"}> ({
    %9 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<1024x1024xf32>}> : () -> tensor<1024x1024xf32> loc("<stdin>":90:10)
    %10 = "shard.sharding"() <{grid = @grid4x4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0, 1]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding loc("<stdin>":91:11)
    %11 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<1024x1024xf32>}> : () -> tensor<1024x1024xf32> loc("<stdin>":92:11)
    %12 = "shard.sharding"() <{grid = @grid4x4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0, 1]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding loc("<stdin>":93:11)
    %13 = "shard.shard"(%11, %12) : (tensor<1024x1024xf32>, !shard.sharding) -> tensor<1024x1024xf32> loc("<stdin>":94:11)
    %14 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<1024x1024xf32>}> : () -> tensor<1024x1024xf32> loc("<stdin>":95:11)
    %15 = "shard.sharding"() <{grid = @grid4x4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0, 1]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding loc("<stdin>":96:11)
    %16 = "shard.shard"(%14, %15) : (tensor<1024x1024xf32>, !shard.sharding) -> tensor<1024x1024xf32> loc("<stdin>":97:11)
    %17 = "shard.shard"(%9, %10) : (tensor<1024x1024xf32>, !shard.sharding) -> tensor<1024x1024xf32> loc("<stdin>":98:11)
    "func.return"(%17, %13) : (tensor<1024x1024xf32>, tensor<1024x1024xf32>) -> () loc("<stdin>":99:5)
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":89:3)
  "func.func"() <{function_type = () -> (tensor<1024x1024xf32>, tensor<1024x1024xf32>), sym_name = "test_duplicate_shardops_diff"}> ({
    %0 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<1024x1024xf32>}> : () -> tensor<1024x1024xf32> loc("<stdin>":102:10)
    %1 = "shard.sharding"() <{grid = @grid4x4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding loc("<stdin>":103:10)
    %2 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<1024x1024xf32>}> : () -> tensor<1024x1024xf32> loc("<stdin>":104:10)
    %3 = "shard.sharding"() <{grid = @grid4x4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0, 1]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding loc("<stdin>":105:10)
    %4 = "shard.shard"(%2, %3) : (tensor<1024x1024xf32>, !shard.sharding) -> tensor<1024x1024xf32> loc("<stdin>":106:10)
    %5 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<1024x1024xf32>}> : () -> tensor<1024x1024xf32> loc("<stdin>":107:10)
    %6 = "shard.sharding"() <{grid = @grid4x4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding loc("<stdin>":108:10)
    %7 = "shard.shard"(%5, %6) : (tensor<1024x1024xf32>, !shard.sharding) -> tensor<1024x1024xf32> loc("<stdin>":109:10)
    %8 = "shard.shard"(%0, %1) : (tensor<1024x1024xf32>, !shard.sharding) -> tensor<1024x1024xf32> loc("<stdin>":110:10)
    "func.return"(%8, %4) : (tensor<1024x1024xf32>, tensor<1024x1024xf32>) -> () loc("<stdin>":111:5)
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":101:3)
}) : () -> () loc("<stdin>":1:1)
