#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
module {
  func.func @reduction_2d_static(%arg0: tensor<3x7xf16>, %arg1: tensor<3xf16>) -> tensor<3xf16> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction"]} ins(%arg0 : tensor<3x7xf16>) outs(%arg1 : tensor<3xf16>) {
    ^bb0(%in: f16, %out: f16):
      %1 = arith.addf %in, %out : f16
      linalg.yield %1 : f16
    } -> tensor<3xf16>
    return %0 : tensor<3xf16>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.pack %0 packed_sizes = [0, 4] : (!transform.any_op) -> !transform.op<"linalg.generic">
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
module {
  func.func @col_reduction_2d_static(%arg0: tensor<7x3xf16>, %arg1: tensor<3xf16>) -> tensor<3xf16> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["reduction", "parallel"]} ins(%arg0 : tensor<7x3xf16>) outs(%arg1 : tensor<3xf16>) {
    ^bb0(%in: f16, %out: f16):
      %1 = arith.addf %in, %out : f16
      linalg.yield %1 : f16
    } -> tensor<3xf16>
    return %0 : tensor<3xf16>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.pack %0 packed_sizes = [4, 0] : (!transform.any_op) -> !transform.op<"linalg.generic">
      %2 = transform.get_producer_of_operand %1[0] : (!transform.op<"linalg.generic">) -> !transform.op<"linalg.pack">
      %packed_op, %pack_op, %un_pack_op = transform.structured.pack_transpose %2 with_compute_op(%1) outer_perm = [1, 0] : (!transform.op<"linalg.pack">, !transform.op<"linalg.generic">) -> (!transform.op<"linalg.generic">, !transform.op<"linalg.pack">, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
module {
  func.func @reduction_2d_dynamic(%arg0: tensor<?x?xf16>, %arg1: tensor<?xf16>) -> tensor<?xf16> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction"]} ins(%arg0 : tensor<?x?xf16>) outs(%arg1 : tensor<?xf16>) {
    ^bb0(%in: f16, %out: f16):
      %1 = arith.addf %in, %out : f16
      linalg.yield %1 : f16
    } -> tensor<?xf16>
    return %0 : tensor<?xf16>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.pack %0 packed_sizes = [0, 4] : (!transform.any_op) -> !transform.op<"linalg.generic">
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
module {
  func.func @reduction_2d_dynamic(%arg0: tensor<?x?xf16>, %arg1: tensor<?xf16>) -> tensor<?xf16> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction"]} ins(%arg0 : tensor<?x?xf16>) outs(%arg1 : tensor<?xf16>) {
    ^bb0(%in: f16, %out: f16):
      %1 = arith.addf %in, %out : f16
      linalg.yield %1 : f16
    } -> tensor<?xf16>
    return %0 : tensor<?xf16>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.pack %0 packed_sizes = [3, 4] : (!transform.any_op) -> !transform.op<"linalg.generic">
      transform.yield 
    }
  }
}

// -----
module {
  func.func @matmul(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.pack %0 packed_sizes = [2, 3, 4] : (!transform.any_op) -> !transform.op<"linalg.generic">
      %2 = transform.get_consumers_of_result %1[0] : (!transform.op<"linalg.generic">) -> !transform.op<"linalg.unpack">
      %packed_op, %pack_op, %un_pack_op = transform.structured.pack_transpose %2 with_compute_op(%1) outer_perm = [1, 0] inner_perm = [1, 0] : (!transform.op<"linalg.unpack">, !transform.op<"linalg.generic">) -> (!transform.op<"linalg.generic">, !transform.op<"linalg.pack">, !transform.op<"linalg.unpack">)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @conv_2d_nchw_fchw(%arg0: tensor<14x512x28x28xf32>, %arg1: tensor<1024x512x1x1xf32>, %arg2: tensor<14x1024x28x28xf32>) -> tensor<14x1024x28x28xf32> {
    %0 = linalg.conv_2d_nchw_fchw ins(%arg0, %arg1 : tensor<14x512x28x28xf32>, tensor<1024x512x1x1xf32>) outs(%arg2 : tensor<14x1024x28x28xf32>) -> tensor<14x1024x28x28xf32>
    return %0 : tensor<14x1024x28x28xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match interface{LinalgOp} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.pack %0 packed_sizes = [0, 4, 0, 0, 8, 0, 0] : (!transform.any_op) -> !transform.op<"linalg.generic">
      transform.yield 
    }
  }
}

// -----
module {
  func.func @conv_2d_nhwc_hwcf(%arg0: tensor<?x1x?x?xf32>, %arg1: tensor<1x?x?x?xf32>, %arg2: tensor<?x1x?x?xf32>) -> tensor<?x1x?x?xf32> {
    %0 = linalg.conv_2d_nhwc_hwcf ins(%arg0, %arg1 : tensor<?x1x?x?xf32>, tensor<1x?x?x?xf32>) outs(%arg2 : tensor<?x1x?x?xf32>) -> tensor<?x1x?x?xf32>
    return %0 : tensor<?x1x?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match interface{LinalgOp} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.pack %0 packed_sizes = [0, 0, 0, 4, 0, 0, 6] : (!transform.any_op) -> !transform.op<"linalg.generic">
      transform.yield 
    }
  }
}

// -----
module {
  func.func @matmul_dynamic_pack_size(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = "some_tile_size"() : () -> index
    %1 = linalg.matmul ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %1 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["some_tile_size"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.pack %0 packed_sizes = [0, %1, %1] : (!transform.any_op, !transform.any_op, !transform.any_op) -> !transform.op<"linalg.generic">
      transform.yield 
    }
  }
}

// -----
module {
  func.func @no_padding_on_packs(%arg0: tensor<32x32xf32>, %arg1: tensor<32x32xf32>, %arg2: tensor<32x32xf32>) -> tensor<32x32xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<32x32xf32>, tensor<32x32xf32>) outs(%arg2 : tensor<32x32xf32>) -> tensor<32x32xf32>
    return %0 : tensor<32x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.pack %0 packed_sizes = [4, 8, 8] : (!transform.any_op) -> !transform.op<"linalg.generic">
      %2 = transform.get_producer_of_operand %1[1] : (!transform.op<"linalg.generic">) -> !transform.op<"linalg.pack">
      %packed_op, %pack_op, %un_pack_op = transform.structured.pack_transpose %2 with_compute_op(%1) outer_perm = [1, 0] inner_perm = [1, 0] : (!transform.op<"linalg.pack">, !transform.op<"linalg.generic">) -> (!transform.op<"linalg.generic">, !transform.op<"linalg.pack">, !transform.any_op)
      transform.yield 
    }
  }
}

