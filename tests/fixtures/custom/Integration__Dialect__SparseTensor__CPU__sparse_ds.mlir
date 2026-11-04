#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : loose_compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 floordiv 4 : dense, d1 mod 4 : structured[2, 4]), crdWidth = 8 }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 floordiv 8 : dense, d1 mod 8 : structured[5, 8]), crdWidth = 8 }>
module {
  func.func private @getTensorFilename(index) -> !llvm.ptr
  func.func @main() {
    %c0 = arith.constant 0 : index
    %0 = call @getTensorFilename(%c0) : (index) -> !llvm.ptr
    %1 = sparse_tensor.new %0 : !llvm.ptr to tensor<?x?xf64, #sparse>
    %2 = sparse_tensor.new %0 : !llvm.ptr to tensor<?x?xf64, #sparse1>
    %3 = sparse_tensor.new %0 : !llvm.ptr to tensor<?x?xf64, #sparse2>
    %4 = sparse_tensor.new %0 : !llvm.ptr to tensor<?x?xf64, #sparse3>
    sparse_tensor.print %1 : tensor<?x?xf64, #sparse>
    sparse_tensor.print %2 : tensor<?x?xf64, #sparse1>
    sparse_tensor.print %3 : tensor<?x?xf64, #sparse2>
    sparse_tensor.print %4 : tensor<?x?xf64, #sparse3>
    bufferization.dealloc_tensor %1 : tensor<?x?xf64, #sparse>
    bufferization.dealloc_tensor %2 : tensor<?x?xf64, #sparse1>
    bufferization.dealloc_tensor %3 : tensor<?x?xf64, #sparse2>
    bufferization.dealloc_tensor %4 : tensor<?x?xf64, #sparse3>
    return
  }
}

