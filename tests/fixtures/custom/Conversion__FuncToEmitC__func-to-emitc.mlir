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
    emitc.call_opaque "bar"(%arg0) : (i32) -> ()
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

