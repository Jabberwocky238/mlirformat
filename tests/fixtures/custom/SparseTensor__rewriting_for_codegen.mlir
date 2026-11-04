#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>
module {
  func.func @sparse_new(%arg0: !llvm.ptr) -> tensor<?x?xf32, #sparse> {
    %0 = sparse_tensor.new %arg0 : !llvm.ptr to tensor<?x?xf32, #sparse>
    return %0 : tensor<?x?xf32, #sparse>
  }
  func.func @sparse_new_csc(%arg0: !llvm.ptr) -> tensor<?x?xf32, #sparse1> {
    %0 = sparse_tensor.new %arg0 : !llvm.ptr to tensor<?x?xf32, #sparse1>
    return %0 : tensor<?x?xf32, #sparse1>
  }
  func.func @sparse_new_coo(%arg0: !llvm.ptr) -> tensor<?x?xf32, #sparse2> {
    %0 = sparse_tensor.new %arg0 : !llvm.ptr to tensor<?x?xf32, #sparse2>
    return %0 : tensor<?x?xf32, #sparse2>
  }
  func.func @sparse_out(%arg0: tensor<10x20xf32, #sparse>, %arg1: !llvm.ptr) {
    sparse_tensor.out %arg0, %arg1 : tensor<10x20xf32, #sparse>, !llvm.ptr
    return
  }
}

