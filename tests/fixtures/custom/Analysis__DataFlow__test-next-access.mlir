module {
  func.func @trivial(%arg0: memref<f32>, %arg1: f32) -> f32 {
    memref.store %arg1, %arg0[] {name = "store"} : memref<f32>
    %0 = memref.load %arg0[] {name = "load"} : memref<f32>
    return %0 : f32
  }
  func.func @chain(%arg0: memref<f32>, %arg1: f32) -> f32 {
    memref.store %arg1, %arg0[] {name = "store"} : memref<f32>
    %0 = memref.load %arg0[] {name = "load 1"} : memref<f32>
    %1 = memref.load %arg0[] {name = "load 2"} : memref<f32>
    %2 = arith.addf %0, %1 : f32
    return %2 : f32
  }
  func.func @branch(%arg0: memref<f32>, %arg1: f32, %arg2: i1) -> f32 {
    memref.store %arg1, %arg0[] {name = "store"} : memref<f32>
    cf.cond_br %arg2, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    %0 = memref.load %arg0[] {name = "load 1"} : memref<f32>
    cf.br ^bb3(%0 : f32)
  ^bb2:  // pred: ^bb0
    %1 = memref.load %arg0[] {name = "load 2"} : memref<f32>
    cf.br ^bb3(%1 : f32)
  ^bb3(%2: f32):  // 2 preds: ^bb1, ^bb2
    return %2 : f32
  }
  func.func @dead_branch(%arg0: memref<f32>, %arg1: f32) -> f32 {
    memref.store %arg1, %arg0[] {name = "store"} : memref<f32>
    cf.br ^bb2
  ^bb1:  // no predecessors
    %0 = memref.load %arg0[] {name = "load 1"} : memref<f32>
    cf.br ^bb3(%0 : f32)
  ^bb2:  // pred: ^bb0
    %1 = memref.load %arg0[] {name = "load 2"} : memref<f32>
    cf.br ^bb3(%1 : f32)
  ^bb3(%2: f32):  // 2 preds: ^bb1, ^bb2
    return %2 : f32
  }
  func.func @loop(%arg0: memref<?xf32>, %arg1: f32, %arg2: index, %arg3: index, %arg4: index) -> f32 {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = memref.load %arg0[%arg4] {name = "pre"} : memref<?xf32>
    %1 = scf.for %arg5 = %arg2 to %arg3 step %arg4 iter_args(%arg6 = %cst) -> (f32) {
      %4 = memref.load %arg0[%arg5] {name = "loop"} : memref<?xf32>
      %5 = arith.addf %arg6, %4 : f32
      scf.yield %5 : f32
    }
    %2 = memref.load %arg0[%arg3] {name = "outside"} : memref<?xf32>
    %3 = arith.addf %2, %1 : f32
    return %3 : f32
  }
  func.func @conditional(%arg0: i1, %arg1: memref<f32>) {
    %0 = memref.load %arg1[] {name = "pre"} : memref<f32>
    scf.if %arg0 {
      %2 = memref.load %arg1[] {name = "then"} : memref<f32>
    }
    %1 = memref.load %arg1[] {name = "post"} : memref<f32>
    return
  }
  func.func @two_sided_conditional(%arg0: i1, %arg1: memref<f32>) {
    %0 = memref.load %arg1[] {name = "pre"} : memref<f32>
    scf.if %arg0 {
      %2 = memref.load %arg1[] {name = "then"} : memref<f32>
    } else {
      %2 = memref.load %arg1[] {name = "else"} : memref<f32>
    }
    %1 = memref.load %arg1[] {name = "post"} : memref<f32>
    return
  }
  func.func @dead_conditional(%arg0: memref<f32>) {
    %false = arith.constant false
    %0 = memref.load %arg0[] {name = "pre"} : memref<f32>
    scf.if %false {
      %2 = memref.load %arg0[] {name = "then"} : memref<f32>
    }
    %1 = memref.load %arg0[] {name = "post"} : memref<f32>
    return
  }
  func.func @known_conditional(%arg0: memref<f32>) {
    %false = arith.constant false
    %0 = memref.load %arg0[] {name = "pre"} : memref<f32>
    scf.if %false {
      %2 = memref.load %arg0[] {name = "then"} : memref<f32>
    } else {
      %2 = memref.load %arg0[] {name = "else"} : memref<f32>
    }
    %1 = memref.load %arg0[] {name = "post"} : memref<f32>
    return
  }
  func.func @loop_cf(%arg0: memref<?xf32>, %arg1: f32, %arg2: index, %arg3: index, %arg4: index) -> f32 {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = memref.load %arg0[%arg4] {name = "pre"} : memref<?xf32>
    cf.br ^bb1(%arg2, %cst : index, f32)
  ^bb1(%1: index, %2: f32):  // 2 preds: ^bb0, ^bb2
    %3 = arith.cmpi slt, %1, %arg3 : index
    cf.cond_br %3, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %4 = memref.load %arg0[%1] {name = "loop"} : memref<?xf32>
    %5 = arith.addf %2, %4 : f32
    %6 = arith.addi %1, %arg4 : index
    cf.br ^bb1(%6, %5 : index, f32)
  ^bb3:  // pred: ^bb1
    %7 = memref.load %arg0[%arg3] {name = "outside"} : memref<?xf32>
    %8 = arith.addf %7, %2 : f32
    return %8 : f32
  }
  func.func @conditional_cf(%arg0: i1, %arg1: memref<f32>) {
    %0 = memref.load %arg1[] {name = "pre"} : memref<f32>
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    %1 = memref.load %arg1[] {name = "then"} : memref<f32>
    cf.br ^bb2
  ^bb2:  // 2 preds: ^bb0, ^bb1
    %2 = memref.load %arg1[] {name = "post"} : memref<f32>
    return
  }
  func.func @two_sided_conditional_cf(%arg0: i1, %arg1: memref<f32>) {
    %0 = memref.load %arg1[] {name = "pre"} : memref<f32>
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    %1 = memref.load %arg1[] {name = "then"} : memref<f32>
    cf.br ^bb3
  ^bb2:  // pred: ^bb0
    %2 = memref.load %arg1[] {name = "else"} : memref<f32>
    cf.br ^bb3
  ^bb3:  // 2 preds: ^bb1, ^bb2
    %3 = memref.load %arg1[] {name = "post"} : memref<f32>
    return
  }
  func.func @dead_conditional_cf(%arg0: memref<f32>) {
    %false = arith.constant false
    %0 = memref.load %arg0[] {name = "pre"} : memref<f32>
    cf.cond_br %false, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    %1 = memref.load %arg0[] {name = "then"} : memref<f32>
    cf.br ^bb2
  ^bb2:  // 2 preds: ^bb0, ^bb1
    %2 = memref.load %arg0[] {name = "post"} : memref<f32>
    return
  }
  func.func @known_conditional_cf(%arg0: memref<f32>) {
    %false = arith.constant false
    %0 = memref.load %arg0[] {name = "pre"} : memref<f32>
    cf.cond_br %false, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    %1 = memref.load %arg0[] {name = "then"} : memref<f32>
    cf.br ^bb3
  ^bb2:  // pred: ^bb0
    %2 = memref.load %arg0[] {name = "else"} : memref<f32>
    cf.br ^bb3
  ^bb3:  // 2 preds: ^bb1, ^bb2
    %3 = memref.load %arg0[] {name = "post"} : memref<f32>
    return
  }
}

