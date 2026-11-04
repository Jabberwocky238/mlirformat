#map = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @sparse_cast_s32_to_f32(%arg0: tensor<10xi32, #sparse>, %arg1: tensor<10xf32>) -> tensor<10xf32> {
    %0 = linalg.generic {doc = "X(i) = cast A(i)", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<10xi32, #sparse>) outs(%arg1 : tensor<10xf32>) {
    ^bb0(%in: i32, %out: f32):
      %1 = arith.sitofp %in : i32 to f32
      linalg.yield %1 : f32
    } -> tensor<10xf32>
    return %0 : tensor<10xf32>
  }
  func.func @sparse_cast_u32_to_f32(%arg0: tensor<10xi32, #sparse>, %arg1: tensor<10xf32>) -> tensor<10xf32> {
    %0 = linalg.generic {doc = "X(i) = cast A(i)", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<10xi32, #sparse>) outs(%arg1 : tensor<10xf32>) {
    ^bb0(%in: i32, %out: f32):
      %1 = arith.uitofp %in : i32 to f32
      linalg.yield %1 : f32
    } -> tensor<10xf32>
    return %0 : tensor<10xf32>
  }
  func.func @sparse_cast_f32_to_s32(%arg0: tensor<10xf32, #sparse>, %arg1: tensor<10xi32>) -> tensor<10xi32> {
    %0 = linalg.generic {doc = "X(i) = cast A(i)", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<10xf32, #sparse>) outs(%arg1 : tensor<10xi32>) {
    ^bb0(%in: f32, %out: i32):
      %1 = arith.fptosi %in : f32 to i32
      linalg.yield %1 : i32
    } -> tensor<10xi32>
    return %0 : tensor<10xi32>
  }
  func.func @sparse_cast_f64_to_u32(%arg0: tensor<10xf64, #sparse>, %arg1: tensor<10xi32>) -> tensor<10xi32> {
    %0 = linalg.generic {doc = "X(i) = cast A(i)", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<10xf64, #sparse>) outs(%arg1 : tensor<10xi32>) {
    ^bb0(%in: f64, %out: i32):
      %1 = arith.fptoui %in : f64 to i32
      linalg.yield %1 : i32
    } -> tensor<10xi32>
    return %0 : tensor<10xi32>
  }
  func.func @sparse_cast_f32_to_f64(%arg0: tensor<10xf32, #sparse>, %arg1: tensor<10xf64>) -> tensor<10xf64> {
    %0 = linalg.generic {doc = "X(i) = cast A(i)", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<10xf32, #sparse>) outs(%arg1 : tensor<10xf64>) {
    ^bb0(%in: f32, %out: f64):
      %1 = arith.extf %in : f32 to f64
      linalg.yield %1 : f64
    } -> tensor<10xf64>
    return %0 : tensor<10xf64>
  }
  func.func @sparse_cast_f64_to_f32(%arg0: tensor<10xf64, #sparse>, %arg1: tensor<10xf32>) -> tensor<10xf32> {
    %0 = linalg.generic {doc = "X(i) = cast A(i)", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<10xf64, #sparse>) outs(%arg1 : tensor<10xf32>) {
    ^bb0(%in: f64, %out: f32):
      %1 = arith.truncf %in : f64 to f32
      linalg.yield %1 : f32
    } -> tensor<10xf32>
    return %0 : tensor<10xf32>
  }
  func.func @sparse_cast_s32_to_u64(%arg0: tensor<10xi32, #sparse>, %arg1: tensor<10xi64>) -> tensor<10xi64> {
    %0 = linalg.generic {doc = "X(i) = cast A(i)", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<10xi32, #sparse>) outs(%arg1 : tensor<10xi64>) {
    ^bb0(%in: i32, %out: i64):
      %1 = arith.extsi %in : i32 to i64
      linalg.yield %1 : i64
    } -> tensor<10xi64>
    return %0 : tensor<10xi64>
  }
  func.func @sparse_cast_u32_to_s64(%arg0: tensor<10xi32, #sparse>, %arg1: tensor<10xi64>) -> tensor<10xi64> {
    %0 = linalg.generic {doc = "X(i) = cast A(i)", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<10xi32, #sparse>) outs(%arg1 : tensor<10xi64>) {
    ^bb0(%in: i32, %out: i64):
      %1 = arith.extui %in : i32 to i64
      linalg.yield %1 : i64
    } -> tensor<10xi64>
    return %0 : tensor<10xi64>
  }
  func.func @sparse_cast_i32_to_i8(%arg0: tensor<10xi32, #sparse>, %arg1: tensor<10xi8>) -> tensor<10xi8> {
    %0 = linalg.generic {doc = "X(i) = cast A(i)", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<10xi32, #sparse>) outs(%arg1 : tensor<10xi8>) {
    ^bb0(%in: i32, %out: i8):
      %1 = arith.trunci %in : i32 to i8
      linalg.yield %1 : i8
    } -> tensor<10xi8>
    return %0 : tensor<10xi8>
  }
  func.func @sparse_cast_f32_as_s32(%arg0: tensor<10xf32, #sparse>, %arg1: tensor<10xi32>) -> tensor<10xi32> {
    %0 = linalg.generic {doc = "X(i) = cast A(i)", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<10xf32, #sparse>) outs(%arg1 : tensor<10xi32>) {
    ^bb0(%in: f32, %out: i32):
      %1 = arith.bitcast %in : f32 to i32
      linalg.yield %1 : i32
    } -> tensor<10xi32>
    return %0 : tensor<10xi32>
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c0_i8 = arith.constant 0 : i8
    %c0_i32 = arith.constant 0 : i32
    %c0_i64 = arith.constant 0 : i64
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 0.000000e+00 : f64
    %cst_1 = arith.constant dense<0> : tensor<10xi8>
    %cst_2 = arith.constant dense<0.000000e+00> : tensor<10xf64>
    %cst_3 = arith.constant dense<0.000000e+00> : tensor<10xf32>
    %cst_4 = arith.constant dense<0> : tensor<10xi32>
    %cst_5 = arith.constant dense<0> : tensor<10xi64>
    %cst_6 = arith.constant dense<[-4, -3, -2, -1, 0, 1, 2, 3, 4, 305]> : tensor<10xi32>
    %0 = sparse_tensor.convert %cst_6 : tensor<10xi32> to tensor<10xi32, #sparse>
    %cst_7 = arith.constant dense<[-4.400000e+00, -3.300000e+00, -2.200000e+00, -1.100000e+00, 0.000000e+00, 1.100000e+00, 2.200000e+00, 3.300000e+00, 4.400000e+00, 3.055000e+02]> : tensor<10xf32>
    %1 = sparse_tensor.convert %cst_7 : tensor<10xf32> to tensor<10xf32, #sparse>
    %cst_8 = arith.constant dense<[-4.400000e+00, -3.300000e+00, -2.200000e+00, -1.100000e+00, 0.000000e+00, 1.100000e+00, 2.200000e+00, 3.300000e+00, 4.400000e+00, 3.055000e+02]> : tensor<10xf64>
    %2 = sparse_tensor.convert %cst_8 : tensor<10xf64> to tensor<10xf64, #sparse>
    %cst_9 = arith.constant dense<[0x41EFFFFFFFE00000, 0x41EFFFFFFFC00000, 0x41EFFFFFFFA00000, 0x41EFFFFFFF800000, 0.000000e+00, 1.100000e+00, 2.200000e+00, 3.300000e+00, 4.400000e+00, 3.055000e+02]> : tensor<10xf64>
    %3 = sparse_tensor.convert %cst_9 : tensor<10xf64> to tensor<10xf64, #sparse>
    %4 = call @sparse_cast_s32_to_f32(%0, %cst_3) : (tensor<10xi32, #sparse>, tensor<10xf32>) -> tensor<10xf32>
    %5 = vector.transfer_read %4[%c0], %cst : tensor<10xf32>, vector<10xf32>
    vector.print %5 : vector<10xf32>
    %6 = call @sparse_cast_u32_to_f32(%0, %cst_3) : (tensor<10xi32, #sparse>, tensor<10xf32>) -> tensor<10xf32>
    %7 = vector.transfer_read %6[%c0], %cst : tensor<10xf32>, vector<10xf32>
    vector.print %7 : vector<10xf32>
    %8 = call @sparse_cast_f32_to_s32(%1, %cst_4) : (tensor<10xf32, #sparse>, tensor<10xi32>) -> tensor<10xi32>
    %9 = vector.transfer_read %8[%c0], %c0_i32 : tensor<10xi32>, vector<10xi32>
    vector.print %9 : vector<10xi32>
    %10 = call @sparse_cast_f64_to_u32(%3, %cst_4) : (tensor<10xf64, #sparse>, tensor<10xi32>) -> tensor<10xi32>
    %11 = vector.transfer_read %10[%c0], %c0_i32 : tensor<10xi32>, vector<10xi32>
    %12 = vector.bitcast %11 : vector<10xi32> to vector<10xui32>
    vector.print %12 : vector<10xui32>
    %13 = call @sparse_cast_f32_to_f64(%1, %cst_2) : (tensor<10xf32, #sparse>, tensor<10xf64>) -> tensor<10xf64>
    %14 = vector.transfer_read %13[%c0], %cst_0 : tensor<10xf64>, vector<10xf64>
    vector.print %14 : vector<10xf64>
    %15 = call @sparse_cast_f64_to_f32(%2, %cst_3) : (tensor<10xf64, #sparse>, tensor<10xf32>) -> tensor<10xf32>
    %16 = vector.transfer_read %15[%c0], %cst : tensor<10xf32>, vector<10xf32>
    vector.print %16 : vector<10xf32>
    %17 = call @sparse_cast_s32_to_u64(%0, %cst_5) : (tensor<10xi32, #sparse>, tensor<10xi64>) -> tensor<10xi64>
    %18 = vector.transfer_read %17[%c0], %c0_i64 : tensor<10xi64>, vector<10xi64>
    vector.print %18 : vector<10xi64>
    %19 = call @sparse_cast_u32_to_s64(%0, %cst_5) : (tensor<10xi32, #sparse>, tensor<10xi64>) -> tensor<10xi64>
    %20 = vector.transfer_read %19[%c0], %c0_i64 : tensor<10xi64>, vector<10xi64>
    vector.print %20 : vector<10xi64>
    %21 = call @sparse_cast_i32_to_i8(%0, %cst_1) : (tensor<10xi32, #sparse>, tensor<10xi8>) -> tensor<10xi8>
    %22 = vector.transfer_read %21[%c0], %c0_i8 : tensor<10xi8>, vector<10xi8>
    vector.print %22 : vector<10xi8>
    %23 = call @sparse_cast_f32_as_s32(%1, %cst_4) : (tensor<10xf32, #sparse>, tensor<10xi32>) -> tensor<10xi32>
    %24 = vector.transfer_read %23[%c0], %c0_i32 : tensor<10xi32>, vector<10xi32>
    vector.print %24 : vector<10xi32>
    bufferization.dealloc_tensor %0 : tensor<10xi32, #sparse>
    bufferization.dealloc_tensor %1 : tensor<10xf32, #sparse>
    bufferization.dealloc_tensor %2 : tensor<10xf64, #sparse>
    bufferization.dealloc_tensor %3 : tensor<10xf64, #sparse>
    bufferization.dealloc_tensor %4 : tensor<10xf32>
    bufferization.dealloc_tensor %6 : tensor<10xf32>
    bufferization.dealloc_tensor %8 : tensor<10xi32>
    bufferization.dealloc_tensor %10 : tensor<10xi32>
    bufferization.dealloc_tensor %13 : tensor<10xf64>
    bufferization.dealloc_tensor %15 : tensor<10xf32>
    bufferization.dealloc_tensor %17 : tensor<10xi64>
    bufferization.dealloc_tensor %19 : tensor<10xi64>
    bufferization.dealloc_tensor %21 : tensor<10xi8>
    bufferization.dealloc_tensor %23 : tensor<10xi32>
    return
  }
}

