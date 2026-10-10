module {
  func.func @matmul_tensors(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %c4 = arith.constant 4 : index
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %0, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %0, %c1 : tensor<?x?xf32>
    %dim_1 = tensor.dim %arg1, %c1 : tensor<?x?xf32>
    %1 = scf.for %arg3 = %c0 to %dim step %c2 iter_args(%arg4 = %arg2) -> (tensor<?x?xf32>) {
      %2 = scf.for %arg5 = %c0 to %dim_1 step %c3 iter_args(%arg6 = %arg4) -> (tensor<?x?xf32>) {
        %3 = scf.for %arg7 = %c0 to %dim_0 step %c4 iter_args(%arg8 = %arg6) -> (tensor<?x?xf32>) {
          %extracted_slice = tensor.extract_slice %0[%arg3, %arg7] [%c2, 4] [1, 1] : tensor<?x?xf32> to tensor<?x4xf32>
          %extracted_slice_2 = tensor.extract_slice %arg1[%arg7, %arg5] [4, %c3] [1, 1] : tensor<?x?xf32> to tensor<4x?xf32>
          %extracted_slice_3 = tensor.extract_slice %arg8[%arg3, %arg5] [%c2, %c3] [1, 1] : tensor<?x?xf32> to tensor<?x?xf32>
          %4 = linalg.matmul ins(%extracted_slice, %extracted_slice_2 : tensor<?x4xf32>, tensor<4x?xf32>) outs(%extracted_slice_3 : tensor<?x?xf32>) -> tensor<?x?xf32>
          %inserted_slice = tensor.insert_slice %4 into %arg8[%arg3, %arg5] [%c2, %c3] [1, 1] : tensor<?x?xf32> into tensor<?x?xf32>
          scf.yield %inserted_slice : tensor<?x?xf32>
        }
        scf.yield %3 : tensor<?x?xf32>
      }
      scf.yield %2 : tensor<?x?xf32>
    }
    return %1 : tensor<?x?xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
module {
  func.func @conv_tensors_static(%arg0: tensor<1x225x225x3xf32>, %arg1: tensor<3x3x3x32xf32>, %arg2: tensor<1x112x112x32xf32>) -> tensor<1x112x112x32xf32> {
    %c112 = arith.constant 112 : index
    %c32 = arith.constant 32 : index
    %c16 = arith.constant 16 : index
    %c8 = arith.constant 8 : index
    %c4 = arith.constant 4 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<1x112x112x32xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<1x112x112x32xf32>) -> tensor<1x112x112x32xf32>
    %2 = linalg.conv_2d_nhwc_hwcf {dilations = dense<1> : tensor<2xi64>, strides = dense<2> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<1x225x225x3xf32>, tensor<3x3x3x32xf32>) outs(%1 : tensor<1x112x112x32xf32>) -> tensor<1x112x112x32xf32>
    %3 = scf.for %arg3 = %c0 to %c112 step %c8 iter_args(%arg4 = %1) -> (tensor<1x112x112x32xf32>) {
      %4 = scf.for %arg5 = %c0 to %c112 step %c16 iter_args(%arg6 = %arg4) -> (tensor<1x112x112x32xf32>) {
        %5 = scf.for %arg7 = %c0 to %c32 step %c4 iter_args(%arg8 = %arg6) -> (tensor<1x112x112x32xf32>) {
          %extracted_slice = tensor.extract_slice %2[0, %arg3, %arg5, %arg7] [1, 8, 16, 4] [1, 1, 1, 1] : tensor<1x112x112x32xf32> to tensor<1x8x16x4xf32>
          %extracted_slice_0 = tensor.extract_slice %arg2[0, %arg3, %arg5, %arg7] [1, 8, 16, 4] [1, 1, 1, 1] : tensor<1x112x112x32xf32> to tensor<1x8x16x4xf32>
          %extracted_slice_1 = tensor.extract_slice %arg8[0, %arg3, %arg5, %arg7] [1, 8, 16, 4] [1, 1, 1, 1] : tensor<1x112x112x32xf32> to tensor<1x8x16x4xf32>
          %6 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%extracted_slice, %extracted_slice_0 : tensor<1x8x16x4xf32>, tensor<1x8x16x4xf32>) outs(%extracted_slice_1 : tensor<1x8x16x4xf32>) {
          ^bb0(%in: f32, %in_2: f32, %out: f32):
            %7 = arith.addf %in, %in_2 : f32
            linalg.yield %7 : f32
          } -> tensor<1x8x16x4xf32>
          %inserted_slice = tensor.insert_slice %6 into %arg8[0, %arg3, %arg5, %arg7] [1, 8, 16, 4] [1, 1, 1, 1] : tensor<1x8x16x4xf32> into tensor<1x112x112x32xf32>
          scf.yield %inserted_slice : tensor<1x112x112x32xf32>
        }
        scf.yield %5 : tensor<1x112x112x32xf32>
      }
      scf.yield %4 : tensor<1x112x112x32xf32>
    }
    return %3 : tensor<1x112x112x32xf32>
  }
}

