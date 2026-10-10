module {
  func.func @fuse_1st_for_into_2nd(%arg0: tensor<128xf32>, %arg1: tensor<128xf32>) -> (tensor<128xf32>, tensor<128xf32>) {
    %c0 = arith.constant 0 : index
    %c16 = arith.constant 16 : index
    %c128 = arith.constant 128 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = scf.for %arg2 = %c0 to %c128 step %c16 iter_args(%arg3 = %arg0) -> (tensor<128xf32>) {
      %2 = vector.transfer_read %arg0[%arg2], %cst {in_bounds = [true]} : tensor<128xf32>, vector<16xf32>
      %3 = vector.transfer_read %arg3[%arg2], %cst {in_bounds = [true]} : tensor<128xf32>, vector<16xf32>
      %4 = arith.addf %3, %2 : vector<16xf32>
      %5 = vector.transfer_write %4, %arg3[%arg2] {in_bounds = [true]} : vector<16xf32>, tensor<128xf32>
      scf.yield %5 : tensor<128xf32>
    }
    %1 = scf.for %arg2 = %c0 to %c128 step %c16 iter_args(%arg3 = %arg1) -> (tensor<128xf32>) {
      %2 = vector.transfer_read %arg0[%arg2], %cst {in_bounds = [true]} : tensor<128xf32>, vector<16xf32>
      %3 = vector.transfer_read %arg3[%arg2], %cst {in_bounds = [true]} : tensor<128xf32>, vector<16xf32>
      %4 = arith.addf %3, %2 : vector<16xf32>
      %5 = vector.transfer_write %4, %arg3[%arg2] {in_bounds = [true]} : vector<16xf32>, tensor<128xf32>
      scf.yield %5 : tensor<128xf32>
    }
    return %0, %1 : tensor<128xf32>, tensor<128xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["scf.for"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1:2 = transform.split_handle %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2 = transform.loop.fuse_sibling %1#0 into %1#1 : (!transform.any_op, !transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @fuse_2nd_for_into_1st(%arg0: tensor<128xf32>, %arg1: tensor<128xf32>) -> (tensor<128xf32>, tensor<128xf32>) {
    %c0 = arith.constant 0 : index
    %c16 = arith.constant 16 : index
    %c128 = arith.constant 128 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = scf.for %arg2 = %c0 to %c128 step %c16 iter_args(%arg3 = %arg0) -> (tensor<128xf32>) {
      %2 = vector.transfer_read %arg0[%arg2], %cst {in_bounds = [true]} : tensor<128xf32>, vector<16xf32>
      %3 = vector.transfer_read %arg3[%arg2], %cst {in_bounds = [true]} : tensor<128xf32>, vector<16xf32>
      %4 = arith.addf %3, %2 : vector<16xf32>
      %5 = vector.transfer_write %4, %arg3[%arg2] {in_bounds = [true]} : vector<16xf32>, tensor<128xf32>
      scf.yield %5 : tensor<128xf32>
    }
    %1 = scf.for %arg2 = %c0 to %c128 step %c16 iter_args(%arg3 = %arg1) -> (tensor<128xf32>) {
      %2 = vector.transfer_read %arg0[%arg2], %cst {in_bounds = [true]} : tensor<128xf32>, vector<16xf32>
      %3 = vector.transfer_read %arg3[%arg2], %cst {in_bounds = [true]} : tensor<128xf32>, vector<16xf32>
      %4 = arith.addf %3, %2 : vector<16xf32>
      %5 = vector.transfer_write %4, %arg3[%arg2] {in_bounds = [true]} : vector<16xf32>, tensor<128xf32>
      scf.yield %5 : tensor<128xf32>
    }
    return %0, %1 : tensor<128xf32>, tensor<128xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["scf.for"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1:2 = transform.split_handle %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2 = transform.loop.fuse_sibling %1#1 into %1#0 : (!transform.any_op, !transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @matmul_fuse_1st_forall_into_2nd(%arg0: tensor<128x128xf32>, %arg1: tensor<128x128xf32>, %arg2: tensor<128x128xf32>) -> (tensor<128x128xf32>, tensor<128x128xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<128x128xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<128x128xf32>) -> tensor<128x128xf32>
    %2 = linalg.matmul ins(%arg0, %arg2 : tensor<128x128xf32>, tensor<128x128xf32>) outs(%1 : tensor<128x128xf32>) -> tensor<128x128xf32>
    %3 = linalg.matmul ins(%arg1, %arg2 : tensor<128x128xf32>, tensor<128x128xf32>) outs(%1 : tensor<128x128xf32>) -> tensor<128x128xf32>
    return %2, %3 : tensor<128x128xf32>, tensor<128x128xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1:2 = transform.split_handle %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %tiled_op, %forall_op = transform.structured.tile_using_forall %1#0 tile_sizes [32] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %tiled_op_0, %forall_op_1 = transform.structured.tile_using_forall %1#1 tile_sizes [32] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2 = transform.loop.fuse_sibling %forall_op_1 into %forall_op : (!transform.any_op, !transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @matmul_fuse_2nd_forall_into_1st(%arg0: tensor<128x128xf32>, %arg1: tensor<128x128xf32>, %arg2: tensor<128x128xf32>) -> (tensor<128x128xf32>, tensor<128x128xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<128x128xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<128x128xf32>) -> tensor<128x128xf32>
    %2 = linalg.matmul ins(%arg0, %arg2 : tensor<128x128xf32>, tensor<128x128xf32>) outs(%1 : tensor<128x128xf32>) -> tensor<128x128xf32>
    %3 = linalg.matmul ins(%arg1, %arg2 : tensor<128x128xf32>, tensor<128x128xf32>) outs(%1 : tensor<128x128xf32>) -> tensor<128x128xf32>
    return %2, %3 : tensor<128x128xf32>, tensor<128x128xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1:2 = transform.split_handle %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %tiled_op, %forall_op = transform.structured.tile_using_forall %1#0 tile_sizes [32] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %tiled_op_0, %forall_op_1 = transform.structured.tile_using_forall %1#1 tile_sizes [32] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2 = transform.loop.fuse_sibling %forall_op into %forall_op_1 : (!transform.any_op, !transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @fuse_no_iter_args(%arg0: tensor<128xf32>, %arg1: tensor<128xf32>) {
    %c0 = arith.constant 0 : index
    %c16 = arith.constant 16 : index
    %c128 = arith.constant 128 : index
    %cst = arith.constant 0.000000e+00 : f32
    scf.for %arg2 = %c0 to %c128 step %c16 {
      %0 = vector.transfer_read %arg0[%arg2], %cst {in_bounds = [true]} : tensor<128xf32>, vector<16xf32>
    }
    scf.for %arg2 = %c0 to %c128 step %c16 {
      %0 = vector.transfer_read %arg1[%arg2], %cst {in_bounds = [true]} : tensor<128xf32>, vector<16xf32>
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["scf.for"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1:2 = transform.split_handle %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2 = transform.loop.fuse_sibling %1#0 into %1#1 : (!transform.any_op, !transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @source_for_uses_result_of_target_for_err(%arg0: tensor<128xf32>, %arg1: tensor<128xf32>) -> (tensor<128xf32>, tensor<128xf32>) {
    %c0 = arith.constant 0 : index
    %c16 = arith.constant 16 : index
    %c128 = arith.constant 128 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = scf.for %arg2 = %c0 to %c128 step %c16 iter_args(%arg3 = %arg0) -> (tensor<128xf32>) {
      %2 = vector.transfer_read %arg0[%arg2], %cst {in_bounds = [true]} : tensor<128xf32>, vector<16xf32>
      %3 = vector.transfer_read %arg3[%arg2], %cst {in_bounds = [true]} : tensor<128xf32>, vector<16xf32>
      %4 = arith.addf %3, %2 : vector<16xf32>
      %5 = vector.transfer_write %4, %arg3[%arg2] {in_bounds = [true]} : vector<16xf32>, tensor<128xf32>
      scf.yield %5 : tensor<128xf32>
    }
    %1 = scf.for %arg2 = %c0 to %c128 step %c16 iter_args(%arg3 = %0) -> (tensor<128xf32>) {
      %2 = vector.transfer_read %arg0[%arg2], %cst {in_bounds = [true]} : tensor<128xf32>, vector<16xf32>
      %3 = vector.transfer_read %arg3[%arg2], %cst {in_bounds = [true]} : tensor<128xf32>, vector<16xf32>
      %4 = arith.addf %3, %2 : vector<16xf32>
      %5 = vector.transfer_write %4, %arg3[%arg2] {in_bounds = [true]} : vector<16xf32>, tensor<128xf32>
      scf.yield %5 : tensor<128xf32>
    }
    return %0, %1 : tensor<128xf32>, tensor<128xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["scf.for"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1:2 = transform.split_handle %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2 = transform.loop.fuse_sibling %1#0 into %1#1 : (!transform.any_op, !transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @source_forall_uses_result_of_target_forall_err(%arg0: tensor<128x128xf32>, %arg1: tensor<128x128xf32>, %arg2: tensor<128x128xf32>) -> (tensor<128x128xf32>, tensor<128x128xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<128x128xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<128x128xf32>) -> tensor<128x128xf32>
    %2 = linalg.matmul ins(%arg0, %arg1 : tensor<128x128xf32>, tensor<128x128xf32>) outs(%1 : tensor<128x128xf32>) -> tensor<128x128xf32>
    %3 = linalg.matmul ins(%arg0, %2 : tensor<128x128xf32>, tensor<128x128xf32>) outs(%1 : tensor<128x128xf32>) -> tensor<128x128xf32>
    return %2, %3 : tensor<128x128xf32>, tensor<128x128xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1:2 = transform.split_handle %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %tiled_op, %forall_op = transform.structured.tile_using_forall %1#0 tile_sizes [32] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %tiled_op_0, %forall_op_1 = transform.structured.tile_using_forall %1#1 tile_sizes [32] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2 = transform.loop.fuse_sibling %forall_op into %forall_op_1 : (!transform.any_op, !transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @target_for_region_uses_result_of_source_for_err(%arg0: tensor<128xf32>, %arg1: tensor<128xf32>) -> (tensor<128xf32>, tensor<128xf32>) {
    %c0 = arith.constant 0 : index
    %c16 = arith.constant 16 : index
    %c128 = arith.constant 128 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = scf.for %arg2 = %c0 to %c128 step %c16 iter_args(%arg3 = %arg0) -> (tensor<128xf32>) {
      %2 = vector.transfer_read %arg0[%arg2], %cst {in_bounds = [true]} : tensor<128xf32>, vector<16xf32>
      %3 = vector.transfer_read %arg3[%arg2], %cst {in_bounds = [true]} : tensor<128xf32>, vector<16xf32>
      %4 = arith.addf %3, %2 : vector<16xf32>
      %5 = vector.transfer_write %4, %arg3[%arg2] {in_bounds = [true]} : vector<16xf32>, tensor<128xf32>
      scf.yield %5 : tensor<128xf32>
    }
    %1 = scf.for %arg2 = %c0 to %c128 step %c16 iter_args(%arg3 = %arg1) -> (tensor<128xf32>) {
      %2 = vector.transfer_read %0[%arg2], %cst {in_bounds = [true]} : tensor<128xf32>, vector<16xf32>
      %3 = vector.transfer_read %arg3[%arg2], %cst {in_bounds = [true]} : tensor<128xf32>, vector<16xf32>
      %4 = arith.addf %3, %2 : vector<16xf32>
      %5 = vector.transfer_write %4, %arg3[%arg2] {in_bounds = [true]} : vector<16xf32>, tensor<128xf32>
      scf.yield %5 : tensor<128xf32>
    }
    return %0, %1 : tensor<128xf32>, tensor<128xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["scf.for"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1:2 = transform.split_handle %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2 = transform.loop.fuse_sibling %1#1 into %1#0 : (!transform.any_op, !transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @target_forall_depends_on_value_not_dominated_by_source_forall_err(%arg0: tensor<128x128xf32>, %arg1: tensor<128x128xf32>, %arg2: tensor<128x128xf32>) -> (tensor<128x128xf32>, tensor<128x128xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<128x128xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<128x128xf32>) -> tensor<128x128xf32>
    %2 = linalg.matmul ins(%arg0, %arg2 : tensor<128x128xf32>, tensor<128x128xf32>) outs(%1 : tensor<128x128xf32>) -> tensor<128x128xf32>
    %3 = tensor.empty() : tensor<128x128xf32>
    %4 = linalg.fill ins(%cst : f32) outs(%0 : tensor<128x128xf32>) -> tensor<128x128xf32>
    %5 = linalg.matmul ins(%arg1, %arg2 : tensor<128x128xf32>, tensor<128x128xf32>) outs(%4 : tensor<128x128xf32>) -> tensor<128x128xf32>
    return %2, %5 : tensor<128x128xf32>, tensor<128x128xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1:2 = transform.split_handle %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %tiled_op, %forall_op = transform.structured.tile_using_forall %1#0 tile_sizes [32] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %tiled_op_0, %forall_op_1 = transform.structured.tile_using_forall %1#1 tile_sizes [32] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2 = transform.loop.fuse_sibling %forall_op_1 into %forall_op : (!transform.any_op, !transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @foreach_loop_pair_fuse(%arg0: tensor<128xf32>, %arg1: tensor<128xf32>) -> (tensor<128xf32>, tensor<128xf32>, tensor<128xf32>, tensor<128xf32>) {
    %c0 = arith.constant 0 : index
    %c16 = arith.constant 16 : index
    %c32 = arith.constant 32 : index
    %c128 = arith.constant 128 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = scf.for %arg2 = %c0 to %c128 step %c16 iter_args(%arg3 = %arg1) -> (tensor<128xf32>) {
      %4 = vector.transfer_read %arg0[%arg2], %cst {in_bounds = [true]} : tensor<128xf32>, vector<16xf32>
      %5 = vector.transfer_read %arg3[%arg2], %cst {in_bounds = [true]} : tensor<128xf32>, vector<16xf32>
      %6 = arith.addf %5, %4 : vector<16xf32>
      %7 = vector.transfer_write %6, %arg3[%arg2] {in_bounds = [true]} : vector<16xf32>, tensor<128xf32>
      scf.yield %7 : tensor<128xf32>
    } {target_loops}
    %1 = scf.for %arg2 = %c0 to %c128 step %c16 iter_args(%arg3 = %arg1) -> (tensor<128xf32>) {
      %4 = vector.transfer_read %arg0[%arg2], %cst {in_bounds = [true]} : tensor<128xf32>, vector<16xf32>
      %5 = vector.transfer_read %arg3[%arg2], %cst {in_bounds = [true]} : tensor<128xf32>, vector<16xf32>
      %6 = arith.addf %5, %4 : vector<16xf32>
      %7 = vector.transfer_write %6, %arg3[%arg2] {in_bounds = [true]} : vector<16xf32>, tensor<128xf32>
      scf.yield %7 : tensor<128xf32>
    } {source_loops}
    %2 = scf.for %arg2 = %c0 to %c128 step %c32 iter_args(%arg3 = %arg1) -> (tensor<128xf32>) {
      %4 = vector.transfer_read %arg0[%arg2], %cst {in_bounds = [true]} : tensor<128xf32>, vector<32xf32>
      %5 = vector.transfer_read %arg3[%arg2], %cst {in_bounds = [true]} : tensor<128xf32>, vector<32xf32>
      %6 = arith.addf %5, %4 : vector<32xf32>
      %7 = vector.transfer_write %6, %arg3[%arg2] {in_bounds = [true]} : vector<32xf32>, tensor<128xf32>
      scf.yield %7 : tensor<128xf32>
    } {target_loops}
    %3 = scf.for %arg2 = %c0 to %c128 step %c32 iter_args(%arg3 = %arg1) -> (tensor<128xf32>) {
      %4 = vector.transfer_read %arg0[%arg2], %cst {in_bounds = [true]} : tensor<128xf32>, vector<32xf32>
      %5 = vector.transfer_read %arg3[%arg2], %cst {in_bounds = [true]} : tensor<128xf32>, vector<32xf32>
      %6 = arith.addf %5, %4 : vector<32xf32>
      %7 = vector.transfer_write %6, %arg3[%arg2] {in_bounds = [true]} : vector<32xf32>, tensor<128xf32>
      scf.yield %7 : tensor<128xf32>
    } {source_loops}
    return %0, %1, %2, %3 : tensor<128xf32>, tensor<128xf32>, tensor<128xf32>, tensor<128xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["scf.for"]} attributes {target_loops} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["scf.for"]} attributes {source_loops} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.foreach %0, %1 : !transform.any_op, !transform.any_op {
      ^bb0(%arg1: !transform.any_op, %arg2: !transform.any_op):
        %2 = transform.loop.fuse_sibling %arg1 into %arg2 : (!transform.any_op, !transform.any_op) -> !transform.any_op
      }
      transform.yield 
    }
  }
}

