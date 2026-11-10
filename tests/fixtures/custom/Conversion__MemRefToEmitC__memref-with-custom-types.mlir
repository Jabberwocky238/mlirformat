module {
  func.func @alloc_with_custom_element_type() {
    %alloc = memref.alloc() : memref<10x!test.memref_element>
    return
  }
}

// -----
module {
  func.func @copy_with_custom_element_type(%arg0: memref<10x!test.memref_element>, %arg1: memref<10x!test.memref_element>) {
    memref.copy %arg0, %arg1 : memref<10x!test.memref_element> to memref<10x!test.memref_element>
    return
  }
}

// -----
module {
  func.func @store_with_custom_element_type(%arg0: !test.memref_element, %arg1: index) {
    %alloc = memref.alloc() : memref<4x!test.memref_element>
    memref.store %arg0, %alloc[%arg1] : memref<4x!test.memref_element>
    return
  }
}

// -----
module {
  func.func @load_with_custom_element_type(%arg0: index) -> !test.memref_element {
    %alloc = memref.alloc() : memref<4x!test.memref_element>
    %0 = memref.load %alloc[%arg0] : memref<4x!test.memref_element>
    return %0 : !test.memref_element
  }
}

