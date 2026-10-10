module {
  func.func @pack(%arg0: tensor<129x47x16x16xf32>, %arg1: tensor<17x2x16x16x32x8xf32>) -> tensor<17x2x16x16x32x8xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %pack = linalg.pack %arg0 padding_value(%cst : f32) inner_dims_pos = [1, 0] inner_tiles = [32, 8] into %arg1 : tensor<129x47x16x16xf32> -> tensor<17x2x16x16x32x8xf32>
    return %pack : tensor<17x2x16x16x32x8xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pack"]} in %arg0 : (!transform.any_op) -> !transform.op<"linalg.pack">
      %pad_op, %expand_shape_op, %transpose_op = transform.structured.lower_pack %0 : (!transform.op<"linalg.pack">) -> (!transform.op<"tensor.pad">, !transform.op<"tensor.expand_shape">, !transform.op<"linalg.transpose">)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pack(%arg0: tensor<128x8xf32>, %arg1: tensor<8x8x16x1xf32>) -> tensor<8x8x16x1xf32> {
    %pack = linalg.pack %arg0 inner_dims_pos = [0, 1] inner_tiles = [16, 1] into %arg1 : tensor<128x8xf32> -> tensor<8x8x16x1xf32>
    return %pack : tensor<8x8x16x1xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pack"]} in %arg0 : (!transform.any_op) -> !transform.op<"linalg.pack">
      %pad_op, %expand_shape_op, %transpose_op = transform.structured.lower_pack %0 : (!transform.op<"linalg.pack">) -> (!transform.op<"tensor.pad">, !transform.op<"tensor.expand_shape">, !transform.op<"linalg.transpose">)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pack_as_pad(%arg0: tensor<129x47x16x16xf32>, %arg1: tensor<1x1x1x1x136x64x16x16xf32>) -> tensor<1x1x1x1x136x64x16x16xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %pack = linalg.pack %arg0 padding_value(%cst : f32) inner_dims_pos = [0, 1, 2, 3] inner_tiles = [136, 64, 16, 16] into %arg1 : tensor<129x47x16x16xf32> -> tensor<1x1x1x1x136x64x16x16xf32>
    return %pack : tensor<1x1x1x1x136x64x16x16xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pack"]} in %arg0 : (!transform.any_op) -> !transform.op<"linalg.pack">
      %pad_op, %expand_shape_op, %transpose_op = transform.structured.lower_pack %0 : (!transform.op<"linalg.pack">) -> (!transform.op<"tensor.pad">, !transform.op<"tensor.expand_shape">, !transform.op<"linalg.transpose">)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pack_as_pad_disabled_insert_slice(%arg0: tensor<129x47x16x16xf32>, %arg1: tensor<1x1x1x1x136x64x16x16xf32>) -> tensor<1x1x1x1x136x64x16x16xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %pack = linalg.pack %arg0 padding_value(%cst : f32) inner_dims_pos = [0, 1, 2, 3] inner_tiles = [136, 64, 16, 16] into %arg1 : tensor<129x47x16x16xf32> -> tensor<1x1x1x1x136x64x16x16xf32>
    return %pack : tensor<1x1x1x1x136x64x16x16xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pack"]} in %arg0 : (!transform.any_op) -> !transform.op<"linalg.pack">
      %pad_op, %expand_shape_op, %transpose_op = transform.structured.lower_pack %0 {lowerPadLikeWithInsertSlice = false} : (!transform.op<"linalg.pack">) -> (!transform.op<"tensor.pad">, !transform.op<"tensor.expand_shape">, !transform.op<"linalg.transpose">)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pack_not_a_pad(%arg0: tensor<129x47x16x16xf32>, %arg1: tensor<1x1x16x16x136x64xf32>) -> tensor<1x1x16x16x136x64xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %pack = linalg.pack %arg0 padding_value(%cst : f32) inner_dims_pos = [0, 1] inner_tiles = [136, 64] into %arg1 : tensor<129x47x16x16xf32> -> tensor<1x1x16x16x136x64xf32>
    return %pack : tensor<1x1x16x16x136x64xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pack"]} in %arg0 : (!transform.any_op) -> !transform.op<"linalg.pack">
      %pad_op, %expand_shape_op, %transpose_op = transform.structured.lower_pack %0 : (!transform.op<"linalg.pack">) -> (!transform.op<"tensor.pad">, !transform.op<"tensor.expand_shape">, !transform.op<"linalg.transpose">)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @unpack(%arg0: tensor<17x2x16x16x32x8xf32>, %arg1: tensor<129x47x16x16xf32>) -> tensor<129x47x16x16xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %unpack = linalg.unpack %arg0 inner_dims_pos = [1, 0] inner_tiles = [32, 8] into %arg1 : tensor<17x2x16x16x32x8xf32> -> tensor<129x47x16x16xf32>
    return %unpack : tensor<129x47x16x16xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.unpack"]} in %arg0 : (!transform.any_op) -> !transform.op<"linalg.unpack">
      %empty_op, %transpose_op, %collapse_shape_op, %extract_slice_op = transform.structured.lower_unpack %0 : (!transform.op<"linalg.unpack">) -> (!transform.op<"tensor.empty">, !transform.op<"linalg.transpose">, !transform.op<"tensor.collapse_shape">, !transform.op<"tensor.extract_slice">)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @unpack_with_identity_outer_dims_perm(%arg0: tensor<17x2x16x16x32x8xf32>, %arg1: tensor<129x47x16x16xf32>) -> tensor<129x47x16x16xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %unpack = linalg.unpack %arg0 outer_dims_perm = [0, 1, 2, 3] inner_dims_pos = [1, 0] inner_tiles = [32, 8] into %arg1 : tensor<17x2x16x16x32x8xf32> -> tensor<129x47x16x16xf32>
    return %unpack : tensor<129x47x16x16xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.unpack"]} in %arg0 : (!transform.any_op) -> !transform.op<"linalg.unpack">
      %empty_op, %transpose_op, %collapse_shape_op, %extract_slice_op = transform.structured.lower_unpack %0 : (!transform.op<"linalg.unpack">) -> (!transform.op<"tensor.empty">, !transform.op<"linalg.transpose">, !transform.op<"tensor.collapse_shape">, !transform.op<"tensor.extract_slice">)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @unpack_as_pad(%arg0: tensor<1x1x1x1x136x64x16x16xf32>, %arg1: tensor<129x47x16x16xf32>) -> tensor<129x47x16x16xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %unpack = linalg.unpack %arg0 inner_dims_pos = [0, 1, 2, 3] inner_tiles = [136, 64, 16, 16] into %arg1 : tensor<1x1x1x1x136x64x16x16xf32> -> tensor<129x47x16x16xf32>
    return %unpack : tensor<129x47x16x16xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.unpack"]} in %arg0 : (!transform.any_op) -> !transform.op<"linalg.unpack">
      %empty_op, %transpose_op, %collapse_shape_op, %extract_slice_op = transform.structured.lower_unpack %0 : (!transform.op<"linalg.unpack">) -> (!transform.op<"tensor.empty">, !transform.op<"linalg.transpose">, !transform.op<"tensor.collapse_shape">, !transform.op<"tensor.extract_slice">)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @unpack_as_pad_disabled_extract_slice(%arg0: tensor<1x1x1x1x136x64x16x16xf32>, %arg1: tensor<129x47x16x16xf32>) -> tensor<129x47x16x16xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %unpack = linalg.unpack %arg0 inner_dims_pos = [0, 1, 2, 3] inner_tiles = [136, 64, 16, 16] into %arg1 : tensor<1x1x1x1x136x64x16x16xf32> -> tensor<129x47x16x16xf32>
    return %unpack : tensor<129x47x16x16xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.unpack"]} in %arg0 : (!transform.any_op) -> !transform.op<"linalg.unpack">
      %empty_op, %transpose_op, %collapse_shape_op, %extract_slice_op = transform.structured.lower_unpack %0 {lowerUnpadLikeWithExtractSlice = false} : (!transform.op<"linalg.unpack">) -> (!transform.op<"tensor.empty">, !transform.op<"linalg.transpose">, !transform.op<"tensor.collapse_shape">, !transform.op<"tensor.extract_slice">)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pack_with_outer_dims_perm(%arg0: tensor<100x200x128x256xi32>, %arg1: tensor<200x4x16x100x16x32xi32>) -> tensor<200x4x16x100x16x32xi32> {
    %pack = linalg.pack %arg0 outer_dims_perm = [1, 2, 3, 0] inner_dims_pos = [3, 2] inner_tiles = [16, 32] into %arg1 : tensor<100x200x128x256xi32> -> tensor<200x4x16x100x16x32xi32>
    return %pack : tensor<200x4x16x100x16x32xi32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pack"]} in %arg0 : (!transform.any_op) -> !transform.op<"linalg.pack">
      %pad_op, %expand_shape_op, %transpose_op = transform.structured.lower_pack %0 : (!transform.op<"linalg.pack">) -> (!transform.op<"tensor.pad">, !transform.op<"tensor.expand_shape">, !transform.op<"linalg.transpose">)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pack_with_pad(%arg0: tensor<4225x12xf32>, %arg1: tensor<265x12x16x1xf32>) -> tensor<265x12x16x1xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %pack = linalg.pack %arg0 padding_value(%cst : f32) inner_dims_pos = [0, 1] inner_tiles = [16, 1] into %arg1 : tensor<4225x12xf32> -> tensor<265x12x16x1xf32>
    return %pack : tensor<265x12x16x1xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pack"]} in %arg0 : (!transform.any_op) -> !transform.op<"linalg.pack">
      %pad_op, %expand_shape_op, %transpose_op = transform.structured.lower_pack %0 : (!transform.op<"linalg.pack">) -> (!transform.op<"tensor.pad">, !transform.op<"tensor.expand_shape">, !transform.op<"linalg.transpose">)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pack_with_pad_and_outer_dims_perm(%arg0: tensor<100x200x127x255xi32>, %arg1: tensor<200x4x16x100x16x32xi32>) -> tensor<200x4x16x100x16x32xi32> {
    %c0_i32 = arith.constant 0 : i32
    %pack = linalg.pack %arg0 padding_value(%c0_i32 : i32) outer_dims_perm = [1, 2, 3, 0] inner_dims_pos = [3, 2] inner_tiles = [16, 32] into %arg1 : tensor<100x200x127x255xi32> -> tensor<200x4x16x100x16x32xi32>
    return %pack : tensor<200x4x16x100x16x32xi32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pack"]} in %arg0 : (!transform.any_op) -> !transform.op<"linalg.pack">
      %pad_op, %expand_shape_op, %transpose_op = transform.structured.lower_pack %0 : (!transform.op<"linalg.pack">) -> (!transform.op<"tensor.pad">, !transform.op<"tensor.expand_shape">, !transform.op<"linalg.transpose">)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @dynamic_pack_pad_transpose_inner_and_outer_dims(%arg0: tensor<?x?xf32>) -> tensor<?x?x16x32xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?xf32>
    %cst = arith.constant 0.000000e+00 : f32
    %c16 = arith.constant 16 : index
    %c32 = arith.constant 32 : index
    %0 = arith.ceildivui %dim, %c32 : index
    %1 = arith.ceildivui %dim_0, %c16 : index
    %2 = tensor.empty(%1, %0) : tensor<?x?x16x32xf32>
    %pack = linalg.pack %arg0 padding_value(%cst : f32) outer_dims_perm = [1, 0] inner_dims_pos = [1, 0] inner_tiles = [16, 32] into %2 : tensor<?x?xf32> -> tensor<?x?x16x32xf32>
    return %pack : tensor<?x?x16x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pack"]} in %arg0 : (!transform.any_op) -> !transform.op<"linalg.pack">
      %pad_op, %expand_shape_op, %transpose_op = transform.structured.lower_pack %0 : (!transform.op<"linalg.pack">) -> (!transform.op<"tensor.pad">, !transform.op<"tensor.expand_shape">, !transform.op<"linalg.transpose">)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pack_as_pad_with_outer_dims_perm(%arg0: tensor<129x47x16x16xf32>, %arg1: tensor<1x1x1x1x136x64x16x16xf32>) -> tensor<1x1x1x1x136x64x16x16xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %pack = linalg.pack %arg0 padding_value(%cst : f32) outer_dims_perm = [1, 2, 3, 0] inner_dims_pos = [0, 1, 2, 3] inner_tiles = [136, 64, 16, 16] into %arg1 : tensor<129x47x16x16xf32> -> tensor<1x1x1x1x136x64x16x16xf32>
    return %pack : tensor<1x1x1x1x136x64x16x16xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pack"]} in %arg0 : (!transform.any_op) -> !transform.op<"linalg.pack">
      %pad_op, %expand_shape_op, %transpose_op = transform.structured.lower_pack %0 : (!transform.op<"linalg.pack">) -> (!transform.op<"tensor.pad">, !transform.op<"tensor.expand_shape">, !transform.op<"linalg.transpose">)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pack_as_pad_with_unit_dims(%arg0: tensor<3x1x1x1xf32>, %arg1: tensor<1x1x1x1x8x1xf32>) -> tensor<1x1x1x1x8x1xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %pack = linalg.pack %arg0 padding_value(%cst : f32) inner_dims_pos = [0, 1] inner_tiles = [8, 1] into %arg1 : tensor<3x1x1x1xf32> -> tensor<1x1x1x1x8x1xf32>
    return %pack : tensor<1x1x1x1x8x1xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pack"]} in %arg0 : (!transform.any_op) -> !transform.op<"linalg.pack">
      %pad_op, %expand_shape_op, %transpose_op = transform.structured.lower_pack %0 : (!transform.op<"linalg.pack">) -> (!transform.op<"tensor.pad">, !transform.op<"tensor.expand_shape">, !transform.op<"linalg.transpose">)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @unpack_with_dynamic_dest(%arg0: tensor<32x2x49x16x16xf32>, %arg1: tensor<32x?x?xf32>) -> tensor<32x?x?xf32> {
    %unpack = linalg.unpack %arg0 inner_dims_pos = [1, 2] inner_tiles = [16, 16] into %arg1 : tensor<32x2x49x16x16xf32> -> tensor<32x?x?xf32>
    return %unpack : tensor<32x?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.unpack"]} in %arg0 : (!transform.any_op) -> !transform.op<"linalg.unpack">
      %empty_op, %transpose_op, %collapse_shape_op, %extract_slice_op = transform.structured.lower_unpack %0 : (!transform.op<"linalg.unpack">) -> (!transform.op<"tensor.empty">, !transform.op<"linalg.transpose">, !transform.op<"tensor.collapse_shape">, !transform.op<"tensor.extract_slice">)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @unpack_with_dynamic_input_dest(%arg0: tensor<?x?x8x16xf32>, %arg1: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %unpack = linalg.unpack %arg0 inner_dims_pos = [0, 1] inner_tiles = [8, 16] into %arg1 : tensor<?x?x8x16xf32> -> tensor<?x?xf32>
    return %unpack : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.unpack"]} in %arg0 : (!transform.any_op) -> !transform.op<"linalg.unpack">
      %empty_op, %transpose_op, %collapse_shape_op, %extract_slice_op = transform.structured.lower_unpack %0 : (!transform.op<"linalg.unpack">) -> (!transform.op<"tensor.empty">, !transform.op<"linalg.transpose">, !transform.op<"tensor.collapse_shape">, !transform.op<"tensor.extract_slice">)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @unpack_fully_dynamic(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: index, %arg3: index) -> tensor<?x?xf32> {
    %unpack = linalg.unpack %arg0 inner_dims_pos = [0, 1] inner_tiles = [%arg2, %arg3] into %arg1 : tensor<?x?x?x?xf32> -> tensor<?x?xf32>
    return %unpack : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.unpack"]} in %arg0 : (!transform.any_op) -> !transform.op<"linalg.unpack">
      %empty_op, %transpose_op, %collapse_shape_op, %extract_slice_op = transform.structured.lower_unpack %0 : (!transform.op<"linalg.unpack">) -> (!transform.op<"tensor.empty">, !transform.op<"linalg.transpose">, !transform.op<"tensor.collapse_shape">, !transform.op<"tensor.extract_slice">)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @unpack_as_pad_dynamic(%arg0: tensor<1x1x1x1x136x64x16x16xf32>, %arg1: tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> {
    %unpack = linalg.unpack %arg0 inner_dims_pos = [0, 1, 2, 3] inner_tiles = [136, 64, 16, 16] into %arg1 : tensor<1x1x1x1x136x64x16x16xf32> -> tensor<?x?x?x?xf32>
    return %unpack : tensor<?x?x?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.unpack"]} in %arg0 : (!transform.any_op) -> !transform.op<"linalg.unpack">
      %empty_op, %transpose_op, %collapse_shape_op, %extract_slice_op = transform.structured.lower_unpack %0 : (!transform.op<"linalg.unpack">) -> (!transform.op<"tensor.empty">, !transform.op<"linalg.transpose">, !transform.op<"tensor.collapse_shape">, !transform.op<"tensor.extract_slice">)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @unpack_with_outer_dims_perm(%arg0: tensor<32x64xf32>, %arg1: tensor<2x4x32x8xf32>) -> tensor<32x64xf32> {
    %unpack = linalg.unpack %arg1 outer_dims_perm = [1, 0] inner_dims_pos = [1, 0] inner_tiles = [32, 8] into %arg0 : tensor<2x4x32x8xf32> -> tensor<32x64xf32>
    return %unpack : tensor<32x64xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.unpack"]} in %arg0 : (!transform.any_op) -> !transform.op<"linalg.unpack">
      %empty_op, %transpose_op, %collapse_shape_op, %extract_slice_op = transform.structured.lower_unpack %0 : (!transform.op<"linalg.unpack">) -> (!transform.op<"tensor.empty">, !transform.op<"linalg.transpose">, !transform.op<"tensor.collapse_shape">, !transform.op<"tensor.extract_slice">)
      transform.yield 
    }
  }
}

