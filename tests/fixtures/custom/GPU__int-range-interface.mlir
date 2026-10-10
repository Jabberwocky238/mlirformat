module {
  func.func @launch_func(%arg0: index) {
    %0 = test.with_bounds {smax = 5 : index, smin = 3 : index, umax = 5 : index, umin = 3 : index} : index
    %1 = test.with_bounds {smax = 11 : index, smin = 7 : index, umax = 11 : index, umin = 7 : index} : index
    gpu.launch blocks(%arg1, %arg2, %arg3) in (%arg7 = %0, %arg8 = %1, %arg9 = %arg0) threads(%arg4, %arg5, %arg6) in (%arg10 = %arg0, %arg11 = %0, %arg12 = %1) {
      %2 = test.reflect_bounds %arg7 : index
      %3 = test.reflect_bounds %arg8 : index
      %4 = test.reflect_bounds %arg9 : index
      %5 = test.reflect_bounds %arg1 : index
      %6 = test.reflect_bounds %arg2 : index
      %7 = test.reflect_bounds %arg3 : index
      %8 = test.reflect_bounds %arg10 : index
      %9 = test.reflect_bounds %arg11 : index
      %10 = test.reflect_bounds %arg12 : index
      %11 = test.reflect_bounds %arg4 : index
      %12 = test.reflect_bounds %arg5 : index
      %13 = test.reflect_bounds %arg6 : index
      %thread_id_y = gpu.thread_id  y
      %14 = test.reflect_bounds %thread_id_y : index
      gpu.terminator
    }
    return
  }
}

// -----
module attributes {gpu.container_module} {
  gpu.module @gpu_module {
    llvm.func @kernel() attributes {gpu.kernel} {
      %grid_dim_x = gpu.grid_dim  x
      %grid_dim_y = gpu.grid_dim  y
      %grid_dim_z = gpu.grid_dim  z
      %0 = test.reflect_bounds %grid_dim_x : index
      %1 = test.reflect_bounds %grid_dim_y : index
      %2 = test.reflect_bounds %grid_dim_z : index
      %block_id_x = gpu.block_id  x
      %block_id_y = gpu.block_id  y
      %block_id_z = gpu.block_id  z
      %3 = test.reflect_bounds %block_id_x : index
      %4 = test.reflect_bounds %block_id_y : index
      %5 = test.reflect_bounds %block_id_z : index
      %block_dim_x = gpu.block_dim  x
      %block_dim_y = gpu.block_dim  y
      %block_dim_z = gpu.block_dim  z
      %6 = test.reflect_bounds %block_dim_x : index
      %7 = test.reflect_bounds %block_dim_y : index
      %8 = test.reflect_bounds %block_dim_z : index
      %thread_id_x = gpu.thread_id  x
      %thread_id_y = gpu.thread_id  y
      %thread_id_z = gpu.thread_id  z
      %9 = test.reflect_bounds %thread_id_x : index
      %10 = test.reflect_bounds %thread_id_y : index
      %11 = test.reflect_bounds %thread_id_z : index
      %global_id_x = gpu.global_id  x
      %global_id_y = gpu.global_id  y
      %global_id_z = gpu.global_id  z
      %12 = test.reflect_bounds %global_id_x : index
      %13 = test.reflect_bounds %global_id_y : index
      %14 = test.reflect_bounds %global_id_z : index
      %15 = gpu.subgroup_size : index
      %16 = gpu.lane_id
      %17 = gpu.num_subgroups : index
      %18 = gpu.subgroup_id : index
      %19 = test.reflect_bounds %15 : index
      %20 = test.reflect_bounds %16 : index
      %21 = test.reflect_bounds %17 : index
      %22 = test.reflect_bounds %18 : index
      llvm.return
    }
  }
}

// -----
module attributes {gpu.container_module} {
  gpu.module @gpu_module {
    gpu.func @annotated_kernel() kernel attributes {known_block_size = array<i32: 8, 12, 16>, known_grid_size = array<i32: 20, 24, 28>} {
      %grid_dim_x = gpu.grid_dim  x
      %grid_dim_y = gpu.grid_dim  y
      %grid_dim_z = gpu.grid_dim  z
      %0 = test.reflect_bounds %grid_dim_x : index
      %1 = test.reflect_bounds %grid_dim_y : index
      %2 = test.reflect_bounds %grid_dim_z : index
      %block_id_x = gpu.block_id  x
      %block_id_y = gpu.block_id  y
      %block_id_z = gpu.block_id  z
      %3 = test.reflect_bounds %block_id_x : index
      %4 = test.reflect_bounds %block_id_y : index
      %5 = test.reflect_bounds %block_id_z : index
      %block_dim_x = gpu.block_dim  x
      %block_dim_y = gpu.block_dim  y
      %block_dim_z = gpu.block_dim  z
      %6 = test.reflect_bounds %block_dim_x : index
      %7 = test.reflect_bounds %block_dim_y : index
      %8 = test.reflect_bounds %block_dim_z : index
      %thread_id_x = gpu.thread_id  x
      %thread_id_y = gpu.thread_id  y
      %thread_id_z = gpu.thread_id  z
      %9 = test.reflect_bounds %thread_id_x : index
      %10 = test.reflect_bounds %thread_id_y : index
      %11 = test.reflect_bounds %thread_id_z : index
      %global_id_x = gpu.global_id  x
      %global_id_y = gpu.global_id  y
      %global_id_z = gpu.global_id  z
      %12 = test.reflect_bounds %global_id_x : index
      %13 = test.reflect_bounds %global_id_y : index
      %14 = test.reflect_bounds %global_id_z : index
      %15 = gpu.subgroup_size : index
      %16 = gpu.lane_id
      %17 = gpu.num_subgroups : index
      %18 = gpu.subgroup_id : index
      %19 = test.reflect_bounds %15 : index
      %20 = test.reflect_bounds %16 : index
      %21 = test.reflect_bounds %17 : index
      %22 = test.reflect_bounds %18 : index
      gpu.return
    }
  }
}

