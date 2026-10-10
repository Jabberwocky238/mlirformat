module {
  func.func @views(%arg0: index) {
    %c0 = arith.constant 0 : index
    %0 = arith.muli %arg0, %arg0 : index
    %alloc = memref.alloc(%0) : memref<?xi8>
    %view = memref.view %alloc[%c0][%arg0, %arg0] : memref<?xi8> to memref<?x?xf32>
    %view_0 = memref.view %alloc[%c0][%arg0, %arg0] : memref<?xi8> to memref<?x?xvector<4x4xf32>>
    memref.dealloc %alloc : memref<?xi8>
    return
  }
}

// -----
module {
  func.func @ops(%arg0: memref<?x?xf32, strided<[?, 1], offset: ?>>, %arg1: memref<?xf32, strided<[1], offset: ?>>, %arg2: memref<?xf32, strided<[1], offset: ?>>, %arg3: memref<f32>) {
    linalg.matmul ins(%arg0, %arg0 : memref<?x?xf32, strided<[?, 1], offset: ?>>, memref<?x?xf32, strided<[?, 1], offset: ?>>) outs(%arg0 : memref<?x?xf32, strided<[?, 1], offset: ?>>)
    linalg.matvec ins(%arg0, %arg1 : memref<?x?xf32, strided<[?, 1], offset: ?>>, memref<?xf32, strided<[1], offset: ?>>) outs(%arg2 : memref<?xf32, strided<[1], offset: ?>>)
    linalg.dot ins(%arg1, %arg2 : memref<?xf32, strided<[1], offset: ?>>, memref<?xf32, strided<[1], offset: ?>>) outs(%arg3 : memref<f32>)
    return
  }
}

// -----
module {
  func.func @fill_view(%arg0: memref<?xf32, strided<[1], offset: ?>>, %arg1: f32) {
    linalg.fill ins(%arg1 : f32) outs(%arg0 : memref<?xf32, strided<[1], offset: ?>>)
    return
  }
}

// -----
module {
  func.func @memref_transpose(%arg0: memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>) {
    %transpose = memref.transpose %arg0 (d0, d1, d2) -> (d2, d1, d0) : memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>> to memref<?x?x?xf32, strided<[1, ?, ?], offset: ?>>
    return
  }
}

