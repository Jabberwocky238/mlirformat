"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: 4, -9223372036854775808, 2>, sym_name = "grid0"}> : () -> ()
  "func.func"() <{function_type = () -> (index, index), sym_name = "grid_to_inline", sym_visibility = "private"}> ({
    %1:2 = "shard.grid_shape"() <{axes = array<i16: 2, 1>, grid = @grid0}> : () -> (index, index)
    "func.return"(%1#0, %1#1) : (index, index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (index, index), sym_name = "main"}> ({
    %0:2 = "func.call"() <{callee = @grid_to_inline}> : () -> (index, index)
    "func.return"(%0#0, %0#1) : (index, index) -> ()
  }) : () -> ()
}) : () -> ()

