module {
  func.func @gemm(%arg0: memref<?x?xf32>, %arg1: memref<?x?xf32>, %arg2: memref<?x?xf32>) {
    linalg.matmul ins(%arg0, %arg1 : memref<?x?xf32>, memref<?x?xf32>) outs(%arg2 : memref<?x?xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.convert_to_loops %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @gemm(%arg0: memref<?x?xf32>, %arg1: memref<?x?xf32>, %arg2: memref<?x?xf32>, %arg3: memref<?xf32>, %arg4: memref<?xf32>) {
    linalg.matmul ins(%arg0, %arg1 : memref<?x?xf32>, memref<?x?xf32>) outs(%arg2 : memref<?x?xf32>)
    linalg.matvec ins(%arg0, %arg3 : memref<?x?xf32>, memref<?xf32>) outs(%arg4 : memref<?xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match interface{TilingInterface} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.convert_to_loops %0 : (!transform.any_op) -> !transform.any_op
      %2:5 = transform.split_handle %1 : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
#map2 = affine_map<(d0, d1) -> (d0)>
#map3 = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func @indexed_generic(%arg0: memref<200x300xi32>, %arg1: memref<300xi16>, %arg2: memref<200xi8>, %arg3: memref<300x200xi64>) {
    linalg.generic {indexing_maps = [#map, #map1, #map2, #map3], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1, %arg2 : memref<200x300xi32>, memref<300xi16>, memref<200xi8>) outs(%arg3 : memref<300x200xi64>) {
    ^bb0(%in: i32, %in_0: i16, %in_1: i8, %out: i64):
      %0 = linalg.index 0 : index
      %1 = arith.index_cast %0 : index to i16
      %2 = arith.muli %in_0, %1 : i16
      %3 = linalg.index 1 : index
      %4 = arith.index_cast %3 : index to i8
      %5 = arith.muli %in_1, %4 : i8
      %6 = arith.extsi %2 : i16 to i32
      %7 = arith.extsi %5 : i8 to i32
      %8 = arith.addi %6, %7 : i32
      %9 = arith.addi %8, %in : i32
      %10 = arith.extsi %9 : i32 to i64
      linalg.yield %10 : i64
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.convert_to_loops %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @conv_strides_and_dilation(%arg0: memref<?x?x?x?xf32>, %arg1: memref<?x?x?x?xf32>, %arg2: memref<?x?x?x?xf32>) {
    linalg.conv_2d_nhwc_hwcf {dilations = dense<[3, 4]> : tensor<2xi64>, strides = dense<[1, 2]> : tensor<2xi64>} ins(%arg0, %arg1 : memref<?x?x?x?xf32>, memref<?x?x?x?xf32>) outs(%arg2 : memref<?x?x?x?xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.conv_2d_nhwc_hwcf"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.convert_to_loops %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pool_strides_and_dilation(%arg0: memref<?x?x?x?xf32>, %arg1: memref<?x?xf32>, %arg2: memref<?x?x?x?xf32>) {
    linalg.pooling_nhwc_max {dilations = dense<[3, 4]> : tensor<2xi64>, strides = dense<[1, 2]> : tensor<2xi64>} ins(%arg0, %arg1 : memref<?x?x?x?xf32>, memref<?x?xf32>) outs(%arg2 : memref<?x?x?x?xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pooling_nhwc_max"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.convert_to_loops %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @map(%arg0: memref<64xf32>, %arg1: memref<64xf32>, %arg2: memref<64xf32>) {
    linalg.map { arith.addf } ins(%arg0, %arg1 : memref<64xf32>, memref<64xf32>) outs(%arg2 : memref<64xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.map"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.convert_to_loops %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @transpose(%arg0: memref<16x32x64xf32>, %arg1: memref<32x64x16xf32>) {
    linalg.transpose ins(%arg0 : memref<16x32x64xf32>) outs(%arg1 : memref<32x64x16xf32>) permutation = [1, 2, 0] 
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.transpose"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.convert_to_loops %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @reduce(%arg0: memref<16x32x64xf32>, %arg1: memref<16x64xf32>) {
    linalg.reduce ins(%arg0 : memref<16x32x64xf32>) outs(%arg1 : memref<16x64xf32>) dimensions = [1] 
      (%in: f32, %init: f32) {
        %0 = arith.addf %in, %init : f32
        linalg.yield %0 : f32
      }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.reduce"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.convert_to_loops %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @broadcast(%arg0: memref<8x32xf32>, %arg1: memref<8x16x32xf32>) {
    linalg.broadcast ins(%arg0 : memref<8x32xf32>) outs(%arg1 : memref<8x16x32xf32>) dimensions = [1] 
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.broadcast"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.convert_to_loops %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

