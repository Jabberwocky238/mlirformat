#map = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @empty() -> tensor<10xf32, #sparse> {
    %0 = tensor.empty() : tensor<10xf32, #sparse>
    return %0 : tensor<10xf32, #sparse>
  }
  func.func @empty_alloc() -> tensor<10xf32, #sparse> {
    %0 = bufferization.alloc_tensor() : tensor<10xf32, #sparse>
    return %0 : tensor<10xf32, #sparse>
  }
  func.func @zeros() -> tensor<10xf32, #sparse> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = bufferization.alloc_tensor() : tensor<10xf32, #sparse>
    %1 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel"]} outs(%0 : tensor<10xf32, #sparse>) {
    ^bb0(%out: f32):
      linalg.yield %cst : f32
    } -> tensor<10xf32, #sparse>
    return %1 : tensor<10xf32, #sparse>
  }
  func.func @ones() -> tensor<10xf32, #sparse> {
    %cst = arith.constant 1.000000e+00 : f32
    %0 = bufferization.alloc_tensor() : tensor<10xf32, #sparse>
    %1 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel"]} outs(%0 : tensor<10xf32, #sparse>) {
    ^bb0(%out: f32):
      linalg.yield %cst : f32
    } -> tensor<10xf32, #sparse>
    return %1 : tensor<10xf32, #sparse>
  }
  func.func @main() {
    %0 = call @empty() : () -> tensor<10xf32, #sparse>
    %1 = call @empty_alloc() : () -> tensor<10xf32, #sparse>
    %2 = call @zeros() : () -> tensor<10xf32, #sparse>
    %3 = call @ones() : () -> tensor<10xf32, #sparse>
    sparse_tensor.print %0 : tensor<10xf32, #sparse>
    sparse_tensor.print %1 : tensor<10xf32, #sparse>
    sparse_tensor.print %2 : tensor<10xf32, #sparse>
    sparse_tensor.print %3 : tensor<10xf32, #sparse>
    bufferization.dealloc_tensor %0 : tensor<10xf32, #sparse>
    bufferization.dealloc_tensor %1 : tensor<10xf32, #sparse>
    bufferization.dealloc_tensor %2 : tensor<10xf32, #sparse>
    bufferization.dealloc_tensor %3 : tensor<10xf32, #sparse>
    return
  }
}

