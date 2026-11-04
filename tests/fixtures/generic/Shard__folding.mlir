"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: 4, -9223372036854775808, 2>, sym_name = "grid0"}> : () -> ()
  "shard.grid"() <{shape = array<i64: 2, 3>, sym_name = "grid1"}> : () -> ()
  "func.func"() <{function_type = () -> (index, index), sym_name = "grid_shape_op_folding"}> ({
    %1:2 = "shard.grid_shape"() <{axes = array<i16: 2, 1>, grid = @grid0}> : () -> (index, index)
    "func.return"(%1#0, %1#1) : (index, index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (index, index), sym_name = "grid_shape_op_folding_all_axes_static_grid"}> ({
    %0:2 = "shard.grid_shape"() <{axes = array<i16>, grid = @grid1}> : () -> (index, index)
    "func.return"(%0#0, %0#1) : (index, index) -> ()
  }) : () -> ()
}) : () -> ()

