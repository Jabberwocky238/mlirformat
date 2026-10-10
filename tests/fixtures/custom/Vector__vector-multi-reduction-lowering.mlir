#map = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func @vector_multi_reduction(%arg0: vector<2x4xf32>, %arg1: vector<2xf32>) -> vector<2xf32> {
    %0 = vector.multi_reduction <mul>, %arg0, %arg1 [1] : vector<2x4xf32> to vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @vector_multi_reduction_to_scalar(%arg0: vector<2x4xf32>, %arg1: f32) -> f32 {
    %0 = vector.multi_reduction <mul>, %arg0, %arg1 [0, 1] : vector<2x4xf32> to f32
    return %0 : f32
  }
  func.func @vector_reduction_inner(%arg0: vector<2x3x4x5xi32>, %arg1: vector<2x3xi32>) -> vector<2x3xi32> {
    %0 = vector.multi_reduction <add>, %arg0, %arg1 [2, 3] : vector<2x3x4x5xi32> to vector<2x3xi32>
    return %0 : vector<2x3xi32>
  }
  func.func @vector_multi_reduction_transposed(%arg0: vector<2x3x4x5xf32>, %arg1: vector<2x5xf32>) -> vector<2x5xf32> {
    %0 = vector.multi_reduction <add>, %arg0, %arg1 [1, 2] : vector<2x3x4x5xf32> to vector<2x5xf32>
    return %0 : vector<2x5xf32>
  }
  func.func @vector_multi_reduction_ordering(%arg0: vector<3x2x4xf32>, %arg1: vector<2x4xf32>) -> vector<2x4xf32> {
    %0 = vector.multi_reduction <mul>, %arg0, %arg1 [0] : vector<3x2x4xf32> to vector<2x4xf32>
    return %0 : vector<2x4xf32>
  }
  func.func @vectorize_dynamic_reduction(%arg0: tensor<?x?xf32>, %arg1: tensor<?xf32>) -> tensor<?xf32> {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf32>
    %c1 = arith.constant 1 : index
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?xf32>
    %c0_1 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.create_mask %dim, %dim_0 : vector<4x8xi1>
    %1 = vector.mask %0 { vector.transfer_read %arg0[%c0_1, %c0_1], %cst {in_bounds = [true, true]} : tensor<?x?xf32>, vector<4x8xf32> } : vector<4x8xi1> -> vector<4x8xf32>
    %cst_2 = arith.constant 0.000000e+00 : f32
    %2 = vector.create_mask %dim : vector<4xi1>
    %3 = vector.mask %2 { vector.transfer_read %arg1[%c0_1], %cst_2 {in_bounds = [true]} : tensor<?xf32>, vector<4xf32> } : vector<4xi1> -> vector<4xf32>
    %4 = vector.mask %0 { vector.multi_reduction <add>, %1, %3 [1] : vector<4x8xf32> to vector<4xf32> } : vector<4x8xi1> -> vector<4xf32>
    %c0_3 = arith.constant 0 : index
    %5 = vector.mask %2 { vector.transfer_write %4, %arg1[%c0_3] {in_bounds = [true]} : vector<4xf32>, tensor<?xf32> } : vector<4xi1> -> tensor<?xf32>
    return %5 : tensor<?xf32>
  }
  func.func @vectorize_1d_dynamic_reduction(%arg0: tensor<?xf32>) -> f32 {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?xf32>
    %c0_0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.create_mask %dim : vector<8xi1>
    %1 = vector.mask %0 { vector.transfer_read %arg0[%c0_0], %cst {in_bounds = [true]} : tensor<?xf32>, vector<8xf32> } : vector<8xi1> -> vector<8xf32>
    %2 = vector.mask %0 { vector.multi_reduction <add>, %1, %cst [0] : vector<8xf32> to f32 } : vector<8xi1> -> f32
    return %2 : f32
  }
  func.func @vectorize_dynamic_transpose_reduction(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?x?xf32>
    %c1 = arith.constant 1 : index
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?x?xf32>
    %c2 = arith.constant 2 : index
    %dim_1 = tensor.dim %arg0, %c2 : tensor<?x?x?xf32>
    %c0_2 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.create_mask %dim, %dim_0, %dim_1 : vector<4x8x16xi1>
    %1 = vector.mask %0 { vector.transfer_read %arg0[%c0_2, %c0_2, %c0_2], %cst {in_bounds = [true, true, true]} : tensor<?x?x?xf32>, vector<4x8x16xf32> } : vector<4x8x16xi1> -> vector<4x8x16xf32>
    %cst_3 = arith.constant 0.000000e+00 : f32
    %2 = vector.create_mask %dim_1, %dim_0 : vector<16x8xi1>
    %3 = vector.mask %2 { vector.transfer_read %arg1[%c0_2, %c0_2], %cst_3 {in_bounds = [true, true], permutation_map = #map} : tensor<?x?xf32>, vector<8x16xf32> } : vector<16x8xi1> -> vector<8x16xf32>
    %4 = vector.mask %0 { vector.multi_reduction <add>, %1, %3 [0] : vector<4x8x16xf32> to vector<8x16xf32> } : vector<4x8x16xi1> -> vector<8x16xf32>
    %c0_4 = arith.constant 0 : index
    %5 = vector.mask %2 { vector.transfer_write %4, %arg1[%c0_4, %c0_4] {in_bounds = [true, true], permutation_map = #map} : vector<8x16xf32>, tensor<?x?xf32> } : vector<16x8xi1> -> tensor<?x?xf32>
    return %5 : tensor<?x?xf32>
  }
  func.func @vector_multi_reduction_parallel_middle(%arg0: vector<3x4x5xf32>, %arg1: vector<4xf32>) -> vector<4xf32> {
    %0 = vector.multi_reduction <add>, %arg0, %arg1 [0, 2] : vector<3x4x5xf32> to vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func private @vector_multi_reduction_non_scalable_dim(%arg0: vector<8x[4]x2xf32>, %arg1: vector<8x[4]xf32>) -> vector<8x[4]xf32> {
    %0 = vector.multi_reduction <add>, %arg0, %arg1 [2] : vector<8x[4]x2xf32> to vector<8x[4]xf32>
    return %0 : vector<8x[4]xf32>
  }
  func.func @vector_multi_reduction_scalable_dim_1d(%arg0: vector<[4]xf32>, %arg1: f32, %arg2: vector<[4]xi1>) -> f32 {
    %0 = vector.mask %arg2 { vector.multi_reduction <add>, %arg0, %arg1 [0] : vector<[4]xf32> to f32 } : vector<[4]xi1> -> f32
    return %0 : f32
  }
  func.func @vector_multi_reduction_scalable_dim_2d(%arg0: vector<2x[4]xf32>, %arg1: vector<2xf32>, %arg2: vector<2x[4]xi1>) -> vector<2xf32> {
    %0 = vector.mask %arg2 { vector.multi_reduction <add>, %arg0, %arg1 [1] : vector<2x[4]xf32> to vector<2xf32> } : vector<2x[4]xi1> -> vector<2xf32>
    return %0 : vector<2xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.lower_multi_reduction lowering_strategy = innerreduction
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
}

