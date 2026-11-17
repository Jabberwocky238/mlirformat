"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: 4>, sym_name = "grid_1d_4"}> : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "tensor_empty_static_sharded_dims_offsets"}> ({
    %7 = "tensor.empty"() : () -> tensor<8x16xf32> loc("<stdin>":4:10)
    %8 = "shard.sharding"() <{grid = @grid_1d_4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64: 0, 1, 4, 7, 8>}> : () -> !shard.sharding loc("<stdin>":5:10)
    %9 = "shard.shard"(%7, %8) : (tensor<8x16xf32>, !shard.sharding) -> tensor<8x16xf32> loc("<stdin>":6:10)
    "func.return"() : () -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = (index) -> (), sym_name = "tensor_empty_dynamic_sharded_dims_offsets"}> ({
  ^bb0(%arg0: index loc("<stdin>":10:8)):
    %4 = "tensor.empty"(%arg0) : (index) -> tensor<8x?xf32> loc("<stdin>":11:10)
    %5 = "shard.sharding"() <{grid = @grid_1d_4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64: 0, 1, 4, 7, 8>}> : () -> !shard.sharding loc("<stdin>":12:10)
    %6 = "shard.shard"(%4, %5) : (tensor<8x?xf32>, !shard.sharding) -> tensor<8x?xf32> loc("<stdin>":13:10)
    "func.return"() : () -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":9:3)
  "func.func"() <{function_type = () -> (), sym_name = "tensor_empty_same_static_dims_sizes"}> ({
    %1 = "tensor.empty"() : () -> tensor<16x16xf32> loc("<stdin>":17:10)
    %2 = "shard.sharding"() <{grid = @grid_1d_4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64: 0, 4, 8, 12, 16>}> : () -> !shard.sharding loc("<stdin>":18:10)
    %3 = "shard.shard"(%1, %2) : (tensor<16x16xf32>, !shard.sharding) -> tensor<16x16xf32> loc("<stdin>":19:10)
    "func.return"() : () -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":16:3)
  "func.func"() <{function_type = () -> (), sym_name = "tensor_empty_0d"}> ({
    %0 = "tensor.empty"() : () -> tensor<f32> loc("<stdin>":23:10)
    "func.return"() : () -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":22:3)
}) : () -> () loc("<stdin>":1:1)
