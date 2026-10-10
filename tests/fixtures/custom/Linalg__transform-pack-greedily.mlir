module {
  func.func @matmul_mk_kn_mn(%arg0: tensor<1023x255xf32>, %arg1: tensor<255x127xf32>, %arg2: tensor<1023x127xf32>) -> tensor<1023x127xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<1023x255xf32>, tensor<255x127xf32>) outs(%arg2 : tensor<1023x127xf32>) -> tensor<1023x127xf32>
    return %0 : tensor<1023x127xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.op<"linalg.matmul">
      %1 = transform.structured.pack_greedily %0 matmul_packed_sizes = [8, 16, 32] matmul_inner_dims_order = [1, 2, 0] : (!transform.op<"linalg.matmul">) -> !transform.op<"linalg.generic">
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d0)>
module {
  func.func @matmul_mk_nk_nm(%arg0: tensor<1023x255xf32>, %arg1: tensor<127x255xf32>, %arg2: tensor<127x1023xf32>) -> tensor<127x1023xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<1023x255xf32>, tensor<127x255xf32>) outs(%arg2 : tensor<127x1023xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<127x1023xf32>
    return %0 : tensor<127x1023xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.op<"linalg.generic">
      %1 = transform.structured.pack_greedily %0 matmul_packed_sizes = [8, 16, 32] matmul_inner_dims_order = [1, 2, 0] : (!transform.op<"linalg.generic">) -> !transform.op<"linalg.generic">
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d0)>
#map2 = affine_map<(d0, d1, d2) -> (d2, d1)>
module {
  func.func @matmul_mk_nk_nm_transposed(%arg0: tensor<1023x255xf32>, %arg1: tensor<127x255xf32>, %arg2: tensor<127x1023xf32>) -> tensor<127x1023xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel"]} ins(%arg0, %arg1 : tensor<1023x255xf32>, tensor<127x255xf32>) outs(%arg2 : tensor<127x1023xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<127x1023xf32>
    return %0 : tensor<127x1023xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.op<"linalg.generic">
      %1 = transform.structured.pack_greedily %0 matmul_packed_sizes = [8, 16, 32] matmul_inner_dims_order = [1, 2, 0] : (!transform.op<"linalg.generic">) -> !transform.op<"linalg.generic">
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d3, d1, d0, d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d2, d0, d3)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d2, d3, d1)>
module {
  func.func @contraction_bmkm2_nkb_nbm(%arg0: tensor<42x1023x255x33xf32>, %arg1: tensor<127x255x42xf32>, %arg2: tensor<127x42x1023xf32>) -> tensor<127x42x1023xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : tensor<42x1023x255x33xf32>, tensor<127x255x42xf32>) outs(%arg2 : tensor<127x42x1023xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<127x42x1023xf32>
    return %0 : tensor<127x42x1023xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.op<"linalg.generic">
      %1 = transform.structured.pack_greedily %0 matmul_packed_sizes = [8, 16, 32] matmul_inner_dims_order = [1, 2, 0] : (!transform.op<"linalg.generic">) -> !transform.op<"linalg.generic">
      transform.yield 
    }
  }
}

// -----
module {
  func.func @conv_2d_nchw_fchw(%arg0: tensor<?x47x16x16xf32>, %arg1: tensor<?x16x14x14xf32>) -> tensor<?x16x14x14xf32> {
    %cst = arith.constant dense<1.000000e-01> : tensor<16x47x3x3xf32>
    %0 = linalg.conv_2d_nchw_fchw {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %cst : tensor<?x47x16x16xf32>, tensor<16x47x3x3xf32>) outs(%arg1 : tensor<?x16x14x14xf32>) -> tensor<?x16x14x14xf32>
    return %0 : tensor<?x16x14x14xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.conv_2d_nchw_fchw"]} in %arg0 : (!transform.any_op) -> !transform.op<"linalg.conv_2d_nchw_fchw">
      %1 = transform.structured.pack_greedily %0 matmul_packed_sizes = [8, 16, 32] matmul_inner_dims_order = [1, 2, 0] : (!transform.op<"linalg.conv_2d_nchw_fchw">) -> !transform.op<"linalg.generic">
      transform.yield 
    }
  }
}

