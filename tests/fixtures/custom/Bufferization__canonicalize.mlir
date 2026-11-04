module {
  func.func @tensor_load_of_buffer_cast(%arg0: tensor<?xf32>) -> tensor<?xf32> {
    %0 = bufferization.to_buffer %arg0 : tensor<?xf32> to memref<?xf32>
    %1 = bufferization.to_tensor %0 : memref<?xf32> to tensor<?xf32>
    return %1 : tensor<?xf32>
  }
}

// -----
module {
  func.func @buffer_cast_of_tensor_load(%arg0: memref<?xf32>) -> memref<?xf32> {
    %0 = bufferization.to_tensor %arg0 : memref<?xf32> to tensor<?xf32>
    %1 = bufferization.to_buffer %0 : tensor<?xf32> to memref<?xf32>
    return %1 : memref<?xf32>
  }
}

// -----
module {
  func.func @canonicalize_buffer_cast_of_tensor_load_different_address_space(%arg0: memref<?xf32, 2>) -> memref<?xf32, 7> {
    %0 = bufferization.to_tensor %arg0 : memref<?xf32, 2> to tensor<?xf32, 7 : i64>
    %1 = bufferization.to_buffer %0 : tensor<?xf32, 7 : i64> to memref<?xf32, 7>
    return %1 : memref<?xf32, 7>
  }
}

// -----
module {
  func.func @canonicalize_buffer_cast_of_tensor_load(%arg0: memref<?xf32, strided<[1], offset: 3>>) -> memref<?xf32, strided<[1], offset: ?>> {
    %0 = bufferization.to_tensor %arg0 : memref<?xf32, strided<[1], offset: 3>> to tensor<?xf32>
    %1 = bufferization.to_buffer %0 : tensor<?xf32> to memref<?xf32, strided<[1], offset: ?>>
    return %1 : memref<?xf32, strided<[1], offset: ?>>
  }
}

// -----
module {
  func.func @canonicalize_buffer_cast_of_tensor_load_to_copy(%arg0: memref<?xf32, strided<[1], offset: ?>>) -> memref<?xf32, strided<[1], offset: 3>> {
    %0 = bufferization.to_tensor %arg0 : memref<?xf32, strided<[1], offset: ?>> to tensor<?xf32>
    %1 = bufferization.to_buffer %0 : tensor<?xf32> to memref<?xf32, strided<[1], offset: 3>>
    return %1 : memref<?xf32, strided<[1], offset: 3>>
  }
}

// -----
module {
  func.func @dim_of_tensor_load(%arg0: memref<?xf32>) -> index {
    %c0 = arith.constant 0 : index
    %0 = bufferization.to_tensor %arg0 : memref<?xf32> to tensor<?xf32>
    %dim = tensor.dim %0, %c0 : tensor<?xf32>
    return %dim : index
  }
}

// -----
module {
  func.func @clone_before_dealloc(%arg0: memref<?xf32>) -> memref<?xf32> {
    %0 = bufferization.clone %arg0 : memref<?xf32> to memref<?xf32>
    memref.dealloc %arg0 : memref<?xf32>
    return %0 : memref<?xf32>
  }
}

// -----
module {
  func.func @clone_before_dealloc(%arg0: memref<?xf32>) -> memref<?xf32> {
    %0 = bufferization.clone %arg0 : memref<?xf32> to memref<?xf32>
    "use"(%0) : (memref<?xf32>) -> ()
    memref.dealloc %0 : memref<?xf32>
    return %arg0 : memref<?xf32>
  }
}

// -----
module {
  func.func @clone_after_cast(%arg0: memref<?xf32>) -> memref<32xf32> {
    %cast = memref.cast %arg0 : memref<?xf32> to memref<32xf32>
    %0 = bufferization.clone %cast : memref<32xf32> to memref<32xf32>
    return %0 : memref<32xf32>
  }
}

// -----
module {
  func.func @clone_and_cast(%arg0: memref<?xf32>) -> memref<32xf32> {
    %0 = bufferization.clone %arg0 : memref<?xf32> to memref<32xf32>
    memref.dealloc %arg0 : memref<?xf32>
    return %0 : memref<32xf32>
  }
}

