"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: 4, -9223372036854775808, 2>, sym_name = "grid0"}> : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (index, index), sym_name = "grid_to_inline", sym_visibility = "private"}> ({
    %1:2 = "shard.grid_shape"() <{axes = array<i16: 2, 1>, grid = @grid0}> : () -> (index, index) loc("<stdin>":4:12)
    "func.return"(%1#0, %1#1) : (index, index) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = () -> (index, index), sym_name = "main"}> ({
    %0:2 = "func.call"() <{callee = @grid_to_inline}> : () -> (index, index) loc("<stdin>":8:12)
    "func.return"(%0#0, %0#1) : (index, index) -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":7:3)
}) : () -> () loc("<stdin>":1:1)
