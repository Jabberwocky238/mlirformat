#map = affine_map<(d0) -> (d0)>
module {
  module {
    func.func @fuse_tilable_consumer_scf_for(%arg0: tensor<32xf32>, %arg1: tensor<32xf32>, %arg2: tensor<64xf32>) -> tensor<64xf32> {
      %c4 = arith.constant 4 : index
      %c64 = arith.constant 64 : index
      %c0 = arith.constant 0 : index
      %0:2 = scf.for %arg3 = %c0 to %c64 step %c4 iter_args(%arg4 = %arg2, %arg5 = %arg2) -> (tensor<64xf32>, tensor<64xf32>) {
        %extracted_slice = tensor.extract_slice %arg4[%arg3] [32] [1] : tensor<64xf32> to tensor<32xf32>
        %4 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<32xf32>, tensor<32xf32>) outs(%extracted_slice : tensor<32xf32>) {
        ^bb0(%in: f32, %in_0: f32, %out: f32):
          %5 = arith.mulf %in, %in_0 : f32
          %6 = arith.addf %out, %5 : f32
          linalg.yield %6 : f32
        } -> tensor<32xf32>
        %inserted_slice = tensor.insert_slice %4 into %arg4[%arg3] [32] [1] : tensor<32xf32> into tensor<64xf32>
        scf.yield %arg5, %inserted_slice : tensor<64xf32>, tensor<64xf32>
      }
      %1 = tensor.empty() : tensor<64xf32>
      %2 = tensor.empty() : tensor<64xf32>
      %3 = linalg.add ins(%0#1, %1 : tensor<64xf32>, tensor<64xf32>) outs(%2 : tensor<64xf32>) -> tensor<64xf32>
      return %3 : tensor<64xf32>
    }
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["scf.for"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["linalg.add"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fused_consumer, %result_loops = transform.test.fuse_consumer %1 into(%0) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  module {
    func.func @fuse_tilable_consumer_nested_scf_for(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index) -> tensor<?x?xf32> {
      %0 = scf.for %arg9 = %arg3 to %arg4 step %arg5 iter_args(%arg10 = %arg0) -> (tensor<?x?xf32>) {
        %2 = scf.for %arg11 = %arg6 to %arg7 step %arg8 iter_args(%arg12 = %arg10) -> (tensor<?x?xf32>) {
          %extracted_slice = tensor.extract_slice %arg12[%arg9, %arg11] [%arg5, %arg8] [1, 1] : tensor<?x?xf32> to tensor<?x?xf32>
          %inserted_slice = tensor.insert_slice %extracted_slice into %arg12[%arg9, %arg11] [%arg5, %arg8] [1, 1] : tensor<?x?xf32> into tensor<?x?xf32>
          scf.yield %inserted_slice : tensor<?x?xf32>
        }
        scf.yield %2 : tensor<?x?xf32>
      }
      %1 = linalg.add ins(%0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
      return %1 : tensor<?x?xf32>
    }
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["scf.for"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1:2 = transform.split_handle %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2 = transform.structured.match ops{["linalg.add"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fused_consumer, %result_loops:2 = transform.test.fuse_consumer %2 into(%1#0, %1#1) : (!transform.any_op, !transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  module {
    func.func @fuse_tilable_consumer_scf_forall(%arg0: tensor<32x32xf32>, %arg1: tensor<32x32xf32>, %arg2: tensor<64x64xf32>) -> tensor<64x64xf32> {
      %c4 = arith.constant 4 : index
      %c64 = arith.constant 64 : index
      %c0 = arith.constant 0 : index
      %0:2 = scf.forall (%arg3, %arg4) in (2, 2) shared_outs(%arg5 = %arg2, %arg6 = %arg2) -> (tensor<64x64xf32>, tensor<64x64xf32>) {
        %extracted_slice = tensor.extract_slice %arg5[%arg3, %arg4] [32, 32] [1, 1] : tensor<64x64xf32> to tensor<32x32xf32>
        %extracted_slice_0 = tensor.extract_slice %arg6[%arg3, %arg4] [32, 32] [1, 1] : tensor<64x64xf32> to tensor<32x32xf32>
        %4 = linalg.matmul ins(%arg0, %arg1 : tensor<32x32xf32>, tensor<32x32xf32>) outs(%extracted_slice : tensor<32x32xf32>) -> tensor<32x32xf32>
        scf.forall.in_parallel {
          tensor.parallel_insert_slice %4 into %arg6[%arg3, %arg4] [32, 32] [1, 1] : tensor<32x32xf32> into tensor<64x64xf32>
          tensor.parallel_insert_slice %extracted_slice_0 into %arg5[%arg3, %arg4] [32, 32] [1, 1] : tensor<32x32xf32> into tensor<64x64xf32>
        }
      }
      %1 = tensor.empty() : tensor<64x64xf32>
      %2 = tensor.empty() : tensor<64x64xf32>
      %3 = linalg.add ins(%0#1, %1 : tensor<64x64xf32>, tensor<64x64xf32>) outs(%2 : tensor<64x64xf32>) -> tensor<64x64xf32>
      return %3 : tensor<64x64xf32>
    }
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.add"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["scf.forall"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fused_consumer, %result_loops = transform.test.fuse_consumer %0 into(%1) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
module {
  module {
    func.func @fuse_tilable_consumer_scf_for_multi_yielding_consumer(%arg0: tensor<32xf32>, %arg1: tensor<32xf32>, %arg2: tensor<64xf32>) -> tensor<64xf32> {
      %c4 = arith.constant 4 : index
      %c64 = arith.constant 64 : index
      %c0 = arith.constant 0 : index
      %0:2 = scf.for %arg3 = %c0 to %c64 step %c4 iter_args(%arg4 = %arg2, %arg5 = %arg2) -> (tensor<64xf32>, tensor<64xf32>) {
        %extracted_slice = tensor.extract_slice %arg4[%arg3] [32] [1] : tensor<64xf32> to tensor<32xf32>
        %5 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<32xf32>, tensor<32xf32>) outs(%extracted_slice : tensor<32xf32>) {
        ^bb0(%in: f32, %in_0: f32, %out: f32):
          %6 = arith.mulf %in, %in_0 : f32
          %7 = arith.addf %out, %6 : f32
          linalg.yield %7 : f32
        } -> tensor<32xf32>
        %inserted_slice = tensor.insert_slice %5 into %arg4[%arg3] [32] [1] : tensor<32xf32> into tensor<64xf32>
        scf.yield %arg5, %inserted_slice : tensor<64xf32>, tensor<64xf32>
      }
      %1 = tensor.empty() : tensor<64xf32>
      %2 = tensor.empty() : tensor<64xf32>
      %3 = tensor.empty() : tensor<64xf32>
      %4:2 = linalg.generic {indexing_maps = [#map, #map, #map, #map], iterator_types = ["parallel"]} ins(%0#1, %1 : tensor<64xf32>, tensor<64xf32>) outs(%2, %3 : tensor<64xf32>, tensor<64xf32>) {
      ^bb0(%in: f32, %in_0: f32, %out: f32, %out_1: f32):
        %5 = arith.mulf %in, %in_0 : f32
        %6 = arith.subf %out, %5 : f32
        %7 = arith.addf %out_1, %in : f32
        linalg.yield %6, %7 : f32, f32
      } -> (tensor<64xf32>, tensor<64xf32>)
      return %4#1 : tensor<64xf32>
    }
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1:2 = transform.split_handle %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2 = transform.structured.match ops{["scf.for"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fused_consumer, %result_loops = transform.test.fuse_consumer %1#1 into(%2) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  module {
    func.func @fuse_tilable_consumer_scf_forall_multi_yielding_consumer(%arg0: tensor<32x32xf32>, %arg1: tensor<32x32xf32>, %arg2: tensor<64x64xf32>, %arg3: tensor<64x32xf32>) -> (tensor<64x64xf32>, tensor<2048xf32>) {
      %c4 = arith.constant 4 : index
      %c64 = arith.constant 64 : index
      %c0 = arith.constant 0 : index
      %0:2 = scf.forall (%arg4, %arg5) in (2, 2) shared_outs(%arg6 = %arg3, %arg7 = %arg2) -> (tensor<64x32xf32>, tensor<64x64xf32>) {
        %extracted_slice = tensor.extract_slice %arg6[%arg4, %arg5] [32, 32] [1, 1] : tensor<64x32xf32> to tensor<32x32xf32>
        %extracted_slice_0 = tensor.extract_slice %arg7[%arg4, %arg5] [32, 32] [1, 1] : tensor<64x64xf32> to tensor<32x32xf32>
        %6 = linalg.matmul ins(%arg0, %arg1 : tensor<32x32xf32>, tensor<32x32xf32>) outs(%extracted_slice : tensor<32x32xf32>) -> tensor<32x32xf32>
        scf.forall.in_parallel {
          tensor.parallel_insert_slice %6 into %arg7[%arg4, %arg5] [32, 32] [1, 1] : tensor<32x32xf32> into tensor<64x64xf32>
          tensor.parallel_insert_slice %extracted_slice_0 into %arg6[%arg4, %arg5] [32, 32] [1, 1] : tensor<32x32xf32> into tensor<64x32xf32>
        }
      }
      %1 = tensor.empty() : tensor<64x64xf32>
      %2 = tensor.empty() : tensor<64x64xf32>
      %3 = tensor.empty() : tensor<64x64xf32>
      %4:2 = linalg.generic {indexing_maps = [#map, #map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%0#1, %1 : tensor<64x64xf32>, tensor<64x64xf32>) outs(%2, %3 : tensor<64x64xf32>, tensor<64x64xf32>) {
      ^bb0(%in: f32, %in_0: f32, %out: f32, %out_1: f32):
        %6 = arith.mulf %in, %in_0 : f32
        %7 = arith.subf %out, %6 : f32
        %8 = arith.addf %out_1, %in : f32
        linalg.yield %7, %8 : f32, f32
      } -> (tensor<64x64xf32>, tensor<64x64xf32>)
      %5 = tensor.empty() : tensor<2048xf32>
      %unpack = linalg.unpack %0#0 outer_dims_perm = [0] inner_dims_pos = [0] inner_tiles = [32] into %5 : tensor<64x32xf32> -> tensor<2048xf32>
      return %4#1, %unpack : tensor<64x64xf32>, tensor<2048xf32>
    }
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["scf.forall"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fused_consumer, %result_loops = transform.test.fuse_consumer %0 into(%1) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  module {
    func.func @fuse_unpack_consumer_into_scf_forall(%arg0: tensor<32x32xf32>, %arg1: tensor<32x32xf32>, %arg2: tensor<64x32xf32>) -> tensor<2048xf32> {
      %c4 = arith.constant 4 : index
      %c64 = arith.constant 64 : index
      %c0 = arith.constant 0 : index
      %0 = scf.forall (%arg3, %arg4) = (0, 0) to (64, 32) step (32, 32) shared_outs(%arg5 = %arg2) -> (tensor<64x32xf32>) {
        %extracted_slice = tensor.extract_slice %arg5[%arg3, %arg4] [32, 32] [1, 1] : tensor<64x32xf32> to tensor<32x32xf32>
        %2 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<32x32xf32>, tensor<32x32xf32>) outs(%extracted_slice : tensor<32x32xf32>) {
        ^bb0(%in: f32, %in_0: f32, %out: f32):
          %3 = arith.mulf %in, %in_0 : f32
          %4 = arith.addf %out, %3 : f32
          linalg.yield %4 : f32
        } -> tensor<32x32xf32>
        scf.forall.in_parallel {
          tensor.parallel_insert_slice %2 into %arg5[%arg3, %arg4] [32, 32] [1, 1] : tensor<32x32xf32> into tensor<64x32xf32>
        }
      }
      %1 = tensor.empty() : tensor<2048xf32>
      %unpack = linalg.unpack %0 outer_dims_perm = [0] inner_dims_pos = [0] inner_tiles = [32] into %1 : tensor<64x32xf32> -> tensor<2048xf32>
      return %unpack : tensor<2048xf32>
    }
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.unpack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["scf.forall"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fused_consumer, %result_loops = transform.test.fuse_consumer %0 into(%1) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  module {
    func.func @fuse_unaligned_unpack_consumer_into_scf_forall(%arg0: tensor<32x32xf32>, %arg1: tensor<32x32xf32>, %arg2: tensor<64x32xf32>) -> tensor<2047xf32> {
      %c4 = arith.constant 4 : index
      %c64 = arith.constant 64 : index
      %c0 = arith.constant 0 : index
      %0 = scf.forall (%arg3, %arg4) = (0, 0) to (64, 32) step (32, 32) shared_outs(%arg5 = %arg2) -> (tensor<64x32xf32>) {
        %extracted_slice = tensor.extract_slice %arg5[%arg3, %arg4] [32, 32] [1, 1] : tensor<64x32xf32> to tensor<32x32xf32>
        %2 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<32x32xf32>, tensor<32x32xf32>) outs(%extracted_slice : tensor<32x32xf32>) {
        ^bb0(%in: f32, %in_0: f32, %out: f32):
          %3 = arith.mulf %in, %in_0 : f32
          %4 = arith.addf %out, %3 : f32
          linalg.yield %4 : f32
        } -> tensor<32x32xf32>
        scf.forall.in_parallel {
          tensor.parallel_insert_slice %2 into %arg5[%arg3, %arg4] [32, 32] [1, 1] : tensor<32x32xf32> into tensor<64x32xf32>
        }
      }
      %1 = tensor.empty() : tensor<2047xf32>
      %unpack = linalg.unpack %0 outer_dims_perm = [0] inner_dims_pos = [0] inner_tiles = [32] into %1 : tensor<64x32xf32> -> tensor<2047xf32>
      return %unpack : tensor<2047xf32>
    }
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.unpack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["scf.forall"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fused_consumer, %result_loops = transform.test.fuse_consumer %0 into(%1) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  module {
    func.func @fuse_perfect_tiling_pack_consumer(%arg0: tensor<32x32xf32>, %arg1: tensor<32x32xf32>, %arg2: tensor<64x32xf32>) -> tensor<4x32x16xf32> {
      %c4 = arith.constant 4 : index
      %c64 = arith.constant 64 : index
      %c0 = arith.constant 0 : index
      %0 = scf.forall (%arg3, %arg4) in (2, 1) shared_outs(%arg5 = %arg2) -> (tensor<64x32xf32>) {
        %extracted_slice = tensor.extract_slice %arg5[%arg3, %arg4] [32, 32] [1, 1] : tensor<64x32xf32> to tensor<32x32xf32>
        %2 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<32x32xf32>, tensor<32x32xf32>) outs(%extracted_slice : tensor<32x32xf32>) {
        ^bb0(%in: f32, %in_0: f32, %out: f32):
          %3 = arith.mulf %in, %in_0 : f32
          %4 = arith.addf %out, %3 : f32
          linalg.yield %4 : f32
        } -> tensor<32x32xf32>
        scf.forall.in_parallel {
          tensor.parallel_insert_slice %2 into %arg5[%arg3, %arg4] [32, 32] [1, 1] : tensor<32x32xf32> into tensor<64x32xf32>
        }
      }
      %1 = tensor.empty() : tensor<4x32x16xf32>
      %pack = linalg.pack %0 inner_dims_pos = [0] inner_tiles = [16] into %1 : tensor<64x32xf32> -> tensor<4x32x16xf32>
      return %pack : tensor<4x32x16xf32>
    }
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["scf.forall"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fused_consumer, %result_loops = transform.test.fuse_consumer %0 into(%1) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0) -> (-d0 + 4, 16)>
module {
  func.func @fuse_pack_consumer_if_single_iteration(%arg0: tensor<4x4xf32>) -> tensor<1x4x16x1xf32> {
    %0 = tensor.empty() : tensor<1x4x16x1xf32>
    %1 = tensor.empty() : tensor<4x4xf32>
    %2 = scf.forall (%arg1) = (0) to (4) step (16) shared_outs(%arg2 = %1) -> (tensor<4x4xf32>) {
      %3 = affine.min #map(%arg1)
      %extracted_slice = tensor.extract_slice %arg0[%arg1, 0] [%3, 4] [1, 1] : tensor<4x4xf32> to tensor<?x4xf32>
      %extracted_slice_0 = tensor.extract_slice %arg2[%arg1, 0] [%3, 4] [1, 1] : tensor<4x4xf32> to tensor<?x4xf32>
      %4 = linalg.exp ins(%extracted_slice : tensor<?x4xf32>) outs(%extracted_slice_0 : tensor<?x4xf32>) -> tensor<?x4xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %4 into %arg2[%arg1, 0] [%3, 4] [1, 1] : tensor<?x4xf32> into tensor<4x4xf32>
      }
    }
    %cst = arith.constant 0.000000e+00 : f32
    %pack = linalg.pack %2 padding_value(%cst : f32) outer_dims_perm = [0, 1] inner_dims_pos = [0, 1] inner_tiles = [16, 1] into %0 : tensor<4x4xf32> -> tensor<1x4x16x1xf32>
    return %pack : tensor<1x4x16x1xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["scf.forall"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fused_consumer, %result_loops = transform.test.fuse_consumer %0 into(%1) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @fuse_perfect_tiling_pack_consumer_with_outer_dims_perm(%arg0: tensor<64x32xf32>, %arg1: tensor<64x32xf32>, %arg2: tensor<2x64x16x1xf32>) -> tensor<2x64x16x1xf32> {
    %0 = scf.forall (%arg3) = (0) to (32) step (16) shared_outs(%arg4 = %arg1) -> (tensor<64x32xf32>) {
      %extracted_slice = tensor.extract_slice %arg0[0, %arg3] [64, 16] [1, 1] : tensor<64x32xf32> to tensor<64x16xf32>
      %extracted_slice_0 = tensor.extract_slice %arg4[0, %arg3] [64, 16] [1, 1] : tensor<64x32xf32> to tensor<64x16xf32>
      %1 = linalg.exp ins(%extracted_slice : tensor<64x16xf32>) outs(%extracted_slice_0 : tensor<64x16xf32>) -> tensor<64x16xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %1 into %arg4[0, %arg3] [64, 16] [1, 1] : tensor<64x16xf32> into tensor<64x32xf32>
      }
    }
    %pack = linalg.pack %0 outer_dims_perm = [1, 0] inner_dims_pos = [1, 0] inner_tiles = [16, 1] into %arg2 : tensor<64x32xf32> -> tensor<2x64x16x1xf32>
    return %pack : tensor<2x64x16x1xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["scf.forall"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fused_consumer, %result_loops = transform.test.fuse_consumer %0 into(%1) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @fuse_pack_consumer_with_no_pad_dynamic_dim(%arg0: tensor<64x?xf32>, %arg1: tensor<64x?xf32>, %arg2: tensor<64x?x16xf32>) -> tensor<64x?x16xf32> {
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c1 : tensor<64x?xf32>
    %0 = scf.forall (%arg3) = (0) to (%dim) step (16) shared_outs(%arg4 = %arg1) -> (tensor<64x?xf32>) {
      %extracted_slice = tensor.extract_slice %arg0[0, %arg3] [64, 16] [1, 1] : tensor<64x?xf32> to tensor<64x16xf32>
      %extracted_slice_0 = tensor.extract_slice %arg4[0, %arg3] [64, 16] [1, 1] : tensor<64x?xf32> to tensor<64x16xf32>
      %1 = linalg.exp ins(%extracted_slice : tensor<64x16xf32>) outs(%extracted_slice_0 : tensor<64x16xf32>) -> tensor<64x16xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %1 into %arg4[0, %arg3] [64, 16] [1, 1] : tensor<64x16xf32> into tensor<64x?xf32>
      }
    }
    %pack = linalg.pack %0 inner_dims_pos = [1] inner_tiles = [16] into %arg2 : tensor<64x?xf32> -> tensor<64x?x16xf32>
    return %pack : tensor<64x?x16xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["scf.forall"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fused_consumer, %result_loops = transform.test.fuse_consumer %0 into(%1) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0) -> (-d0 + 64, 15)>
module {
  func.func @fuse_pack_consumer_with_padding_semantics(%arg0: tensor<64x32xf32>, %arg1: tensor<64x32xf32>) -> tensor<22x2x3x16xf32> {
    %0 = scf.forall (%arg2, %arg3) = (0, 0) to (64, 32) step (15, 16) shared_outs(%arg4 = %arg1) -> (tensor<64x32xf32>) {
      %2 = affine.min #map(%arg2)
      %extracted_slice = tensor.extract_slice %arg0[%arg2, %arg3] [%2, 16] [1, 1] : tensor<64x32xf32> to tensor<?x16xf32>
      %extracted_slice_0 = tensor.extract_slice %arg4[%arg2, %arg3] [%2, 16] [1, 1] : tensor<64x32xf32> to tensor<?x16xf32>
      %3 = linalg.exp ins(%extracted_slice : tensor<?x16xf32>) outs(%extracted_slice_0 : tensor<?x16xf32>) -> tensor<?x16xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %3 into %arg4[%arg2, %arg3] [%2, 16] [1, 1] : tensor<?x16xf32> into tensor<64x32xf32>
      }
    }
    %1 = tensor.empty() : tensor<22x2x3x16xf32>
    %cst = arith.constant 0.000000e+00 : f32
    %pack = linalg.pack %0 padding_value(%cst : f32) inner_dims_pos = [0, 1] inner_tiles = [3, 16] into %1 : tensor<64x32xf32> -> tensor<22x2x3x16xf32>
    return %pack : tensor<22x2x3x16xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["scf.forall"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fused_consumer, %result_loops = transform.test.fuse_consumer %0 into(%1) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  module {
    func.func @fuse_add_multiple_tilable_consumers(%arg0: tensor<256x256xf32>, %arg1: tensor<256x256xf32>, %arg2: tensor<256x256xf32>) -> (tensor<256x256xf32>, tensor<256x256xf32>) {
      %c0 = arith.constant 0 : index
      %c64 = arith.constant 64 : index
      %c256 = arith.constant 256 : index
      %cst = arith.constant 0.000000e+00 : f32
      %0 = tensor.empty() : tensor<256x256xf32>
      %1 = scf.for %arg3 = %c0 to %c256 step %c64 iter_args(%arg4 = %0) -> (tensor<256x256xf32>) {
        %extracted_slice = tensor.extract_slice %arg4[%arg3, 0] [64, 256] [1, 1] : tensor<256x256xf32> to tensor<64x256xf32>
        %extracted_slice_0 = tensor.extract_slice %arg0[%arg3, 0] [64, 256] [1, 1] : tensor<256x256xf32> to tensor<64x256xf32>
        %extracted_slice_1 = tensor.extract_slice %arg1[%arg3, 0] [64, 256] [1, 1] : tensor<256x256xf32> to tensor<64x256xf32>
        %4 = linalg.add ins(%extracted_slice_0, %extracted_slice_1 : tensor<64x256xf32>, tensor<64x256xf32>) outs(%extracted_slice : tensor<64x256xf32>) -> tensor<64x256xf32>
        %inserted_slice = tensor.insert_slice %4 into %arg4[%arg3, 0] [64, 256] [1, 1] : tensor<64x256xf32> into tensor<256x256xf32>
        scf.yield %inserted_slice : tensor<256x256xf32>
      }
      %2 = linalg.mul ins(%1, %arg2 : tensor<256x256xf32>, tensor<256x256xf32>) outs(%0 : tensor<256x256xf32>) -> tensor<256x256xf32>
      %3 = linalg.exp ins(%1 : tensor<256x256xf32>) outs(%0 : tensor<256x256xf32>) -> tensor<256x256xf32>
      return %2, %3 : tensor<256x256xf32>, tensor<256x256xf32>
    }
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.mul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["scf.for"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fused_consumer, %result_loops = transform.test.fuse_consumer %0 into(%1) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2 = transform.structured.match ops{["linalg.exp"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fused_consumer_0, %result_loops_1 = transform.test.fuse_consumer %2 into(%result_loops) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
module {
  module {
    func.func @fuse_with_tilable_consumer_with_projected_permutations(%arg0: tensor<256x256xf32>, %arg1: tensor<256x256xf32>, %arg2: tensor<24xf32>) -> tensor<256x256x24xf32> {
      %c0 = arith.constant 0 : index
      %c64 = arith.constant 64 : index
      %c256 = arith.constant 256 : index
      %0 = tensor.empty() : tensor<256x256xf32>
      %1 = scf.for %arg3 = %c0 to %c256 step %c64 iter_args(%arg4 = %0) -> (tensor<256x256xf32>) {
        %extracted_slice = tensor.extract_slice %arg4[%arg3, 0] [64, 256] [1, 1] : tensor<256x256xf32> to tensor<64x256xf32>
        %extracted_slice_0 = tensor.extract_slice %arg0[%arg3, 0] [64, 256] [1, 1] : tensor<256x256xf32> to tensor<64x256xf32>
        %extracted_slice_1 = tensor.extract_slice %arg1[%arg3, 0] [64, 256] [1, 1] : tensor<256x256xf32> to tensor<64x256xf32>
        %4 = linalg.add ins(%extracted_slice_0, %extracted_slice_1 : tensor<64x256xf32>, tensor<64x256xf32>) outs(%extracted_slice : tensor<64x256xf32>) -> tensor<64x256xf32>
        %inserted_slice = tensor.insert_slice %4 into %arg4[%arg3, 0] [64, 256] [1, 1] : tensor<64x256xf32> into tensor<256x256xf32>
        scf.yield %inserted_slice : tensor<256x256xf32>
      }
      %2 = tensor.empty() : tensor<256x256x24xf32>
      %3 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "parallel"]} ins(%1, %arg2 : tensor<256x256xf32>, tensor<24xf32>) outs(%2 : tensor<256x256x24xf32>) {
      ^bb0(%in: f32, %in_0: f32, %out: f32):
        %4 = arith.addf %in, %in_0 : f32
        linalg.yield %4 : f32
      } -> tensor<256x256x24xf32>
      return %3 : tensor<256x256x24xf32>
    }
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["scf.for"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fused_consumer, %result_loops = transform.test.fuse_consumer %0 into(%1) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0)[s0, s1] -> (s1, -d0 + s0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<(d0, d1) -> (d0)>
#map3 = affine_map<(d0) -> (d0)>
module {
  func.func @multi_slice_fusion1(%arg0: tensor<?x?xf32>, %arg1: tensor<?xf32>, %arg2: tensor<?xf32>, %arg3: index) -> tensor<?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?xf32>
    %0:2 = scf.forall (%arg4) = (%c0) to (%dim) step (%arg3) shared_outs(%arg5 = %arg1, %arg6 = %arg2) -> (tensor<?xf32>, tensor<?xf32>) {
      %3 = affine.min #map(%arg4)[%dim, %arg3]
      %extracted_slice = tensor.extract_slice %arg0[%arg4, 0] [%3, %dim_0] [1, 1] : tensor<?x?xf32> to tensor<?x?xf32>
      %extracted_slice_1 = tensor.extract_slice %arg5[%arg4] [%3] [1] : tensor<?xf32> to tensor<?xf32>
      %extracted_slice_2 = tensor.extract_slice %arg6[%arg4] [%3] [1] : tensor<?xf32> to tensor<?xf32>
      %4:2 = linalg.generic {indexing_maps = [#map1, #map2, #map2], iterator_types = ["parallel", "reduction"]} ins(%extracted_slice : tensor<?x?xf32>) outs(%extracted_slice_1, %extracted_slice_2 : tensor<?xf32>, tensor<?xf32>) {
      ^bb0(%in: f32, %out: f32, %out_3: f32):
        %5 = arith.mulf %in, %out : f32
        %6 = arith.addf %in, %out_3 : f32
        linalg.yield %5, %6 : f32, f32
      } -> (tensor<?xf32>, tensor<?xf32>)
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %4#0 into %arg5[%arg4] [%3] [1] : tensor<?xf32> into tensor<?xf32>
        tensor.parallel_insert_slice %4#1 into %arg6[%arg4] [%3] [1] : tensor<?xf32> into tensor<?xf32>
      }
    }
    %1 = tensor.empty(%dim) : tensor<?xf32>
    %2 = linalg.generic {indexing_maps = [#map3, #map3, #map3], iterator_types = ["parallel"]} ins(%0#0, %0#1 : tensor<?xf32>, tensor<?xf32>) outs(%1 : tensor<?xf32>) {
    ^bb0(%in: f32, %in_1: f32, %out: f32):
      %3 = arith.addf %in, %in_1 : f32
      linalg.yield %3 : f32
    } -> tensor<?xf32>
    return %2 : tensor<?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["scf.forall"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %2:2 = transform.split_handle %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %fused_consumer, %result_loops = transform.test.fuse_consumer %2#1 into(%1) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0)[s0, s1] -> (s1, -d0 + s0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<(d0, d1) -> (d0)>
#map3 = affine_map<(d0) -> (d0)>
module {
  func.func @multi_slice_fusion2(%arg0: tensor<?x?xf32>, %arg1: tensor<?xf32>, %arg2: tensor<?xf32>, %arg3: index) -> tensor<?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?xf32>
    %0:2 = scf.forall (%arg4) = (%c0) to (%dim) step (%arg3) shared_outs(%arg5 = %arg1, %arg6 = %arg2) -> (tensor<?xf32>, tensor<?xf32>) {
      %3 = affine.min #map(%arg4)[%dim, %arg3]
      %extracted_slice = tensor.extract_slice %arg0[%arg4, 0] [%3, %dim_0] [1, 1] : tensor<?x?xf32> to tensor<?x?xf32>
      %extracted_slice_1 = tensor.extract_slice %arg5[%arg4] [%3] [1] : tensor<?xf32> to tensor<?xf32>
      %4 = linalg.generic {indexing_maps = [#map1, #map2], iterator_types = ["parallel", "reduction"]} ins(%extracted_slice : tensor<?x?xf32>) outs(%extracted_slice_1 : tensor<?xf32>) {
      ^bb0(%in: f32, %out: f32):
        %6 = arith.mulf %in, %out : f32
        linalg.yield %6 : f32
      } -> tensor<?xf32>
      %extracted_slice_2 = tensor.extract_slice %arg6[%arg4] [%3] [1] : tensor<?xf32> to tensor<?xf32>
      %5 = linalg.generic {indexing_maps = [#map1, #map2], iterator_types = ["parallel", "reduction"]} ins(%extracted_slice : tensor<?x?xf32>) outs(%extracted_slice_2 : tensor<?xf32>) {
      ^bb0(%in: f32, %out: f32):
        %6 = arith.addf %in, %out : f32
        linalg.yield %6 : f32
      } -> tensor<?xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %4 into %arg5[%arg4] [%3] [1] : tensor<?xf32> into tensor<?xf32>
        tensor.parallel_insert_slice %5 into %arg6[%arg4] [%3] [1] : tensor<?xf32> into tensor<?xf32>
      }
    }
    %1 = tensor.empty(%dim) : tensor<?xf32>
    %2 = linalg.generic {indexing_maps = [#map3, #map3, #map3], iterator_types = ["parallel"]} ins(%0#0, %0#1 : tensor<?xf32>, tensor<?xf32>) outs(%1 : tensor<?xf32>) {
    ^bb0(%in: f32, %in_1: f32, %out: f32):
      %3 = arith.addf %in, %in_1 : f32
      linalg.yield %3 : f32
    } -> tensor<?xf32>
    return %2 : tensor<?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["scf.forall"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %2:3 = transform.split_handle %1 : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %fused_consumer, %result_loops = transform.test.fuse_consumer %2#2 into(%0) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0)[s0, s1] -> (s1, -d0 + s0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map3 = affine_map<(d0, d1) -> (d0, d1)>
#map4 = affine_map<(d0, d1) -> (d0)>
module {
  func.func @multi_slice_fusion_with_broadcast(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?xf32>, %arg3: index, %arg4: index) -> tensor<?x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?x?xf32>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?x?xf32>
    %dim_1 = tensor.dim %arg0, %c2 : tensor<?x?x?xf32>
    %0:2 = scf.forall (%arg5, %arg6) = (%c0, %c0) to (%dim, %dim_0) step (%arg3, %arg4) shared_outs(%arg7 = %arg1, %arg8 = %arg2) -> (tensor<?x?xf32>, tensor<?xf32>) {
      %3 = affine.min #map(%arg5)[%dim, %arg3]
      %4 = affine.min #map(%arg6)[%dim_0, %arg4]
      %extracted_slice = tensor.extract_slice %arg0[%arg5, %arg6, 0] [%3, %4, %dim_1] [1, 1, 1] : tensor<?x?x?xf32> to tensor<?x?x?xf32>
      %extracted_slice_2 = tensor.extract_slice %arg7[%arg5, %arg6] [%3, %4] [1, 1] : tensor<?x?xf32> to tensor<?x?xf32>
      %5 = linalg.generic {indexing_maps = [#map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%extracted_slice : tensor<?x?x?xf32>) outs(%extracted_slice_2 : tensor<?x?xf32>) {
      ^bb0(%in: f32, %out: f32):
        %7 = arith.mulf %in, %out : f32
        linalg.yield %7 : f32
      } -> tensor<?x?xf32>
      %extracted_slice_3 = tensor.extract_slice %arg8[%arg5] [%3] [1] : tensor<?xf32> to tensor<?xf32>
      %6 = linalg.generic {indexing_maps = [#map3, #map4], iterator_types = ["parallel", "reduction"]} ins(%5 : tensor<?x?xf32>) outs(%extracted_slice_3 : tensor<?xf32>) {
      ^bb0(%in: f32, %out: f32):
        %7 = arith.addf %in, %out : f32
        linalg.yield %7 : f32
      } -> tensor<?xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %5 into %arg7[%arg5, %arg6] [%3, %4] [1, 1] : tensor<?x?xf32> into tensor<?x?xf32>
        tensor.parallel_insert_slice %6 into %arg8[%arg5] [%3] [1] : tensor<?xf32> into tensor<?xf32>
      }
    }
    %1 = tensor.empty(%dim, %dim_0) : tensor<?x?xf32>
    %2 = linalg.generic {indexing_maps = [#map3, #map4, #map3], iterator_types = ["parallel", "parallel"]} ins(%0#0, %0#1 : tensor<?x?xf32>, tensor<?xf32>) outs(%1 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_2: f32, %out: f32):
      %3 = arith.addf %in, %in_2 : f32
      linalg.yield %3 : f32
    } -> tensor<?x?xf32>
    return %2 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["scf.forall"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %2:3 = transform.split_handle %1 : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %fused_consumer, %result_loops = transform.test.fuse_consumer %2#2 into(%0) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

