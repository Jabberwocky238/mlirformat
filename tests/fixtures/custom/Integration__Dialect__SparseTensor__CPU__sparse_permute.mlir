#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d2 : compressed, d1 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d1 : compressed, d0 : compressed, d2 : compressed) }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d1 : compressed, d2 : compressed, d0 : compressed) }>
#sparse4 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : compressed, d0 : compressed, d1 : compressed) }>
#sparse5 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : compressed, d1 : compressed, d0 : compressed) }>
module {
  func.func private @getTensorFilename(index) -> !llvm.ptr
  func.func @dump(%arg0: tensor<2x3x4xf64>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f64
    %0 = vector.transfer_read %arg0[%c0, %c0, %c0], %cst : tensor<2x3x4xf64>, vector<2x3x4xf64>
    vector.print %0 : vector<2x3x4xf64>
    return
  }
  func.func @linalg1(%arg0: tensor<2x3x4xf64, #sparse>) -> tensor<2x3x4xf64> {
    %cst = arith.constant dense<0.000000e+00> : tensor<2x3x4xf64>
    %0 = linalg.generic {doc = "A(i,j,k) = B(i,j,k)", indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0 : tensor<2x3x4xf64, #sparse>) outs(%cst : tensor<2x3x4xf64>) {
    ^bb0(%in: f64, %out: f64):
      linalg.yield %in : f64
    } -> tensor<2x3x4xf64>
    return %0 : tensor<2x3x4xf64>
  }
  func.func @convert1(%arg0: tensor<2x3x4xf64, #sparse>) -> tensor<2x3x4xf64> {
    %0 = sparse_tensor.convert %arg0 : tensor<2x3x4xf64, #sparse> to tensor<2x3x4xf64>
    return %0 : tensor<2x3x4xf64>
  }
  func.func @foo1(%arg0: !llvm.ptr) {
    %0 = sparse_tensor.new %arg0 : !llvm.ptr to tensor<2x3x4xf64, #sparse>
    %1 = call @linalg1(%0) : (tensor<2x3x4xf64, #sparse>) -> tensor<2x3x4xf64>
    call @dump(%1) : (tensor<2x3x4xf64>) -> ()
    %2 = call @convert1(%0) : (tensor<2x3x4xf64, #sparse>) -> tensor<2x3x4xf64>
    call @dump(%2) : (tensor<2x3x4xf64>) -> ()
    bufferization.dealloc_tensor %1 : tensor<2x3x4xf64>
    bufferization.dealloc_tensor %0 : tensor<2x3x4xf64, #sparse>
    bufferization.dealloc_tensor %2 : tensor<2x3x4xf64>
    return
  }
  func.func @linalg2(%arg0: tensor<2x3x4xf64, #sparse1>) -> tensor<2x3x4xf64> {
    %cst = arith.constant dense<0.000000e+00> : tensor<2x3x4xf64>
    %0 = linalg.generic {doc = "A(i,j,k) = B(i,j,k)", indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0 : tensor<2x3x4xf64, #sparse1>) outs(%cst : tensor<2x3x4xf64>) {
    ^bb0(%in: f64, %out: f64):
      linalg.yield %in : f64
    } -> tensor<2x3x4xf64>
    return %0 : tensor<2x3x4xf64>
  }
  func.func @convert2(%arg0: tensor<2x3x4xf64, #sparse1>) -> tensor<2x3x4xf64> {
    %0 = sparse_tensor.convert %arg0 : tensor<2x3x4xf64, #sparse1> to tensor<2x3x4xf64>
    return %0 : tensor<2x3x4xf64>
  }
  func.func @foo2(%arg0: !llvm.ptr) {
    %0 = sparse_tensor.new %arg0 : !llvm.ptr to tensor<2x3x4xf64, #sparse1>
    %1 = call @linalg2(%0) : (tensor<2x3x4xf64, #sparse1>) -> tensor<2x3x4xf64>
    call @dump(%1) : (tensor<2x3x4xf64>) -> ()
    %2 = call @convert2(%0) : (tensor<2x3x4xf64, #sparse1>) -> tensor<2x3x4xf64>
    call @dump(%2) : (tensor<2x3x4xf64>) -> ()
    bufferization.dealloc_tensor %1 : tensor<2x3x4xf64>
    bufferization.dealloc_tensor %0 : tensor<2x3x4xf64, #sparse1>
    bufferization.dealloc_tensor %2 : tensor<2x3x4xf64>
    return
  }
  func.func @linalg3(%arg0: tensor<2x3x4xf64, #sparse2>) -> tensor<2x3x4xf64> {
    %cst = arith.constant dense<0.000000e+00> : tensor<2x3x4xf64>
    %0 = linalg.generic {doc = "A(i,j,k) = B(i,j,k)", indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0 : tensor<2x3x4xf64, #sparse2>) outs(%cst : tensor<2x3x4xf64>) {
    ^bb0(%in: f64, %out: f64):
      linalg.yield %in : f64
    } -> tensor<2x3x4xf64>
    return %0 : tensor<2x3x4xf64>
  }
  func.func @convert3(%arg0: tensor<2x3x4xf64, #sparse2>) -> tensor<2x3x4xf64> {
    %0 = sparse_tensor.convert %arg0 : tensor<2x3x4xf64, #sparse2> to tensor<2x3x4xf64>
    return %0 : tensor<2x3x4xf64>
  }
  func.func @foo3(%arg0: !llvm.ptr) {
    %0 = sparse_tensor.new %arg0 : !llvm.ptr to tensor<2x3x4xf64, #sparse2>
    %1 = call @linalg3(%0) : (tensor<2x3x4xf64, #sparse2>) -> tensor<2x3x4xf64>
    call @dump(%1) : (tensor<2x3x4xf64>) -> ()
    %2 = call @convert3(%0) : (tensor<2x3x4xf64, #sparse2>) -> tensor<2x3x4xf64>
    call @dump(%2) : (tensor<2x3x4xf64>) -> ()
    bufferization.dealloc_tensor %1 : tensor<2x3x4xf64>
    bufferization.dealloc_tensor %0 : tensor<2x3x4xf64, #sparse2>
    bufferization.dealloc_tensor %2 : tensor<2x3x4xf64>
    return
  }
  func.func @linalg4(%arg0: tensor<2x3x4xf64, #sparse3>) -> tensor<2x3x4xf64> {
    %cst = arith.constant dense<0.000000e+00> : tensor<2x3x4xf64>
    %0 = linalg.generic {doc = "A(i,j,k) = B(i,j,k)", indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0 : tensor<2x3x4xf64, #sparse3>) outs(%cst : tensor<2x3x4xf64>) {
    ^bb0(%in: f64, %out: f64):
      linalg.yield %in : f64
    } -> tensor<2x3x4xf64>
    return %0 : tensor<2x3x4xf64>
  }
  func.func @convert4(%arg0: tensor<2x3x4xf64, #sparse3>) -> tensor<2x3x4xf64> {
    %0 = sparse_tensor.convert %arg0 : tensor<2x3x4xf64, #sparse3> to tensor<2x3x4xf64>
    return %0 : tensor<2x3x4xf64>
  }
  func.func @foo4(%arg0: !llvm.ptr) {
    %0 = sparse_tensor.new %arg0 : !llvm.ptr to tensor<2x3x4xf64, #sparse3>
    %1 = call @linalg4(%0) : (tensor<2x3x4xf64, #sparse3>) -> tensor<2x3x4xf64>
    call @dump(%1) : (tensor<2x3x4xf64>) -> ()
    %2 = call @convert4(%0) : (tensor<2x3x4xf64, #sparse3>) -> tensor<2x3x4xf64>
    call @dump(%2) : (tensor<2x3x4xf64>) -> ()
    bufferization.dealloc_tensor %1 : tensor<2x3x4xf64>
    bufferization.dealloc_tensor %0 : tensor<2x3x4xf64, #sparse3>
    bufferization.dealloc_tensor %2 : tensor<2x3x4xf64>
    return
  }
  func.func @linalg5(%arg0: tensor<2x3x4xf64, #sparse4>) -> tensor<2x3x4xf64> {
    %cst = arith.constant dense<0.000000e+00> : tensor<2x3x4xf64>
    %0 = linalg.generic {doc = "A(i,j,k) = B(i,j,k)", indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0 : tensor<2x3x4xf64, #sparse4>) outs(%cst : tensor<2x3x4xf64>) {
    ^bb0(%in: f64, %out: f64):
      linalg.yield %in : f64
    } -> tensor<2x3x4xf64>
    return %0 : tensor<2x3x4xf64>
  }
  func.func @convert5(%arg0: tensor<2x3x4xf64, #sparse4>) -> tensor<2x3x4xf64> {
    %0 = sparse_tensor.convert %arg0 : tensor<2x3x4xf64, #sparse4> to tensor<2x3x4xf64>
    return %0 : tensor<2x3x4xf64>
  }
  func.func @foo5(%arg0: !llvm.ptr) {
    %0 = sparse_tensor.new %arg0 : !llvm.ptr to tensor<2x3x4xf64, #sparse4>
    %1 = call @linalg5(%0) : (tensor<2x3x4xf64, #sparse4>) -> tensor<2x3x4xf64>
    call @dump(%1) : (tensor<2x3x4xf64>) -> ()
    %2 = call @convert5(%0) : (tensor<2x3x4xf64, #sparse4>) -> tensor<2x3x4xf64>
    call @dump(%2) : (tensor<2x3x4xf64>) -> ()
    bufferization.dealloc_tensor %1 : tensor<2x3x4xf64>
    bufferization.dealloc_tensor %0 : tensor<2x3x4xf64, #sparse4>
    bufferization.dealloc_tensor %2 : tensor<2x3x4xf64>
    return
  }
  func.func @linalg6(%arg0: tensor<2x3x4xf64, #sparse5>) -> tensor<2x3x4xf64> {
    %cst = arith.constant dense<0.000000e+00> : tensor<2x3x4xf64>
    %0 = linalg.generic {doc = "A(i,j,k) = B(i,j,k)", indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0 : tensor<2x3x4xf64, #sparse5>) outs(%cst : tensor<2x3x4xf64>) {
    ^bb0(%in: f64, %out: f64):
      linalg.yield %in : f64
    } -> tensor<2x3x4xf64>
    return %0 : tensor<2x3x4xf64>
  }
  func.func @convert6(%arg0: tensor<2x3x4xf64, #sparse5>) -> tensor<2x3x4xf64> {
    %0 = sparse_tensor.convert %arg0 : tensor<2x3x4xf64, #sparse5> to tensor<2x3x4xf64>
    return %0 : tensor<2x3x4xf64>
  }
  func.func @foo6(%arg0: !llvm.ptr) {
    %0 = sparse_tensor.new %arg0 : !llvm.ptr to tensor<2x3x4xf64, #sparse5>
    %1 = call @linalg6(%0) : (tensor<2x3x4xf64, #sparse5>) -> tensor<2x3x4xf64>
    call @dump(%1) : (tensor<2x3x4xf64>) -> ()
    %2 = call @convert6(%0) : (tensor<2x3x4xf64, #sparse5>) -> tensor<2x3x4xf64>
    call @dump(%2) : (tensor<2x3x4xf64>) -> ()
    bufferization.dealloc_tensor %1 : tensor<2x3x4xf64>
    bufferization.dealloc_tensor %0 : tensor<2x3x4xf64, #sparse5>
    bufferization.dealloc_tensor %2 : tensor<2x3x4xf64>
    return
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %0 = call @getTensorFilename(%c0) : (index) -> !llvm.ptr
    call @foo1(%0) : (!llvm.ptr) -> ()
    call @foo2(%0) : (!llvm.ptr) -> ()
    call @foo3(%0) : (!llvm.ptr) -> ()
    call @foo4(%0) : (!llvm.ptr) -> ()
    call @foo5(%0) : (!llvm.ptr) -> ()
    call @foo6(%0) : (!llvm.ptr) -> ()
    return
  }
}

