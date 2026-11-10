module {
  func.func @memref_store_i4(%arg0: index, %arg1: i4) {
    %alloc = memref.alloc() : memref<5xi4>
    memref.store %arg1, %alloc[%arg0] : memref<5xi4>
    return
  }
}

// -----
module {
  func.func @memref_store_i4_rank2(%arg0: index, %arg1: index, %arg2: i4) {
    %alloc = memref.alloc() : memref<3x125xi4>
    memref.store %arg2, %alloc[%arg0, %arg1] : memref<3x125xi4>
    return
  }
}

// -----
module {
  func.func @memref_store_i4_dynamic(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: i4) {
    %alloc = memref.alloc(%arg0, %arg1) : memref<?x?xi4>
    memref.store %arg4, %alloc[%arg2, %arg3] : memref<?x?xi4>
    return
  }
}

// -----
module {
  func.func @memref_store_f4(%arg0: f4E2M1FN) {
    %alloc = memref.alloc() : memref<f4E2M1FN>
    memref.store %arg0, %alloc[] : memref<f4E2M1FN>
    return
  }
}

// -----
module {
  func.func @rank_zero_memref_store(%arg0: i4) {
    %alloc = memref.alloc() : memref<i4>
    memref.store %arg0, %alloc[] : memref<i4>
    return
  }
}

