module {
  shard.grid @grid_1d(shape = ?)
  func.func @all_slice_op_lowering_of_dynamic_1d_tensor_on_dynamic_1d_grid(%arg0: tensor<?xf16>) -> tensor<?xf16> {
    %all_slice = shard.all_slice %arg0 on @grid_1d grid_axes = [0] slice_axis = 0 : tensor<?xf16> -> tensor<?xf16>
    return %all_slice : tensor<?xf16>
  }
}

// -----
module {
  shard.grid @grid_1d(shape = 2)
  func.func @all_slice_op_lowering_of_static_1d_tensor_on_static_1d_grid(%arg0: tensor<2xf16>) -> tensor<1xf16> {
    %all_slice = shard.all_slice %arg0 on @grid_1d grid_axes = [0] slice_axis = 0 : tensor<2xf16> -> tensor<1xf16>
    return %all_slice : tensor<1xf16>
  }
}

// -----
module {
  shard.grid @grid_4d(shape = ?x?x?x?)
  func.func @all_slice_op_lowering_of_dynamic_2d_tensor_on_dynamic_4d_grid(%arg0: tensor<?x?xf16>) -> tensor<?x?xf16> {
    %all_slice = shard.all_slice %arg0 on @grid_4d grid_axes = [3, 1] slice_axis = 1 : tensor<?x?xf16> -> tensor<?x?xf16>
    return %all_slice : tensor<?x?xf16>
  }
}

