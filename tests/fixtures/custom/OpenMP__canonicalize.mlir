module {
  func.func @update_no_op(%arg0: memref<i32>) {
    omp.atomic.update %arg0 : memref<i32> {
    ^bb0(%arg1: i32):
      omp.yield(%arg1 : i32)
    }
    return
  }
}

// -----
module {
  func.func @update_write_op(%arg0: memref<i32>, %arg1: i32) {
    omp.atomic.update %arg0 : memref<i32> {
    ^bb0(%arg2: i32):
      omp.yield(%arg1 : i32)
    }
    return
  }
}

// -----
module {
  func.func @update_normal(%arg0: memref<i32>, %arg1: i32) {
    omp.atomic.update %arg0 : memref<i32> {
    ^bb0(%arg2: i32):
      %0 = arith.addi %arg2, %arg1 : i32
      omp.yield(%0 : i32)
    }
    return
  }
}

// -----
module {
  func.func @update_unnecessary_computations(%arg0: memref<i32>) {
    %c0_i32 = arith.constant 0 : i32
    omp.atomic.update %arg0 : memref<i32> {
    ^bb0(%arg1: i32):
      %0 = arith.addi %arg1, %c0_i32 : i32
      omp.yield(%0 : i32)
    }
    return
  }
}

// -----
module {
  func.func @update_unnecessary_computations(%arg0: memref<i32>) {
    %c0_i32 = arith.constant 0 : i32
    omp.atomic.update %arg0 : memref<i32> {
    ^bb0(%arg1: i32):
      %0 = arith.muli %arg1, %c0_i32 : i32
      omp.yield(%0 : i32)
    }
    return
  }
}

// -----
module {
  func.func @parallel_empty() {
    omp.parallel {
    }
    return
  }
}

// -----
module {
  func.func @parallel_only_terminator() {
    omp.parallel {
      omp.terminator
    }
    return
  }
}

// -----
module {
  func.func @parallel_no_side_effects(%arg0: i32, %arg1: i32) {
    omp.parallel {
      %0 = arith.addi %arg0, %arg1 : i32
      omp.terminator
    }
    return
  }
}

// -----
module {
  func.func @parallel_maybe_side_effects(%arg0: i32, %arg1: i32) {
    omp.parallel {
      func.call @foo() : () -> ()
      omp.terminator
    }
    return
  }
  func.func private @foo()
}

