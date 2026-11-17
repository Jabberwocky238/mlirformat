"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: 4, -9223372036854775808, 2>, sym_name = "grid0"}> : () -> () loc("<stdin>":2:3)
  "shard.grid"() <{shape = array<i64: 2, 3>, sym_name = "grid1"}> : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = () -> (index, index), sym_name = "grid_shape_op_folding"}> ({
    %1:2 = "shard.grid_shape"() <{axes = array<i16: 2, 1>, grid = @grid0}> : () -> (index, index) loc("<stdin>":5:12)
    "func.return"(%1#0, %1#1) : (index, index) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":4:3)
  "func.func"() <{function_type = () -> (index, index), sym_name = "grid_shape_op_folding_all_axes_static_grid"}> ({
    %0:2 = "shard.grid_shape"() <{axes = array<i16>, grid = @grid1}> : () -> (index, index) loc("<stdin>":9:12)
    "func.return"(%0#0, %0#1) : (index, index) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":8:3)
}) : () -> () loc("<stdin>":1:1)