// -----
module {
  func.func private @callee1(%arg0: memref<f32>) {
    %0 = memref.load %arg0[] {name = "callee1"} : memref<f32>
    return
  }
  func.func private @callee2(%arg0: memref<f32>) {
    %0 = memref.load %arg0[] {name = "callee2"} : memref<f32>
    return
  }
  func.func @simple_call(%arg0: memref<f32>) {
    %0 = memref.load %arg0[] {name = "caller"} : memref<f32>
    call @callee1(%arg0) {name = "call"} : (memref<f32>) -> ()
    %1 = memref.load %arg0[] {name = "post"} : memref<f32>
    return
  }
}

// -----
module {
  func.func @infinite_recursive_call(%arg0: memref<f32>) {
    %0 = memref.load %arg0[] {name = "pre"} : memref<f32>
    call @infinite_recursive_call(%arg0) {name = "call"} : (memref<f32>) -> ()
    %1 = memref.load %arg0[] {name = "post"} : memref<f32>
    return
  }
}

// -----
module {
  func.func @recursive_call(%arg0: memref<f32>, %arg1: i1) {
    %0 = memref.load %arg0[] {name = "pre"} : memref<f32>
    scf.if %arg1 {
      func.call @recursive_call(%arg0, %arg1) {name = "call"} : (memref<f32>, i1) -> ()
    }
    %1 = memref.load %arg0[] {name = "post"} : memref<f32>
    return
  }
}

// -----
module {
  func.func @recursive_call_cf(%arg0: memref<f32>, %arg1: i1) {
    %0 = memref.load %arg0[] {name = "pre"} : memref<f32>
    cf.cond_br %arg1, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    call @recursive_call_cf(%arg0, %arg1) {name = "call"} : (memref<f32>, i1) -> ()
    cf.br ^bb2
  ^bb2:  // 2 preds: ^bb0, ^bb1
    %1 = memref.load %arg0[] {name = "post"} : memref<f32>
    return
  }
}

