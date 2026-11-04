module {
  shard.grid @grid0(shape = 4x?x2)
  func.func private @grid_to_inline() -> (index, index) {
    %grid_shape:2 = shard.grid_shape @grid0 axes = [2, 1] : index, index
    return %grid_shape#0, %grid_shape#1 : index, index
  }
  func.func @main() -> (index, index) {
    %0:2 = call @grid_to_inline() : () -> (index, index)
    return %0#0, %0#1 : index, index
  }
}

