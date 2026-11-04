module {
  shard.grid @grid2d(shape = ?x?)
  func.func @multi_index_2d_grid() -> (index, index) {
    %proc_linear_idx:2 = shard.process_multi_index on @grid2d : index, index
    return %proc_linear_idx#0, %proc_linear_idx#1 : index, index
  }
  func.func @multi_index_2d_grid_single_inner_axis() -> index {
    %proc_linear_idx = shard.process_multi_index on @grid2d axes = [0] : index
    return %proc_linear_idx : index
  }
}

