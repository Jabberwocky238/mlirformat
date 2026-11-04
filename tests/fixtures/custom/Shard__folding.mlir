module {
  shard.grid @grid0(shape = 4x?x2)
  shard.grid @grid1(shape = 2x3)
  func.func @grid_shape_op_folding() -> (index, index) {
    %grid_shape:2 = shard.grid_shape @grid0 axes = [2, 1] : index, index
    return %grid_shape#0, %grid_shape#1 : index, index
  }
  func.func @grid_shape_op_folding_all_axes_static_grid() -> (index, index) {
    %grid_shape:2 = shard.grid_shape @grid1 : index, index
    return %grid_shape#0, %grid_shape#1 : index, index
  }
}

