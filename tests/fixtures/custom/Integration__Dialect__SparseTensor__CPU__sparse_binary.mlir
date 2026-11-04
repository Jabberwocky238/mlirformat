#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
module {
  func.func @vector_min(%arg0: tensor<?xi32, #sparse>, %arg1: tensor<?xi32, #sparse>) -> tensor<?xi32, #sparse> {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?xi32, #sparse>
    %0 = tensor.empty(%dim) : tensor<?xi32, #sparse>
    %1 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<?xi32, #sparse>, tensor<?xi32, #sparse>) outs(%0 : tensor<?xi32, #sparse>) {
    ^bb0(%in: i32, %in_0: i32, %out: i32):
      %2 = sparse_tensor.binary %in, %in_0 : i32, i32 to i32
       overlap = {
      ^bb0(%arg2: i32, %arg3: i32):
        %3 = arith.minsi %arg2, %arg3 : i32
        sparse_tensor.yield %3 : i32
      }
       left = identity
       right = identity
      linalg.yield %2 : i32
    } -> tensor<?xi32, #sparse>
    return %1 : tensor<?xi32, #sparse>
  }
  func.func @vector_mul(%arg0: tensor<?xf64, #sparse>, %arg1: tensor<?xf64>) -> tensor<?xf64, #sparse> {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?xf64, #sparse>
    %0 = tensor.empty(%dim) : tensor<?xf64, #sparse>
    %1 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<?xf64, #sparse>, tensor<?xf64>) outs(%0 : tensor<?xf64, #sparse>) {
    ^bb0(%in: f64, %in_0: f64, %out: f64):
      %2 = sparse_tensor.binary %in, %in_0 : f64, f64 to f64
       overlap = {
      ^bb0(%arg2: f64, %arg3: f64):
        %3 = arith.mulf %arg2, %arg3 : f64
        sparse_tensor.yield %3 : f64
      }
       left = {
      }
       right = {
      }
      linalg.yield %2 : f64
    } -> tensor<?xf64, #sparse>
    return %1 : tensor<?xf64, #sparse>
  }
  func.func @vector_setdiff(%arg0: tensor<?xf64, #sparse>, %arg1: tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse> {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?xf64, #sparse>
    %0 = tensor.empty(%dim) : tensor<?xf64, #sparse>
    %1 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<?xf64, #sparse>, tensor<?xf64, #sparse>) outs(%0 : tensor<?xf64, #sparse>) {
    ^bb0(%in: f64, %in_0: f64, %out: f64):
      %2 = sparse_tensor.binary %in, %in_0 : f64, f64 to f64
       overlap = {
      }
       left = identity
       right = {
      }
      linalg.yield %2 : f64
    } -> tensor<?xf64, #sparse>
    return %1 : tensor<?xf64, #sparse>
  }
  func.func @vector_index(%arg0: tensor<?xf64, #sparse>) -> tensor<?xi32, #sparse> {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?xf64, #sparse>
    %0 = tensor.empty(%dim) : tensor<?xi32, #sparse>
    %1 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<?xf64, #sparse>) outs(%0 : tensor<?xi32, #sparse>) {
    ^bb0(%in: f64, %out: i32):
      %2 = linalg.index 0 : index
      %3 = sparse_tensor.binary %in, %2 : f64, index to i32
       overlap = {
      ^bb0(%arg1: f64, %arg2: index):
        %4 = arith.index_cast %arg2 : index to i32
        sparse_tensor.yield %4 : i32
      }
       left = {
      }
       right = {
      }
      linalg.yield %3 : i32
    } -> tensor<?xi32, #sparse>
    return %1 : tensor<?xi32, #sparse>
  }
  func.func @matrix_intersect(%arg0: tensor<?x?xf64, #sparse1>, %arg1: tensor<?x?xf64, #sparse1>) -> tensor<?x?xf64, #sparse1> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf64, #sparse1>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?xf64, #sparse1>
    %0 = tensor.empty(%dim, %dim_0) : tensor<?x?xf64, #sparse1>
    %1 = linalg.generic {doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map1, #map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<?x?xf64, #sparse1>, tensor<?x?xf64, #sparse1>) outs(%0 : tensor<?x?xf64, #sparse1>) {
    ^bb0(%in: f64, %in_1: f64, %out: f64):
      %2 = sparse_tensor.binary %in, %in_1 : f64, f64 to f64
       overlap = {
      ^bb0(%arg2: f64, %arg3: f64):
        %3 = arith.addf %arg2, %arg3 : f64
        sparse_tensor.yield %3 : f64
      }
       left = {
      }
       right = {
      ^bb0(%arg2: f64):
        %3 = arith.negf %arg2 : f64
        sparse_tensor.yield %3 : f64
      }
      linalg.yield %2 : f64
    } -> tensor<?x?xf64, #sparse1>
    return %1 : tensor<?x?xf64, #sparse1>
  }
  func.func @add_tensor_1(%arg0: tensor<4x4xf64, #sparse1>, %arg1: tensor<4x4xf64, #sparse1>) -> tensor<4x4xf64, #sparse1> {
    %0 = tensor.empty() : tensor<4x4xf64, #sparse1>
    %1 = linalg.generic {doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map1, #map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<4x4xf64, #sparse1>, tensor<4x4xf64, #sparse1>) outs(%0 : tensor<4x4xf64, #sparse1>) {
    ^bb0(%in: f64, %in_0: f64, %out: f64):
      %2 = sparse_tensor.binary %in, %in_0 : f64, f64 to f64
       overlap = {
      ^bb0(%arg2: f64, %arg3: f64):
        %3 = arith.addf %arg2, %arg3 : f64
        sparse_tensor.yield %3 : f64
      }
       left = identity
       right = identity
      linalg.yield %2 : f64
    } -> tensor<4x4xf64, #sparse1>
    return %1 : tensor<4x4xf64, #sparse1>
  }
  func.func @add_tensor_2(%arg0: tensor<4x4xf64, #sparse1>, %arg1: tensor<4x4xf64, #sparse1>) -> tensor<4x4xf64, #sparse1> {
    %0 = tensor.empty() : tensor<4x4xf64, #sparse1>
    %1 = linalg.generic {doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map1, #map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<4x4xf64, #sparse1>, tensor<4x4xf64, #sparse1>) outs(%0 : tensor<4x4xf64, #sparse1>) {
    ^bb0(%in: f64, %in_0: f64, %out: f64):
      %2 = sparse_tensor.binary %in, %in_0 : f64, f64 to f64
       overlap = {
      ^bb0(%arg2: f64, %arg3: f64):
        %3 = arith.addf %arg2, %arg3 : f64
        sparse_tensor.yield %3 : f64
      }
       left = {
      ^bb0(%arg2: f64):
        sparse_tensor.yield %arg2 : f64
      }
       right = {
      ^bb0(%arg2: f64):
        sparse_tensor.yield %arg2 : f64
      }
      linalg.yield %2 : f64
    } -> tensor<4x4xf64, #sparse1>
    return %1 : tensor<4x4xf64, #sparse1>
  }
  func.func @triangular(%arg0: tensor<4x4xf64, #sparse1>, %arg1: tensor<4x4xf64, #sparse1>) -> tensor<4x4xf64, #sparse1> {
    %0 = tensor.empty() : tensor<4x4xf64, #sparse1>
    %1 = linalg.generic {doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map1, #map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<4x4xf64, #sparse1>, tensor<4x4xf64, #sparse1>) outs(%0 : tensor<4x4xf64, #sparse1>) {
    ^bb0(%in: f64, %in_0: f64, %out: f64):
      %2 = linalg.index 0 : index
      %3 = linalg.index 1 : index
      %4 = sparse_tensor.binary %in, %in_0 : f64, f64 to f64
       overlap = {
      ^bb0(%arg2: f64, %arg3: f64):
        %5 = arith.cmpi uge, %3, %2 : index
        %6 = arith.addf %arg2, %arg3 : f64
        %7 = arith.subf %arg2, %arg3 : f64
        %8 = arith.select %5, %6, %7 : f64
        sparse_tensor.yield %8 : f64
      }
       left = identity
       right = {
      ^bb0(%arg2: f64):
        %5 = arith.cmpi uge, %3, %2 : index
        %6 = arith.negf %arg2 : f64
        %7 = arith.select %5, %arg2, %6 : f64
        sparse_tensor.yield %7 : f64
      }
      linalg.yield %4 : f64
    } -> tensor<4x4xf64, #sparse1>
    return %1 : tensor<4x4xf64, #sparse1>
  }
  func.func @sub_with_thres(%arg0: tensor<4x4xf64, #sparse1>, %arg1: tensor<4x4xf64, #sparse1>) -> tensor<4x4xf64, #sparse1> {
    %0 = tensor.empty() : tensor<4x4xf64, #sparse1>
    %cst = arith.constant 2.000000e+00 : f64
    %cst_0 = arith.constant -2.000000e+00 : f64
    %1 = linalg.generic {doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map1, #map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<4x4xf64, #sparse1>, tensor<4x4xf64, #sparse1>) outs(%0 : tensor<4x4xf64, #sparse1>) {
    ^bb0(%in: f64, %in_1: f64, %out: f64):
      %2 = sparse_tensor.binary %in, %in_1 : f64, f64 to f64
       overlap = {
      ^bb0(%arg2: f64, %arg3: f64):
        %cst_2 = arith.constant 1.000000e+00 : f64
        %cst_3 = arith.constant -1.000000e+00 : f64
        %3 = arith.subf %arg2, %arg3 : f64
        %4 = arith.cmpf oge, %3, %cst_2 : f64
        %5 = arith.select %4, %cst_2, %3 : f64
        %6 = arith.cmpf ole, %5, %cst_3 : f64
        %7 = arith.select %6, %cst_3, %5 : f64
        sparse_tensor.yield %7 : f64
      }
       left = {
      ^bb0(%arg2: f64):
        %3 = arith.cmpf oge, %arg2, %cst : f64
        %4 = arith.select %3, %cst, %arg2 : f64
        %5 = arith.cmpf ole, %4, %cst_0 : f64
        %6 = arith.select %5, %cst_0, %4 : f64
        sparse_tensor.yield %6 : f64
      }
       right = {
      ^bb0(%arg2: f64):
        %3 = arith.negf %arg2 : f64
        %4 = arith.cmpf oge, %3, %cst : f64
        %5 = arith.select %4, %cst, %3 : f64
        %6 = arith.cmpf ole, %5, %cst_0 : f64
        %7 = arith.select %6, %cst_0, %5 : f64
        sparse_tensor.yield %7 : f64
      }
      linalg.yield %2 : f64
    } -> tensor<4x4xf64, #sparse1>
    return %1 : tensor<4x4xf64, #sparse1>
  }
  func.func @intersect_equal(%arg0: tensor<4x4xf64, #sparse1>, %arg1: tensor<4x4xf64, #sparse1>) -> tensor<4x4xi8, #sparse1> {
    %0 = tensor.empty() : tensor<4x4xi8, #sparse1>
    %1 = linalg.generic {doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map1, #map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<4x4xf64, #sparse1>, tensor<4x4xf64, #sparse1>) outs(%0 : tensor<4x4xi8, #sparse1>) {
    ^bb0(%in: f64, %in_0: f64, %out: i8):
      %2 = sparse_tensor.binary %in, %in_0 : f64, f64 to i8
       overlap = {
      ^bb0(%arg2: f64, %arg3: f64):
        %3 = arith.cmpf oeq, %arg2, %arg3 : f64
        %4 = arith.extui %3 : i1 to i8
        sparse_tensor.yield %4 : i8
      }
       left = {
      }
       right = {
      }
      linalg.yield %2 : i8
    } -> tensor<4x4xi8, #sparse1>
    return %1 : tensor<4x4xi8, #sparse1>
  }
  func.func @only_left_right(%arg0: tensor<4x4xf64, #sparse1>, %arg1: tensor<4x4xf64, #sparse1>) -> tensor<4x4xf64, #sparse1> {
    %0 = tensor.empty() : tensor<4x4xf64, #sparse1>
    %1 = linalg.generic {doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map1, #map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<4x4xf64, #sparse1>, tensor<4x4xf64, #sparse1>) outs(%0 : tensor<4x4xf64, #sparse1>) {
    ^bb0(%in: f64, %in_0: f64, %out: f64):
      %2 = sparse_tensor.binary %in, %in_0 : f64, f64 to f64
       overlap = {
      }
       left = identity
       right = {
      ^bb0(%arg2: f64):
        %3 = arith.negf %arg2 : f64
        sparse_tensor.yield %3 : f64
      }
      linalg.yield %2 : f64
    } -> tensor<4x4xf64, #sparse1>
    return %1 : tensor<4x4xf64, #sparse1>
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %cst = arith.constant sparse<[[0], [3], [11], [17], [20], [21], [28], [29], [31]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00, 9.000000e+00]> : tensor<32xf64>
    %cst_0 = arith.constant sparse<[[1], [3], [4], [10], [16], [18], [21], [28], [29], [31]], [1.100000e+01, 1.200000e+01, 1.300000e+01, 1.400000e+01, 1.500000e+01, 1.600000e+01, 1.700000e+01, 1.800000e+01, 1.900000e+01, 2.000000e+01]> : tensor<32xf64>
    %cst_1 = arith.constant dense<[0.000000e+00, 1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00, 9.000000e+00, 0.000000e+00, 1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00, 9.000000e+00, 0.000000e+00, 1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00, 9.000000e+00, 0.000000e+00, 1.000000e+00]> : tensor<32xf64>
    %0 = arith.fptosi %cst : tensor<32xf64> to tensor<32xi32>
    %1 = arith.fptosi %cst_0 : tensor<32xf64> to tensor<32xi32>
    %2 = sparse_tensor.convert %cst : tensor<32xf64> to tensor<?xf64, #sparse>
    %3 = sparse_tensor.convert %cst_0 : tensor<32xf64> to tensor<?xf64, #sparse>
    %4 = sparse_tensor.convert %0 : tensor<32xi32> to tensor<?xi32, #sparse>
    %5 = sparse_tensor.convert %1 : tensor<32xi32> to tensor<?xi32, #sparse>
    %cast = tensor.cast %cst_1 : tensor<32xf64> to tensor<?xf64>
    %cst_2 = arith.constant sparse<[[0, 0], [0, 1], [1, 7], [2, 2], [2, 4], [2, 7], [3, 0], [3, 2], [3, 3]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00, 9.000000e+00]> : tensor<4x8xf64>
    %cst_3 = arith.constant sparse<[[0, 0], [0, 7], [1, 0], [1, 6], [2, 1], [2, 7]], [6.000000e+00, 5.000000e+00, 4.000000e+00, 3.000000e+00, 2.000000e+00, 1.000000e+00]> : tensor<4x8xf64>
    %6 = sparse_tensor.convert %cst_2 : tensor<4x8xf64> to tensor<?x?xf64, #sparse1>
    %7 = sparse_tensor.convert %cst_3 : tensor<4x8xf64> to tensor<?x?xf64, #sparse1>
    %cst_4 = arith.constant dense<[[1.000000e+00, 0.000000e+00, 3.000000e+00, 0.000000e+00], [0.000000e+00, 2.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 4.000000e+00], [3.000000e+00, 4.000000e+00, 0.000000e+00, 0.000000e+00]]> : tensor<4x4xf64>
    %cst_5 = arith.constant dense<[[1.000000e+00, 0.000000e+00, 1.000000e+00, 1.000000e+00], [0.000000e+00, 5.000000e-01, 0.000000e+00, 0.000000e+00], [1.000000e+00, 5.000000e+00, 2.000000e+00, 0.000000e+00], [2.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00]]> : tensor<4x4xf64>
    %8 = sparse_tensor.convert %cst_4 : tensor<4x4xf64> to tensor<4x4xf64, #sparse1>
    %9 = sparse_tensor.convert %cst_5 : tensor<4x4xf64> to tensor<4x4xf64, #sparse1>
    %10 = call @vector_min(%4, %5) : (tensor<?xi32, #sparse>, tensor<?xi32, #sparse>) -> tensor<?xi32, #sparse>
    %11 = call @vector_mul(%2, %cast) : (tensor<?xf64, #sparse>, tensor<?xf64>) -> tensor<?xf64, #sparse>
    %12 = call @vector_setdiff(%2, %3) : (tensor<?xf64, #sparse>, tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>
    %13 = call @vector_index(%2) : (tensor<?xf64, #sparse>) -> tensor<?xi32, #sparse>
    %14 = call @matrix_intersect(%6, %7) : (tensor<?x?xf64, #sparse1>, tensor<?x?xf64, #sparse1>) -> tensor<?x?xf64, #sparse1>
    %15 = call @add_tensor_1(%8, %9) : (tensor<4x4xf64, #sparse1>, tensor<4x4xf64, #sparse1>) -> tensor<4x4xf64, #sparse1>
    %16 = call @add_tensor_2(%8, %9) : (tensor<4x4xf64, #sparse1>, tensor<4x4xf64, #sparse1>) -> tensor<4x4xf64, #sparse1>
    %17 = call @triangular(%8, %9) : (tensor<4x4xf64, #sparse1>, tensor<4x4xf64, #sparse1>) -> tensor<4x4xf64, #sparse1>
    %18 = call @sub_with_thres(%8, %9) : (tensor<4x4xf64, #sparse1>, tensor<4x4xf64, #sparse1>) -> tensor<4x4xf64, #sparse1>
    %19 = call @intersect_equal(%8, %9) : (tensor<4x4xf64, #sparse1>, tensor<4x4xf64, #sparse1>) -> tensor<4x4xi8, #sparse1>
    %20 = call @only_left_right(%8, %9) : (tensor<4x4xf64, #sparse1>, tensor<4x4xf64, #sparse1>) -> tensor<4x4xf64, #sparse1>
    sparse_tensor.print %2 : tensor<?xf64, #sparse>
    sparse_tensor.print %3 : tensor<?xf64, #sparse>
    sparse_tensor.print %10 : tensor<?xi32, #sparse>
    sparse_tensor.print %11 : tensor<?xf64, #sparse>
    sparse_tensor.print %12 : tensor<?xf64, #sparse>
    sparse_tensor.print %13 : tensor<?xi32, #sparse>
    sparse_tensor.print %14 : tensor<?x?xf64, #sparse1>
    sparse_tensor.print %15 : tensor<4x4xf64, #sparse1>
    sparse_tensor.print %16 : tensor<4x4xf64, #sparse1>
    sparse_tensor.print %17 : tensor<4x4xf64, #sparse1>
    sparse_tensor.print %18 : tensor<4x4xf64, #sparse1>
    sparse_tensor.print %19 : tensor<4x4xi8, #sparse1>
    sparse_tensor.print %20 : tensor<4x4xf64, #sparse1>
    bufferization.dealloc_tensor %2 : tensor<?xf64, #sparse>
    bufferization.dealloc_tensor %3 : tensor<?xf64, #sparse>
    bufferization.dealloc_tensor %4 : tensor<?xi32, #sparse>
    bufferization.dealloc_tensor %5 : tensor<?xi32, #sparse>
    bufferization.dealloc_tensor %6 : tensor<?x?xf64, #sparse1>
    bufferization.dealloc_tensor %7 : tensor<?x?xf64, #sparse1>
    bufferization.dealloc_tensor %8 : tensor<4x4xf64, #sparse1>
    bufferization.dealloc_tensor %9 : tensor<4x4xf64, #sparse1>
    bufferization.dealloc_tensor %10 : tensor<?xi32, #sparse>
    bufferization.dealloc_tensor %11 : tensor<?xf64, #sparse>
    bufferization.dealloc_tensor %12 : tensor<?xf64, #sparse>
    bufferization.dealloc_tensor %13 : tensor<?xi32, #sparse>
    bufferization.dealloc_tensor %14 : tensor<?x?xf64, #sparse1>
    bufferization.dealloc_tensor %15 : tensor<4x4xf64, #sparse1>
    bufferization.dealloc_tensor %16 : tensor<4x4xf64, #sparse1>
    bufferization.dealloc_tensor %17 : tensor<4x4xf64, #sparse1>
    bufferization.dealloc_tensor %18 : tensor<4x4xf64, #sparse1>
    bufferization.dealloc_tensor %19 : tensor<4x4xi8, #sparse1>
    bufferization.dealloc_tensor %20 : tensor<4x4xf64, #sparse1>
    return
  }
}

