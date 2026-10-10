module {
  gpu.module @test_module {
    gpu.func @test_cluster_ranges() kernel attributes {known_cluster_size = array<i32: 8, 4, 1>} {
      %cluster_block_id_x = gpu.cluster_block_id  x
      %0 = test.reflect_bounds %cluster_block_id_x : index
      %cluster_block_id_y = gpu.cluster_block_id  y
      %1 = test.reflect_bounds %cluster_block_id_y : index
      %cluster_block_id_z = gpu.cluster_block_id  z
      %2 = test.reflect_bounds %cluster_block_id_z : index
      %cluster_dim_blocks_x = gpu.cluster_dim_blocks  x
      %3 = test.reflect_bounds %cluster_dim_blocks_x : index
      %cluster_dim_blocks_y = gpu.cluster_dim_blocks  y
      %4 = test.reflect_bounds %cluster_dim_blocks_y : index
      %cluster_dim_blocks_z = gpu.cluster_dim_blocks  z
      %5 = test.reflect_bounds %cluster_dim_blocks_z : index
      gpu.return
    }
  }
}

