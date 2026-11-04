#map = affine_map<(d0, d1)[s0] -> ((d1 - d0) ceildiv s0)>
#map1 = affine_map<(d0, d1)[s0] -> ((d0 - d1) ceildiv s0)>
module {
  func.func @init_and_dot(%arg0: tensor<64xf32>, %arg1: tensor<64xf32>, %arg2: tensor<f32>) -> tensor<f32> {
    %c64 = arith.constant 64 : index
    %cst = arith.constant 0.000000e+00 : f32
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %0 = linalg.fill ins(%cst : f32) outs(%arg2 : tensor<f32>) -> tensor<f32>
    %1 = affine.apply #map(%c0, %c64)[%c2]
    %2 = bufferization.alloc_tensor(%1) : tensor<?x2xf32>
    %3 = scf.for %arg3 = %c0 to %c64 step %c2 iter_args(%arg4 = %2) -> (tensor<?x2xf32>) {
      %8 = affine.apply #map1(%arg3, %c0)[%c2]
      %extracted_slice = tensor.extract_slice %arg1[%arg3] [2] [1] : tensor<64xf32> to tensor<2xf32>
      %cast = tensor.cast %extracted_slice : tensor<2xf32> to tensor<?xf32>
      %padded = tensor.pad %cast low[%c0] high[%c0] {
      ^bb0(%arg5: index):
        tensor.yield %cst : f32
      } : tensor<?xf32> to tensor<2xf32>
      %inserted_slice = tensor.insert_slice %padded into %arg4[%8, 0] [1, 2] [1, 1] : tensor<2xf32> into tensor<?x2xf32>
      scf.yield %inserted_slice : tensor<?x2xf32>
    }
    %4 = affine.apply #map(%c0, %c64)[%c2]
    %5 = bufferization.alloc_tensor(%4) : tensor<?x2xf32>
    %6 = scf.for %arg3 = %c0 to %c64 step %c2 iter_args(%arg4 = %5) -> (tensor<?x2xf32>) {
      %8 = affine.apply #map1(%arg3, %c0)[%c2]
      %extracted_slice = tensor.extract_slice %arg0[%arg3] [2] [1] : tensor<64xf32> to tensor<2xf32>
      %cast = tensor.cast %extracted_slice : tensor<2xf32> to tensor<?xf32>
      %padded = tensor.pad %cast low[%c0] high[%c0] {
      ^bb0(%arg5: index):
        tensor.yield %cst : f32
      } : tensor<?xf32> to tensor<2xf32>
      %inserted_slice = tensor.insert_slice %padded into %arg4[%8, 0] [1, 2] [1, 1] : tensor<2xf32> into tensor<?x2xf32>
      scf.yield %inserted_slice : tensor<?x2xf32>
    }
    %7 = scf.for %arg3 = %c0 to %c64 step %c2 iter_args(%arg4 = %0) -> (tensor<f32>) {
      %extracted_slice = tensor.extract_slice %arg0[%arg3] [2] [1] : tensor<64xf32> to tensor<2xf32>
      %cast = tensor.cast %extracted_slice : tensor<2xf32> to tensor<?xf32>
      %extracted_slice_0 = tensor.extract_slice %arg1[%arg3] [2] [1] : tensor<64xf32> to tensor<2xf32>
      %cast_1 = tensor.cast %extracted_slice_0 : tensor<2xf32> to tensor<?xf32>
      %8 = affine.apply #map1(%arg3, %c0)[%c2]
      %extracted_slice_2 = tensor.extract_slice %6[%8, 0] [1, 2] [1, 1] : tensor<?x2xf32> to tensor<2xf32>
      %9 = affine.apply #map1(%arg3, %c0)[%c2]
      %extracted_slice_3 = tensor.extract_slice %3[%9, 0] [1, 2] [1, 1] : tensor<?x2xf32> to tensor<2xf32>
      %10 = linalg.dot ins(%extracted_slice_2, %extracted_slice_3 : tensor<2xf32>, tensor<2xf32>) outs(%arg4 : tensor<f32>) -> tensor<f32>
      scf.yield %10 : tensor<f32>
    }
    return %7 : tensor<f32>
  }
  func.func @main() {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    %cst_1 = arith.constant 2.000000e+00 : f32
    %0 = bufferization.alloc_tensor() : tensor<64xf32>
    %1 = bufferization.alloc_tensor() : tensor<64xf32>
    %2 = bufferization.alloc_tensor() : tensor<f32>
    %3 = linalg.fill ins(%cst_0 : f32) outs(%0 : tensor<64xf32>) -> tensor<64xf32>
    %4 = linalg.fill ins(%cst_1 : f32) outs(%1 : tensor<64xf32>) -> tensor<64xf32>
    %5 = linalg.fill ins(%cst : f32) outs(%2 : tensor<f32>) -> tensor<f32>
    %6 = call @init_and_dot(%3, %4, %5) : (tensor<64xf32>, tensor<64xf32>, tensor<f32>) -> tensor<f32>
    %cast = tensor.cast %6 : tensor<f32> to tensor<*xf32>
    call @printMemrefF32(%cast) : (tensor<*xf32>) -> ()
    return
  }
  func.func private @printMemrefF32(tensor<*xf32>) attributes {llvm.emit_c_interface}
}

