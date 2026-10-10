module {
  func.func @blocks_3d(%arg0: memref<2x32xf32>, %arg1: memref<2x32xf32>, %arg2: memref<32xf32>, %arg3: f32, %arg4: !gpu.async.token) -> memref<2x32xf32> {
    %c9 = arith.constant 9 : index
    %c7 = arith.constant 7 : index
    %c1 = arith.constant 1 : index
    %0 = gpu.launch async [%arg4] blocks(%arg5, %arg6, %arg7) in (%arg11 = %c1, %arg12 = %c1, %arg13 = %c1) threads(%arg8, %arg9, %arg10) in (%arg14 = %c1, %arg15 = %c1, %arg16 = %c1) {
      scf.forall (%arg17, %arg18) in (%c7, %c9) {
        %1 = memref.load %arg0[%arg17, %arg18] : memref<2x32xf32>
        %2 = memref.load %arg1[%arg17, %arg18] : memref<2x32xf32>
        %3 = math.fma %arg3, %1, %2 : f32
        memref.store %3, %arg1[%arg17, %arg18] : memref<2x32xf32>
      } {mapping = [#gpu.block<x>, #gpu.block<y>]}
      gpu.terminator
    }
    return %arg1 : memref<2x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["gpu.launch"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.gpu.map_forall_to_blocks %0 grid_dims = [12, 9, 1] : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @warpgroup_3d(%arg0: memref<2x32xf32>, %arg1: memref<2x32xf32>, %arg2: memref<32xf32>, %arg3: f32, %arg4: !gpu.async.token) -> memref<2x32xf32> {
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %c1_0 = arith.constant 1 : index
    %0 = gpu.launch async [%arg4] blocks(%arg5, %arg6, %arg7) in (%arg11 = %c1_0, %arg12 = %c1_0, %arg13 = %c1_0) threads(%arg8, %arg9, %arg10) in (%arg14 = %c1_0, %arg15 = %c1_0, %arg16 = %c1_0) {
      scf.forall (%arg17, %arg18) in (%c3, %c1) {
        %1 = memref.load %arg0[%arg17, %arg18] : memref<2x32xf32>
        %2 = memref.load %arg1[%arg17, %arg18] : memref<2x32xf32>
        %3 = math.fma %arg3, %1, %2 : f32
        memref.store %3, %arg1[%arg17, %arg18] : memref<2x32xf32>
      } {mapping = [#gpu.warpgroup<x>, #gpu.warpgroup<y>]}
      gpu.terminator
    }
    return %arg1 : memref<2x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["gpu.launch"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.gpu.map_nested_forall_to_threads %0 block_dims = [512, 2, 1] : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @warp_3d(%arg0: memref<2x32xf32>, %arg1: memref<2x32xf32>, %arg2: memref<32xf32>, %arg3: f32, %arg4: !gpu.async.token) -> memref<2x32xf32> {
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    %0 = gpu.launch async [%arg4] blocks(%arg5, %arg6, %arg7) in (%arg11 = %c1, %arg12 = %c1, %arg13 = %c1) threads(%arg8, %arg9, %arg10) in (%arg14 = %c1, %arg15 = %c1, %arg16 = %c1) {
      scf.forall (%arg17, %arg18, %arg19) in (%c2, %c3, %c3) {
        %1 = memref.load %arg0[%arg17, %arg18] : memref<2x32xf32>
        %2 = memref.load %arg1[%arg17, %arg18] : memref<2x32xf32>
        %3 = math.fma %arg3, %1, %2 : f32
        memref.store %3, %arg1[%arg17, %arg18] : memref<2x32xf32>
      } {mapping = [#gpu.warp<x>, #gpu.warp<y>, #gpu.warp<z>]}
      gpu.terminator
    }
    return %arg1 : memref<2x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["gpu.launch"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.gpu.map_nested_forall_to_threads %0 block_dims = [64, 4, 3] warp_size = 16 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @threads_3d(%arg0: memref<2x32xf32>, %arg1: memref<2x32xf32>, %arg2: memref<32xf32>, %arg3: f32, %arg4: !gpu.async.token) -> memref<2x32xf32> {
    %c1 = arith.constant 1 : index
    %c12 = arith.constant 12 : index
    %c9 = arith.constant 9 : index
    %c7 = arith.constant 7 : index
    %0 = gpu.launch async [%arg4] blocks(%arg5, %arg6, %arg7) in (%arg11 = %c1, %arg12 = %c1, %arg13 = %c1) threads(%arg8, %arg9, %arg10) in (%arg14 = %c1, %arg15 = %c1, %arg16 = %c1) {
      scf.forall (%arg17, %arg18) in (%c7, %c9) {
        %1 = memref.load %arg0[%arg17, %arg18] : memref<2x32xf32>
        %2 = memref.load %arg1[%arg17, %arg18] : memref<2x32xf32>
        %3 = math.fma %arg3, %1, %2 : f32
        memref.store %3, %arg1[%arg17, %arg18] : memref<2x32xf32>
      } {mapping = [#gpu.thread<y>, #gpu.thread<x>]}
      scf.forall (%arg17) in (%c12) {
        %1 = memref.load %arg2[%arg17] : memref<32xf32>
        %2 = arith.addf %arg3, %1 : f32
        memref.store %2, %arg2[%arg17] : memref<32xf32>
      } {mapping = [#gpu.thread<x>]}
      gpu.terminator
    }
    return %arg1 : memref<2x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["gpu.launch"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.gpu.map_nested_forall_to_threads %0 block_dims = [12, 9, 1] : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @saxpy4d(%arg0: memref<32x64x4x32xf32>, %arg1: memref<32x64x4x32xf32>, %arg2: f32) -> memref<32x64x4x32xf32> {
    %c32 = arith.constant 32 : index
    %c64 = arith.constant 64 : index
    %c4 = arith.constant 4 : index
    scf.forall (%arg3, %arg4) in (%c32, %c64) {
      scf.forall (%arg5, %arg6) in (%c4, %c32) {
        %0 = memref.load %arg0[%arg3, %arg4, %arg5, %arg6] : memref<32x64x4x32xf32>
        %1 = memref.load %arg1[%arg3, %arg4, %arg5, %arg6] : memref<32x64x4x32xf32>
        %2 = math.fma %arg2, %0, %1 : f32
        memref.store %2, %arg1[%arg3, %arg4, %arg5, %arg6] : memref<32x64x4x32xf32>
      } {mapping = [#gpu.thread<y>, #gpu.thread<x>]}
    } {mapping = [#gpu.block<x>, #gpu.block<y>]}
    return %arg1 : memref<32x64x4x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.gpu.map_forall_to_blocks %0 generate_gpu_launch : (!transform.any_op) -> !transform.any_op
      %2 = transform.gpu.map_nested_forall_to_threads %1 block_dims = [32, 4, 1] : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @saxpy2d_no_barrier(%arg0: memref<2x32xf32>, %arg1: memref<2x32xf32>, %arg2: memref<32xf32>, %arg3: f32, %arg4: !gpu.async.token) -> memref<2x32xf32> {
    %c1 = arith.constant 1 : index
    %c12 = arith.constant 12 : index
    %c9 = arith.constant 9 : index
    %c7 = arith.constant 7 : index
    %0 = gpu.launch async [%arg4] blocks(%arg5, %arg6, %arg7) in (%arg11 = %c1, %arg12 = %c1, %arg13 = %c1) threads(%arg8, %arg9, %arg10) in (%arg14 = %c1, %arg15 = %c1, %arg16 = %c1) {
      scf.forall (%arg17, %arg18) in (%c7, %c9) {
        %1 = memref.load %arg0[%arg17, %arg18] : memref<2x32xf32>
        %2 = memref.load %arg1[%arg17, %arg18] : memref<2x32xf32>
        %3 = math.fma %arg3, %1, %2 : f32
        memref.store %3, %arg1[%arg17, %arg18] : memref<2x32xf32>
      } {mapping = [#gpu.thread<y>, #gpu.thread<x>]}
      gpu.terminator
    }
    return %arg1 : memref<2x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["gpu.launch"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.gpu.map_nested_forall_to_threads %0 block_dims = [12, 9, 1] sync_after_distribute = false : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @saxpy2d_singleloop(%arg0: memref<32x32xf32>, %arg1: memref<32x32xf32>, %arg2: !gpu.async.token) -> memref<32x32xf32> {
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %0 = gpu.launch async [%arg2] blocks(%arg3, %arg4, %arg5) in (%arg9 = %c1, %arg10 = %c1, %arg11 = %c1) threads(%arg6, %arg7, %arg8) in (%arg12 = %c1, %arg13 = %c1, %arg14 = %c1) {
      scf.forall (%arg15) in (%c32) {
        %1 = memref.load %arg0[%arg15, %arg15] : memref<32x32xf32>
        %2 = memref.load %arg1[%arg15, %arg15] : memref<32x32xf32>
        %3 = arith.mulf %1, %2 : f32
        memref.store %3, %arg1[%arg15, %arg15] : memref<32x32xf32>
      } {mapping = [#gpu.thread<x>]}
      gpu.terminator
    }
    return %arg1 : memref<32x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["gpu.launch"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.gpu.map_nested_forall_to_threads %0 block_dims = [32, 1, 1] : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @saxpy3d_fold_id_z(%arg0: memref<3x2x32xf32>, %arg1: memref<3x2x32xf32>, %arg2: memref<32xf32>, %arg3: f32, %arg4: !gpu.async.token) -> memref<3x2x32xf32> {
    %c1 = arith.constant 1 : index
    %c12 = arith.constant 12 : index
    %c9 = arith.constant 9 : index
    %c7 = arith.constant 7 : index
    %0 = gpu.launch async [%arg4] blocks(%arg5, %arg6, %arg7) in (%arg11 = %c1, %arg12 = %c1, %arg13 = %c1) threads(%arg8, %arg9, %arg10) in (%arg14 = %c1, %arg15 = %c1, %arg16 = %c1) {
      scf.forall (%arg17, %arg18, %arg19) in (%c1, %c7, %c9) {
        %1 = memref.load %arg0[%arg17, %arg18, %arg19] : memref<3x2x32xf32>
        %2 = memref.load %arg1[%arg17, %arg18, %arg19] : memref<3x2x32xf32>
        %3 = math.fma %arg3, %1, %2 : f32
        memref.store %3, %arg1[%arg17, %arg18, %arg19] : memref<3x2x32xf32>
      } {mapping = [#gpu.thread<z>, #gpu.thread<y>, #gpu.thread<x>]}
      gpu.terminator
    }
    return %arg1 : memref<3x2x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["gpu.launch"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.gpu.map_nested_forall_to_threads %0 block_dims = [12, 9, 1] sync_after_distribute = false : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @warpgroup_linear(%arg0: memref<2x32xf32>, %arg1: memref<2x32xf32>, %arg2: memref<32xf32>, %arg3: f32, %arg4: !gpu.async.token) -> memref<2x32xf32> {
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    %0 = gpu.launch async [%arg4] blocks(%arg5, %arg6, %arg7) in (%arg11 = %c1, %arg12 = %c1, %arg13 = %c1) threads(%arg8, %arg9, %arg10) in (%arg14 = %c1, %arg15 = %c1, %arg16 = %c1) {
      scf.forall (%arg17, %arg18) in (%c2, %c3) {
        %1 = memref.load %arg0[%arg17, %arg18] : memref<2x32xf32>
        %2 = memref.load %arg1[%arg17, %arg18] : memref<2x32xf32>
        %3 = math.fma %arg3, %1, %2 : f32
        memref.store %3, %arg1[%arg17, %arg18] : memref<2x32xf32>
      } {mapping = [#gpu.warpgroup<linear_dim_0>, #gpu.warpgroup<linear_dim_1>]}
      gpu.terminator
    }
    return %arg1 : memref<2x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["gpu.launch"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.gpu.map_nested_forall_to_threads %0 block_dims = [32, 8, 4] : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @warp_linear(%arg0: memref<2x32xf32>, %arg1: memref<2x32xf32>, %arg2: memref<32xf32>, %arg3: f32, %arg4: !gpu.async.token) -> memref<2x32xf32> {
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    %0 = gpu.launch async [%arg4] blocks(%arg5, %arg6, %arg7) in (%arg11 = %c1, %arg12 = %c1, %arg13 = %c1) threads(%arg8, %arg9, %arg10) in (%arg14 = %c1, %arg15 = %c1, %arg16 = %c1) {
      scf.forall (%arg17, %arg18) in (%c2, %c3) {
        %1 = memref.load %arg0[%arg17, %arg18] : memref<2x32xf32>
        %2 = memref.load %arg1[%arg17, %arg18] : memref<2x32xf32>
        %3 = math.fma %arg3, %1, %2 : f32
        memref.store %3, %arg1[%arg17, %arg18] : memref<2x32xf32>
      } {mapping = [#gpu.warp<linear_dim_0>, #gpu.warp<linear_dim_1>]}
      gpu.terminator
    }
    return %arg1 : memref<2x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["gpu.launch"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.gpu.map_nested_forall_to_threads %0 block_dims = [32, 8, 4] : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @map_multi_level_linear(%arg0: memref<2x32xf32>, %arg1: memref<2x32xf32>, %arg2: memref<32xf32>, %arg3: f32, %arg4: !gpu.async.token) -> memref<2x32xf32> {
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    %c9 = arith.constant 9 : index
    %c7 = arith.constant 7 : index
    %c1_0 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %0 = gpu.launch async [%arg4] blocks(%arg5, %arg6, %arg7) in (%arg11 = %c1, %arg12 = %c1, %arg13 = %c1) threads(%arg8, %arg9, %arg10) in (%arg14 = %c1, %arg15 = %c1, %arg16 = %c1) {
      scf.forall (%arg17, %arg18) in (%c7, %c9) {
        %1 = memref.load %arg0[%arg17, %arg18] : memref<2x32xf32>
        %2 = memref.load %arg1[%arg17, %arg18] : memref<2x32xf32>
        %3 = math.fma %arg3, %1, %2 : f32
        memref.store %3, %arg1[%arg17, %arg18] : memref<2x32xf32>
      } {mapping = [#gpu.thread<y>, #gpu.thread<x>]}
      scf.forall (%arg17, %arg18, %arg19) in (%c3, %c2, %c1_0) {
        %1 = memref.load %arg0[%arg17, %arg18] : memref<2x32xf32>
        %2 = arith.addf %arg3, %1 : f32
        memref.store %2, %arg1[%arg17, %arg18] : memref<2x32xf32>
      } {mapping = [#gpu.warp<linear_dim_0>, #gpu.warp<linear_dim_1>, #gpu.warp<linear_dim_2>]}
      scf.forall (%arg17, %arg18) in (%c10, %c2) {
        %1 = memref.load %arg2[%arg17] : memref<32xf32>
        %2 = arith.addf %arg3, %1 : f32
        memref.store %2, %arg2[%arg18] : memref<32xf32>
      } {mapping = [#gpu.thread<linear_dim_0>, #gpu.thread<linear_dim_1>]}
      gpu.terminator
    }
    return %arg1 : memref<2x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["gpu.launch"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.gpu.map_nested_forall_to_threads %0 block_dims = [18, 11, 1] : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @block_linear_existing_launch(%arg0: memref<2x32xf32>, %arg1: memref<2x32xf32>, %arg2: memref<32xf32>, %arg3: f32, %arg4: !gpu.async.token) -> memref<2x32xf32> {
    %c9 = arith.constant 9 : index
    %c7 = arith.constant 7 : index
    %c1 = arith.constant 1 : index
    %0 = gpu.launch async [%arg4] blocks(%arg5, %arg6, %arg7) in (%arg11 = %c1, %arg12 = %c1, %arg13 = %c1) threads(%arg8, %arg9, %arg10) in (%arg14 = %c1, %arg15 = %c1, %arg16 = %c1) {
      scf.forall (%arg17, %arg18) in (%c7, %c9) {
        %1 = memref.load %arg0[%arg17, %arg18] : memref<2x32xf32>
        %2 = memref.load %arg1[%arg17, %arg18] : memref<2x32xf32>
        %3 = math.fma %arg3, %1, %2 : f32
        memref.store %3, %arg1[%arg17, %arg18] : memref<2x32xf32>
      } {mapping = [#gpu.block<linear_dim_0>, #gpu.block<linear_dim_1>]}
      gpu.terminator
    }
    return %arg1 : memref<2x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["gpu.launch"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.gpu.map_forall_to_blocks %0 grid_dims = [12, 9, 1] : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @block_linear_generate_launch(%arg0: memref<2x32xf32>, %arg1: memref<2x32xf32>, %arg2: memref<32xf32>, %arg3: f32, %arg4: !gpu.async.token) -> memref<2x32xf32> {
    %c9 = arith.constant 9 : index
    %c7 = arith.constant 7 : index
    %c1 = arith.constant 1 : index
    scf.forall (%arg5, %arg6) in (%c7, %c9) {
      %0 = memref.load %arg0[%arg5, %arg6] : memref<2x32xf32>
      %1 = memref.load %arg1[%arg5, %arg6] : memref<2x32xf32>
      %2 = math.fma %arg3, %0, %1 : f32
      memref.store %2, %arg1[%arg5, %arg6] : memref<2x32xf32>
    } {mapping = [#gpu.block<linear_dim_0>, #gpu.block<linear_dim_1>]}
    return %arg1 : memref<2x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.gpu.map_forall_to_blocks %0 generate_gpu_launch : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0) -> (d0 * 128)>
#map1 = affine_map<(d0) -> (d0 * 32)>
module {
  func.func @simple_fill(%arg0: memref<128xf32>) -> memref<128xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant dense<0.000000e+00> : vector<32xf32>
    scf.forall (%arg1) in (1) {
      %0 = affine.apply #map(%arg1)
      %subview = memref.subview %arg0[%0] [128] [1] : memref<128xf32> to memref<128xf32, strided<[1], offset: ?>>
      scf.forall (%arg2) in (4) {
        %1 = affine.apply #map1(%arg2)
        %subview_0 = memref.subview %subview[%1] [32] [1] : memref<128xf32, strided<[1], offset: ?>> to memref<32xf32, strided<[1], offset: ?>>
        vector.transfer_write %cst, %subview_0[%c0] {in_bounds = [true]} : vector<32xf32>, memref<32xf32, strided<[1], offset: ?>>
        memref.copy %subview_0, %subview_0 : memref<32xf32, strided<[1], offset: ?>> to memref<32xf32, strided<[1], offset: ?>>
      } {mapping = [#gpu.warp<linear_dim_0>]}
      memref.copy %subview, %subview : memref<128xf32, strided<[1], offset: ?>> to memref<128xf32, strided<[1], offset: ?>>
    } {mapping = [#gpu.block<x>]}
    return %arg0 : memref<128xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.gpu.map_forall_to_blocks %0 generate_gpu_launch : (!transform.any_op) -> !transform.any_op
      %2 = transform.gpu.map_nested_forall_to_threads %1 block_dims = [4, 8, 4] : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0) -> (d0 * 128)>
#map1 = affine_map<(d0) -> (d0 * 32)>
module {
  func.func @simple_fill(%arg0: memref<128x256xf32>) -> memref<128x256xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant dense<0.000000e+00> : vector<16x32xf32>
    scf.forall (%arg1) in (1) {
      %0 = affine.apply #map(%arg1)
      %subview = memref.subview %arg0[%0, 0] [128, 256] [1, 1] : memref<128x256xf32> to memref<128x256xf32, strided<[256, 1], offset: ?>>
      scf.forall (%arg2, %arg3) in (2, 3) {
        %1 = affine.apply #map1(%arg2)
        %2 = affine.apply #map1(%arg3)
        %subview_0 = memref.subview %subview[%1, %2] [16, 32] [1, 1] : memref<128x256xf32, strided<[256, 1], offset: ?>> to memref<16x32xf32, strided<[256, 1], offset: ?>>
        vector.transfer_write %cst, %subview_0[%c0, %c0] {in_bounds = [true, true]} : vector<16x32xf32>, memref<16x32xf32, strided<[256, 1], offset: ?>>
      } {mapping = [#gpu.lane<linear_dim_0>, #gpu.lane<linear_dim_1>]}
    } {mapping = [#gpu.block<x>]}
    return %arg0 : memref<128x256xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.gpu.map_forall_to_blocks %0 generate_gpu_launch : (!transform.any_op) -> !transform.any_op
      %2 = transform.gpu.map_nested_forall_to_threads %1 block_dims = [73, 5, 1] : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0) -> (d0 * 128)>
#map1 = affine_map<(d0) -> (d0 * 32)>
module {
  func.func @simple_fill(%arg0: memref<128xf32>) -> memref<128xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant dense<0.000000e+00> : vector<32xf32>
    scf.forall (%arg1) in (1) {
      %0 = affine.apply #map(%arg1)
      %subview = memref.subview %arg0[%0] [128] [1] : memref<128xf32> to memref<128xf32, strided<[1], offset: ?>>
      scf.forall (%arg2, %arg3) in (2, 3) {
        %1 = affine.apply #map1(%arg2)
        %2 = affine.apply #map1(%arg3)
        %subview_0 = memref.subview %subview[%1] [%2] [1] : memref<128xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
        vector.transfer_write %cst, %subview_0[%c0] {in_bounds = [true]} : vector<32xf32>, memref<?xf32, strided<[1], offset: ?>>
      } {mapping = [#gpu.warp<linear_dim_0>, #gpu.warp<linear_dim_1>, #gpu.mask<753>]}
      memref.copy %subview, %subview : memref<128xf32, strided<[1], offset: ?>> to memref<128xf32, strided<[1], offset: ?>>
    } {mapping = [#gpu.block<x>]}
    return %arg0 : memref<128xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.gpu.map_forall_to_blocks %0 generate_gpu_launch : (!transform.any_op) -> !transform.any_op
      %2 = transform.gpu.map_nested_forall_to_threads %1 block_dims = [73, 5, 1] : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

