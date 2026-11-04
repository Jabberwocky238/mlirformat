module {
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %alloc = memref.alloc(%c2) : memref<?xi32>
    %cast = memref.cast %alloc : memref<?xi32> to memref<*xi32>
    gpu.host_register %cast : memref<*xi32>
    %c42_i32 = arith.constant 42 : i32
    memref.store %c42_i32, %alloc[%c0] : memref<?xi32>
    memref.store %c42_i32, %alloc[%c1] : memref<?xi32>
    %token, %bodyResults = async.execute -> !async.value<memref<?xi32>> {
      %memref = gpu.alloc  (%c2) : memref<?xi32>
      gpu.memcpy  %memref, %alloc : memref<?xi32>, memref<?xi32>
      async.yield %memref : memref<?xi32>
    }
    %token_0, %bodyResults_1 = async.execute [%token] (%bodyResults as %arg0: !async.value<memref<?xi32>>) -> !async.value<memref<?xi32>> {
      %memref = gpu.alloc  (%c2) : memref<?xi32>
      gpu.memcpy  %memref, %arg0 : memref<?xi32>, memref<?xi32>
      async.yield %memref : memref<?xi32>
    }
    %token_2, %bodyResults_3 = async.execute [%token] (%bodyResults as %arg0: !async.value<memref<?xi32>>) -> !async.value<memref<?xi32>> {
      %memref = gpu.alloc  (%c2) : memref<?xi32>
      gpu.memcpy  %memref, %arg0 : memref<?xi32>, memref<?xi32>
      async.yield %memref : memref<?xi32>
    }
    %token_4 = async.execute [%token_0, %token_2] (%bodyResults_1 as %arg0: !async.value<memref<?xi32>>, %bodyResults_3 as %arg1: !async.value<memref<?xi32>>) {
      gpu.launch blocks(%arg2, %arg3, %arg4) in (%arg8 = %c1, %arg9 = %c1, %arg10 = %c1) threads(%arg5, %arg6, %arg7) in (%arg11 = %c2, %arg12 = %c1, %arg13 = %c1) {
        %0 = memref.load %arg0[%arg5] : memref<?xi32>
        %1 = memref.load %arg1[%arg5] : memref<?xi32>
        %2 = arith.addi %0, %1 : i32
        memref.store %2, %alloc[%arg5] : memref<?xi32>
        gpu.terminator
      }
      async.yield
    }
    async.await %token_4 : !async.token
    call @printMemrefI32(%cast) : (memref<*xi32>) -> ()
    return
  }
  func.func private @printMemrefI32(memref<*xi32>)
}

