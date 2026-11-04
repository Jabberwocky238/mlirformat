#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @sum_reduction_i32(%arg0: tensor<32xi32, #sparse>, %arg1: tensor<i32>) -> tensor<i32> {
    %0 = linalg.generic {doc = "x += OPER_i a(i)", indexing_maps = [#map, #map1], iterator_types = ["reduction"]} ins(%arg0 : tensor<32xi32, #sparse>) outs(%arg1 : tensor<i32>) {
    ^bb0(%in: i32, %out: i32):
      %1 = arith.addi %out, %in : i32
      linalg.yield %1 : i32
    } -> tensor<i32>
    return %0 : tensor<i32>
  }
  func.func @sum_reduction_f32(%arg0: tensor<32xf32, #sparse>, %arg1: tensor<f32>) -> tensor<f32> {
    %0 = linalg.generic {doc = "x += OPER_i a(i)", indexing_maps = [#map, #map1], iterator_types = ["reduction"]} ins(%arg0 : tensor<32xf32, #sparse>) outs(%arg1 : tensor<f32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.addf %out, %in : f32
      linalg.yield %1 : f32
    } -> tensor<f32>
    return %0 : tensor<f32>
  }
  func.func @or_reduction_i32(%arg0: tensor<32xi32, #sparse>, %arg1: tensor<i32>) -> tensor<i32> {
    %0 = linalg.generic {doc = "x += OPER_i a(i)", indexing_maps = [#map, #map1], iterator_types = ["reduction"]} ins(%arg0 : tensor<32xi32, #sparse>) outs(%arg1 : tensor<i32>) {
    ^bb0(%in: i32, %out: i32):
      %1 = arith.ori %out, %in : i32
      linalg.yield %1 : i32
    } -> tensor<i32>
    return %0 : tensor<i32>
  }
  func.func @xor_reduction_i32(%arg0: tensor<32xi32, #sparse>, %arg1: tensor<i32>) -> tensor<i32> {
    %0 = linalg.generic {doc = "x += OPER_i a(i)", indexing_maps = [#map, #map1], iterator_types = ["reduction"]} ins(%arg0 : tensor<32xi32, #sparse>) outs(%arg1 : tensor<i32>) {
    ^bb0(%in: i32, %out: i32):
      %1 = arith.xori %out, %in : i32
      linalg.yield %1 : i32
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
    %cst_1 = arith.constant dense<[0, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0]> : tensor<32xi32>
    %cst_2 = arith.constant dense<[0.000000e+00, 1.000000e+00, 0.000000e+00, 0.000000e+00, 4.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 3.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 2.500000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 2.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 4.000000e+00, 0.000000e+00, 9.000000e+00]> : tensor<32xf32>
    %0 = sparse_tensor.convert %cst_1 : tensor<32xi32> to tensor<32xi32, #sparse>
    %1 = sparse_tensor.convert %cst_2 : tensor<32xf32> to tensor<32xf32, #sparse>
    %2 = call @sum_reduction_i32(%0, %cst) : (tensor<32xi32, #sparse>, tensor<i32>) -> tensor<i32>
    %3 = call @sum_reduction_f32(%1, %cst_0) : (tensor<32xf32, #sparse>, tensor<f32>) -> tensor<f32>
    %4 = call @or_reduction_i32(%0, %cst) : (tensor<32xi32, #sparse>, tensor<i32>) -> tensor<i32>
    %5 = call @xor_reduction_i32(%0, %cst) : (tensor<32xi32, #sparse>, tensor<i32>) -> tensor<i32>
    call @dump_i32(%2) : (tensor<i32>) -> ()
    call @dump_f32(%3) : (tensor<f32>) -> ()
    call @dump_i32(%4) : (tensor<i32>) -> ()
    call @dump_i32(%5) : (tensor<i32>) -> ()
    bufferization.dealloc_tensor %0 : tensor<32xi32, #sparse>
    bufferization.dealloc_tensor %1 : tensor<32xf32, #sparse>
    bufferization.dealloc_tensor %2 : tensor<i32>
    bufferization.dealloc_tensor %3 : tensor<f32>
    bufferization.dealloc_tensor %4 : tensor<i32>
    bufferization.dealloc_tensor %5 : tensor<i32>
    return
  }
}