// -----
module {
  func.func @clone_incompatible(%arg0: memref<32xf32, strided<[2]>>) -> memref<32xf32> {
    %0 = bufferization.clone %arg0 : memref<32xf32, strided<[2]>> to memref<32xf32>
    memref.dealloc %arg0 : memref<32xf32, strided<[2]>>
    return %0 : memref<32xf32>
  }
}

// -----
module {
  func.func @alias_is_freed(%arg0: memref<?xf32>) {
    %cast = memref.cast %arg0 : memref<?xf32> to memref<32xf32>
    %0 = bufferization.clone %cast : memref<32xf32> to memref<32xf32>
    memref.dealloc %arg0 : memref<?xf32>
    "use"(%0) : (memref<32xf32>) -> ()
    memref.dealloc %0 : memref<32xf32>
    return
  }
}

// -----
module {
  func.func @clone_multiple_dealloc_of_source(%arg0: memref<?xf32>) -> memref<?xf32> {
    %0 = bufferization.clone %arg0 : memref<?xf32> to memref<?xf32>
    "if_else"() ({
      memref.dealloc %arg0 : memref<?xf32>
    }, {
      memref.dealloc %arg0 : memref<?xf32>
    }) : () -> ()
    return %0 : memref<?xf32>
  }
}

// -----
module {
  func.func @clone_multiple_dealloc_of_clone(%arg0: memref<?xf32>) -> memref<?xf32> {
    %0 = bufferization.clone %arg0 : memref<?xf32> to memref<?xf32>
    "use"(%0) : (memref<?xf32>) -> ()
    "if_else"() ({
      memref.dealloc %0 : memref<?xf32>
    }, {
      memref.dealloc %0 : memref<?xf32>
    }) : () -> ()
    return %arg0 : memref<?xf32>
  }
}

// -----
module {
  func.func @clone_and_realloc(%arg0: memref<?xf32>) {
    %0 = bufferization.clone %arg0 : memref<?xf32> to memref<32xf32>
    "use"(%0) : (memref<32xf32>) -> ()
    %1 = memref.realloc %0 : memref<32xf32> to memref<64xf32>
    memref.dealloc %1 : memref<64xf32>
    return
  }
}

// -----
module {
  func.func @clone_and_preceding_dealloc(%arg0: memref<?xf32>) -> memref<32xf32> {
    memref.dealloc %arg0 : memref<?xf32>
    %0 = bufferization.clone %arg0 : memref<?xf32> to memref<32xf32>
    return %0 : memref<32xf32>
  }
}

// -----
module {
  func.func @tensor_cast_to_buffer(%arg0: tensor<4x6x16x32xi8>) -> memref<?x?x16x32xi8> {
    %cast = tensor.cast %arg0 : tensor<4x6x16x32xi8> to tensor<?x?x16x32xi8>
    %0 = bufferization.to_buffer %cast read_only : tensor<?x?x16x32xi8> to memref<?x?x16x32xi8>
    return %0 : memref<?x?x16x32xi8>
  }
  func.func @tensor_cast_to_unranked_buffer(%arg0: tensor<4x6x16x32xi8>) -> memref<*xi8> {
    %cast = tensor.cast %arg0 : tensor<4x6x16x32xi8> to tensor<*xi8>
    %0 = bufferization.to_buffer %cast read_only : tensor<*xi8> to memref<*xi8>
    return %0 : memref<*xi8>
  }
}

// -----
module {
  func.func @tensor_cast_to_buffer_layout_and_memspace(%arg0: tensor<4x6x16x32xi8>) -> memref<?x?x16x32xi8, strided<[?, ?, ?, 1], offset: ?>, 1> {
    %cast = tensor.cast %arg0 : tensor<4x6x16x32xi8> to tensor<?x?x16x32xi8>
    %0 = bufferization.to_buffer %cast : tensor<?x?x16x32xi8> to memref<?x?x16x32xi8, strided<[?, ?, ?, 1], offset: ?>, 1>
    return %0 : memref<?x?x16x32xi8, strided<[?, ?, ?, 1], offset: ?>, 1>
  }
}

