"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: -9223372036854775808, -9223372036854775808>, sym_name = "grid2d"}> : () -> ()
  "func.func"() <{function_type = () -> (index, index), sym_name = "multi_index_2d_grid"}> ({
    %1:2 = "shard.process_multi_index"() <{axes = array<i16>, grid = @grid2d}> : () -> (index, index)
    "func.return"(%1#0, %1#1) : (index, index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "multi_index_2d_grid_single_inner_axis"}> ({
    %0 = "shard.process_multi_index"() <{axes = array<i16: 0>, grid = @grid2d}> : () -> index
    "func.return"(%0) : (index) -> ()
  }) : () -> ()
}) : () -> ()

