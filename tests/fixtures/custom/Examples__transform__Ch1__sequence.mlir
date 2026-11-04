module {
  func.func @fc_relu(%arg0: tensor<512x512xf32>, %arg1: tensor<512x512xf32>, %arg2: tensor<512x512xf32>, %arg3: tensor<512x512xf32>) -> tensor<512x512xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<512x512xf32>, tensor<512x512xf32>) outs(%arg3 : tensor<512x512xf32>) -> tensor<512x512xf32>
    %1 = linalg.elementwise kind=#linalg.elementwise_kind<add> ins(%0, %arg2 : tensor<512x512xf32>, tensor<512x512xf32>) outs(%arg3 : tensor<512x512xf32>) -> tensor<512x512xf32>
    %cst = arith.constant dense<0.000000e+00> : tensor<512x512xf32>
    %2 = linalg.elementwise kind=#linalg.elementwise_kind<max_signed> ins(%1, %cst : tensor<512x512xf32>, tensor<512x512xf32>) outs(%arg3 : tensor<512x512xf32>) -> tensor<512x512xf32>
    return %2 : tensor<512x512xf32>
  }
  func.func private @microkernel(tensor<4x512xf32>, tensor<512x4xf32>, tensor<4x4xf32>, tensor<4x4xf32>, tensor<4x4xf32>) -> tensor<4x4xf32>
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op, %arg1: !transform.op<"linalg.matmul">, %arg2: !transform.op<"linalg.elementwise">) {
      %0:2 = transform.split_handle %arg2 : (!transform.op<"linalg.elementwise">) -> (!transform.any_op, !transform.any_op)
      %tiled_op, %forall_op = transform.structured.tile_using_forall %0#1 tile_sizes [8, 32] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %fused_op, %new_containing_op = transform.structured.fuse_into_containing_op %0#0 into %forall_op : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      %fused_op_0, %new_containing_op_1 = transform.structured.fuse_into_containing_op %arg1 into %new_containing_op : (!transform.op<"linalg.matmul">, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      %tiled_op_2, %forall_op_3 = transform.structured.tile_using_forall %fused_op tile_sizes [4, 4] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %fused_op_4, %new_containing_op_5 = transform.structured.fuse_into_containing_op %fused_op_0 into %forall_op_3 : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      %tiled_op_6, %forall_op_7 = transform.structured.tile_using_forall %tiled_op_2 tile_sizes [1] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %fused_op_8, %new_containing_op_9 = transform.structured.fuse_into_containing_op %fused_op_4 into %forall_op_7 : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      %function, %call = transform.loop.outline %new_containing_op_9 {func_name = "outlined"} : (!transform.any_op) -> (!transform.any_op, !transform.op<"func.call">)
      transform.yield 
    }
  }
}

