"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: -9223372036854775808>, sym_name = "grid_1d"}> : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (tensor<?xf16>) -> tensor<?xf16>, sym_name = "all_slice_op_lowering_of_dynamic_1d_tensor_on_dynamic_1d_grid"}> ({
  ^bb0(%arg0: tensor<?xf16> loc("<stdin>":4:8)):
    %0 = "shard.all_slice"(%arg0) <{grid = @grid_1d, grid_axes = array<i16: 0>, slice_axis = 0 : index}> : (tensor<?xf16>) -> tensor<?xf16> loc("<stdin>":5:10)
    "func.return"(%0) : (tensor<?xf16>) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":1:1)
