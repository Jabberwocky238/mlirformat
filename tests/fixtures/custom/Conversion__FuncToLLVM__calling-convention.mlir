module {
  func.func private @external(memref<?x?xf32>, memref<f32>)
  func.func private @returner() -> (memref<?x?xf32>, memref<f32>)
  func.func @caller() {
    %0:2 = call @returner() : () -> (memref<?x?xf32>, memref<f32>)
    call @external(%0#0, %0#1) : (memref<?x?xf32>, memref<f32>) -> ()
    return
  }
  func.func @callee(%arg0: memref<?xf32>, %arg1: index) {
    %0 = memref.load %arg0[%arg1] : memref<?xf32>
    return
  }
  func.func @other_callee(%arg0: memref<?xf32>, %arg1: index) attributes {llvm.emit_c_interface} {
    %0 = memref.load %arg0[%arg1] : memref<?xf32>
    return
  }
  func.func @return_var_memref_caller(%arg0: memref<4x3xf32>) {
    %0 = call @return_var_memref(%arg0) : (memref<4x3xf32>) -> memref<*xf32>
    return
  }
  func.func @return_var_memref(%arg0: memref<4x3xf32>) -> memref<*xf32> attributes {llvm.emit_c_interface} {
    %cast = memref.cast %arg0 : memref<4x3xf32> to memref<*xf32>
    return %cast : memref<*xf32>
  }
  func.func @return_two_var_memref_caller(%arg0: memref<4x3xf32>) {
    %0:2 = call @return_two_var_memref(%arg0) : (memref<4x3xf32>) -> (memref<*xf32>, memref<*xf32>)
    return
  }
  func.func @return_two_var_memref(%arg0: memref<4x3xf32>) -> (memref<*xf32>, memref<*xf32>) attributes {llvm.emit_c_interface} {
    %cast = memref.cast %arg0 : memref<4x3xf32> to memref<*xf32>
    return %cast, %cast : memref<*xf32>, memref<*xf32>
  }
  func.func @bare_ptr_calling_conv(%arg0: memref<4x3xf32>, %arg1: index, %arg2: index, %arg3: f32) -> memref<4x3xf32> attributes {llvm.bareptr} {
    memref.store %arg3, %arg0[%arg1, %arg2] : memref<4x3xf32>
    return %arg0 : memref<4x3xf32>
  }
  func.func @bare_ptr_calling_conv_multiresult(%arg0: memref<4x3xf32>, %arg1: index, %arg2: index, %arg3: f32) -> (f32, memref<4x3xf32>) attributes {llvm.bareptr} {
    memref.store %arg3, %arg0[%arg1, %arg2] : memref<4x3xf32>
    %0 = memref.load %arg0[%arg1, %arg2] : memref<4x3xf32>
    return %0, %arg0 : f32, memref<4x3xf32>
  }
}

