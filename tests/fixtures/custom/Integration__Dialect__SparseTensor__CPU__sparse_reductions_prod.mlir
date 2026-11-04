#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : dense) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @prod_dreduction_i32(%arg0: tensor<32xi32, #sparse>, %arg1: tensor<i32>) -> tensor<i32> {
    %extracted = tensor.extract %arg1[] : tensor<i32>
    %0 = linalg.generic {doc = "x += PROD_CUSTOM_i a(i)", indexing_maps = [#map, #map1], iterator_types = ["reduction"]} ins(%arg0 : tensor<32xi32, #sparse>) outs(%arg1 : tensor<i32>) {
    ^bb0(%in: i32, %out: i32):
      %1 = sparse_tensor.reduce %in, %out, %extracted : i32 {
      ^bb0(%arg2: i32, %arg3: i32):
        %2 = arith.muli %arg2, %arg3 : i32
        sparse_tensor.yield %2 : i32
      }
      linalg.yield %1 : i32
    } -> tensor<i32>
    return %0 : tensor<i32>
  }
  func.func @prod_dreduction_f32(%arg0: tensor<32xf32, #sparse>, %arg1: tensor<f32>) -> tensor<f32> {
    %extracted = tensor.extract %arg1[] : tensor<f32>
    %0 = linalg.generic {doc = "x += PROD_CUSTOM_i a(i)", indexing_maps = [#map, #map1], iterator_types = ["reduction"]} ins(%arg0 : tensor<32xf32, #sparse>) outs(%arg1 : tensor<f32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = sparse_tensor.reduce %in, %out, %extracted : f32 {
      ^bb0(%arg2: f32, %arg3: f32):
        %2 = arith.mulf %arg2, %arg3 : f32
        sparse_tensor.yield %2 : f32
      }
      linalg.yield %1 : f32
    } -> tensor<f32>
    return %0 : tensor<f32>
  }
  func.func @prod_sreduction_i32(%arg0: tensor<32xi32, #sparse1>, %arg1: tensor<i32>) -> tensor<i32> {
    %extracted = tensor.extract %arg1[] : tensor<i32>
    %0 = linalg.generic {doc = "x += PROD_CUSTOM_i a(i)", indexing_maps = [#map, #map1], iterator_types = ["reduction"]} ins(%arg0 : tensor<32xi32, #sparse1>) outs(%arg1 : tensor<i32>) {
    ^bb0(%in: i32, %out: i32):
      %1 = sparse_tensor.reduce %in, %out, %extracted : i32 {
      ^bb0(%arg2: i32, %arg3: i32):
        %2 = arith.muli %arg2, %arg3 : i32
        sparse_tensor.yield %2 : i32
      }
      linalg.yield %1 : i32
    } -> tensor<i32>
    return %0 : tensor<i32>
  }
  func.func @prod_sreduction_f32(%arg0: tensor<32xf32, #sparse1>, %arg1: tensor<f32>) -> tensor<f32> {
    %extracted = tensor.extract %arg1[] : tensor<f32>
    %0 = linalg.generic {doc = "x += PROD_CUSTOM_i a(i)", indexing_maps = [#map, #map1], iterator_types = ["reduction"]} ins(%arg0 : tensor<32xf32, #sparse1>) outs(%arg1 : tensor<f32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = sparse_tensor.reduce %in, %out, %extracted : f32 {
      ^bb0(%arg2: f32, %arg3: f32):
        %2 = arith.mulf %arg2, %arg3 : f32
        sparse_tensor.yield %2 : f32
      }
      linalg.yield %1 : f32
    } -> tensor<f32>
    return %0 : tensor<f32>
  }
  func.func @prod_xreduction_i32(%arg0: tensor<32xi32, #sparse1>, %arg1: tensor<i32>) -> tensor<i32> {
    %extracted = tensor.extract %arg1[] : tensor<i32>
    %0 = linalg.generic {doc = "x += PROD_CUSTOM_i a(i)", indexing_maps = [#map, #map1], iterator_types = ["reduction"]} ins(%arg0 : tensor<32xi32, #sparse1>) outs(%arg1 : tensor<i32>) {
    ^bb0(%in: i32, %out: i32):
      %1 = sparse_tensor.unary %in : i32 to i32
       present = {
      ^bb0(%arg2: i32):
        sparse_tensor.yield %arg2 : i32
      }
       absent = {
        %c0_i32 = arith.constant 0 : i32
        sparse_tensor.yield %c0_i32 : i32
      }
      %2 = sparse_tensor.reduce %1, %out, %extracted : i32 {
      ^bb0(%arg2: i32, %arg3: i32):
        %3 = arith.muli %arg2, %arg3 : i32
        sparse_tensor.yield %3 : i32
      }
      linalg.yield %2 : i32
    } -> tensor<i32>
    return %0 : tensor<i32>
  }
  func.func @dump_i32(%arg0: tensor<i32>) {
    %extracted = tensor.extract %arg0[] : tensor<i32>
    vector.print %extracted : i32
    return
  }
  func.func @dump_f32(%arg0: tensor<f32>) {
    %extracted = tensor.extract %arg0[] : tensor<f32>
    vector.print %extracted : f32
    return
  }
  func.func @main() {
    %cst = arith.constant dense<7> : tensor<i32>
    %cst_0 = arith.constant dense<2.000000e+00> : tensor<f32>
    %cst_1 = arith.constant dense<[1, 1, 7, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 0, 1, 1, 1, 1, 1, 0, 1, 1, 7, 3]> : tensor<32xi32>
    %cst_2 = arith.constant dense<[1.000000e+00, 1.000000e+00, 1.000000e+00, 3.500000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 0.000000e+00, 2.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 0.000000e+00, 1.000000e+00, 1.000000e+00, 0.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 0.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 0.000000e+00, 0.000000e+00]> : tensor<32xf32>
    %cst_3 = arith.constant dense<[1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 7, 3]> : tensor<32xi32>
    %cst_4 = arith.constant dense<[1.000000e+00, 1.000000e+00, 1.000000e+00, 3.500000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 2.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 3.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 4.000000e+00]> : tensor<32xf32>
    %0 = sparse_tensor.convert %cst_1 : tensor<32xi32> to tensor<32xi32, #sparse>
    %1 = sparse_tensor.convert %cst_2 : tensor<32xf32> to tensor<32xf32, #sparse>
    %2 = sparse_tensor.convert %cst_1 : tensor<32xi32> to tensor<32xi32, #sparse1>
    %3 = sparse_tensor.convert %cst_2 : tensor<32xf32> to tensor<32xf32, #sparse1>
    %4 = sparse_tensor.convert %cst_3 : tensor<32xi32> to tensor<32xi32, #sparse>
    %5 = sparse_tensor.convert %cst_4 : tensor<32xf32> to tensor<32xf32, #sparse>
    %6 = sparse_tensor.convert %cst_3 : tensor<32xi32> to tensor<32xi32, #sparse1>
    %7 = sparse_tensor.convert %cst_4 : tensor<32xf32> to tensor<32xf32, #sparse1>
    %cst_5 = arith.constant sparse<1, 0> : tensor<32xi32>
    %8 = sparse_tensor.convert %cst_5 : tensor<32xi32> to tensor<32xi32, #sparse1>
    %9 = call @prod_dreduction_i32(%0, %cst) : (tensor<32xi32, #sparse>, tensor<i32>) -> tensor<i32>
    %10 = call @prod_dreduction_f32(%1, %cst_0) : (tensor<32xf32, #sparse>, tensor<f32>) -> tensor<f32>
    %11 = call @prod_sreduction_i32(%2, %cst) : (tensor<32xi32, #sparse1>, tensor<i32>) -> tensor<i32>
    %12 = call @prod_sreduction_f32(%3, %cst_0) : (tensor<32xf32, #sparse1>, tensor<f32>) -> tensor<f32>
    %13 = call @prod_dreduction_i32(%4, %cst) : (tensor<32xi32, #sparse>, tensor<i32>) -> tensor<i32>
    %14 = call @prod_dreduction_f32(%5, %cst_0) : (tensor<32xf32, #sparse>, tensor<f32>) -> tensor<f32>
    %15 = call @prod_sreduction_i32(%6, %cst) : (tensor<32xi32, #sparse1>, tensor<i32>) -> tensor<i32>
    %16 = call @prod_sreduction_f32(%7, %cst_0) : (tensor<32xf32, #sparse1>, tensor<f32>) -> tensor<f32>
    %17 = call @prod_sreduction_i32(%8, %cst) : (tensor<32xi32, #sparse1>, tensor<i32>) -> tensor<i32>
    %18 = call @prod_xreduction_i32(%2, %cst) : (tensor<32xi32, #sparse1>, tensor<i32>) -> tensor<i32>
    %19 = call @prod_xreduction_i32(%6, %cst) : (tensor<32xi32, #sparse1>, tensor<i32>) -> tensor<i32>
    call @dump_i32(%9) : (tensor<i32>) -> ()
    call @dump_f32(%10) : (tensor<f32>) -> ()
    call @dump_i32(%11) : (tensor<i32>) -> ()
    call @dump_f32(%12) : (tensor<f32>) -> ()
    call @dump_i32(%13) : (tensor<i32>) -> ()
    call @dump_f32(%14) : (tensor<f32>) -> ()
    call @dump_i32(%15) : (tensor<i32>) -> ()
    call @dump_f32(%16) : (tensor<f32>) -> ()
    call @dump_i32(%17) : (tensor<i32>) -> ()
    call @dump_i32(%18) : (tensor<i32>) -> ()
    call @dump_i32(%19) : (tensor<i32>) -> ()
    bufferization.dealloc_tensor %0 : tensor<32xi32, #sparse>
    bufferization.dealloc_tensor %1 : tensor<32xf32, #sparse>
    bufferization.dealloc_tensor %2 : tensor<32xi32, #sparse1>
    bufferization.dealloc_tensor %3 : tensor<32xf32, #sparse1>
    bufferization.dealloc_tensor %4 : tensor<32xi32, #sparse>
    bufferization.dealloc_tensor %5 : tensor<32xf32, #sparse>
    bufferization.dealloc_tensor %6 : tensor<32xi32, #sparse1>
    bufferization.dealloc_tensor %7 : tensor<32xf32, #sparse1>
    bufferization.dealloc_tensor %8 : tensor<32xi32, #sparse1>
    bufferization.dealloc_tensor %9 : tensor<i32>
    bufferization.dealloc_tensor %10 : tensor<f32>
    bufferization.dealloc_tensor %11 : tensor<i32>
    bufferization.dealloc_tensor %12 : tensor<f32>
    bufferization.dealloc_tensor %13 : tensor<i32>
    bufferization.dealloc_tensor %14 : tensor<f32>
    bufferization.dealloc_tensor %15 : tensor<i32>
    bufferization.dealloc_tensor %16 : tensor<f32>
    bufferization.dealloc_tensor %17 : tensor<i32>
    bufferization.dealloc_tensor %18 : tensor<i32>
    bufferization.dealloc_tensor %19 : tensor<i32>
    return
  }
}

