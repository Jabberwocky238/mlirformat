module {
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    %cst_1 = arith.constant 2.000000e+00 : f32
    %cst_2 = arith.constant 3.000000e+00 : f32
    %cst_3 = arith.constant 4.000000e+00 : f32
    %alloc = memref.alloc() : memref<4xf32>
    linalg.fill ins(%cst : f32) outs(%alloc : memref<4xf32>)
    %cast = memref.cast %alloc : memref<4xf32> to memref<*xf32>
    call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
    memref.store %cst_0, %alloc[%c0] : memref<4xf32>
    call @mlirAsyncRuntimePrintCurrentThreadId() : () -> ()
    call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
    %token = async.execute {
      memref.store %cst_1, %alloc[%c1] : memref<4xf32>
      func.call @mlirAsyncRuntimePrintCurrentThreadId() : () -> ()
      func.call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
      %token_4 = async.execute {
        func.call @mlirAsyncRuntimePrintCurrentThreadId() : () -> ()
        async.yield
      }
      %token_5 = async.execute [%token_4] {
        memref.store %cst_2, %alloc[%c2] : memref<4xf32>
        func.call @mlirAsyncRuntimePrintCurrentThreadId() : () -> ()
        func.call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
        async.yield
      }
      async.await %token_5 : !async.token
      memref.store %cst_3, %alloc[%c3] : memref<4xf32>
      func.call @mlirAsyncRuntimePrintCurrentThreadId() : () -> ()
      func.call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
      async.yield
    }
    async.await %token : !async.token
    call @mlirAsyncRuntimePrintCurrentThreadId() : () -> ()
    call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
    memref.dealloc %alloc : memref<4xf32>
    return
  }
  func.func private @mlirAsyncRuntimePrintCurrentThreadId()
  func.func private @printMemrefF32(memref<*xf32>) attributes {llvm.emit_c_interface}
}