// -----
module {
  func.func @fill_view3(%arg0: memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>, %arg1: f32) {
    linalg.fill ins(%arg1 : f32) outs(%arg0 : memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>)
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2) -> ()>
#map2 = affine_map<(d0, d1, d2) -> (d0, d2, d0 + d1)>
module {
  func.func @generic(%arg0: memref<?x?xvector<3x4xi4>, strided<[?, 1], offset: ?>>, %arg1: memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>) {
    %cst = arith.constant 0.000000e+00 : f32
    linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "parallel"], library_call = "some_external_function_name_1"} ins(%arg0, %cst : memref<?x?xvector<3x4xi4>, strided<[?, 1], offset: ?>>, f32) outs(%arg1 : memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>) attrs =  {foo = 1 : i64} {
    ^bb0(%in: vector<3x4xi4>, %in_0: f32, %out: f32):
      linalg.yield %in_0 : f32
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
module {
  func.func @generic_without_inputs(%arg0: memref<?x?x?xf32>) {
    linalg.generic {indexing_maps = [#map], iterator_types = ["parallel", "parallel", "parallel"]} outs(%arg0 : memref<?x?x?xf32>) {
    ^bb0(%out: f32):
      %cst = arith.constant 0.000000e+00 : f32
      linalg.yield %cst : f32
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2, d0 + d1)>
module {
  func.func @generic_with_tensor_input_and_output(%arg0: tensor<?x?xvector<3x4xi4>>, %arg1: tensor<?x?x?xf32>) -> tensor<?x?x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map1], iterator_types = ["parallel", "parallel", "parallel"], library_call = "some_external_function_name_1"} ins(%arg0, %arg1 : tensor<?x?xvector<3x4xi4>>, tensor<?x?x?xf32>) outs(%arg1 : tensor<?x?x?xf32>) attrs =  {foo = 1 : i64} {
    ^bb0(%in: vector<3x4xi4>, %in_0: f32, %out: f32):
      %cst = arith.constant 0.000000e+00 : f32
      linalg.yield %cst : f32
    } -> tensor<?x?x?xf32>
    return %0 : tensor<?x?x?xf32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
module {
  func.func @generic_with_multiple_tensor_outputs(%arg0: tensor<?xi32>, %arg1: tensor<?xi32>, %arg2: i32) -> (tensor<i32>, tensor<i32>) {
    %c0 = arith.constant 0 : index
    %0 = tensor.empty() : tensor<i32>
    %1 = linalg.fill ins(%arg2 : i32) outs(%0 : tensor<i32>) -> tensor<i32>
    %2 = tensor.empty() : tensor<i32>
    %3 = linalg.fill ins(%arg2 : i32) outs(%2 : tensor<i32>) -> tensor<i32>
    %4:2 = linalg.generic {indexing_maps = [#map, #map, #map1, #map1], iterator_types = ["reduction"]} ins(%arg0, %arg1 : tensor<?xi32>, tensor<?xi32>) outs(%1, %3 : tensor<i32>, tensor<i32>) {
    ^bb0(%in: i32, %in_0: i32, %out: i32, %out_1: i32):
      %5 = arith.cmpi sge, %in, %out : i32
      %6 = arith.select %5, %in, %out : i32
      %7 = arith.cmpi eq, %in, %out : i32
      %8 = arith.cmpi slt, %in_0, %out_1 : i32
      %9 = arith.select %8, %in_0, %out_1 : i32
      %10 = arith.select %5, %in_0, %out_1 : i32
      %11 = arith.select %7, %9, %10 : i32
      linalg.yield %6, %11 : i32, i32
    } -> (tensor<i32>, tensor<i32>)
    return %4#0, %4#1 : tensor<i32>, tensor<i32>
  }
}

// -----
#map = affine_map<(d0, d1) -> ()>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @generic_op_zero_rank(%arg0: tensor<f32>, %arg1: tensor<3x4xf32>) -> tensor<3x4xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel"], library_call = "some_broadcast_external_fn"} ins(%arg0 : tensor<f32>) outs(%arg1 : tensor<3x4xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<3x4xf32>
    return %0 : tensor<3x4xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2, d0 + d1)>
module {
  func.func @generic_region(%arg0: memref<?x?xvector<3x4xi4>, strided<[?, 1], offset: ?>>, %arg1: memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>) {
    linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel", "parallel"], library_call = "some_external_function_name_2"} ins(%arg0 : memref<?x?xvector<3x4xi4>, strided<[?, 1], offset: ?>>) outs(%arg1 : memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>) attrs =  {foo = 1 : i64} {
    ^bb0(%in: vector<3x4xi4>, %out: f32):
      %0 = linalg.index 0 : index
      %1 = linalg.index 1 : index
      %2 = linalg.index 2 : index
      linalg.yield %out : f32
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
module {
  func.func @named_ops(%arg0: memref<?x?x?xf32>, %arg1: memref<?x?x?xf32>, %arg2: memref<?x?x?xf32>, %arg3: tensor<?x?x?xf32>, %arg4: tensor<?x?x?xf32>, %arg5: tensor<?x?x?xf32>) -> (tensor<?x?x?xf32>, tensor<?x?x?xf32>) {
    linalg.batch_matmul ins(%arg0, %arg1 : memref<?x?x?xf32>, memref<?x?x?xf32>) outs(%arg2 : memref<?x?x?xf32>)
    linalg.contract indexing_maps = [#map, #map1, #map2] ins(%arg0, %arg1 : memref<?x?x?xf32>, memref<?x?x?xf32>) outs(%arg2 : memref<?x?x?xf32>)
    %0 = linalg.batch_matmul ins(%arg3, %arg4 : tensor<?x?x?xf32>, tensor<?x?x?xf32>) outs(%arg5 : tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    %1 = linalg.contract indexing_maps = [#map, #map1, #map2] ins(%arg3, %arg4 : tensor<?x?x?xf32>, tensor<?x?x?xf32>) outs(%arg5 : tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    return %0, %1 : tensor<?x?x?xf32>, tensor<?x?x?xf32>
  }
}

// -----
module {
  func.func @fill_tensor(%arg0: index, %arg1: index, %arg2: f32) -> tensor<?x?xf32> {
    %0 = tensor.empty(%arg0, %arg1) : tensor<?x?xf32>
    %1 = linalg.fill ins(%arg2 : f32) outs(%0 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %1 : tensor<?x?xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @mixed_parallel_reduced_results(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?x?xf32>, %arg3: tensor<?x?xf32>) -> (tensor<?x?x?xf32>, tensor<?x?xf32>) {
    %0:2 = linalg.generic {indexing_maps = [#map, #map1, #map, #map1], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<?x?x?xf32>, tensor<?x?xf32>) outs(%arg2, %arg3 : tensor<?x?x?xf32>, tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32, %out_1: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %1, %out_1 : f32
      linalg.yield %1, %2 : f32, f32
    } -> (tensor<?x?x?xf32>, tensor<?x?xf32>)
    return %0#0, %0#1 : tensor<?x?x?xf32>, tensor<?x?xf32>
  }
}

// -----
module {
  func.func @map_no_inputs(%arg0: tensor<64xf32>) -> tensor<64xf32> {
    %mapped = linalg.map outs(%arg0 : tensor<64xf32>)
      (%init: f32) {
        %cst = arith.constant 0.000000e+00 : f32
        linalg.yield %cst : f32
      }
    return %mapped : tensor<64xf32>
  }
}

// -----
module {
  func.func @map_binary(%arg0: tensor<64xf32>, %arg1: tensor<64xf32>, %arg2: tensor<64xf32>) -> tensor<64xf32> {
    %mapped = linalg.map { arith.addf } ins(%arg0, %arg1 : tensor<64xf32>, tensor<64xf32>) outs(%arg2 : tensor<64xf32>)
    return %mapped : tensor<64xf32>
  }
}

// -----
module {
  func.func @map_binary_memref(%arg0: memref<64xf32>, %arg1: memref<64xf32>, %arg2: memref<64xf32>) {
    linalg.map { arith.addf } ins(%arg0, %arg1 : memref<64xf32>, memref<64xf32>) outs(%arg2 : memref<64xf32>)
    return
  }
}

// -----
module {
  func.func @map_unary(%arg0: tensor<64xf32>, %arg1: tensor<64xf32>) -> tensor<64xf32> {
    %mapped = linalg.map { math.absf } ins(%arg0 : tensor<64xf32>) outs(%arg1 : tensor<64xf32>)
    return %mapped : tensor<64xf32>
  }
}

// -----
module {
  func.func @map_unary_memref(%arg0: memref<64xf32>, %arg1: memref<64xf32>) {
    linalg.map { math.absf } ins(%arg0 : memref<64xf32>) outs(%arg1 : memref<64xf32>)
    return
  }
}

// -----
module {
  func.func @reduce(%arg0: tensor<16x32x64xf32>, %arg1: tensor<16x64xf32>) -> tensor<16x64xf32> {
    %reduced = linalg.reduce { arith.addf } ins(%arg0 : tensor<16x32x64xf32>) outs(%arg1 : tensor<16x64xf32>) dimensions = [1] 
    return %reduced : tensor<16x64xf32>
  }
}

// -----
module {
  func.func @reduce_not_short_form_compatible(%arg0: tensor<16x32x64xf32>, %arg1: tensor<16x64xf32>) -> tensor<16x64xf32> {
    %reduced = linalg.reduce ins(%arg0 : tensor<16x32x64xf32>) outs(%arg1 : tensor<16x64xf32>) dimensions = [1] 
      (%in: f32, %init: f32) {
        %0 = arith.addf %in, %init : f32
        linalg.yield %in : f32
      }
    return %reduced : tensor<16x64xf32>
  }
}

// -----
module {
  func.func @reduce_memref(%arg0: memref<16x32x64xf32>, %arg1: memref<16x64xf32>) {
    linalg.reduce { arith.addf } ins(%arg0 : memref<16x32x64xf32>) outs(%arg1 : memref<16x64xf32>) dimensions = [1] 
    return
  }
}

// -----
module {
  func.func @variadic_reduce(%arg0: tensor<16x32x64xf32>, %arg1: tensor<16x64xf32>, %arg2: tensor<16x32x64xi64>, %arg3: tensor<16x64xi64>) -> (tensor<16x64xf32>, tensor<16x64xi64>) {
    %reduced:2 = linalg.reduce ins(%arg0, %arg2 : tensor<16x32x64xf32>, tensor<16x32x64xi64>) outs(%arg1, %arg3 : tensor<16x64xf32>, tensor<16x64xi64>) dimensions = [1] 
      (%in: f32, %in_0: i64, %init: f32, %init_1: i64) {
        %0 = arith.addf %in, %init : f32
        %1 = arith.addi %in_0, %init_1 : i64
        linalg.yield %0, %1 : f32, i64
      }
    return %reduced#0, %reduced#1 : tensor<16x64xf32>, tensor<16x64xi64>
  }
}

// -----
module {
  func.func @variadic_reduce_memref(%arg0: memref<16x32x64xf32>, %arg1: memref<16x64xf32>, %arg2: memref<16x32x64xi64>, %arg3: memref<16x64xi64>) {
    linalg.reduce ins(%arg0, %arg2 : memref<16x32x64xf32>, memref<16x32x64xi64>) outs(%arg1, %arg3 : memref<16x64xf32>, memref<16x64xi64>) dimensions = [1] 
      (%in: f32, %in_0: i64, %init: f32, %init_1: i64) {
        %0 = arith.addf %in, %init : f32
        %1 = arith.addi %in_0, %init_1 : i64
        linalg.yield %0, %1 : f32, i64
      }
    return
  }
}

// -----
module {
  func.func @transpose(%arg0: tensor<16x32x64xf32>, %arg1: tensor<32x64x16xf32>) -> tensor<32x64x16xf32> {
    %transposed = linalg.transpose ins(%arg0 : tensor<16x32x64xf32>) outs(%arg1 : tensor<32x64x16xf32>) permutation = [1, 2, 0] 
    return %transposed : tensor<32x64x16xf32>
  }
}

// -----
module {
  func.func @transpose_memref(%arg0: memref<16x32x64xf32>, %arg1: memref<32x64x16xf32>) {
    linalg.transpose ins(%arg0 : memref<16x32x64xf32>) outs(%arg1 : memref<32x64x16xf32>) permutation = [1, 2, 0] 
    return
  }
}

// -----
module {
  func.func @broadcast_static_sizes(%arg0: tensor<8x32xf32>, %arg1: tensor<8x16x32xf32>) -> tensor<8x16x32xf32> {
    %broadcasted = linalg.broadcast ins(%arg0 : tensor<8x32xf32>) outs(%arg1 : tensor<8x16x32xf32>) dimensions = [1] 
    return %broadcasted : tensor<8x16x32xf32>
  }
}

// -----
module {
  func.func @broadcast_with_dynamic_sizes(%arg0: tensor<8x?xf32>, %arg1: tensor<8x16x?xf32>) -> tensor<8x16x?xf32> {
    %broadcasted = linalg.broadcast ins(%arg0 : tensor<8x?xf32>) outs(%arg1 : tensor<8x16x?xf32>) dimensions = [1] 
    return %broadcasted : tensor<8x16x?xf32>
  }
}

// -----
module {
  func.func @broadcast_memref(%arg0: memref<8x32xf32>, %arg1: memref<8x16x32xf32>) {
    linalg.broadcast ins(%arg0 : memref<8x32xf32>) outs(%arg1 : memref<8x16x32xf32>) dimensions = [1] 
    return
  }
}

// -----
module {
  func.func @map_arith_with_attr(%arg0: tensor<64xf32>, %arg1: tensor<64xf32>, %arg2: tensor<64xf32>) -> tensor<64xf32> {
    %mapped = linalg.map { arith.addf {fastmath = #arith.fastmath<fast>} } ins(%arg0, %arg1 : tensor<64xf32>, tensor<64xf32>) outs(%arg2 : tensor<64xf32>)
    return %mapped : tensor<64xf32>
  }
}

// -----
module {
  func.func @map_not_short_form_compatible(%arg0: tensor<1x32xf32>, %arg1: tensor<1x32xf32>, %arg2: tensor<1x32xf32>) -> tensor<1x32xf32> {
    %mapped = linalg.map ins(%arg0, %arg1 : tensor<1x32xf32>, tensor<1x32xf32>) outs(%arg2 : tensor<1x32xf32>)
      (%in: f32, %in_0: f32, %init: f32) {
        %0 = arith.maximumf %in, %in_0 : f32
        linalg.yield %in : f32
      }
    return %mapped : tensor<1x32xf32>
  }
}

// -----
module {
  func.func @reduce_arith_with_attr(%arg0: tensor<16x32x64xf32>, %arg1: tensor<16x64xf32>) -> tensor<16x64xf32> {
    %reduced = linalg.reduce { arith.addf {fastmath = #arith.fastmath<fast>} } ins(%arg0 : tensor<16x32x64xf32>) outs(%arg1 : tensor<16x64xf32>) dimensions = [1] 
    return %reduced : tensor<16x64xf32>
  }
}

// -----
module {
  func.func @softmax(%arg0: tensor<2x16x32xf32>) -> tensor<2x16x32xf32> {
    %0 = tensor.empty() : tensor<2x16x32xf32>
    %1 = linalg.softmax dimension(2) ins(%arg0 : tensor<2x16x32xf32>) outs(%0 : tensor<2x16x32xf32>) -> tensor<2x16x32xf32>
    return %1 : tensor<2x16x32xf32>
  }
}

// -----
module {
  func.func @winograd(%arg0: tensor<2x6x6x5xf32>, %arg1: tensor<2x3x3x5xf32>, %arg2: tensor<1xf32>, %arg3: tensor<2x4x4x2xf32>) -> tensor<2x4x4x2xf32> {
    %0 = tensor.empty() : tensor<6x6x5x2xf32>
    %1 = linalg.winograd_filter_transform fmr(F_4_3) ins(%arg1 : tensor<2x3x3x5xf32>) outs(%0 : tensor<6x6x5x2xf32>) -> tensor<6x6x5x2xf32>
    %2 = tensor.empty() : tensor<6x6x1x1x2x5xf32>
    %3 = linalg.winograd_input_transform fmr(F_4_3) ins(%arg0 : tensor<2x6x6x5xf32>) outs(%2 : tensor<6x6x1x1x2x5xf32>) -> tensor<6x6x1x1x2x5xf32>
    %collapsed = tensor.collapse_shape %1 [[0, 1], [2], [3]] : tensor<6x6x5x2xf32> into tensor<36x5x2xf32>
    %collapsed_0 = tensor.collapse_shape %3 [[0, 1], [2, 3, 4], [5]] : tensor<6x6x1x1x2x5xf32> into tensor<36x2x5xf32>
    %4 = tensor.empty() : tensor<36x2x2xf32>
    %5 = linalg.batch_matmul ins(%collapsed_0, %collapsed : tensor<36x2x5xf32>, tensor<36x5x2xf32>) outs(%4 : tensor<36x2x2xf32>) -> tensor<36x2x2xf32>
    %expanded = tensor.expand_shape %5 [[0, 1], [2, 3, 4], [5]] output_shape [6, 6, 1, 1, 2, 2] : tensor<36x2x2xf32> into tensor<6x6x1x1x2x2xf32>
    %6 = linalg.winograd_output_transform fmr(F_4_3) ins(%expanded : tensor<6x6x1x1x2x2xf32>) outs(%arg3 : tensor<2x4x4x2xf32>) -> tensor<2x4x4x2xf32>
    return %6 : tensor<2x4x4x2xf32>
  }
}

// -----
module {
  func.func @winograd_filter_dyn(%arg0: tensor<?x3x3x?xf32>, %arg1: tensor<6x6x?x?xf32>) -> tensor<6x6x?x?xf32> {
    %0 = linalg.winograd_filter_transform fmr(F_4_3) ins(%arg0 : tensor<?x3x3x?xf32>) outs(%arg1 : tensor<6x6x?x?xf32>) -> tensor<6x6x?x?xf32>
    return %0 : tensor<6x6x?x?xf32>
  }
}

// -----
module {
  func.func @winograd_input_dyn(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<6x6x?x?x?x?xf32>) -> tensor<6x6x?x?x?x?xf32> {
    %0 = linalg.winograd_input_transform fmr(F_4_3) ins(%arg0 : tensor<?x?x?x?xf32>) outs(%arg1 : tensor<6x6x?x?x?x?xf32>) -> tensor<6x6x?x?x?x?xf32>
    return %0 : tensor<6x6x?x?x?x?xf32>
  }
}

// -----
module {
  func.func @winograd_output_dyn(%arg0: tensor<6x6x?x?x?x?xf32>, %arg1: tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> {
    %0 = linalg.winograd_output_transform fmr(F_4_3) ins(%arg0 : tensor<6x6x?x?x?x?xf32>) outs(%arg1 : tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    return %0 : tensor<?x?x?x?xf32>
  }
}

// -----
module {
  func.func @conv2d_channel_first_q(%arg0: tensor<100x3x224x224xi32>, %arg1: tensor<64x3x5x5xi32>, %arg2: i32, %arg3: i32) -> tensor<100x64x220x220xi32> {
    %cst = arith.constant dense<0> : tensor<100x64x220x220xi32>
    %0 = linalg.conv_2d_nchw_fchw_q {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1, %arg2, %arg3 : tensor<100x3x224x224xi32>, tensor<64x3x5x5xi32>, i32, i32) outs(%cst : tensor<100x64x220x220xi32>) -> tensor<100x64x220x220xi32>
    return %0 : tensor<100x64x220x220xi32>
  }
}

// -----
module {
  func.func @conv2d_channel_first_q_promote(%arg0: tensor<100x3x224x224xi8>, %arg1: tensor<64x3x5x5xi8>, %arg2: i8, %arg3: i8) -> tensor<100x64x220x220xi32> {
    %cst = arith.constant dense<0> : tensor<100x64x220x220xi32>
    %0 = linalg.conv_2d_nchw_fchw_q {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1, %arg2, %arg3 : tensor<100x3x224x224xi8>, tensor<64x3x5x5xi8>, i8, i8) outs(%cst : tensor<100x64x220x220xi32>) -> tensor<100x64x220x220xi32>
    return %0 : tensor<100x64x220x220xi32>
  }
}

