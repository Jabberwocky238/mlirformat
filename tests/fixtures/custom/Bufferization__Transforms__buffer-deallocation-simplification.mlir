module {
  func.func @dealloc_deallocated_in_retained(%arg0: memref<2xi32>, %arg1: i1, %arg2: memref<2xi32>, %arg3: i1) -> (i1, i1, i1, i1, i1, i1, i1) {
    %0 = bufferization.dealloc (%arg0 : memref<2xi32>) if (%arg1) retain (%arg0 : memref<2xi32>)
    %1 = bufferization.dealloc (%arg0, %arg2 : memref<2xi32>, memref<2xi32>) if (%arg1, %arg1) retain (%arg0 : memref<2xi32>)
    %2:2 = bufferization.dealloc (%arg0 : memref<2xi32>) if (%arg1) retain (%arg0, %arg2 : memref<2xi32>, memref<2xi32>)
    %subview = memref.subview %arg0[0] [1] [1] : memref<2xi32> to memref<i32>
    %subview_0 = memref.subview %arg0[1] [1] [1] : memref<2xi32> to memref<1xi32, strided<[1], offset: 1>>
    %alloc = memref.alloc() : memref<2xi32>
    %3:3 = bufferization.dealloc (%arg0, %subview_0 : memref<2xi32>, memref<1xi32, strided<[1], offset: 1>>) if (%arg1, %arg3) retain (%arg0, %alloc, %subview : memref<2xi32>, memref<2xi32>, memref<i32>)
    return %0, %1, %2#0, %2#1, %3#0, %3#1, %3#2 : i1, i1, i1, i1, i1, i1, i1
  }
}

// -----
module {
  func.func @dealloc_deallocated_in_retained_extract_base_memref(%arg0: memref<2xi32>, %arg1: i1, %arg2: memref<2xi32>, %arg3: i1) -> (i1, i1, i1, i1, i1, i1, i1) {
    %base_buffer, %offset, %sizes, %strides = memref.extract_strided_metadata %arg0 : memref<2xi32> -> memref<i32>, index, index, index
    %base_buffer_0, %offset_1, %sizes_2, %strides_3 = memref.extract_strided_metadata %arg2 : memref<2xi32> -> memref<i32>, index, index, index
    %0 = bufferization.dealloc (%base_buffer : memref<i32>) if (%arg1) retain (%arg0 : memref<2xi32>)
    %1 = bufferization.dealloc (%base_buffer, %base_buffer_0 : memref<i32>, memref<i32>) if (%arg1, %arg1) retain (%arg0 : memref<2xi32>)
    %2:2 = bufferization.dealloc (%base_buffer : memref<i32>) if (%arg1) retain (%arg0, %arg2 : memref<2xi32>, memref<2xi32>)
    %subview = memref.subview %arg0[0] [1] [1] : memref<2xi32> to memref<i32>
    %subview_4 = memref.subview %arg0[1] [1] [1] : memref<2xi32> to memref<1xi32, strided<[1], offset: 1>>
    %alloc = memref.alloc() : memref<2xi32>
    %3:3 = bufferization.dealloc (%base_buffer, %subview_4 : memref<i32>, memref<1xi32, strided<[1], offset: 1>>) if (%arg1, %arg3) retain (%arg0, %alloc, %subview : memref<2xi32>, memref<2xi32>, memref<i32>)
    return %0, %1, %2#0, %2#1, %3#0, %3#1, %3#2 : i1, i1, i1, i1, i1, i1, i1
  }
}

// -----
module {
  func.func @remove_retained_memrefs_guarateed_to_not_alias(%arg0: i1, %arg1: memref<2xi32>) -> (i1, i1, memref<2xi32>) {
    %alloc = memref.alloc() : memref<2xi32>
    %alloc_0 = memref.alloc() : memref<2xi32>
    %0:2 = bufferization.dealloc (%alloc : memref<2xi32>) if (%arg0) retain (%alloc_0, %arg1 : memref<2xi32>, memref<2xi32>)
    return %0#0, %0#1, %alloc : i1, i1, memref<2xi32>
  }
}

