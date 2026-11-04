#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func private @rtsrand(index) -> !llvm.ptr
  func.func private @rtrand(!llvm.ptr, index) -> index
  func.func private @rtdrand(!llvm.ptr)
  func.func private @shuffle(memref<?xi64>, !llvm.ptr) attributes {llvm.emit_c_interface}
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0.000000e+00 : f64
    %c99 = arith.constant 99 : index
    %c100 = arith.constant 100 : index
    %c50 = arith.constant 50 : index
    %c90 = arith.constant 90 : index
    %0 = arith.muli %c50, %c90 : index
    %1 = arith.floordivsi %0, %c100 : index
    %2 = arith.subi %c50, %1 : index
    %3 = tensor.empty(%c50) : tensor<?xf64>
    %4 = linalg.fill ins(%cst : f64) outs(%3 : tensor<?xf64>) -> tensor<?xf64>
    %alloc = memref.alloc(%c50) : memref<?xi64>
    %5 = call @rtsrand(%c0) : (index) -> !llvm.ptr
    call @shuffle(%alloc, %5) : (memref<?xi64>, !llvm.ptr) -> ()
    %6 = scf.for %arg0 = %c0 to %2 step %c1 iter_args(%arg1 = %4) -> (tensor<?xf64>) {
      %9 = memref.load %alloc[%arg0] : memref<?xi64>
      %10 = arith.index_cast %9 : i64 to index
      %11 = func.call @rtrand(%5, %c99) : (!llvm.ptr, index) -> index
      %12 = arith.addi %11, %c1 : index
      %13 = arith.index_cast %12 : index to i64
      %14 = arith.uitofp %13 : i64 to f64
      %inserted = tensor.insert %14 into %arg1[%10] : tensor<?xf64>
      scf.yield %inserted : tensor<?xf64>
    }
    %7 = sparse_tensor.convert %6 : tensor<?xf64> to tensor<?xf64, #sparse>
    %8 = sparse_tensor.number_of_entries %7 : tensor<?xf64, #sparse>
    vector.print %8 : index
    bufferization.dealloc_tensor %7 : tensor<?xf64, #sparse>
    bufferization.dealloc_tensor %3 : tensor<?xf64>
    memref.dealloc %alloc : memref<?xi64>
    call @rtdrand(%5) : (!llvm.ptr) -> ()
    return
  }
}