// -----
module {
  func.func @reduce_and_map(%arg0: tensor<10x100xf32>, %arg1: tensor<10x100xf32>, %arg2: tensor<10xf32>) -> tensor<10xf32> {
    %0 = tensor.empty() : tensor<10x100xf32>
    %mapped = linalg.map { arith.addf } ins(%arg0, %arg1 : tensor<10x100xf32>, tensor<10x100xf32>) outs(%0 : tensor<10x100xf32>)
    %reduced = linalg.reduce { arith.addf } ins(%mapped : tensor<10x100xf32>) outs(%arg2 : tensor<10xf32>) dimensions = [1] 
    return %reduced : tensor<10xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.op<"linalg.generic">
      %1 = transform.structured.pack_greedily %0 matmul_packed_sizes = [8, 16, 32] matmul_inner_dims_order = [1, 2, 0] : (!transform.op<"linalg.generic">) -> !transform.op<"linalg.generic">
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d0)>
module {
  func.func @matmul_mk_nk_nm(%arg0: tensor<1023x255xf32>, %arg1: tensor<127x255xf32>, %arg2: tensor<127x1023xf32>) -> tensor<127x1023xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<1023x255xf32>, tensor<127x255xf32>) outs(%arg2 : tensor<127x1023xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<127x1023xf32>
    return %0 : tensor<127x1023xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.op<"linalg.generic">
      %1 = transform.structured.pack_greedily %0 matmul_packed_sizes = [8, 0, 32] matmul_padded_sizes_next_multiple_of = [0, 10, 0] matmul_inner_dims_order = [1, 2, 0] : (!transform.op<"linalg.generic">) -> !transform.op<"linalg.generic">
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d0)>
module {
  func.func @matmul_mk_nk_nm(%arg0: tensor<1023x255xf32>, %arg1: tensor<127x255xf32>, %arg2: tensor<127x1023xf32>) -> tensor<127x1023xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<1023x255xf32>, tensor<127x255xf32>) outs(%arg2 : tensor<127x1023xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<127x1023xf32>
    return %0 : tensor<127x1023xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.op<"linalg.generic">
      %1 = transform.structured.pack_greedily %0 matmul_packed_sizes = [0, 0, 32] matmul_padded_sizes_next_multiple_of = [0, 10, 0] matmul_inner_dims_order = [1, 2, 0] : (!transform.op<"linalg.generic">) -> !transform.op<"linalg.generic">
      transform.yield 
    }
  }
}

// -----
module {
  func.func @matvec_fail(%arg0: tensor<1023x255xf32>, %arg1: tensor<255xf32>, %arg2: tensor<1023xf32>) -> tensor<1023xf32> {
    %0 = linalg.matvec ins(%arg0, %arg1 : tensor<1023x255xf32>, tensor<255xf32>) outs(%arg2 : tensor<1023xf32>) -> tensor<1023xf32>
    return %0 : tensor<1023xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matvec"]} in %arg0 : (!transform.any_op) -> !transform.op<"linalg.matvec">
      %1 = transform.structured.pack_greedily %0 matmul_packed_sizes = [8, 16, 32] matmul_inner_dims_order = [1, 2, 0] : (!transform.op<"linalg.matvec">) -> !transform.any_op
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
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.op<"linalg.matmul">
      %1 = transform.structured.pack_greedily %0 matmul_packed_sizes = [8, 16, 4] matmul_inner_dims_order = [0, 1, 2] : (!transform.op<"linalg.matmul">) -> !transform.op<"linalg.generic">
      %2 = transform.get_producer_of_operand %1[1] : (!transform.op<"linalg.generic">) -> !transform.op<"linalg.pack">
      %packed_op, %pack_op, %un_pack_op = transform.structured.pack_transpose %2 with_compute_op(%1) outer_perm = [1, 0] inner_perm = [1, 0] : (!transform.op<"linalg.pack">, !transform.op<"linalg.generic">) -> (!transform.op<"linalg.generic">, !transform.op<"linalg.pack">, !transform.any_op)
      transform.yield 
    }
  }
}

