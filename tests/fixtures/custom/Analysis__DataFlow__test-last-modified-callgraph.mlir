module {
  func.func private @single_callsite_fn(%arg0: memref<i32>) -> memref<i32> {
    return {tag = "test_callsite"} %arg0 : memref<i32>
  }
  func.func @test_callsite() {
    %alloc = memref.alloc() : memref<i32>
    %c0_i32 = arith.constant 0 : i32
    memref.store %c0_i32, %alloc[] {tag_name = "a"} : memref<i32>
    %0 = call @single_callsite_fn(%alloc) : (memref<i32>) -> memref<i32>
    return
  }
  func.func private @single_return_site_fn(%arg0: memref<i32>) -> memref<i32> {
    %c0_i32 = arith.constant 0 : i32
    memref.store %c0_i32, %arg0[] {tag_name = "b"} : memref<i32>
    return %arg0 : memref<i32>
  }
  func.func @test_return_site(%arg0: memref<i32>) -> memref<i32> {
    %0 = call @single_return_site_fn(%arg0) : (memref<i32>) -> memref<i32>
    return {tag = "test_return_site"} %0 : memref<i32>
  }
  func.func private @multiple_callsite_fn(%arg0: memref<i32>) -> memref<i32> {
    return {tag = "test_multiple_callsites"} %arg0 : memref<i32>
  }
  func.func @test_multiple_callsites(%arg0: i32, %arg1: memref<i32>) -> memref<i32> {
    memref.store %arg0, %arg1[] {tag_name = "write0"} : memref<i32>
    %0 = call @multiple_callsite_fn(%arg1) : (memref<i32>) -> memref<i32>
    memref.store %arg0, %arg1[] {tag_name = "write1"} : memref<i32>
    %1 = call @multiple_callsite_fn(%arg1) : (memref<i32>) -> memref<i32>
    return %arg1 : memref<i32>
  }
  func.func private @multiple_return_site_fn(%arg0: i1, %arg1: i32, %arg2: memref<i32>) -> memref<i32> {
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    memref.store %arg1, %arg2[] {tag_name = "return0"} : memref<i32>
    return %arg2 : memref<i32>
  ^bb2:  // pred: ^bb0
    memref.store %arg1, %arg2[] {tag_name = "return1"} : memref<i32>
    return %arg2 : memref<i32>
  }
  func.func @test_multiple_return_sites(%arg0: i1, %arg1: i32, %arg2: memref<i32>) -> memref<i32> {
    %0 = call @multiple_return_site_fn(%arg0, %arg1, %arg2) : (i1, i32, memref<i32>) -> memref<i32>
    return {tag = "test_multiple_return_sites"} %0 : memref<i32>
  }
}

// -----
module {
  func.func private @void_return(%arg0: memref<i32>) {
    return
  }
  func.func @test_call_void_return() {
    %alloc = memref.alloc() : memref<i32>
    %c0_i32 = arith.constant 0 : i32
    memref.store %c0_i32, %alloc[] {tag_name = "write0"} : memref<i32>
    call @void_return(%alloc) : (memref<i32>) -> ()
    %0 = memref.load %alloc[] {tag = "after_call"} : memref<i32>
    return
  }
}

// -----
module {
  func.func private @callee(%arg0: memref<f32>) -> memref<f32> {
    %cst = arith.constant 2.000000e+00 : f32
    %0 = memref.load %arg0[] {tag = "call_and_store_before::enter_callee"} : memref<f32>
    memref.store %cst, %arg0[] {tag_name = "callee"} : memref<f32>
    %1 = memref.load %arg0[] {tag = "exit_callee"} : memref<f32>
    return %arg0 : memref<f32>
  }
  func.func @call_and_store_before(%arg0: memref<f32>) -> memref<f32> {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    memref.store %cst, %arg0[] {tag_name = "pre"} : memref<f32>
    %0 = memref.load %arg0[] {tag = "before_call"} : memref<f32>
    test.call_and_store @callee(%arg0), %arg0 {store_before_call = true, tag_name = "call"} : (memref<f32>, memref<f32>) -> ()
    %1 = memref.load %arg0[] {tag = "after_call"} : memref<f32>
    memref.store %cst_0, %arg0[] {tag_name = "post"} : memref<f32>
    return {tag = "return"} %arg0 : memref<f32>
  }
}

// -----
module {
  func.func private @callee(%arg0: memref<f32>) -> memref<f32> {
    %cst = arith.constant 2.000000e+00 : f32
    %0 = memref.load %arg0[] {tag = "call_and_store_after::enter_callee"} : memref<f32>
    memref.store %cst, %arg0[] {tag_name = "callee"} : memref<f32>
    %1 = memref.load %arg0[] {tag = "exit_callee"} : memref<f32>
    return %arg0 : memref<f32>
  }
  func.func @call_and_store_after(%arg0: memref<f32>) -> memref<f32> {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    memref.store %cst, %arg0[] {tag_name = "pre"} : memref<f32>
    %0 = memref.load %arg0[] {tag = "before_call"} : memref<f32>
    test.call_and_store @callee(%arg0), %arg0 {store_before_call = false, tag_name = "call"} : (memref<f32>, memref<f32>) -> ()
    %1 = memref.load %arg0[] {tag = "after_call"} : memref<f32>
    memref.store %cst_0, %arg0[] {tag_name = "post"} : memref<f32>
    return {tag = "return"} %arg0 : memref<f32>
  }
}

// -----
module {
  func.func private @void_return(memref<i32>)
  func.func @test_opaque_call_return() {
    %alloc = memref.alloc() : memref<i32>
    %c0_i32 = arith.constant 0 : i32
    memref.store %c0_i32, %alloc[] {tag_name = "write0"} : memref<i32>
    call @void_return(%alloc) : (memref<i32>) -> ()
    %0 = memref.load %alloc[] {tag = "after_opaque_call"} : memref<i32>
    return
  }
}

