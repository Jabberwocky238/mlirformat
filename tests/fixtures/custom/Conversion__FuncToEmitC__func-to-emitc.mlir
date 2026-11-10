module {
  func.func @foo() {
    return
  }
}

// -----
module {
  func.func private @foo() {
    return
  }
}

// -----
module {
  func.func @foo(%arg0: i32) {
    emitc.call_opaque "bar"(%arg0)  : (i32) -> ()
    return
  }
}

// -----
module {
  func.func @foo(%arg0: i32) -> i32 {
    return %arg0 : i32
  }
}

// -----
module {
  func.func @foo(%arg0: i32, %arg1: i32) -> i32 {
    %0 = emitc.add %arg0, %arg1 : (i32, i32) -> i32
    return %0 : i32
  }
}

// -----
module {
  func.func private @return_i32(%arg0: i32) -> i32 {
    return %arg0 : i32
  }
  func.func @call(%arg0: i32) -> i32 {
    %0 = call @return_i32(%arg0) : (i32) -> i32
    return %0 : i32
  }
}

// -----
module {
  func.func private @return_i32(i32) -> i32
}

// -----
module {
  func.func private @return_void() {
    return
  }
  func.func @call() {
    call @return_void() : () -> ()
    return
  }
}

// -----
module {
  func.func @return_two(%arg0: i32, %arg1: i32) -> (i32, i32) {
    return %arg0, %arg1 : i32, i32
  }
}

// -----
module {
  func.func @return_two(%arg0: i32, %arg1: i32) -> (i32, i32) {
    return %arg0, %arg1 : i32, i32
  }
  func.func @caller(%arg0: i32) -> i32 {
    %0:2 = call @return_two(%arg0, %arg0) : (i32, i32) -> (i32, i32)
    return %0#1 : i32
  }
}

// -----
module {
  func.func @first(%arg0: i32) -> (i32, i32) {
    return %arg0, %arg0 : i32, i32
  }
  func.func @second(%arg0: i32) -> (i32, i32) {
    return %arg0, %arg0 : i32, i32
  }
}

// -----
module {
  func.func private @memref_callee(memref<4x8xf32>)
  func.func @memref_call(%arg0: memref<4x8xf32>) {
    call @memref_callee(%arg0) : (memref<4x8xf32>) -> ()
    return
  }
}