// -----
#map = affine_map<(d0)[s0] -> (8, -d0 + s0)>
#map1 = affine_map<(d0)[s0] -> (16, -d0 + s0)>
#map2 = affine_map<(d0)[s0] -> (4, -d0 + s0)>
#map3 = affine_map<(d0)[s0] -> (2, -d0 + s0)>
#map4 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
module {
  func.func @conv_tensors_dynamic(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c4 = arith.constant 4 : index
    %c8 = arith.constant 8 : index
    %c16 = arith.constant 16 : index
    %dim = tensor.dim %arg2, %c0 : tensor<?x?x?x?xf32>
    %dim_0 = tensor.dim %arg2, %c1 : tensor<?x?x?x?xf32>
    %dim_1 = tensor.dim %arg2, %c2 : tensor<?x?x?x?xf32>
    %dim_2 = tensor.dim %arg2, %c3 : tensor<?x?x?x?xf32>
    %0 = tensor.empty(%dim, %dim_0, %dim_1, %dim_2) : tensor<?x?x?x?xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    %2 = linalg.conv_2d_nhwc_hwcf {dilations = dense<1> : tensor<2xi64>, strides = dense<2> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) outs(%1 : tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    %3 = scf.for %arg3 = %c0 to %dim step %c8 iter_args(%arg4 = %1) -> (tensor<?x?x?x?xf32>) {
      %4 = scf.for %arg5 = %c0 to %dim_0 step %c16 iter_args(%arg6 = %arg4) -> (tensor<?x?x?x?xf32>) {
        %5 = scf.for %arg7 = %c0 to %dim_1 step %c4 iter_args(%arg8 = %arg6) -> (tensor<?x?x?x?xf32>) {
          %6 = scf.for %arg9 = %c0 to %dim_2 step %c2 iter_args(%arg10 = %arg8) -> (tensor<?x?x?x?xf32>) {
            %7 = affine.min #map(%arg3)[%dim]
            %8 = affine.min #map1(%arg5)[%dim_0]
            %9 = affine.min #map2(%arg7)[%dim_1]
            %10 = affine.min #map3(%arg7)[%dim_2]
            %extracted_slice = tensor.extract_slice %2[%arg3, %arg5, %arg7, %arg9] [%7, %8, %9, %10] [1, 1, 1, 1] : tensor<?x?x?x?xf32> to tensor<?x?x?x?xf32>
            %extracted_slice_3 = tensor.extract_slice %arg2[%arg3, %arg5, %arg7, %arg9] [%7, %8, %9, %10] [1, 1, 1, 1] : tensor<?x?x?x?xf32> to tensor<?x?x?x?xf32>
            %extracted_slice_4 = tensor.extract_slice %arg10[%arg3, %arg5, %arg7, %arg9] [%7, %8, %9, %10] [1, 1, 1, 1] : tensor<?x?x?x?xf32> to tensor<?x?x?x?xf32>
            %11 = linalg.generic {indexing_maps = [#map4, #map4, #map4], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%extracted_slice, %extracted_slice_3 : tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) outs(%extracted_slice_4 : tensor<?x?x?x?xf32>) {
            ^bb0(%in: f32, %in_5: f32, %out: f32):
              %12 = arith.addf %in, %in_5 : f32
              linalg.yield %12 : f32
            } -> tensor<?x?x?x?xf32>
            %inserted_slice = tensor.insert_slice %11 into %arg10[%arg3, %arg5, %arg7, %arg9] [%7, %8, %9, %10] [1, 1, 1, 1] : tensor<?x?x?x?xf32> into tensor<?x?x?x?xf32>
            scf.yield %inserted_slice : tensor<?x?x?x?xf32>
          }
          scf.yield %6 : tensor<?x?x?x?xf32>
        }
        scf.yield %5 : tensor<?x?x?x?xf32>
      }
      scf.yield %4 : tensor<?x?x?x?xf32>
    }
    return %3 : tensor<?x?x?x?xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @pad_generic_static(%arg0: tensor<58x1xf32>, %arg1: tensor<64x128xf32>) -> tensor<64x128xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c32 = arith.constant 32 : index
    %cst = arith.constant 0.000000e+00 : f32
    %dim = tensor.dim %arg1, %c0 : tensor<64x128xf32>
    %dim_0 = tensor.dim %arg1, %c1 : tensor<64x128xf32>
    %padded = tensor.pad %arg0 low[4, 60] high[2, 67] {
    ^bb0(%arg2: index, %arg3: index):
      tensor.yield %cst : f32
    } : tensor<58x1xf32> to tensor<64x128xf32>
    %0 = linalg.fill ins(%cst : f32) outs(%arg1 : tensor<64x128xf32>) -> tensor<64x128xf32>
    %1 = scf.for %arg2 = %c0 to %dim step %c16 iter_args(%arg3 = %0) -> (tensor<64x128xf32>) {
      %2 = scf.for %arg4 = %c0 to %dim_0 step %c32 iter_args(%arg5 = %arg3) -> (tensor<64x128xf32>) {
        %extracted_slice = tensor.extract_slice %padded[%arg2, %arg4] [16, 32] [1, 1] : tensor<64x128xf32> to tensor<16x32xf32>
        %extracted_slice_1 = tensor.extract_slice %arg1[%arg2, %arg4] [16, 32] [1, 1] : tensor<64x128xf32> to tensor<16x32xf32>
        %extracted_slice_2 = tensor.extract_slice %arg5[%arg2, %arg4] [16, 32] [1, 1] : tensor<64x128xf32> to tensor<16x32xf32>
        %3 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%extracted_slice, %extracted_slice_1 : tensor<16x32xf32>, tensor<16x32xf32>) outs(%extracted_slice_2 : tensor<16x32xf32>) {
        ^bb0(%in: f32, %in_3: f32, %out: f32):
          %4 = arith.addf %in, %in_3 : f32
          linalg.yield %4 : f32
        } -> tensor<16x32xf32>
        %inserted_slice = tensor.insert_slice %3 into %arg5[%arg2, %arg4] [16, 32] [1, 1] : tensor<16x32xf32> into tensor<64x128xf32>
        scf.yield %inserted_slice : tensor<64x128xf32>
      }
      scf.yield %2 : tensor<64x128xf32>
    }
    return %1 : tensor<64x128xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map4 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map5 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @rank_reduced_extract_slice(%arg0: tensor<1x6x5xf32>, %arg1: tensor<1x5x6xf32>, %arg2: tensor<4x6xf32>, %arg3: tensor<1x6x6xf32>, %arg4: tensor<4x6xf32>, %arg5: tensor<4x2xf32>) -> tensor<4x6xf32> {
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %c6 = arith.constant 6 : index
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<1x6x5xf32>, tensor<1x5x6xf32>) outs(%arg3 : tensor<1x6x6xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %2 = arith.mulf %in, %in_0 : f32
      %3 = arith.addf %out, %2 : f32
      linalg.yield %3 : f32
    } -> tensor<1x6x6xf32>
    %1 = scf.for %arg6 = %c0 to %c6 step %c2 iter_args(%arg7 = %arg4) -> (tensor<4x6xf32>) {
      %extracted_slice = tensor.extract_slice %0[0, 0, %arg6] [1, 6, 2] [1, 1, 1] : tensor<1x6x6xf32> to tensor<6x2xf32>
      %2 = linalg.generic {indexing_maps = [#map3, #map4, #map5], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg2, %extracted_slice : tensor<4x6xf32>, tensor<6x2xf32>) outs(%arg5 : tensor<4x2xf32>) {
      ^bb0(%in: f32, %in_0: f32, %out: f32):
        %3 = arith.mulf %in, %in_0 : f32
        %4 = arith.addf %out, %3 : f32
        linalg.yield %4 : f32
      } -> tensor<4x2xf32>
      %inserted_slice = tensor.insert_slice %2 into %arg7[0, %arg6] [4, 2] [1, 1] : tensor<4x2xf32> into tensor<4x6xf32>
      scf.yield %inserted_slice : tensor<4x6xf32>
    }
    return %1 : tensor<4x6xf32>
  }
}

