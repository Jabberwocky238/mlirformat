module {
  shard.grid @grid0(shape = 4x2)
  shard.grid @grid1(shape = 4)
  func.func @all_reduce_arith_addf_endomorphism(%arg0: tensor<5xf32>, %arg1: tensor<5xf32>) -> tensor<5xf32> {
    %all_reduce = shard.all_reduce %arg0 on @grid0 grid_axes = [0] : tensor<5xf32> -> tensor<5xf32>
    %all_reduce_0 = shard.all_reduce %arg1 on @grid0 grid_axes = [0] : tensor<5xf32> -> tensor<5xf32>
    %0 = arith.addf %all_reduce, %all_reduce_0 : tensor<5xf32>
    return %0 : tensor<5xf32>
  }
  func.func @all_reduce_arith_addf_endomorphism_multiple_uses_of_result(%arg0: tensor<5xf32>, %arg1: tensor<5xf32>) -> (tensor<5xf32>, tensor<5xf32>) {
    %all_reduce = shard.all_reduce %arg0 on @grid0 grid_axes = [0] : tensor<5xf32> -> tensor<5xf32>
    %all_reduce_0 = shard.all_reduce %arg1 on @grid0 grid_axes = [0] : tensor<5xf32> -> tensor<5xf32>
    %0 = arith.addf %all_reduce, %all_reduce_0 : tensor<5xf32>
    return %0, %0 : tensor<5xf32>, tensor<5xf32>
  }
  func.func @all_reduce_arith_addf_endomorphism_multiple_uses_of_all_reduce_result(%arg0: tensor<5xf32>, %arg1: tensor<5xf32>) -> (tensor<5xf32>, tensor<5xf32>) {
    %all_reduce = shard.all_reduce %arg0 on @grid0 grid_axes = [0] : tensor<5xf32> -> tensor<5xf32>
    %all_reduce_0 = shard.all_reduce %arg1 on @grid0 grid_axes = [0] : tensor<5xf32> -> tensor<5xf32>
    %0 = arith.addf %all_reduce, %all_reduce_0 : tensor<5xf32>
    return %all_reduce, %0 : tensor<5xf32>, tensor<5xf32>
  }
  func.func @all_reduce_arith_addf_no_endomorphism_different_grid(%arg0: tensor<5xf32>, %arg1: tensor<5xf32>) -> tensor<5xf32> {
    %all_reduce = shard.all_reduce %arg0 on @grid0 grid_axes = [0] : tensor<5xf32> -> tensor<5xf32>
    %all_reduce_0 = shard.all_reduce %arg1 on @grid1 grid_axes = [0] : tensor<5xf32> -> tensor<5xf32>
    %0 = arith.addf %all_reduce, %all_reduce_0 : tensor<5xf32>
    return %0 : tensor<5xf32>
  }
  func.func @all_reduce_arith_addf_no_endomorphism_different_grid_axes(%arg0: tensor<5xf32>, %arg1: tensor<5xf32>) -> tensor<5xf32> {
    %all_reduce = shard.all_reduce %arg0 on @grid0 grid_axes = [0] : tensor<5xf32> -> tensor<5xf32>
    %all_reduce_0 = shard.all_reduce %arg1 on @grid0 grid_axes = [1] : tensor<5xf32> -> tensor<5xf32>
    %0 = arith.addf %all_reduce, %all_reduce_0 : tensor<5xf32>
    return %0 : tensor<5xf32>
  }
  func.func @all_reduce_arith_addf_no_endomorphism_wrong_reduction_kind(%arg0: tensor<5xf32>, %arg1: tensor<5xf32>) -> tensor<5xf32> {
    %all_reduce = shard.all_reduce %arg0 on @grid0 grid_axes = [0] reduction =  max : tensor<5xf32> -> tensor<5xf32>
    %all_reduce_0 = shard.all_reduce %arg1 on @grid0 grid_axes = [0] : tensor<5xf32> -> tensor<5xf32>
    %0 = arith.addf %all_reduce, %all_reduce_0 : tensor<5xf32>
    return %0 : tensor<5xf32>
  }
  func.func @all_reduce_arith_addf_no_endomorphism_different_operand_result_element_types(%arg0: tensor<5xf32>, %arg1: tensor<5xf32>) -> tensor<5xf64> {
    %all_reduce = shard.all_reduce %arg0 on @grid0 grid_axes = [0] : tensor<5xf32> -> tensor<5xf64>
    %all_reduce_0 = shard.all_reduce %arg1 on @grid0 grid_axes = [0] : tensor<5xf32> -> tensor<5xf64>
    %0 = arith.addf %all_reduce, %all_reduce_0 : tensor<5xf64>
    return %0 : tensor<5xf64>
  }
  func.func @all_reduce_arith_minimumf_endomorphism(%arg0: tensor<5xf32>, %arg1: tensor<5xf32>) -> tensor<5xf32> {
    %all_reduce = shard.all_reduce %arg0 on @grid0 grid_axes = [0] reduction =  min : tensor<5xf32> -> tensor<5xf32>
    %all_reduce_0 = shard.all_reduce %arg1 on @grid0 grid_axes = [0] reduction =  min : tensor<5xf32> -> tensor<5xf32>
    %0 = arith.minimumf %all_reduce, %all_reduce_0 : tensor<5xf32>
    return %0 : tensor<5xf32>
  }
  func.func @all_reduce_arith_minsi_endomorphism(%arg0: tensor<5xi32>, %arg1: tensor<5xi32>) -> tensor<5xi32> {
    %all_reduce = shard.all_reduce %arg0 on @grid0 grid_axes = [0] reduction =  min : tensor<5xi32> -> tensor<5xi32>
    %all_reduce_0 = shard.all_reduce %arg1 on @grid0 grid_axes = [0] reduction =  min : tensor<5xi32> -> tensor<5xi32>
    %0 = arith.minsi %all_reduce, %all_reduce_0 : tensor<5xi32>
    return %0 : tensor<5xi32>
  }
  func.func @no_endomorphism_op(%arg0: tensor<2xi64>) -> i64 {
    %c0 = arith.constant 0 : index
    %c1_i64 = arith.constant 1 : i64
    %extracted = tensor.extract %arg0[%c0] : tensor<2xi64>
    %0 = arith.maxsi %extracted, %c1_i64 : i64
    return %0 : i64
  }
}

