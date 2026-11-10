module {
}

// -----
module {
  func.func @simple_sequential() {
    %alloc = memref.alloc() : memref<1024xf32>
    memref.dealloc %alloc : memref<1024xf32>
    %alloc_0 = memref.alloc() : memref<512xf32>
    memref.dealloc %alloc_0 : memref<512xf32>
    return
  }
}

// -----
module {
  func.func @non_sequential_pairs() {
    %alloc = memref.alloc() : memref<1024xf32>
    %alloc_0 = memref.alloc() : memref<512xf32>
    memref.dealloc %alloc : memref<1024xf32>
    memref.dealloc %alloc_0 : memref<512xf32>
    return
  }
}

// -----
module {
  func.func @interleaved_pairs() {
    %alloc = memref.alloc() : memref<512xf32>
    %alloc_0 = memref.alloc() : memref<256xf32>
    memref.dealloc %alloc : memref<512xf32>
    %alloc_1 = memref.alloc() : memref<128xf32>
    memref.dealloc %alloc_0 : memref<256xf32>
    memref.dealloc %alloc_1 : memref<128xf32>
    return
  }
}

// -----
module {
  func.func @dynamic_shape_skipped(%arg0: index) {
    %alloc = memref.alloc(%arg0) : memref<?xf32>
    return
  }
}

// -----
module {
  func.func @no_dealloc_skipped() {
    %alloc = memref.alloc() : memref<1024xf32>
    return
  }
}

// -----
module {
  func.func @different_block_skipped(%arg0: i1) {
    %alloc = memref.alloc() : memref<1024xf32>
    scf.if %arg0 {
      memref.dealloc %alloc : memref<1024xf32>
    }
    return
  }
}

// -----
module {
  func.func @multiple_sequential() {
    %alloc = memref.alloc() : memref<1024xf32>
    memref.dealloc %alloc : memref<1024xf32>
    %alloc_0 = memref.alloc() : memref<512xf32>
    memref.dealloc %alloc_0 : memref<512xf32>
    %alloc_1 = memref.alloc() : memref<2048xf32>
    memref.dealloc %alloc_1 : memref<2048xf32>
    return
  }
}

// -----
module {
  func.func @alignment_padding() {
    %alloc = memref.alloc() {alignment = 128 : i64} : memref<256xf32>
    memref.dealloc %alloc : memref<256xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<128xf32>
    memref.dealloc %alloc_0 : memref<128xf32>
    %alloc_1 = memref.alloc() {alignment = 128 : i64} : memref<64xf32>
    memref.dealloc %alloc_1 : memref<64xf32>
    return
  }
}

// -----
module {
  func.func @lcm_alignment() {
    %alloc = memref.alloc() {alignment = 4 : i64} : memref<3xi32>
    memref.dealloc %alloc : memref<3xi32>
    %alloc_0 = memref.alloc() {alignment = 16 : i64} : memref<3xi32>
    memref.dealloc %alloc_0 : memref<3xi32>
    return
  }
}

