#map = affine_map<()[s0] -> (s0 * 16)>
#map1 = affine_map<()[s0] -> ((s0 floordiv 32) * 16)>
#map2 = affine_map<(d0)[s0] -> (d0 + s0)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map4 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map5 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @matmul(%arg0: memref<32x32xf32>, %arg1: memref<32x32xf32>, %arg2: memref<32x32xf32>) {
    %c8 = arith.constant 8 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant dense<0.000000e+00> : vector<16x16xf32>
    %c16 = arith.constant 16 : index
    %c32 = arith.constant 32 : index
    %cst_0 = arith.constant 0.000000e+00 : f32
    %thread_id_x = gpu.thread_id  x
    %thread_id_y = gpu.thread_id  y
    %0 = affine.apply #map()[%thread_id_y]
    %1 = affine.apply #map1()[%thread_id_x]
    %2 = scf.for %arg3 = %c0 to %c32 step %c16 iter_args(%arg4 = %cst) -> (vector<16x16xf32>) {
      %5 = affine.apply #map2(%c0)[%0]
      %6 = affine.apply #map2(%c0)[%arg3]
      %7 = vector.transfer_read %arg0[%5, %6], %cst_0 {in_bounds = [true, true]} : memref<32x32xf32>, vector<16x16xf32>
      %8 = affine.apply #map2(%c0)[%1]
      %9 = affine.apply #map2(%c0)[%arg3]
      %10 = vector.transfer_read %arg1[%9, %8], %cst_0 {in_bounds = [true, true]} : memref<32x32xf32>, vector<16x16xf32>
      %11 = vector.contract {indexing_maps = [#map3, #map4, #map5], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %7, %10, %arg4 : vector<16x16xf32>, vector<16x16xf32> into vector<16x16xf32>
      scf.yield %11 : vector<16x16xf32>
    }
    %3 = affine.apply #map2(%c0)[%0]
    %4 = affine.apply #map2(%c0)[%1]
    vector.transfer_write %2, %arg2[%3, %4] {in_bounds = [true, true]} : vector<16x16xf32>, memref<32x32xf32>
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.gpu.unroll_vectors_subgroup_mma[16, 16, 8]
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
}

// -----
#map = affine_map<()[s0] -> (s0 * 16)>
#map1 = affine_map<()[s0] -> ((s0 floordiv 32) * 16)>
#map2 = affine_map<(d0)[s0] -> (d0 + s0)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map4 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map5 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @gathered_matmul(%arg0: memref<32x32xf32>, %arg1: memref<32x32xf32>, %arg2: memref<32x32xf32>) {
    %c8 = arith.constant 8 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant dense<0.000000e+00> : vector<16x16xf32>
    %cst_0 = arith.constant dense<true> : vector<4x4xi1>
    %cst_1 = arith.constant dense<0.000000e+00> : vector<4x4xf32>
    %c16 = arith.constant 16 : index
    %c32 = arith.constant 32 : index
    %cst_2 = arith.constant 0.000000e+00 : f32
    %cst_3 = arith.constant dense<[0, 1, 2, 3]> : vector<4xindex>
    %cst_4 = arith.constant dense<1> : vector<4x4xindex>
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<32x32xf32>
    %thread_id_x = gpu.thread_id  x
    %thread_id_y = gpu.thread_id  y
    %0 = affine.apply #map()[%thread_id_y]
    %1 = affine.apply #map1()[%thread_id_x]
    %2 = scf.for %arg3 = %c0 to %c32 step %c16 iter_args(%arg4 = %cst) -> (vector<16x16xf32>) {
      %5 = vector.broadcast %arg3 : index to vector<4xindex>
      %6 = arith.addi %5, %cst_3 : vector<4xindex>
      %7 = vector.broadcast %6 : vector<4xindex> to vector<4x4xindex>
      %8 = arith.addi %7, %cst_4 : vector<4x4xindex>
      %9 = vector.gather %arg0[%c0, %c0] [%8], %cst_0, %cst_1 : memref<32x32xf32>, vector<4x4xindex>, vector<4x4xi1>, vector<4x4xf32> into vector<4x4xf32>
      vector.transfer_write %9, %alloc[%c0, %c0] {in_bounds = [true, true]} : vector<4x4xf32>, memref<32x32xf32>
      gpu.barrier
      %10 = affine.apply #map2(%c0)[%0]
      %11 = affine.apply #map2(%c0)[%arg3]
      %12 = vector.transfer_read %alloc[%10, %11], %cst_2 {in_bounds = [true, true]} : memref<32x32xf32>, vector<16x16xf32>
      %13 = affine.apply #map2(%c0)[%1]
      %14 = affine.apply #map2(%c0)[%arg3]
      %15 = vector.transfer_read %arg1[%14, %13], %cst_2 {in_bounds = [true, true]} : memref<32x32xf32>, vector<16x16xf32>
      %16 = vector.contract {indexing_maps = [#map3, #map4, #map5], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %12, %15, %arg4 : vector<16x16xf32>, vector<16x16xf32> into vector<16x16xf32>
      scf.yield %16 : vector<16x16xf32>
    }
    %3 = affine.apply #map2(%c0)[%0]
    %4 = affine.apply #map2(%c0)[%1]
    vector.transfer_write %2, %arg2[%3, %4] {in_bounds = [true, true]} : vector<16x16xf32>, memref<32x32xf32>
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.gpu.unroll_vectors_subgroup_mma[8, 16, 4]
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
}

