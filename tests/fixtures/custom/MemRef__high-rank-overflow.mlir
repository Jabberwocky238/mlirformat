module {
  func.func @high_rank_memref_overflow() {
    %alloc = memref.alloc() : memref<2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2x2xi32>
    return
  }
}

// -----
module {
  func.func @high_rank_memref_max_dim() {
    %alloc = memref.alloc() : memref<9223372036854775807x2xi32>
    return
  }
}

