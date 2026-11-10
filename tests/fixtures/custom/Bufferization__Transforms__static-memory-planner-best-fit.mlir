module {
}

// -----
module {
  func.func @reuse_non_overlapping() {
    %alloc = memref.alloc() : memref<1024xf32>
    memref.dealloc %alloc : memref<1024xf32>
    %alloc_0 = memref.alloc() : memref<1024xf32>
    memref.dealloc %alloc_0 : memref<1024xf32>
    return
  }
}

// -----
module {
  func.func @no_reuse_overlapping() {
    %alloc = memref.alloc() : memref<1024xf32>
    %alloc_0 = memref.alloc() : memref<512xf32>
    memref.dealloc %alloc : memref<1024xf32>
    memref.dealloc %alloc_0 : memref<512xf32>
    return
  }
}

// -----
module {
  func.func @best_fit_smallest_gap() {
    %alloc = memref.alloc() : memref<1024xf32>
    %alloc_0 = memref.alloc() : memref<256xf32>
    %alloc_1 = memref.alloc() : memref<1024xf32>
    %alloc_2 = memref.alloc() : memref<256xf32>
    memref.dealloc %alloc_0 : memref<256xf32>
    memref.dealloc %alloc_2 : memref<256xf32>
    memref.dealloc %alloc : memref<1024xf32>
    %alloc_3 = memref.alloc() : memref<128xf32>
    memref.dealloc %alloc_1 : memref<1024xf32>
    memref.dealloc %alloc_3 : memref<128xf32>
    return
  }
}

// -----
module {
  func.func @best_fit_alignment() {
    %alloc = memref.alloc() {alignment = 128 : i64} : memref<128xi8>
    %alloc_0 = memref.alloc() : memref<56xi8>
    %alloc_1 = memref.alloc() {alignment = 128 : i64} : memref<128xi8>
    memref.dealloc %alloc_0 : memref<56xi8>
    %alloc_2 = memref.alloc() {alignment = 128 : i64} : memref<64xi8>
    %alloc_3 = memref.alloc() {alignment = 256 : i64} : memref<64xi8>
    memref.dealloc %alloc : memref<128xi8>
    memref.dealloc %alloc_1 : memref<128xi8>
    memref.dealloc %alloc_2 : memref<64xi8>
    memref.dealloc %alloc_3 : memref<64xi8>
    return
  }
}

