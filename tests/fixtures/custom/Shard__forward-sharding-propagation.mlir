#map = affine_map<(d0, d1) -> (d0, d1)>
module attributes {dlti.map = #dlti.map<"MPI:Implementation" = "mpich", "MPI:comm_world_rank" = 0 : i32>} {
  shard.grid @grid(shape = 1) {sym_visibility = "private"}
  func.func @test_forward() -> (tensor<6x6xi32>, tensor<6x6xi32>, tensor<i32>) attributes {llvm.emit_c_interface} {
    %c1_i32 = arith.constant 1 : i32
    %0 = tensor.empty() : tensor<6x6xi32>
    %1 = linalg.fill ins(%c1_i32 : i32) outs(%0 : tensor<6x6xi32>) -> tensor<6x6xi32>
    %sharding = shard.sharding @grid split_axes = [[0]] : !shard.sharding
    %sharding_annotated = shard.shard %1 to %sharding : tensor<6x6xi32>
    %2 = tensor.empty() : tensor<6x6xi32>
    %3 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%sharding_annotated, %sharding_annotated : tensor<6x6xi32>, tensor<6x6xi32>) outs(%2 : tensor<6x6xi32>) {
    ^bb0(%in: i32, %in_2: i32, %out: i32):
      %6 = arith.addi %in, %in_2 : i32
      linalg.yield %6 : i32
    } -> tensor<6x6xi32>
    %c0_i32 = arith.constant 0 : i32
    %4 = tensor.empty() : tensor<i32>
    %5 = linalg.fill ins(%c0_i32 : i32) outs(%4 : tensor<i32>) -> tensor<i32>
    %reduced = linalg.reduce ins(%3 : tensor<6x6xi32>) outs(%5 : tensor<i32>) dimensions = [0, 1] 
      (%in: i32, %init: i32) {
        %6 = arith.addi %in, %init : i32
        linalg.yield %6 : i32
      }
    %sharding_0 = shard.sharding @grid split_axes = [[]] : !shard.sharding
    %sharding_annotated_1 = shard.shard %reduced to %sharding_0 annotate_for_users : tensor<i32>
    return %sharding_annotated, %3, %sharding_annotated_1 : tensor<6x6xi32>, tensor<6x6xi32>, tensor<i32>
  }
}

