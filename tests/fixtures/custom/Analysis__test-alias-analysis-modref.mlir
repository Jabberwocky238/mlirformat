module {
  func.func @no_side_effects(%arg0: memref<2xf32>) attributes {test.ptr = "func"} {
    %alloc = memref.alloc() {test.ptr = "alloc"} : memref<8x64xf32>
    memref.dealloc %alloc {test.ptr = "dealloc"} : memref<8x64xf32>
    return {test.ptr = "return"}
  }
}

// -----
module {
  func.func @simple(%arg0: memref<i32>, %arg1: i32) attributes {test.ptr = "func"} {
    %alloca = memref.alloca() {test.ptr = "alloc"} : memref<i32>
    memref.store %arg1, %alloca[] {test.ptr = "store"} : memref<i32>
    %0 = memref.load %alloca[] {test.ptr = "load"} : memref<i32>
    return {test.ptr = "return"}
  }
}

// -----
module {
  func.func @mayalias(%arg0: memref<i32>, %arg1: memref<i32>, %arg2: i32) attributes {test.ptr = "func"} {
    memref.store %arg2, %arg1[] {test.ptr = "store"} : memref<i32>
    %0 = memref.load %arg1[] {test.ptr = "load"} : memref<i32>
    return {test.ptr = "return"}
  }
}

// -----
module {
  func.func @recursive(%arg0: memref<i32>, %arg1: memref<i32>, %arg2: i1, %arg3: i32) attributes {test.ptr = "func"} {
    %alloca = memref.alloca() {test.ptr = "alloc"} : memref<i32>
    scf.if %arg2 {
      memref.store %arg3, %arg0[] : memref<i32>
      %0 = memref.load %arg0[] : memref<i32>
    } {test.ptr = "if"}
    return {test.ptr = "return"}
  }
}

// -----
module {
  func.func @unknown(%arg0: memref<i32>) attributes {test.ptr = "func"} {
    "foo.op"() {test.ptr = "unknown"} : () -> ()
    return
  }
}

