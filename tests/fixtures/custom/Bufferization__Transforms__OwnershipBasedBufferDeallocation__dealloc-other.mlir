module {
  func.func private @no_interface_no_operands(%arg0: tensor<?x?x?xf16>) -> memref<?x?x?xf16> {
    %0 = bufferization.to_buffer %arg0 : tensor<?x?x?xf16> to memref<?x?x?xf16>
    return %0 : memref<?x?x?xf16>
  }
}

// -----
module {
  func.func private @no_interface() -> memref<5xf32> {
    %alloc = memref.alloc() : memref<5xf32>
    %0 = "test.forward_buffer"(%alloc) : (memref<5xf32>) -> memref<5xf32>
    return %0 : memref<5xf32>
  }
}

// -----
module {
  func.func @no_buffer_semantics_with_write_effect(%arg0: vector<9x6xf32>) {
    vector.print %arg0 : vector<9x6xf32>
    return
  }
}

