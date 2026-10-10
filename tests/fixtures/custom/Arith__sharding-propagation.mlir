module {
  shard.grid @grid4x4(shape = 4x4)
  func.func @test_shard_constant() -> tensor<1024x1024xf32> attributes {llvm.emit_c_interface} {
    %cst = arith.constant dense<0.000000e+00> : tensor<1024x1024xf32>
    %sharding = shard.sharding @grid4x4 split_axes = [[0]] : !shard.sharding
    %sharding_annotated = shard.shard %cst to %sharding : tensor<1024x1024xf32>
    %cst_0 = arith.constant 4.340000e+01 : f32
    %0 = tensor.empty() : tensor<1024x1024xf32>
    %1 = linalg.add ins(%sharding_annotated, %cst_0 : tensor<1024x1024xf32>, f32) outs(%0 : tensor<1024x1024xf32>) -> tensor<1024x1024xf32>
    return %1 : tensor<1024x1024xf32>
  }
  func.func @test_shard_constant_back() -> tensor<1024x1024xf32> attributes {llvm.emit_c_interface} {
    %cst = arith.constant dense<0.000000e+00> : tensor<1024x1024xf32>
    %cst_0 = arith.constant 4.340000e+01 : f32
    %0 = tensor.empty() : tensor<1024x1024xf32>
    %1 = linalg.add ins(%cst, %cst_0 : tensor<1024x1024xf32>, f32) outs(%0 : tensor<1024x1024xf32>) -> tensor<1024x1024xf32>
    %sharding = shard.sharding @grid4x4 split_axes = [[0]] : !shard.sharding
    %sharding_annotated = shard.shard %1 to %sharding : tensor<1024x1024xf32>
    return %sharding_annotated : tensor<1024x1024xf32>
  }
}

