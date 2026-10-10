module {
  shard.grid @grid4x4(shape = 4x4)
  func.func @test_partition_constant() -> tensor<1024x1024xf32> attributes {llvm.emit_c_interface} {
    %cst = arith.constant dense<0.000000e+00> : tensor<1024x1024xf32>
    %sharding = shard.sharding @grid4x4 split_axes = [[0]] : !shard.sharding
    %sharding_annotated = shard.shard %cst to %sharding : tensor<1024x1024xf32>
    %c434_i32 = arith.constant 434 : i32
    return %sharding_annotated : tensor<1024x1024xf32>
  }
}

