module {
  func.func private @loop_with_realloc(%arg0: index, %arg1: index, %arg2: index, %arg3: i1, %arg4: index, %arg5: index) -> (memref<?xf32>, memref<?xf32>) {
    %alloc = memref.alloc(%arg4) : memref<?xf32>
    %alloc_0 = memref.alloc(%arg4) : memref<?xf32>
    %0:2 = scf.for %arg6 = %arg0 to %arg1 step %arg2 iter_args(%arg7 = %alloc, %arg8 = %alloc_0) -> (memref<?xf32>, memref<?xf32>) {
      %1 = memref.realloc %arg7(%arg5) : memref<?xf32> to memref<?xf32>
      %2 = memref.realloc %arg8(%arg5) : memref<?xf32> to memref<?xf32>
      scf.yield %1, %2 : memref<?xf32>, memref<?xf32>
    }
    return %0#0, %0#1 : memref<?xf32>, memref<?xf32>
  }
}

// -----
module {
  func.func private @swapping_loop_with_realloc(%arg0: index, %arg1: index, %arg2: index, %arg3: i1, %arg4: index, %arg5: index) -> (memref<?xf32>, memref<?xf32>) {
    %alloc = memref.alloc(%arg4) : memref<?xf32>
    %alloc_0 = memref.alloc(%arg4) : memref<?xf32>
    %0:2 = scf.for %arg6 = %arg0 to %arg1 step %arg2 iter_args(%arg7 = %alloc, %arg8 = %alloc_0) -> (memref<?xf32>, memref<?xf32>) {
      %1 = memref.realloc %arg7(%arg5) : memref<?xf32> to memref<?xf32>
      %2 = memref.realloc %arg8(%arg5) : memref<?xf32> to memref<?xf32>
      scf.yield %2, %1 : memref<?xf32>, memref<?xf32>
    }
    return %0#0, %0#1 : memref<?xf32>, memref<?xf32>
  }
}

