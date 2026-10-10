#map = affine_map<()[s0, s1] -> (s0 ceildiv s1)>
#map1 = affine_map<(d0)[s0] -> (d0 * s0)>
#map2 = affine_map<(d0)[s0, s1] -> (-(d0 * s1) + s0, s1)>
module {
  func.func @fuse_tileable_op(%arg0: index, %arg1: tensor<?xf32>, %arg2: tensor<?xf32>) -> tensor<?xf32> {
    %cst = arith.constant 4.200000e+01 : f32
    %c0 = arith.constant 0 : index
    %0 = linalg.fill ins(%cst : f32) outs(%arg1 : tensor<?xf32>) -> tensor<?xf32>
    %dim = tensor.dim %arg1, %c0 : tensor<?xf32>
    %1 = affine.apply #map()[%dim, %arg0]
    %2 = scf.forall (%arg3) in (%1) shared_outs(%arg4 = %arg2) -> (tensor<?xf32>) {
      %3 = affine.apply #map1(%arg3)[%arg0]
      %4 = affine.min #map2(%arg3)[%dim, %arg0]
      %extracted_slice = tensor.extract_slice %arg4[%3] [%4] [1] : tensor<?xf32> to tensor<?xf32>
      %extracted_slice_0 = tensor.extract_slice %0[%3] [%4] [1] : tensor<?xf32> to tensor<?xf32>
      %5 = linalg.elementwise kind=#linalg.elementwise_kind<exp> ins(%extracted_slice_0 : tensor<?xf32>) outs(%extracted_slice : tensor<?xf32>) -> tensor<?xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %5 into %arg4[%3] [%4] [1] : tensor<?xf32> into tensor<?xf32>
      }
    }
    return %2 : tensor<?xf32>
  }
  func.func @dummy1() {
    return
  }
  func.func @dummy2() {
    return
  }
  func.func @dummy3() {
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.fill"]} in %arg0 : (!transform.any_op) -> !transform.op<"linalg.fill">
      %1 = transform.structured.match ops{["scf.forall"]} in %arg0 : (!transform.any_op) -> !transform.op<"scf.forall">
      %fused_op, %new_containing_op = transform.structured.fuse_into_containing_op %0 into %1 : (!transform.op<"linalg.fill">, !transform.op<"scf.forall">) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<()[s0] -> (64 ceildiv s0)>
#map1 = affine_map<(d0)[s0] -> (d0 * s0)>
#map2 = affine_map<(d0)[s0] -> (-(d0 * s0) + 64, s0)>
module {
  func.func @fuse_untileable_op(%arg0: index, %arg1: tensor<64xf32>, %arg2: tensor<64xf32>) -> tensor<64xf32> {
    %0 = tensor.empty(%arg0) : tensor<?xf32>
    %1 = affine.apply #map()[%arg0]
    %2 = scf.forall (%arg3) in (%1) shared_outs(%arg4 = %arg2) -> (tensor<64xf32>) {
      %3 = affine.apply #map1(%arg3)[%arg0]
      %4 = affine.min #map2(%arg3)[%arg0]
      %extracted_slice = tensor.extract_slice %arg4[%3] [%4] [1] : tensor<64xf32> to tensor<?xf32>
      %5 = linalg.exp ins(%0 : tensor<?xf32>) outs(%extracted_slice : tensor<?xf32>) -> tensor<?xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %5 into %arg4[%3] [%4] [1] : tensor<?xf32> into tensor<64xf32>
      }
    }
    return %2 : tensor<64xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.empty"]} in %arg0 : (!transform.any_op) -> !transform.op<"tensor.empty">
      %1 = transform.structured.match ops{["scf.forall"]} in %arg0 : (!transform.any_op) -> !transform.op<"scf.forall">
      %fused_op, %new_containing_op = transform.structured.fuse_into_containing_op %0 into %1 : (!transform.op<"tensor.empty">, !transform.op<"scf.forall">) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @foo(%arg0: tensor<f32>) -> tensor<f32> {
    return %arg0 : tensor<f32>
  }
  func.func @fuse_tileable_op_rank_reducing(%arg0: index, %arg1: tensor<?xf32>, %arg2: tensor<?xf32>) -> tensor<?xf32> {
    %cst = arith.constant 4.200000e+01 : f32
    %c0 = arith.constant 0 : index
    %0 = linalg.fill ins(%cst : f32) outs(%arg2 : tensor<?xf32>) -> tensor<?xf32>
    %dim = tensor.dim %arg1, %c0 : tensor<?xf32>
    %1 = scf.forall (%arg3) in (%dim) shared_outs(%arg4 = %0) -> (tensor<?xf32>) {
      %extracted_slice = tensor.extract_slice %arg4[%arg3] [1] [1] : tensor<?xf32> to tensor<f32>
      %2 = func.call @foo(%extracted_slice) : (tensor<f32>) -> tensor<f32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %2 into %arg4[%arg3] [1] [1] : tensor<f32> into tensor<?xf32>
      }
    }
    return %1 : tensor<?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.fill"]} in %arg0 : (!transform.any_op) -> !transform.op<"linalg.fill">
      %1 = transform.structured.match ops{["scf.forall"]} in %arg0 : (!transform.any_op) -> !transform.op<"scf.forall">
      %fused_op, %new_containing_op = transform.structured.fuse_into_containing_op %0 into %1 : (!transform.op<"linalg.fill">, !transform.op<"scf.forall">) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<()[s0, s1] -> (s0 ceildiv s1)>
#map1 = affine_map<(d0)[s0] -> (d0 * s0)>
#map2 = affine_map<(d0)[s0, s1] -> (-(d0 * s1) + s0, s1)>
module {
  func.func @fuse_tileable_op_through_bbarg(%arg0: index, %arg1: tensor<?xf32>, %arg2: tensor<?xf32>) -> tensor<?xf32> {
    %cst = arith.constant 4.200000e+01 : f32
    %c0 = arith.constant 0 : index
    %0 = linalg.fill ins(%cst : f32) outs(%arg2 : tensor<?xf32>) -> tensor<?xf32>
    %dim = tensor.dim %arg1, %c0 : tensor<?xf32>
    %1 = affine.apply #map()[%dim, %arg0]
    %2 = scf.forall (%arg3) in (%1) shared_outs(%arg4 = %0) -> (tensor<?xf32>) {
      %3 = affine.apply #map1(%arg3)[%arg0]
      %4 = affine.min #map2(%arg3)[%dim, %arg0]
      %extracted_slice = tensor.extract_slice %arg4[%3] [%4] [1] : tensor<?xf32> to tensor<?xf32>
      %extracted_slice_0 = tensor.extract_slice %arg1[%3] [%4] [1] : tensor<?xf32> to tensor<?xf32>
      %5 = linalg.exp ins(%extracted_slice_0 : tensor<?xf32>) outs(%extracted_slice : tensor<?xf32>) -> tensor<?xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %5 into %arg4[%3] [%4] [1] : tensor<?xf32> into tensor<?xf32>
      }
    }
    return %2 : tensor<?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.fill"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["scf.forall"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fused_op, %new_containing_op = transform.structured.fuse_into_containing_op %0 into %1 : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<()[s0, s1] -> (s0 ceildiv s1)>
#map1 = affine_map<(d0)[s0] -> (d0 * s0)>
#map2 = affine_map<(d0)[s0, s1] -> (-(d0 * s1) + s0, s1)>
module {
  func.func @fuse_tileable_op_through_bbarg_inout(%arg0: index, %arg1: tensor<?xf32>) -> tensor<?xf32> {
    %cst = arith.constant 4.200000e+01 : f32
    %c0 = arith.constant 0 : index
    %0 = linalg.fill ins(%cst : f32) outs(%arg1 : tensor<?xf32>) -> tensor<?xf32>
    %dim = tensor.dim %arg1, %c0 : tensor<?xf32>
    %1 = affine.apply #map()[%dim, %arg0]
    %2 = scf.forall (%arg2) in (%1) shared_outs(%arg3 = %arg1) -> (tensor<?xf32>) {
      %3 = affine.apply #map1(%arg2)[%arg0]
      %4 = affine.min #map2(%arg2)[%dim, %arg0]
      %extracted_slice = tensor.extract_slice %arg3[%3] [%4] [1] : tensor<?xf32> to tensor<?xf32>
      %extracted_slice_0 = tensor.extract_slice %0[%3] [%4] [1] : tensor<?xf32> to tensor<?xf32>
      %5 = linalg.exp ins(%extracted_slice_0 : tensor<?xf32>) outs(%extracted_slice : tensor<?xf32>) -> tensor<?xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %5 into %arg3[%3] [%4] [1] : tensor<?xf32> into tensor<?xf32>
      }
    }
    return %2 : tensor<?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.fill"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["scf.forall"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fused_op, %new_containing_op = transform.structured.fuse_into_containing_op %0 into %1 : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0) -> (d0 * 2)>
#map1 = affine_map<(d0) -> (d0 * 4)>
module {
  func.func @fuse_tileable_op_no_dps(%arg0: tensor<4x4x4xf32>, %arg1: tensor<4x4x4xf32>) -> tensor<4x4x4xf32> {
    %0 = "test.tiling_no_dps_op"(%arg0, %arg1) : (tensor<4x4x4xf32>, tensor<4x4x4xf32>) -> tensor<4x4x4xf32>
    %1 = tensor.empty() : tensor<4x4x4xf32>
    %2 = scf.forall (%arg2, %arg3, %arg4) in (4, 2, 1) shared_outs(%arg5 = %1) -> (tensor<4x4x4xf32>) {
      %3 = affine.apply #map(%arg3)
      %4 = affine.apply #map1(%arg4)
      %extracted_slice = tensor.extract_slice %0[%arg2, %3, %4] [1, 2, 4] [1, 1, 1] : tensor<4x4x4xf32> to tensor<1x2x4xf32>
      %5 = "test.unregistered_op"(%extracted_slice, %extracted_slice) : (tensor<1x2x4xf32>, tensor<1x2x4xf32>) -> tensor<1x2x4xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %5 into %arg5[%arg2, %3, %4] [1, 2, 4] [1, 1, 1] : tensor<1x2x4xf32> into tensor<4x4x4xf32>
      }
    }
    return %2 : tensor<4x4x4xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["test.tiling_no_dps_op"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["scf.forall"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fused_op, %new_containing_op = transform.structured.fuse_into_containing_op %0 into %1 : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @fuse_tileable_op_through_bbarg_inout_nested(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?x?x?xf32>) -> tensor<?x?x?xf32> {
    %c2 = arith.constant 2 : index
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %0 = linalg.elementwise kind=#linalg.elementwise_kind<abs> ins(%arg0 : tensor<?x?x?xf32>) outs(%arg1 : tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    %dim = tensor.dim %arg1, %c0 : tensor<?x?x?xf32>
    %dim_0 = tensor.dim %arg1, %c1 : tensor<?x?x?xf32>
    %dim_1 = tensor.dim %arg1, %c2 : tensor<?x?x?xf32>
    %1 = scf.for %arg2 = %c0 to %dim step %c1 iter_args(%arg3 = %arg1) -> (tensor<?x?x?xf32>) {
      %2 = scf.for %arg4 = %c0 to %dim_0 step %c1 iter_args(%arg5 = %arg3) -> (tensor<?x?x?xf32>) {
        %3 = scf.for %arg6 = %c0 to %dim_1 step %c1 iter_args(%arg7 = %arg5) -> (tensor<?x?x?xf32>) {
          %extracted_slice = tensor.extract_slice %0[%arg2, %arg4, %arg6] [1, 1, 1] [1, 1, 1] : tensor<?x?x?xf32> to tensor<1x1x1xf32>
          %extracted_slice_2 = tensor.extract_slice %arg7[%arg2, %arg4, %arg6] [1, 1, 1] [1, 1, 1] : tensor<?x?x?xf32> to tensor<1x1x1xf32>
          %4 = linalg.elementwise kind=#linalg.elementwise_kind<exp> ins(%extracted_slice : tensor<1x1x1xf32>) outs(%extracted_slice_2 : tensor<1x1x1xf32>) -> tensor<1x1x1xf32>
          %inserted_slice = tensor.insert_slice %4 into %arg7[%arg2, %arg4, %arg6] [1, 1, 1] [1, 1, 1] : tensor<1x1x1xf32> into tensor<?x?x?xf32>
          scf.yield %inserted_slice : tensor<?x?x?xf32>
        }
        scf.yield %3 : tensor<?x?x?xf32>
      }
      scf.yield %2 : tensor<?x?x?xf32>
    }
    return %1 : tensor<?x?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.elementwise"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["scf.for"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %2:2 = transform.split_handle %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %3:3 = transform.split_handle %1 : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %fused_op, %new_containing_op = transform.structured.fuse_into_containing_op %2#0 into %3#2 : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<()[s0, s1] -> (s0 ceildiv s1)>
#map2 = affine_map<(d0)[s0] -> (d0 * s0)>
#map3 = affine_map<(d0)[s0, s1] -> (-(d0 * s1) + s0, s1)>
module {
  func.func @fuse_tileable_multi_output_op(%arg0: index, %arg1: tensor<?xf32>, %arg2: tensor<?xf32>, %arg3: tensor<?xf32>, %arg4: tensor<?xf32>) -> tensor<?xf32> {
    %cst = arith.constant 4.200000e+01 : f32
    %c0 = arith.constant 0 : index
    %0:2 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg1 : tensor<?xf32>) outs(%arg2, %arg4 : tensor<?xf32>, tensor<?xf32>) {
    ^bb0(%in: f32, %out: f32, %out_0: f32):
      %3 = arith.addf %in, %out : f32
      %4 = arith.addf %3, %out_0 : f32
      linalg.yield %3, %4 : f32, f32
    } -> (tensor<?xf32>, tensor<?xf32>)
    %dim = tensor.dim %arg2, %c0 : tensor<?xf32>
    %1 = affine.apply #map1()[%dim, %arg0]
    %2 = scf.forall (%arg5) in (%1) shared_outs(%arg6 = %arg3) -> (tensor<?xf32>) {
      %3 = affine.apply #map2(%arg5)[%arg0]
      %4 = affine.min #map3(%arg5)[%dim, %arg0]
      %extracted_slice = tensor.extract_slice %arg6[%3] [%4] [1] : tensor<?xf32> to tensor<?xf32>
      %extracted_slice_0 = tensor.extract_slice %0#0[%3] [%4] [1] : tensor<?xf32> to tensor<?xf32>
      %5 = linalg.exp ins(%extracted_slice_0 : tensor<?xf32>) outs(%extracted_slice : tensor<?xf32>) -> tensor<?xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %5 into %arg6[%3] [%4] [1] : tensor<?xf32> into tensor<?xf32>
      }
    }
    return %2 : tensor<?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.op<"linalg.generic">
      %1 = transform.structured.match ops{["scf.forall"]} in %arg0 : (!transform.any_op) -> !transform.op<"scf.forall">
      %fused_op, %new_containing_op = transform.structured.fuse_into_containing_op %0 into %1 : (!transform.op<"linalg.generic">, !transform.op<"scf.forall">) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @fuse_repeated(%arg0: tensor<2xf32>, %arg1: tensor<2xf32>) -> tensor<2xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = linalg.fill ins(%cst : f32) outs(%arg0 : tensor<2xf32>) -> tensor<2xf32>
    %1 = scf.forall (%arg2) in (2) shared_outs(%arg3 = %arg1) -> (tensor<2xf32>) {
      %extracted_slice = tensor.extract_slice %0[%arg2] [1] [1] : tensor<2xf32> to tensor<1xf32>
      %extracted_slice_0 = tensor.extract_slice %arg3[%arg2] [1] [1] : tensor<2xf32> to tensor<1xf32>
      %2 = linalg.exp ins(%extracted_slice : tensor<1xf32>) outs(%extracted_slice_0 : tensor<1xf32>) -> tensor<1xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %2 into %arg3[%arg2] [1] [1] : tensor<1xf32> into tensor<2xf32>
      }
    }
    return %1 : tensor<2xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.fill"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["scf.forall"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %2 = transform.merge_handles %0, %0 : !transform.any_op
      %fused_op, %new_containing_op = transform.structured.fuse_into_containing_op %2 into %1 : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<()[s0, s1] -> (s0 ceildiv s1)>
#map2 = affine_map<(d0)[s0] -> (d0 * s0)>
#map3 = affine_map<(d0)[s0, s1] -> (-(d0 * s1) + s0, s1)>
module {
  func.func @fuse_tileable_multi_output_op_multi_use(%arg0: index, %arg1: tensor<?xf32>, %arg2: tensor<?xf32>, %arg3: tensor<?xf32>, %arg4: tensor<?xf32>) -> (tensor<?xf32>, tensor<?xf32>, tensor<?xf32>) {
    %cst = arith.constant 4.200000e+01 : f32
    %c0 = arith.constant 0 : index
    %0:2 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg1 : tensor<?xf32>) outs(%arg2, %arg4 : tensor<?xf32>, tensor<?xf32>) {
    ^bb0(%in: f32, %out: f32, %out_0: f32):
      %3 = arith.addf %in, %out : f32
      %4 = arith.addf %3, %out_0 : f32
      linalg.yield %3, %4 : f32, f32
    } -> (tensor<?xf32>, tensor<?xf32>)
    %dim = tensor.dim %arg2, %c0 : tensor<?xf32>
    %1 = affine.apply #map1()[%dim, %arg0]
    %2 = scf.forall (%arg5) in (%1) shared_outs(%arg6 = %arg3) -> (tensor<?xf32>) {
      %3 = affine.apply #map2(%arg5)[%arg0]
      %4 = affine.min #map3(%arg5)[%dim, %arg0]
      %extracted_slice = tensor.extract_slice %arg6[%3] [%4] [1] : tensor<?xf32> to tensor<?xf32>
      %extracted_slice_0 = tensor.extract_slice %0#0[%3] [%4] [1] : tensor<?xf32> to tensor<?xf32>
      %5 = linalg.exp ins(%extracted_slice_0 : tensor<?xf32>) outs(%extracted_slice : tensor<?xf32>) -> tensor<?xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %5 into %arg6[%3] [%4] [1] : tensor<?xf32> into tensor<?xf32>
      }
    }
    return %2, %0#0, %0#1 : tensor<?xf32>, tensor<?xf32>, tensor<?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.op<"linalg.generic">
      %1 = transform.structured.match ops{["scf.forall"]} in %arg0 : (!transform.any_op) -> !transform.op<"scf.forall">
      %fused_op, %new_containing_op = transform.structured.fuse_into_containing_op %0 into %1 : (!transform.op<"linalg.generic">, !transform.op<"scf.forall">) -> (!transform.any_op, !transform.any_op)
      transform.debug.emit_remark_at %new_containing_op, "new containing op" : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<()[s0, s1] -> (s0 ceildiv s1)>
#map2 = affine_map<(d0)[s0] -> (d0 * s0)>
#map3 = affine_map<(d0)[s0, s1] -> (-(d0 * s1) + s0, s1)>
module {
  func.func @fuse_tileable_mixed_dominating_uses(%arg0: index, %arg1: tensor<?xf32>, %arg2: tensor<?xf32>, %arg3: tensor<?xf32>, %arg4: tensor<?xf32>) -> (tensor<?xf32>, tensor<?xf32>) {
    %cst = arith.constant 4.200000e+01 : f32
    %c0 = arith.constant 0 : index
    %0 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg1 : tensor<?xf32>) outs(%arg2 : tensor<?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %3 = arith.addf %in, %out : f32
      linalg.yield %3 : f32
    } -> tensor<?xf32>
    %dim = tensor.dim %0, %c0 : tensor<?xf32>
    %1 = affine.apply #map1()[%dim, %arg0]
    %2 = scf.forall (%arg5) in (%1) shared_outs(%arg6 = %arg3) -> (tensor<?xf32>) {
      %3 = affine.apply #map2(%arg5)[%arg0]
      %4 = affine.min #map3(%arg5)[%dim, %arg0]
      %extracted_slice = tensor.extract_slice %arg6[%3] [%4] [1] : tensor<?xf32> to tensor<?xf32>
      %extracted_slice_0 = tensor.extract_slice %0[%3] [%4] [1] : tensor<?xf32> to tensor<?xf32>
      %5 = linalg.exp ins(%extracted_slice_0 : tensor<?xf32>) outs(%extracted_slice : tensor<?xf32>) -> tensor<?xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %5 into %arg6[%3] [%4] [1] : tensor<?xf32> into tensor<?xf32>
      }
    }
    return %2, %0 : tensor<?xf32>, tensor<?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.op<"linalg.generic">
      %1 = transform.structured.match ops{["scf.forall"]} in %arg0 : (!transform.any_op) -> !transform.op<"scf.forall">
      %fused_op, %new_containing_op = transform.structured.fuse_into_containing_op %0 into %1 : (!transform.op<"linalg.generic">, !transform.op<"scf.forall">) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
#map2 = affine_map<()[s0, s1] -> (s0 ceildiv s1)>
#map3 = affine_map<(d0)[s0] -> (d0 * s0)>
#map4 = affine_map<(d0)[s0, s1] -> (-(d0 * s1) + s0, s1)>
module {
  func.func @fuse_tileable_reductions(%arg0: index, %arg1: tensor<?x?xf32>, %arg2: tensor<?xf32>, %arg3: tensor<?xf32>, %arg4: tensor<?xf32>) -> (tensor<?xf32>, tensor<?xf32>) {
    %cst = arith.constant 4.200000e+01 : f32
    %c0 = arith.constant 0 : index
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction"]} ins(%arg1 : tensor<?x?xf32>) outs(%arg2 : tensor<?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %3 = arith.maximumf %in, %out : f32
      linalg.yield %3 : f32
    } -> tensor<?xf32>
    %dim = tensor.dim %arg2, %c0 : tensor<?xf32>
    %1 = affine.apply #map2()[%dim, %arg0]
    %2 = scf.forall (%arg5) in (%1) shared_outs(%arg6 = %arg3) -> (tensor<?xf32>) {
      %3 = affine.apply #map3(%arg5)[%arg0]
      %4 = affine.min #map4(%arg5)[%dim, %arg0]
      %extracted_slice = tensor.extract_slice %arg6[%3] [%4] [1] : tensor<?xf32> to tensor<?xf32>
      %extracted_slice_0 = tensor.extract_slice %0[%3] [%4] [1] : tensor<?xf32> to tensor<?xf32>
      %5 = linalg.exp ins(%extracted_slice_0 : tensor<?xf32>) outs(%extracted_slice : tensor<?xf32>) -> tensor<?xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %5 into %arg6[%3] [%4] [1] : tensor<?xf32> into tensor<?xf32>
      }
    }
    return %2, %0 : tensor<?xf32>, tensor<?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.op<"linalg.generic">
      %1 = transform.structured.match ops{["scf.forall"]} in %arg0 : (!transform.any_op) -> !transform.op<"scf.forall">
      %fused_op, %new_containing_op = transform.structured.fuse_into_containing_op %0 into %1 : (!transform.op<"linalg.generic">, !transform.op<"scf.forall">) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<()[s0, s1] -> (s0 ceildiv s1)>
#map2 = affine_map<(d0)[s0] -> (d0 * s0)>
#map3 = affine_map<(d0)[s0, s1] -> (-(d0 * s1) + s0, s1)>
module {
  func.func @fuse_tileable_using_new_handle(%arg0: index, %arg1: tensor<?xf32>, %arg2: tensor<?xf32>, %arg3: tensor<?xf32>, %arg4: tensor<?xf32>) -> (tensor<?xf32>, tensor<?xf32>) {
    %cst = arith.constant 4.200000e+01 : f32
    %c0 = arith.constant 0 : index
    %0 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg1 : tensor<?xf32>) outs(%arg2 : tensor<?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %4 = arith.addf %in, %out : f32
      linalg.yield %4 : f32
    } -> tensor<?xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%0 : tensor<?xf32>) outs(%arg2 : tensor<?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %4 = arith.mulf %in, %out : f32
      linalg.yield %4 : f32
    } -> tensor<?xf32>
    %dim = tensor.dim %arg2, %c0 : tensor<?xf32>
    %2 = affine.apply #map1()[%dim, %arg0]
    %3 = scf.forall (%arg5) in (%2) shared_outs(%arg6 = %arg3) -> (tensor<?xf32>) {
      %4 = affine.apply #map2(%arg5)[%arg0]
      %5 = affine.min #map3(%arg5)[%dim, %arg0]
      %extracted_slice = tensor.extract_slice %arg6[%4] [%5] [1] : tensor<?xf32> to tensor<?xf32>
      %extracted_slice_0 = tensor.extract_slice %1[%4] [%5] [1] : tensor<?xf32> to tensor<?xf32>
      %6 = linalg.exp ins(%extracted_slice_0 : tensor<?xf32>) outs(%extracted_slice : tensor<?xf32>) -> tensor<?xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %6 into %arg6[%2] [%5] [1] : tensor<?xf32> into tensor<?xf32>
      }
    }
    return %3, %1 : tensor<?xf32>, tensor<?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.op<"linalg.generic">
      %1:2 = transform.split_handle %0 : (!transform.op<"linalg.generic">) -> (!transform.op<"linalg.generic">, !transform.op<"linalg.generic">)
      %2 = transform.structured.match ops{["scf.forall"]} in %arg0 : (!transform.any_op) -> !transform.op<"scf.forall">
      %fused_op, %new_containing_op = transform.structured.fuse_into_containing_op %1#1 into %2 : (!transform.op<"linalg.generic">, !transform.op<"scf.forall">) -> (!transform.any_op, !transform.op<"scf.forall">)
      %fused_op_0, %new_containing_op_1 = transform.structured.fuse_into_containing_op %1#0 into %new_containing_op : (!transform.op<"linalg.generic">, !transform.op<"scf.forall">) -> (!transform.any_op, !transform.op<"scf.forall">)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map2 = affine_map<(d0) -> (d0 * 4)>
module {
  func.func @softmax_dispatch_0_generic_16x128x128_f32() -> tensor<16x128x128xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant dense<5.000000e+00> : tensor<16x128x128xf32>
    %cst_0 = arith.constant 5.000000e+00 : f32
    %0 = tensor.empty() : tensor<16x128xf32>
    %1 = tensor.empty() : tensor<16x128x128xf32>
    %2 = linalg.fill ins(%cst_0 : f32) outs(%0 : tensor<16x128xf32>) -> tensor<16x128xf32>
    %3 = linalg.fill ins(%cst_0 : f32) outs(%0 : tensor<16x128xf32>) -> tensor<16x128xf32>
    %4 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel", "reduction"]} ins(%cst : tensor<16x128x128xf32>) outs(%3 : tensor<16x128xf32>) attrs =  {producer} {
    ^bb0(%in: f32, %out: f32):
      %6 = arith.maximumf %in, %out : f32
      linalg.yield %6 : f32
    } -> tensor<16x128xf32>
    %c16 = arith.constant 16 : index
    %c32 = arith.constant 32 : index
    %5 = scf.forall (%arg0, %arg1) in (16, 32) shared_outs(%arg2 = %1) -> (tensor<16x128x128xf32>) {
      %6 = affine.apply #map2(%arg1)
      %extracted_slice = tensor.extract_slice %4[%arg0, %6] [1, 4] [1, 1] : tensor<16x128xf32> to tensor<1x4xf32>
      %extracted_slice_1 = tensor.extract_slice %1[%arg0, %6, 0] [1, 4, 128] [1, 1, 1] : tensor<16x128x128xf32> to tensor<1x4x128xf32>
      %extracted_slice_2 = tensor.extract_slice %2[%arg0, %6] [1, 4] [1, 1] : tensor<16x128xf32> to tensor<1x4xf32>
      %7:2 = linalg.generic {indexing_maps = [#map1, #map, #map1], iterator_types = ["parallel", "parallel", "reduction"]} ins(%extracted_slice : tensor<1x4xf32>) outs(%extracted_slice_1, %extracted_slice_2 : tensor<1x4x128xf32>, tensor<1x4xf32>) {
      ^bb0(%in: f32, %out: f32, %out_7: f32):
        %10 = arith.subf %cst_0, %in : f32
        %11 = math.exp %10 : f32
        %12 = arith.addf %11, %out_7 : f32
        linalg.yield %11, %12 : f32, f32
      } -> (tensor<1x4x128xf32>, tensor<1x4xf32>)
      %extracted_slice_3 = tensor.extract_slice %4[%arg0, %6] [1, 4] [1, 1] : tensor<16x128xf32> to tensor<1x4xf32>
      %extracted_slice_4 = tensor.extract_slice %1[%arg0, %6, 0] [1, 4, 128] [1, 1, 1] : tensor<16x128x128xf32> to tensor<1x4x128xf32>
      %extracted_slice_5 = tensor.extract_slice %2[%arg0, %6] [1, 4] [1, 1] : tensor<16x128xf32> to tensor<1x4xf32>
      %8:2 = linalg.generic {indexing_maps = [#map1, #map, #map1], iterator_types = ["parallel", "parallel", "reduction"]} ins(%extracted_slice_3 : tensor<1x4xf32>) outs(%extracted_slice_4, %extracted_slice_5 : tensor<1x4x128xf32>, tensor<1x4xf32>) {
      ^bb0(%in: f32, %out: f32, %out_7: f32):
        %10 = arith.subf %cst_0, %in : f32
        %11 = math.exp %10 : f32
        %12 = arith.addf %11, %out_7 : f32
        linalg.yield %11, %12 : f32, f32
      } -> (tensor<1x4x128xf32>, tensor<1x4xf32>)
      %extracted_slice_6 = tensor.extract_slice %arg2[%arg0, %6, 0] [1, 4, 128] [1, 1, 1] : tensor<16x128x128xf32> to tensor<1x4x128xf32>
      %9 = linalg.generic {indexing_maps = [#map, #map1, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%7#0, %8#1 : tensor<1x4x128xf32>, tensor<1x4xf32>) outs(%extracted_slice_6 : tensor<1x4x128xf32>) {
      ^bb0(%in: f32, %in_7: f32, %out: f32):
        %10 = arith.divf %in, %in_7 : f32
        linalg.yield %10 : f32
      } -> tensor<1x4x128xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %9 into %arg2[%arg0, %6, 0] [1, 4, 128] [1, 1, 1] : tensor<1x4x128xf32> into tensor<16x128x128xf32>
      }
    }
    return %5 : tensor<16x128x128xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match attributes {producer} in %arg0 : (!transform.any_op) -> !transform.op<"linalg.generic">
      %1 = transform.structured.match ops{["scf.forall"]} in %arg0 : (!transform.any_op) -> !transform.op<"scf.forall">
      %fused_op, %new_containing_op = transform.structured.fuse_into_containing_op %0 into %1 : (!transform.op<"linalg.generic">, !transform.op<"scf.forall">) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @copy_1d_1024xf16(%arg0: tensor<123x456xf32>, %arg1: tensor<456x789xf32>, %arg2: tensor<123x789xf32>) -> tensor<123x789xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = linalg.fill ins(%cst : f32) outs(%arg2 : tensor<123x789xf32>) -> tensor<123x789xf32>
    %1 = linalg.matmul ins(%arg0, %arg1 : tensor<123x456xf32>, tensor<456x789xf32>) outs(%0 : tensor<123x789xf32>) -> tensor<123x789xf32>
    return %1 : tensor<123x789xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.fill"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_op, %forall_op = transform.structured.tile_using_forall %1 tile_sizes [50, 16] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %fused_op, %new_containing_op = transform.structured.fuse_into_containing_op %0 into %tiled_op : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

