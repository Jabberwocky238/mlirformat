module {
  func.func @vector_transfer_write(%arg0: tensor<?xf32>, %arg1: vector<5xf32>, %arg2: index) -> index {
    %0 = vector.transfer_write %arg1, %arg0[%arg2] : vector<5xf32>, tensor<?xf32>
    %1 = "test.reify_bound"(%0) <{dim = 0 : i64, type = "EQ"}> : (tensor<?xf32>) -> index
    return %1 : index
  }
}