// -----
module {
  func.func @annotated_kernel() attributes {gpu.known_block_size = array<i32: 8, 12, 16>, gpu.known_grid_size = array<i32: 20, 24, 28>} {
    %block_id_x = gpu.block_id  x
    %block_id_y = gpu.block_id  y
    %block_id_z = gpu.block_id  z
    %0 = test.reflect_bounds %block_id_x : index
    %1 = test.reflect_bounds %block_id_y : index
    %2 = test.reflect_bounds %block_id_z : index
    %thread_id_x = gpu.thread_id  x
    %thread_id_y = gpu.thread_id  y
    %thread_id_z = gpu.thread_id  z
    %3 = test.reflect_bounds %thread_id_x : index
    %4 = test.reflect_bounds %thread_id_y : index
    %5 = test.reflect_bounds %thread_id_z : index
    return
  }
}

// -----
module attributes {gpu.container_module} {
  gpu.module @gpu_module {
    gpu.func @local_bounds_kernel() kernel {
      %grid_dim_x = gpu.grid_dim  x upper_bound 20
      %grid_dim_y = gpu.grid_dim  y upper_bound 24
      %grid_dim_z = gpu.grid_dim  z upper_bound 28
      %0 = test.reflect_bounds %grid_dim_x : index
      %1 = test.reflect_bounds %grid_dim_y : index
      %2 = test.reflect_bounds %grid_dim_z : index
      %block_id_x = gpu.block_id  x upper_bound 20
      %block_id_y = gpu.block_id  y upper_bound 24
      %block_id_z = gpu.block_id  z upper_bound 28
      %3 = test.reflect_bounds %block_id_x : index
      %4 = test.reflect_bounds %block_id_y : index
      %5 = test.reflect_bounds %block_id_z : index
      %block_dim_x = gpu.block_dim  x upper_bound 8
      %block_dim_y = gpu.block_dim  y upper_bound 12
      %block_dim_z = gpu.block_dim  z upper_bound 16
      %6 = test.reflect_bounds %block_dim_x : index
      %7 = test.reflect_bounds %block_dim_y : index
      %8 = test.reflect_bounds %block_dim_z : index
      %thread_id_x = gpu.thread_id  x upper_bound 8
      %thread_id_y = gpu.thread_id  y upper_bound 12
      %thread_id_z = gpu.thread_id  z upper_bound 16
      %9 = test.reflect_bounds %thread_id_x : index
      %10 = test.reflect_bounds %thread_id_y : index
      %11 = test.reflect_bounds %thread_id_z : index
      %global_id_x = gpu.global_id  x upper_bound 160
      %global_id_y = gpu.global_id  y upper_bound 288
      %global_id_z = gpu.global_id  z upper_bound 448
      %12 = test.reflect_bounds %global_id_x : index
      %13 = test.reflect_bounds %global_id_y : index
      %14 = test.reflect_bounds %global_id_z : index
      %15 = gpu.subgroup_size upper_bound 32 : index
      %16 = gpu.subgroup_id upper_bound 32 : index
      %17 = gpu.num_subgroups upper_bound 8 : index
      %18 = gpu.lane_id upper_bound 64
      %19 = test.reflect_bounds %15 : index
      %20 = test.reflect_bounds %16 : index
      %21 = test.reflect_bounds %17 : index
      %22 = test.reflect_bounds %18 : index
      gpu.return
    }
  }
}

// -----
module {
  func.func @broadcast(%arg0: i32) {
    %0 = test.with_bounds {smax = 10 : index, smin = 0 : index, umax = 10 : index, umin = 0 : index} : index
    %1 = gpu.subgroup_broadcast %0,  first_active_lane : index
    %2 = gpu.subgroup_broadcast %0,  specific_lane %arg0 : index
    %3 = test.reflect_bounds %1 : index
    %4 = test.reflect_bounds %2 : index
    return
  }
}