// -----
module {
  func.func private @callee1(%arg0: memref<f32>) {
    %0 = memref.load %arg0[] {name = "callee1"} : memref<f32>
    return
  }
  func.func private @callee2(%arg0: memref<f32>) {
    %0 = memref.load %arg0[] {name = "callee2"} : memref<f32>
    return
  }
  func.func @conditonal_call(%arg0: memref<f32>, %arg1: i1) {
    %0 = memref.load %arg0[] {name = "pre"} : memref<f32>
    scf.if %arg1 {
      func.call @callee1(%arg0) {name = "call1"} : (memref<f32>) -> ()
    } else {
      func.call @callee2(%arg0) {name = "call2"} : (memref<f32>) -> ()
    }
    %1 = memref.load %arg0[] {name = "post"} : memref<f32>
    return
  }
}

// -----
module {
  func.func private @callee(%arg0: memref<f32>) {
    %0 = memref.load %arg0[] {name = "callee"} : memref<f32>
    return
  }
  func.func @call_and_store_before(%arg0: memref<f32>) {
    %0 = memref.load %arg0[] {name = "caller"} : memref<f32>
    test.call_and_store @callee(%arg0), %arg0 {name = "call", store_before_call = true} : (memref<f32>, memref<f32>) -> ()
    %1 = memref.load %arg0[] {name = "post"} : memref<f32>
    return
  }
}

// -----
module {
  func.func private @callee(%arg0: memref<f32>) {
    %0 = memref.load %arg0[] {name = "callee"} : memref<f32>
    return
  }
  func.func @call_and_store_after(%arg0: memref<f32>) {
    %0 = memref.load %arg0[] {name = "caller"} : memref<f32>
    test.call_and_store @callee(%arg0), %arg0 {name = "call", store_before_call = false} : (memref<f32>, memref<f32>) -> ()
    %1 = memref.load %arg0[] {name = "post"} : memref<f32>
    return
  }
}

// -----
module {
  func.func @store_with_a_region_before(%arg0: memref<f32>) {
    %0 = memref.load %arg0[] {name = "pre"} : memref<f32>
    test.store_with_a_region %arg0 attributes {name = "region", store_before_region = true} {
      test.store_with_a_region_terminator
    } : memref<f32>
    %1 = memref.load %arg0[] {name = "post"} : memref<f32>
    return
  }
  func.func @store_with_a_region_after(%arg0: memref<f32>) {
    %0 = memref.load %arg0[] {name = "pre"} : memref<f32>
    test.store_with_a_region %arg0 attributes {name = "region", store_before_region = false} {
      test.store_with_a_region_terminator
    } : memref<f32>
    %1 = memref.load %arg0[] {name = "post"} : memref<f32>
    return
  }
  func.func @store_with_a_region_before_containing_a_load(%arg0: memref<f32>) {
    %0 = memref.load %arg0[] {name = "pre"} : memref<f32>
    test.store_with_a_region %arg0 attributes {name = "region", store_before_region = true} {
      %2 = memref.load %arg0[] {name = "inner"} : memref<f32>
      test.store_with_a_region_terminator
    } : memref<f32>
    %1 = memref.load %arg0[] {name = "post"} : memref<f32>
    return
  }
  func.func @store_with_a_region_after_containing_a_load(%arg0: memref<f32>) {
    %0 = memref.load %arg0[] {name = "pre"} : memref<f32>
    test.store_with_a_region %arg0 attributes {name = "region", store_before_region = false} {
      %2 = memref.load %arg0[] {name = "inner"} : memref<f32>
      test.store_with_a_region_terminator
    } : memref<f32>
    %1 = memref.load %arg0[] {name = "post"} : memref<f32>
    return
  }
}

// -----
module {
  func.func private @opaque_callee(memref<f32>)
  func.func @call_opaque_callee(%arg0: memref<f32>) {
    %0 = memref.load %arg0[] {name = "pre"} : memref<f32>
    call @opaque_callee(%arg0) {name = "call"} : (memref<f32>) -> ()
    %1 = memref.load %arg0[] {name = "post"} : memref<f32>
    return
  }
}

// -----
module {
  func.func @indirect_call(%arg0: memref<f32>, %arg1: (memref<f32>) -> ()) {
    %0 = memref.load %arg0[] {name = "pre"} : memref<f32>
    call_indirect %arg1(%arg0) {name = "call"} : (memref<f32>) -> ()
    %1 = memref.load %arg0[] {name = "post"} : memref<f32>
    return
  }
}

