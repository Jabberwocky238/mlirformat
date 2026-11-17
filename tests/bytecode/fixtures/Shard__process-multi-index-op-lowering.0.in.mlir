"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: -9223372036854775808, -9223372036854775808>, sym_name = "grid2d"}> : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (index, index), sym_name = "multi_index_2d_grid"}> ({
    %1:2 = "shard.process_multi_index"() <{axes = array<i16>, grid = @grid2d}> : () -> (index, index) loc("<stdin>":4:12)
    "func.return"(%1#0, %1#1) : (index, index) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = () -> index, sym_name = "multi_index_2d_grid_single_inner_axis"}> ({
    %0 = "shard.process_multi_index"() <{axes = array<i16: 0>, grid = @grid2d}> : () -> index loc("<stdin>":8:10)
    "func.return"(%0) : (index) -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":7:3)
}) : () -> () loc("<stdin>":1:1)
