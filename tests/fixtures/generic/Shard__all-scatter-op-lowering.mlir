"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: -9223372036854775808>, sym_name = "grid_1d"}> : () -> ()
  "func.func"() <{function_type = (tensor<?xf16>) -> tensor<?xf16>, sym_name = "all_slice_op_lowering_of_dynamic_1d_tensor_on_dynamic_1d_grid"}> ({
  ^bb0(%arg0: tensor<?xf16>):
    %0 = "shard.all_slice"(%arg0) <{grid = @grid_1d, grid_axes = array<i16: 0>, slice_axis = 0 : index}> : (tensor<?xf16>) -> tensor<?xf16>
    "func.return"(%0) : (tensor<?xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: 2>, sym_name = "grid_1d"}> : () -> ()
  "func.func"() <{function_type = (tensor<2xf16>) -> tensor<1xf16>, sym_name = "all_slice_op_lowering_of_static_1d_tensor_on_static_1d_grid"}> ({
  ^bb0(%arg0: tensor<2xf16>):
    %0 = "shard.all_slice"(%arg0) <{grid = @grid_1d, grid_axes = array<i16: 0>, slice_axis = 0 : index}> : (tensor<2xf16>) -> tensor<1xf16>
    "func.return"(%0) : (tensor<1xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808, -9223372036854775808>, sym_name = "grid_4d"}> : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf16>) -> tensor<?x?xf16>, sym_name = "all_slice_op_lowering_of_dynamic_2d_tensor_on_dynamic_4d_grid"}> ({
  ^bb0(%arg0: tensor<?x?xf16>):
    %0 = "shard.all_slice"(%arg0) <{grid = @grid_4d, grid_axes = array<i16: 3, 1>, slice_axis = 1 : index}> : (tensor<?x?xf16>) -> tensor<?x?xf16>
    "func.return"(%0) : (tensor<?x?xf16>) -> ()
  }) : () -> ()
}) : () -> ()

