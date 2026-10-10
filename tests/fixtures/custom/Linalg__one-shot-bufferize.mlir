module {
  func.func private @fill_inplace(%arg0: tensor<?xf32> {bufferization.writable = true}) -> tensor<?xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = linalg.fill ins(%cst : f32) outs(%arg0 : tensor<?xf32>) -> tensor<?xf32>
    return %0 : tensor<?xf32>
  }
}

// -----
module {
  func.func @not_inplace(%arg0: tensor<?xf32> {bufferization.writable = false}) -> tensor<?xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = linalg.fill ins(%cst : f32) outs(%arg0 : tensor<?xf32>) -> tensor<?xf32>
    return %0 : tensor<?xf32>
  }
}

// -----
module {
  func.func private @not_inplace(%arg0: tensor<?x?xf32> {bufferization.writable = true}) -> tensor<?x?xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = linalg.fill ins(%cst : f32) outs(%arg0 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %1 = linalg.matmul ins(%0, %0 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg0 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %1 : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @not_inplace(%arg0: tensor<?x?xf32> {bufferization.writable = true}) -> tensor<?x?xf32> {
    %0 = linalg.matmul ins(%arg0, %arg0 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg0 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @vec_inplace(%arg0: tensor<?xf32> {bufferization.writable = true}, %arg1: vector<4xf32>) -> tensor<?xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_write %arg1, %arg0[%c0] : vector<4xf32>, tensor<?xf32>
    return %0 : tensor<?xf32>
  }
}

// -----
module {
  func.func @vec_not_inplace(%arg0: tensor<?xf32> {bufferization.writable = true}, %arg1: vector<4xf32>) -> (tensor<?xf32>, tensor<?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = vector.transfer_write %arg1, %arg0[%c0] : vector<4xf32>, tensor<?xf32>
    %1 = vector.transfer_write %arg1, %arg0[%c1] : vector<4xf32>, tensor<?xf32>
    return %0, %1 : tensor<?xf32>, tensor<?xf32>
  }
}

// -----
module {
  func.func @matmul(%arg0: tensor<128x256xf32> {bufferization.buffer_layout = affine_map<(d0, d1) -> (d0, d1)>, bufferization.writable = false}, %arg1: tensor<256x192xf32> {bufferization.buffer_layout = affine_map<(d0, d1) -> (d0, d1)>, bufferization.writable = false}, %arg2: tensor<128x192xf32> {bufferization.buffer_layout = affine_map<(d0, d1) -> (d0, d1)>, bufferization.writable = true}) -> tensor<128x192xf32> {
    %c0 = arith.constant 0 : index
    %c256 = arith.constant 256 : index
    %c32 = arith.constant 32 : index
    %cst = arith.constant 0.000000e+00 : f32
    %c128 = arith.constant 128 : index
    %c192 = arith.constant 192 : index
    %c8 = arith.constant 8 : index
    %c16 = arith.constant 16 : index
    %0 = scf.for %arg3 = %c0 to %c128 step %c8 iter_args(%arg4 = %arg2) -> (tensor<128x192xf32>) {
      %extracted_slice = tensor.extract_slice %arg0[%arg3, 0] [8, 256] [1, 1] : tensor<128x256xf32> to tensor<8x256xf32>
      %1 = scf.for %arg5 = %c0 to %c192 step %c16 iter_args(%arg6 = %arg4) -> (tensor<128x192xf32>) {
        %extracted_slice_0 = tensor.extract_slice %arg1[0, %arg5] [256, 16] [1, 1] : tensor<256x192xf32> to tensor<256x16xf32>
        %extracted_slice_1 = tensor.extract_slice %arg2[%arg3, %arg5] [8, 16] [1, 1] : tensor<128x192xf32> to tensor<8x16xf32>
        %2 = linalg.fill ins(%cst : f32) outs(%extracted_slice_1 : tensor<8x16xf32>) -> tensor<8x16xf32>
        %3 = scf.for %arg7 = %c0 to %c256 step %c32 iter_args(%arg8 = %2) -> (tensor<8x16xf32>) {
          %extracted_slice_2 = tensor.extract_slice %extracted_slice[0, %arg7] [8, 32] [1, 1] : tensor<8x256xf32> to tensor<8x32xf32>
          %extracted_slice_3 = tensor.extract_slice %extracted_slice_0[%arg7, 0] [32, 16] [1, 1] : tensor<256x16xf32> to tensor<32x16xf32>
          %4 = linalg.matmul ins(%extracted_slice_2, %extracted_slice_3 : tensor<8x32xf32>, tensor<32x16xf32>) outs(%arg8 : tensor<8x16xf32>) -> tensor<8x16xf32>
          scf.yield %4 : tensor<8x16xf32>
        }
        %inserted_slice = tensor.insert_slice %3 into %arg6[%arg3, %arg5] [8, 16] [1, 1] : tensor<8x16xf32> into tensor<128x192xf32>
        scf.yield %inserted_slice : tensor<128x192xf32>
      }
      scf.yield %1 : tensor<128x192xf32>
    }
    return %0 : tensor<128x192xf32>
  }
}

// -----
module {
  func.func @dominance_violation_bug_1(%arg0: tensor<?x?xf32> {bufferization.writable = false}, %arg1: index) -> tensor<?x?xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %extracted_slice = tensor.extract_slice %arg0[0, 0] [%arg1, %arg1] [1, 1] : tensor<?x?xf32> to tensor<?x?xf32>
    %extracted_slice_0 = tensor.extract_slice %extracted_slice[0, 0] [4, 4] [1, 1] : tensor<?x?xf32> to tensor<4x4xf32>
    %0 = linalg.fill ins(%cst : f32) outs(%extracted_slice_0 : tensor<4x4xf32>) -> tensor<4x4xf32>
    %inserted_slice = tensor.insert_slice %0 into %extracted_slice[0, 0] [4, 4] [1, 1] : tensor<4x4xf32> into tensor<?x?xf32>
    %inserted_slice_1 = tensor.insert_slice %inserted_slice into %arg0[0, 0] [%arg1, %arg1] [1, 1] : tensor<?x?xf32> into tensor<?x?xf32>
    return %inserted_slice_1 : tensor<?x?xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func private @gather_like(%arg0: tensor<?x?xf32> {bufferization.writable = false}, %arg1: tensor<?xi32> {bufferization.writable = false}, %arg2: tensor<?x?xf32> {bufferization.writable = true}) -> tensor<?x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg1 : tensor<?xi32>) outs(%arg2 : tensor<?x?xf32>) {
    ^bb0(%in: i32, %out: f32):
      %1 = linalg.index 1 : index
      %2 = arith.index_cast %in : i32 to index
      %extracted = tensor.extract %arg0[%2, %1] : tensor<?x?xf32>
      linalg.yield %extracted : f32
    } -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
module {
  func.func @linalg_op_bufferizes_inplace_with_input(%arg0: tensor<?x?xf32> {bufferization.writable = true}, %arg1: tensor<?xf32> {bufferization.writable = true}, %arg2: tensor<?x?xf32> {bufferization.writable = true}, %arg3: index, %arg4: index, %arg5: f32) -> tensor<?x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?xf32>) outs(%arg2 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @op_is_reading_but_following_ops_are_not(%arg0: tensor<?xf32> {bufferization.writable = false}, %arg1: f32) -> tensor<?xf32> {
    %0 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel"]} outs(%arg0 : tensor<?xf32>) {
    ^bb0(%out: f32):
      %2 = arith.addf %arg1, %out : f32
      linalg.yield %2 : f32
    } -> tensor<?xf32>
    %1 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel"]} outs(%0 : tensor<?xf32>) {
    ^bb0(%out: f32):
      linalg.yield %arg1 : f32
    } -> tensor<?xf32>
    return %1 : tensor<?xf32>
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
  func.func @reduce(%arg0: tensor<16x32x64xf32>, %arg1: tensor<16x64xf32>) -> tensor<16x64xf32> {
    %reduced = linalg.reduce { arith.addf } ins(%arg0 : tensor<16x32x64xf32>) outs(%arg1 : tensor<16x64xf32>) dimensions = [1] 
    return %reduced : tensor<16x64xf32>
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
  func.func @broadcast(%arg0: tensor<8x32xf32>, %arg1: tensor<8x16x32xf32>) -> tensor<8x16x32xf32> {
    %broadcasted = linalg.broadcast ins(%arg0 : tensor<8x32xf32>) outs(%arg1 : tensor<8x16x32xf32>) dimensions = [1] 
    return %broadcasted : tensor<8x16x32xf32>
  }
}

// -----
#map = affine_map<(d0) -> (d0 ceildiv 8)>
module {
  func.func @depthwise_conv_1d_nwc_wc(%arg0: index, %arg1: index, %arg2: tensor<8x18x32xf32>) -> tensor<?x1x6x8xf32> {
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c8 = arith.constant 8 : index
    %0 = bufferization.alloc_tensor() : tensor<4x1x6x8xf32>
    %cast = tensor.cast %0 : tensor<4x1x6x8xf32> to tensor<?x1x6x8xf32>
    %1 = bufferization.alloc_tensor() : tensor<1x6x8xf32>
    %2 = scf.for %arg3 = %c0 to %c32 step %c8 iter_args(%arg4 = %cast) -> (tensor<?x1x6x8xf32>) {
      %3 = affine.apply #map(%arg3)
      %inserted_slice = tensor.insert_slice %1 into %arg4[%3, 0, 0, 0] [1, 1, 6, 8] [1, 1, 1, 1] : tensor<1x6x8xf32> into tensor<?x1x6x8xf32>
      scf.yield %inserted_slice : tensor<?x1x6x8xf32>
    }
    return %2 : tensor<?x1x6x8xf32>
  }
}

// -----
module {
  func.func @do_not_copy_alloc_tensors(%arg0: f32, %arg1: f32, %arg2: index) -> (tensor<5xf32>, tensor<5xf32>) {
    %0 = bufferization.alloc_tensor() : tensor<5xf32>
    %inserted = tensor.insert %arg0 into %0[%arg2] : tensor<5xf32>
    %inserted_0 = tensor.insert %arg1 into %0[%arg2] : tensor<5xf32>
    return %inserted, %inserted_0 : tensor<5xf32>, tensor<5xf32>
  }
}