// -----
module {
  func.func @load_from_buffer_cast(%arg0: index, %arg1: index, %arg2: tensor<?x?xf32>) -> f32 {
    %0 = bufferization.to_buffer %arg2 : tensor<?x?xf32> to memref<?x?xf32>
    %1 = memref.load %0[%arg0, %arg1] : memref<?x?xf32>
    return %1 : f32
  }
}

// -----
module {
  func.func @alloc_tensor_canonicalize() -> tensor<4x5x?xf32> {
    %c6 = arith.constant 6 : index
    %0 = bufferization.alloc_tensor(%c6) : tensor<4x5x?xf32>
    return %0 : tensor<4x5x?xf32>
  }
}

// -----
module {
  func.func @dealloc_canonicalize_clone_removal(%arg0: memref<?xindex>) -> memref<*xf32> {
    %c1 = arith.constant 1 : index
    %alloc = memref.alloc(%c1) : memref<?xf32>
    %reshape = memref.reshape %alloc(%arg0) : (memref<?xf32>, memref<?xindex>) -> memref<*xf32>
    %0 = bufferization.clone %reshape : memref<*xf32> to memref<*xf32>
    memref.dealloc %alloc : memref<?xf32>
    return %0 : memref<*xf32>
  }
}

// -----
module {
  func.func @dealloc_canonicalize_duplicates(%arg0: memref<2xi32>, %arg1: i1, %arg2: i1, %arg3: memref<2xi32>, %arg4: memref<2xi32>, %arg5: memref<2xi32>) -> (i1, i1, i1) {
    %0:3 = bufferization.dealloc (%arg4, %arg0, %arg0 : memref<2xi32>, memref<2xi32>, memref<2xi32>) if (%arg1, %arg1, %arg1) retain (%arg3, %arg5, %arg3 : memref<2xi32>, memref<2xi32>, memref<2xi32>)
    bufferization.dealloc (%arg0, %arg0 : memref<2xi32>, memref<2xi32>) if (%arg1, %arg2)
    return %0#0, %0#1, %0#2 : i1, i1, i1
  }
}

// -----
module {
  func.func @dealloc_erase_empty(%arg0: memref<2xi32>, %arg1: i1, %arg2: memref<2xi32>) -> i1 {
    bufferization.dealloc
    %0 = bufferization.dealloc retain (%arg0 : memref<2xi32>)
    return %0 : i1
  }
}

// -----
module {
  func.func @dealloc_always_false_condition(%arg0: memref<2xi32>, %arg1: memref<2xi32>, %arg2: i1) {
    %false = arith.constant false
    bufferization.dealloc (%arg0, %arg1 : memref<2xi32>, memref<2xi32>) if (%false, %arg2)
    return
  }
}

// -----
module {
  func.func @dealloc_base_memref_extract_of_alloc(%arg0: memref<2xi32>, %arg1: i1, %arg2: i1, %arg3: memref<2xi32>) -> memref<2xi32> {
    %alloc = memref.alloc() : memref<2xi32>
    %base_buffer, %offset, %sizes, %strides = memref.extract_strided_metadata %alloc : memref<2xi32> -> memref<i32>, index, index, index
    %base_buffer_0, %offset_1, %sizes_2, %strides_3 = memref.extract_strided_metadata %arg3 : memref<2xi32> -> memref<i32>, index, index, index
    bufferization.dealloc (%base_buffer, %arg0, %base_buffer_0 : memref<i32>, memref<2xi32>, memref<i32>) if (%arg1, %arg2, %arg2)
    return %alloc : memref<2xi32>
  }
}

// -----
module {
  func.func @dealloc_base_memref_extract_of_alloc(%arg0: memref<2xi32>) {
    %true = arith.constant true
    %alloc = memref.alloc() : memref<2xi32>
    bufferization.dealloc (%alloc, %arg0 : memref<2xi32>, memref<2xi32>) if (%true, %true)
    return
  }
}

// -----
module {
  func.func @negative_input() -> tensor<?x?x?xf16> {
    %idx27 = index.constant 27
    %idx-3 = index.constant -3
    %c10 = arith.constant 10 : index
    %0 = bufferization.alloc_tensor(%c10, %idx-3, %idx27) : tensor<?x?x?xf16>
    return %0 : tensor<?x?x?xf16>
  }
}