// -----
module {
  func.func @dealloc_split_when_no_other_aliasing(%arg0: i1, %arg1: memref<2xi32>, %arg2: memref<2xi32>, %arg3: i1) -> (i1, i1) {
    %alloc = memref.alloc() : memref<2xi32>
    %alloc_0 = memref.alloc() : memref<2xi32>
    %0 = arith.select %arg0, %alloc, %alloc_0 : memref<2xi32>
    %1:2 = bufferization.dealloc (%alloc, %arg2 : memref<2xi32>, memref<2xi32>) if (%arg0, %arg3) retain (%arg1, %0 : memref<2xi32>, memref<2xi32>)
    return %1#0, %1#1 : i1, i1
  }
}

// -----
module {
  func.func @dealloc_remove_dealloc_memref_contained_in_retained_with_const_true_condition(%arg0: memref<2xi32>, %arg1: memref<2xi32>, %arg2: memref<2xi32>) -> (memref<2xi32>, memref<2xi32>, i1, i1) {
    %true = arith.constant true
    %0:2 = bufferization.dealloc (%arg0, %arg1, %arg2 : memref<2xi32>, memref<2xi32>, memref<2xi32>) if (%true, %true, %true) retain (%arg0, %arg1 : memref<2xi32>, memref<2xi32>)
    return %arg0, %arg1, %0#0, %0#1 : memref<2xi32>, memref<2xi32>, i1, i1
  }
}

// -----
module {
  func.func @dealloc_remove_dealloc_memref_contained_in_retained_with_const_true_condition(%arg0: memref<2xi32>, %arg1: memref<2xi32>, %arg2: memref<2xi32>) -> (memref<2xi32>, memref<2xi32>, i1, i1) {
    %true = arith.constant true
    %base_buffer, %offset, %sizes, %strides = memref.extract_strided_metadata %arg0 : memref<2xi32> -> memref<i32>, index, index, index
    %base_buffer_0, %offset_1, %sizes_2, %strides_3 = memref.extract_strided_metadata %arg1 : memref<2xi32> -> memref<i32>, index, index, index
    %base_buffer_4, %offset_5, %sizes_6, %strides_7 = memref.extract_strided_metadata %arg2 : memref<2xi32> -> memref<i32>, index, index, index
    %0:2 = bufferization.dealloc (%base_buffer, %base_buffer_0, %base_buffer_4 : memref<i32>, memref<i32>, memref<i32>) if (%true, %true, %true) retain (%arg0, %arg1 : memref<2xi32>, memref<2xi32>)
    return %arg0, %arg1, %0#0, %0#1 : memref<2xi32>, memref<2xi32>, i1, i1
  }
}

// -----
module {
  func.func @alloc_and_bbarg(%arg0: memref<5xf32>, %arg1: index, %arg2: index, %arg3: index) -> f32 {
    %true = arith.constant true
    %false = arith.constant false
    %0:2 = scf.for %arg4 = %arg1 to %arg2 step %arg3 iter_args(%arg5 = %arg0, %arg6 = %false) -> (memref<5xf32>, i1) {
      %alloc = memref.alloc() : memref<5xf32>
      memref.copy %arg5, %alloc : memref<5xf32> to memref<5xf32>
      %base_buffer_0, %offset_1, %sizes_2, %strides_3 = memref.extract_strided_metadata %arg5 : memref<5xf32> -> memref<f32>, index, index, index
      %2 = bufferization.dealloc (%base_buffer_0, %alloc : memref<f32>, memref<5xf32>) if (%arg6, %true) retain (%alloc : memref<5xf32>)
      scf.yield %alloc, %2 : memref<5xf32>, i1
    }
    %1 = memref.load %0#0[%arg1] : memref<5xf32>
    %base_buffer, %offset, %sizes, %strides = memref.extract_strided_metadata %0#0 : memref<5xf32> -> memref<f32>, index, index, index
    bufferization.dealloc (%base_buffer : memref<f32>) if (%0#1)
    return %1 : f32
  }
}

// -----
module {
  func.func @duplicate_memref(%arg0: memref<5xf32>, %arg1: memref<6xf32>, %arg2: i1) -> i1 {
    %0 = bufferization.dealloc (%arg0, %arg0 : memref<5xf32>, memref<5xf32>) if (%arg2, %arg2) retain (%arg1 : memref<6xf32>)
    return %0 : i1
  }
}

