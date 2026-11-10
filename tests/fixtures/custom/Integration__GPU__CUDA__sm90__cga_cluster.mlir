module attributes {gpu.container_module} {
  func.func @main() {
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c4 = arith.constant 4 : index
    gpu.launch_func  @gpumodule::@kernel_cluster clusters in (%c2, %c2, %c1) blocks in (%c4, %c4, %c1) threads in (%c1, %c1, %c1)  
    return
  }
  gpu.module @gpumodule {
    gpu.func @kernel_cluster() kernel attributes {gpu.known_block_size = array<i32: 1, 1, 1>, gpu.known_grid_size = array<i32: 4, 4, 1>} {
      %cluster_id_x = gpu.cluster_id x
      %cluster_id_y = gpu.cluster_id y
      %cluster_id_z = gpu.cluster_id z
      %cluster_dim_blocks_x = gpu.cluster_dim_blocks x
      %cluster_dim_blocks_y = gpu.cluster_dim_blocks y
      %cluster_dim_blocks_z = gpu.cluster_dim_blocks z
      %block_id_x = gpu.block_id x
      %block_id_y = gpu.block_id y
      %block_id_z = gpu.block_id z
      %0 = index.casts %cluster_id_x : index to i32
      %1 = index.casts %cluster_id_y : index to i32
      %2 = index.casts %cluster_id_z : index to i32
      %3 = index.casts %cluster_dim_blocks_x : index to i32
      %4 = index.casts %cluster_dim_blocks_y : index to i32
      %5 = index.casts %cluster_dim_blocks_z : index to i32
      %6 = index.casts %block_id_x : index to i32
      %7 = index.casts %block_id_y : index to i32
      %8 = index.casts %block_id_z : index to i32
      %c3 = arith.constant 3 : index
      %9 = arith.cmpi eq, %block_id_x, %c3 : index
      %10 = arith.cmpi eq, %block_id_y, %c3 : index
      scf.if %9 {
        scf.if %10 {
          gpu.printf "clusterIdx: (%d, %d, %d) in Cluster Dimension: (%d, %d, %d) blockIdx: (%d, %d, %d) \0A", %0, %1, %2, %3, %4, %5, %6, %7, %8 : i32, i32, i32, i32, i32, i32, i32, i32, i32
        }
      }
      gpu.return
    }
  }
}

