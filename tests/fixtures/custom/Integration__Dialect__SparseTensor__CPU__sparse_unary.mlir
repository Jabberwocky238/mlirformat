#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
module {
  func.func @vector_complement_sparse(%arg0: tensor<?xf64, #sparse>) -> tensor<?xi32, #sparse> {
    %c0 = arith.constant 0 : index
    %c1_i32 = arith.constant 1 : i32
    %dim = tensor.dim %arg0, %c0 : tensor<?xf64, #sparse>
    %0 = tensor.empty(%dim) : tensor<?xi32, #sparse>
    %1 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<?xf64, #sparse>) outs(%0 : tensor<?xi32, #sparse>) {
    ^bb0(%in: f64, %out: i32):
      %2 = sparse_tensor.unary %in : f64 to i32
       present = {
      }
       absent = {
        sparse_tensor.yield %c1_i32 : i32
      }
      linalg.yield %2 : i32
    } -> tensor<?xi32, #sparse>
    return %1 : tensor<?xi32, #sparse>
  }
  func.func @vector_complement_dense(%arg0: tensor<?xf64, #sparse>) -> tensor<?xi32> {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?xf64, #sparse>
    %0 = tensor.empty(%dim) : tensor<?xi32>
    %1 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<?xf64, #sparse>) outs(%0 : tensor<?xi32>) {
    ^bb0(%in: f64, %out: i32):
      %2 = sparse_tensor.unary %in : f64 to i32
       present = {
      }
       absent = {
        %c1_i32 = arith.constant 1 : i32
        sparse_tensor.yield %c1_i32 : i32
      }
      linalg.yield %2 : i32
    } -> tensor<?xi32>
    return %1 : tensor<?xi32>
  }
  func.func @vector_negation(%arg0: tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 1.000000e+00 : f64
    %dim = tensor.dim %arg0, %c0 : tensor<?xf64, #sparse>
    %0 = tensor.empty(%dim) : tensor<?xf64, #sparse>
    %1 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<?xf64, #sparse>) outs(%0 : tensor<?xf64, #sparse>) {
    ^bb0(%in: f64, %out: f64):
      %2 = sparse_tensor.unary %in : f64 to f64
       present = {
      ^bb0(%arg1: f64):
        %3 = arith.negf %arg1 : f64
        sparse_tensor.yield %3 : f64
      }
       absent = {
        sparse_tensor.yield %cst : f64
      }
      linalg.yield %2 : f64
    } -> tensor<?xf64, #sparse>
    return %1 : tensor<?xf64, #sparse>
  }
  func.func @vector_magnify(%arg0: tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse> {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?xf64, #sparse>
    %0 = tensor.empty(%dim) : tensor<?xf64, #sparse>
    %1 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<?xf64, #sparse>) outs(%0 : tensor<?xf64, #sparse>) {
    ^bb0(%in: f64, %out: f64):
      %2 = linalg.index 0 : index
      %3 = sparse_tensor.unary %in : f64 to f64
       present = {
      ^bb0(%arg1: f64):
        %4 = arith.index_cast %2 : index to i64
        %5 = arith.uitofp %4 : i64 to f64
        %6 = arith.mulf %arg1, %5 : f64
        sparse_tensor.yield %6 : f64
      }
       absent = {
      }
      linalg.yield %3 : f64
    } -> tensor<?xf64, #sparse>
    return %1 : tensor<?xf64, #sparse>
  }
  func.func @matrix_clip(%arg0: tensor<?x?xf64, #sparse1>) -> tensor<?x?xf64, #sparse1> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 3.000000e+00 : f64
    %cst_0 = arith.constant 7.000000e+00 : f64
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf64, #sparse1>
    %dim_1 = tensor.dim %arg0, %c1 : tensor<?x?xf64, #sparse1>
    %0 = tensor.empty(%dim, %dim_1) : tensor<?x?xf64, #sparse1>
    %1 = linalg.generic {indexing_maps = [#map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg0 : tensor<?x?xf64, #sparse1>) outs(%0 : tensor<?x?xf64, #sparse1>) {
    ^bb0(%in: f64, %out: f64):
      %2 = sparse_tensor.unary %in : f64 to f64
       present = {
      ^bb0(%arg1: f64):
        %3 = arith.cmpf ogt, %arg1, %cst : f64
        %4 = arith.select %3, %arg1, %cst : f64
        %5 = arith.cmpf olt, %4, %cst_0 : f64
        %6 = arith.select %5, %4, %cst_0 : f64
        sparse_tensor.yield %6 : f64
      }
       absent = {
      }
      linalg.yield %2 : f64
    } -> tensor<?x?xf64, #sparse1>
    return %1 : tensor<?x?xf64, #sparse1>
  }
  func.func @matrix_slice(%arg0: tensor<?x?xf64, #sparse1>) -> tensor<?x?xf64, #sparse1> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf64, #sparse1>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?xf64, #sparse1>
    %0 = tensor.empty(%dim, %dim_0) : tensor<?x?xf64, #sparse1>
    %1 = linalg.generic {indexing_maps = [#map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg0 : tensor<?x?xf64, #sparse1>) outs(%0 : tensor<?x?xf64, #sparse1>) {
    ^bb0(%in: f64, %out: f64):
      %2 = linalg.index 0 : index
      %3 = linalg.index 1 : index
      %4 = sparse_tensor.unary %in : f64 to f64
       present = {
      ^bb0(%arg1: f64):
        %cst = arith.constant 9.900000e+01 : f64
        %c2 = arith.constant 2 : index
        %5 = arith.muli %c2, %2 : index
        %6 = arith.muli %c2, %3 : index
        %7 = arith.cmpi ult, %5, %dim : index
        %8 = arith.select %7, %cst, %arg1 : f64
        %9 = arith.cmpi ult, %6, %dim_0 : index
        %10 = arith.select %9, %cst, %8 : f64
        sparse_tensor.yield %10 : f64
      }
       absent = {
      }
      linalg.yield %4 : f64
    } -> tensor<?x?xf64, #sparse1>
    return %1 : tensor<?x?xf64, #sparse1>
  }
  func.func @main() {
    %c-99_i32 = arith.constant -99 : i32
    %c0 = arith.constant 0 : index
    %cst = arith.constant sparse<[[0], [3], [11], [17], [20], [21], [28], [29], [31]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00, 9.000000e+00]> : tensor<32xf64>
    %0 = sparse_tensor.convert %cst : tensor<32xf64> to tensor<?xf64, #sparse>
    %cst_0 = arith.constant sparse<[[0, 0], [0, 1], [1, 7], [2, 2], [2, 4], [2, 7], [3, 0], [3, 2], [3, 3]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00, 9.000000e+00]> : tensor<4x8xf64>
    %1 = sparse_tensor.convert %cst_0 : tensor<4x8xf64> to tensor<?x?xf64, #sparse1>
    %2 = call @vector_complement_sparse(%0) : (tensor<?xf64, #sparse>) -> tensor<?xi32, #sparse>
    %3 = call @vector_negation(%0) : (tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>
    %4 = call @vector_magnify(%0) : (tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>
    %5 = call @matrix_clip(%1) : (tensor<?x?xf64, #sparse1>) -> tensor<?x?xf64, #sparse1>
    %6 = call @matrix_slice(%1) : (tensor<?x?xf64, #sparse1>) -> tensor<?x?xf64, #sparse1>
    %7 = call @vector_complement_dense(%0) : (tensor<?xf64, #sparse>) -> tensor<?xi32>
    sparse_tensor.print %0 : tensor<?xf64, #sparse>
    sparse_tensor.print %2 : tensor<?xi32, #sparse>
    sparse_tensor.print %3 : tensor<?xf64, #sparse>
    sparse_tensor.print %4 : tensor<?xf64, #sparse>
    sparse_tensor.print %5 : tensor<?x?xf64, #sparse1>
    sparse_tensor.print %6 : tensor<?x?xf64, #sparse1>
    %8 = vector.transfer_read %7[%c0], %c-99_i32 : tensor<?xi32>, vector<32xi32>
    vector.print %8 : vector<32xi32>
    bufferization.dealloc_tensor %0 : tensor<?xf64, #sparse>
    bufferization.dealloc_tensor %1 : tensor<?x?xf64, #sparse1>
    bufferization.dealloc_tensor %2 : tensor<?xi32, #sparse>
    bufferization.dealloc_tensor %3 : tensor<?xf64, #sparse>
    bufferization.dealloc_tensor %4 : tensor<?xf64, #sparse>
    bufferization.dealloc_tensor %5 : tensor<?x?xf64, #sparse1>
    bufferization.dealloc_tensor %6 : tensor<?x?xf64, #sparse1>
    bufferization.dealloc_tensor %7 : tensor<?xi32>
    return
  }
}

