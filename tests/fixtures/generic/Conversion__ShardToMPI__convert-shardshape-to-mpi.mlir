"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: 3, 4, 5>, sym_name = "grid0"}> : () -> ()
  "func.func"() <{function_type = () -> (index, index, index), sym_name = "shard_shape_equal"}> ({
    %17 = "shard.sharding"() <{grid = @grid0, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0], [1], [2]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %18:3 = "shard.process_multi_index"() <{axes = array<i16>, grid = @grid0}> : () -> (index, index, index)
    %19 = "arith.constant"() <{value = 9 : index}> : () -> index
    %20 = "arith.constant"() <{value = 12 : index}> : () -> index
    %21:3 = "shard.shard_shape"(%19, %20, %17, %18#0, %18#1, %18#2) <{device = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, dims = array<i64: -9223372036854775808, -9223372036854775808, 15>, operandSegmentSizes = array<i32: 2, 1, 3>}> : (index, index, !shard.sharding, index, index, index) -> (index, index, index)
    "func.return"(%21#0, %21#1, %21#2) : (index, index, index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (index, index, index), sym_name = "shard_shape_odd_1"}> ({
    %12 = "shard.sharding"() <{grid = @grid0, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0], [1], [2]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %13:3 = "shard.process_multi_index"() <{axes = array<i16>, grid = @grid0}> : () -> (index, index, index)
    %14 = "arith.constant"() <{value = 9 : index}> : () -> index
    %15 = "arith.constant"() <{value = 12 : index}> : () -> index
    %16:3 = "shard.shard_shape"(%14, %15, %12, %13#0, %13#1, %13#2) <{device = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, dims = array<i64: -9223372036854775808, -9223372036854775808, 16>, operandSegmentSizes = array<i32: 2, 1, 3>}> : (index, index, !shard.sharding, index, index, index) -> (index, index, index)
    "func.return"(%16#0, %16#1, %16#2) : (index, index, index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (index, index, index), sym_name = "shard_shape_odd_2"}> ({
    %8 = "shard.sharding"() <{grid = @grid0, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0], [1], [2]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %9:3 = "shard.process_multi_index"() <{axes = array<i16>, grid = @grid0}> : () -> (index, index, index)
    %10 = "arith.constant"() <{value = 9 : index}> : () -> index
    %11:3 = "shard.shard_shape"(%10, %8, %9#0, %9#1, %9#2) <{device = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, dims = array<i64: -9223372036854775808, 15, 15>, operandSegmentSizes = array<i32: 1, 1, 3>}> : (index, !shard.sharding, index, index, index) -> (index, index, index)
    "func.return"(%11#0, %11#1, %11#2) : (index, index, index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (index, index, index), sym_name = "shard_shape_odd_3"}> ({
    %5 = "shard.sharding"() <{grid = @grid0, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0], [1], [2]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %6:3 = "shard.process_multi_index"() <{axes = array<i16>, grid = @grid0}> : () -> (index, index, index)
    %7:3 = "shard.shard_shape"(%5, %6#0, %6#1, %6#2) <{device = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, dims = array<i64: 11, 12, 15>, operandSegmentSizes = array<i32: 0, 1, 3>}> : (!shard.sharding, index, index, index) -> (index, index, index)
    "func.return"(%7#0, %7#1, %7#2) : (index, index, index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (index, index, index), sym_name = "shard_shape_sharded_dims_offs"}> ({
    %0 = "shard.sharding"() <{grid = @grid0, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0], [1], [2]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64: 0, 1, 4, 9, 0, 2, 6, 12, 12, 0, 3, 6, 9, 12, 15>}> : () -> !shard.sharding
    %1:3 = "shard.process_multi_index"() <{axes = array<i16>, grid = @grid0}> : () -> (index, index, index)
    %2 = "arith.constant"() <{value = 9 : index}> : () -> index
    %3 = "arith.constant"() <{value = 12 : index}> : () -> index
    %4:3 = "shard.shard_shape"(%2, %3, %0, %1#0, %1#1, %1#2) <{device = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, dims = array<i64: -9223372036854775808, -9223372036854775808, 15>, operandSegmentSizes = array<i32: 2, 1, 3>}> : (index, index, !shard.sharding, index, index, index) -> (index, index, index)
    "func.return"(%4#0, %4#1, %4#2) : (index, index, index) -> ()
  }) : () -> ()
}) {mpi.dlti = #dlti.map<"MPI:comm_world_rank" = 24 : i64>} : () -> ()

