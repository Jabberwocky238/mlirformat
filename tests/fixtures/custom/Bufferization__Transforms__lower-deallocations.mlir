module {
  func.func @conversion_dealloc_empty() {
    bufferization.dealloc
    return
  }
}

// -----
module {
  func.func @conversion_dealloc_empty_but_retains(%arg0: memref<2xi32>, %arg1: memref<2xi32>) -> (i1, i1) {
    %0:2 = bufferization.dealloc retain (%arg0, %arg1 : memref<2xi32>, memref<2xi32>)
    return %0#0, %0#1 : i1, i1
  }
}

// -----
module {
  func.func @conversion_dealloc_simple(%arg0: memref<2xf32>, %arg1: i1) {
    bufferization.dealloc (%arg0 : memref<2xf32>) if (%arg1)
    return
  }
}

// -----
module {
  func.func @conversion_dealloc_one_memref_and_multiple_retained(%arg0: memref<2xf32>, %arg1: memref<1xf32>, %arg2: i1, %arg3: memref<2xf32>) -> (i1, i1) {
    %0:2 = bufferization.dealloc (%arg0 : memref<2xf32>) if (%arg2) retain (%arg1, %arg3 : memref<1xf32>, memref<2xf32>)
    return %0#0, %0#1 : i1, i1
  }
}

// -----
module {
  func.func @conversion_dealloc_multiple_memrefs_and_retained(%arg0: memref<2xf32>, %arg1: memref<5xf32>, %arg2: memref<1xf32>, %arg3: i1, %arg4: i1, %arg5: memref<2xf32>) -> (i1, i1) {
    %0:2 = bufferization.dealloc (%arg0, %arg1 : memref<2xf32>, memref<5xf32>) if (%arg3, %arg4) retain (%arg2, %arg5 : memref<1xf32>, memref<2xf32>)
    return %0#0, %0#1 : i1, i1
  }
}

// -----
module @conversion_nest_module_dealloc_helper {
  func.func @top_level_func(%arg0: memref<2xf32>, %arg1: memref<5xf32>, %arg2: memref<1xf32>, %arg3: i1, %arg4: i1, %arg5: memref<2xf32>) -> (i1, i1) {
    %0:2 = bufferization.dealloc (%arg0, %arg1 : memref<2xf32>, memref<5xf32>) if (%arg3, %arg4) retain (%arg2, %arg5 : memref<1xf32>, memref<2xf32>)
    return %0#0, %0#1 : i1, i1
  }
  module @nested_module_not_need_dealloc_helper {
    func.func @nested_module_not_need_dealloc_helper_func(%arg0: memref<2xf32>, %arg1: memref<1xf32>, %arg2: i1, %arg3: memref<2xf32>) -> (i1, i1) {
      %0:2 = bufferization.dealloc (%arg0 : memref<2xf32>) if (%arg2) retain (%arg1, %arg3 : memref<1xf32>, memref<2xf32>)
      return %0#0, %0#1 : i1, i1
    }
  }
  module @nested_module_need_dealloc_helper {
    func.func @nested_module_need_dealloc_helper_func0(%arg0: memref<2xf32>, %arg1: memref<5xf32>, %arg2: memref<1xf32>, %arg3: i1, %arg4: i1, %arg5: memref<2xf32>) -> (i1, i1) {
      %0:2 = bufferization.dealloc (%arg0, %arg1 : memref<2xf32>, memref<5xf32>) if (%arg3, %arg4) retain (%arg2, %arg5 : memref<1xf32>, memref<2xf32>)
      return %0#0, %0#1 : i1, i1
    }
    func.func @nested_module_need_dealloc_helper_func1(%arg0: memref<2xf32>, %arg1: memref<5xf32>, %arg2: memref<1xf32>, %arg3: i1, %arg4: i1, %arg5: memref<2xf32>) -> (i1, i1) {
      %0:2 = bufferization.dealloc (%arg0, %arg1 : memref<2xf32>, memref<5xf32>) if (%arg3, %arg4) retain (%arg2, %arg5 : memref<1xf32>, memref<2xf32>)
      return %0#0, %0#1 : i1, i1
    }
  }
}

