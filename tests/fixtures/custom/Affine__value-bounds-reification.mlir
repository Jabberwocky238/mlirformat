module {
  func.func @reify_through_chain(%arg0: index, %arg1: index) -> (index, index, index) {
    %c2 = arith.constant 2 : index
    %0 = tensor.empty(%arg0, %arg1) : tensor<?x10x?xf32>
    %cast = tensor.cast %0 : tensor<?x10x?xf32> to tensor<?x?x?xf32>
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %inserted = tensor.insert %cst into %cast[%c0, %c0, %c0] : tensor<?x?x?xf32>
    %dim = tensor.dim %inserted, %c2 : tensor<?x?x?xf32>
    %1 = "test.reify_bound"(%inserted) <{dim = 0 : i64, type = "EQ"}> : (tensor<?x?x?xf32>) -> index
    %2 = "test.reify_bound"(%inserted) <{dim = 1 : i64, type = "EQ"}> : (tensor<?x?x?xf32>) -> index
    %3 = "test.reify_bound"(%dim) <{type = "EQ"}> : (index) -> index
    return %1, %2, %3 : index, index, index
  }
}

// -----
#map = affine_map<(d0)[s0] -> (-d0 + s0, 4)>
module {
  func.func @reify_slice_bound(%arg0: tensor<?x?xi32>, %arg1: index, %arg2: index, %arg3: i32) {
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    scf.for %arg4 = %c0 to %arg2 step %c4 {
      %0 = affine.min #map(%arg4)[%arg2]
      %extracted_slice = tensor.extract_slice %arg0[%arg1, %arg4] [1, %0] [1, 1] : tensor<?x?xi32> to tensor<1x?xi32>
      %1 = linalg.fill ins(%arg3 : i32) outs(%extracted_slice : tensor<1x?xi32>) -> tensor<1x?xi32>
      %2 = "test.reify_bound"(%1) <{dim = 1 : i64, type = "UB"}> : (tensor<1x?xi32>) -> index
      "test.some_use"(%2) : (index) -> ()
      %3 = "test.reify_bound"(%1) <{constant, dim = 1 : i64, type = "UB"}> : (tensor<1x?xi32>) -> index
      "test.some_use"(%3) : (index) -> ()
    }
    return
  }
}

// -----
#map = affine_map<(d0)[s0] -> (-d0 + s0)>
module {
  func.func @scf_for(%arg0: index, %arg1: index, %arg2: index) {
    scf.for %arg3 = %arg0 to %arg1 step %arg2 {
      %0 = affine.apply #map(%arg3)[%arg1]
      %1 = "test.reify_bound"(%0) <{type = "UB"}> : (index) -> index
      "test.some_use"(%1) : (index) -> ()
    }
    return
  }
}

// -----
#map = affine_map<(d0)[s0] -> (-d0 + s0, 128)>
#map1 = affine_map<()[s0] -> ((s0 floordiv 32) * 32)>
#map2 = affine_map<(d0)[s0] -> (-d0 + s0)>
module {
  func.func @reify_slice_bound2(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: tensor<1x?xi8>, %arg5: tensor<?x?xi8>, %arg6: tensor<1x?xi32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    scf.for %arg7 = %arg0 to %arg1 step %arg2 {
      %0 = affine.min #map(%arg7)[%arg1]
      %1 = "test.reify_bound"(%0) <{type = "UB"}> : (index) -> index
      "test.some_use"(%1) : (index) -> ()
      %2 = affine.apply #map1()[%0]
      %3 = "test.reify_bound"(%2) <{type = "UB"}> : (index) -> index
      "test.some_use"(%3) : (index) -> ()
      %4 = "test.reify_bound"(%2) <{constant, type = "UB"}> : (index) -> index
      "test.some_use"(%4) : (index) -> ()
      scf.for %arg8 = %2 to %0 step %c32 {
        %5 = affine.apply #map2(%arg8)[%0]
        %6 = "test.reify_bound"(%5) <{type = "UB"}> : (index) -> index
        "test.some_use"(%6) : (index) -> ()
        scf.for %arg9 = %c0 to %arg3 step %c1 {
          %extracted_slice = tensor.extract_slice %arg4[0, %arg9] [1, 1] [1, 1] : tensor<1x?xi8> to tensor<1x1xi8>
          %extracted_slice_0 = tensor.extract_slice %arg5[%arg9, 0] [1, %5] [1, 1] : tensor<?x?xi8> to tensor<1x?xi8>
          %extracted_slice_1 = tensor.extract_slice %arg6[0, 0] [1, %5] [1, 1] : tensor<1x?xi32> to tensor<1x?xi32>
          %7 = linalg.matmul ins(%extracted_slice, %extracted_slice_0 : tensor<1x1xi8>, tensor<1x?xi8>) outs(%extracted_slice_1 : tensor<1x?xi32>) -> tensor<1x?xi32>
          %8 = "test.reify_bound"(%7) <{dim = 1 : i64, type = "UB"}> : (tensor<1x?xi32>) -> index
          "test.some_use"(%8) : (index) -> ()
          %9 = "test.reify_bound"(%7) <{constant, dim = 1 : i64, type = "UB"}> : (tensor<1x?xi32>) -> index
          "test.some_use"(%9) : (index) -> ()
        }
      }
    }
    return
  }
}

