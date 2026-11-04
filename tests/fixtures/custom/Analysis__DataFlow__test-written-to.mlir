module {
  func.func @test_two_writes(%arg0: memref<i32>, %arg1: memref<i32>) -> (memref<i32>, memref<i32>) {
    %c0_i32 = arith.constant {tag = "constant0"} 0 : i32
    %c1_i32 = arith.constant {tag = "constant1"} 1 : i32
    memref.store %c0_i32, %arg0[] {tag_name = "a"} : memref<i32>
    memref.store %c1_i32, %arg1[] {tag_name = "b"} : memref<i32>
    return %arg0, %arg1 : memref<i32>, memref<i32>
  }
}

// -----
module {
  func.func @test_if(%arg0: memref<i32>, %arg1: memref<i32>, %arg2: i1) {
    %c2_i32 = arith.constant {tag = "c0"} 2 : i32
    %c3_i32 = arith.constant {tag = "c1"} 3 : i32
    %0 = arith.addi %arg2, %arg2 {tag = "condition"} : i1
    %1:2 = scf.if %0 -> (i32, i32) {
      %c0_i32 = arith.constant {tag = "c2"} 0 : i32
      scf.yield %c0_i32, %c2_i32 : i32, i32
    } else {
      %c1_i32 = arith.constant {tag = "c3"} 1 : i32
      scf.yield %c1_i32, %c3_i32 : i32, i32
    }
    memref.store %1#0, %arg0[] {tag_name = "a"} : memref<i32>
    memref.store %1#1, %arg1[] {tag_name = "b"} : memref<i32>
    return
  }
}

// -----
module {
  func.func @test_blocks(%arg0: memref<i32>, %arg1: memref<i32>, %arg2: memref<i32>, %arg3: i1) {
    %c0_i32 = arith.constant {tag = "c0"} 0 : i32
    %c1_i32 = arith.constant {tag = "c1"} 1 : i32
    cf.cond_br %arg3, ^bb1(%c0_i32 : i32), ^bb2(%c1_i32 : i32) {tag = "br"}
  ^bb1(%0: i32):  // pred: ^bb0
    memref.store %0, %arg0[] {tag_name = "a"} : memref<i32>
    cf.br ^bb3(%0 : i32)
  ^bb2(%1: i32):  // pred: ^bb0
    memref.store %1, %arg1[] {tag_name = "b"} : memref<i32>
    cf.br ^bb3(%1 : i32)
  ^bb3(%2: i32):  // 2 preds: ^bb1, ^bb2
    memref.store %2, %arg2[] {tag_name = "c"} : memref<i32>
    return
  }
}

// -----
module {
  func.func @test_infinite_loop(%arg0: memref<i32>) {
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    %c2_i32 = arith.constant {tag = "two"} 2 : i32
    %c-1_i32 = arith.constant -1 : i32
    cf.br ^bb1(%c0_i32, %c1_i32, %c2_i32 : i32, i32, i32)
  ^bb1(%0: i32, %1: i32, %2: i32):  // 2 preds: ^bb0, ^bb1
    memref.store %0, %arg0[] {tag_name = "a"} : memref<i32>
    cf.br ^bb1(%1, %2, %c-1_i32 : i32, i32, i32)
  }
}

// -----
module {
  func.func @test_switch(%arg0: i32, %arg1: memref<i32>) {
    %c0_i32 = arith.constant {tag = "c0"} 0 : i32
    cf.switch %arg0 : i32, [
      default: ^bb1(%c0_i32 : i32),
      42: ^bb2(%c0_i32 : i32),
      43: ^bb3(%c0_i32 : i32)
    ]
  ^bb1(%0: i32):  // pred: ^bb0
    memref.store %0, %arg1[] {tag_name = "a"} : memref<i32>
    cf.br ^bb3(%0 : i32)
  ^bb2(%1: i32):  // pred: ^bb0
    memref.store %1, %arg1[] {tag_name = "b"} : memref<i32>
    cf.br ^bb3(%1 : i32)
  ^bb3(%2: i32):  // 3 preds: ^bb0, ^bb1, ^bb2
    memref.store %2, %arg1[] {tag_name = "c"} : memref<i32>
    return
  }
}

// -----
module {
  func.func @test_caller(%arg0: memref<f32>, %arg1: f32) {
    %0 = arith.addf %arg1, %arg1 {tag = "add"} : f32
    %1 = call @callee(%0) : (f32) -> f32
    %2 = arith.mulf %1, %1 : f32
    %3 = arith.mulf %2, %2 : f32
    %4 = arith.mulf %3, %3 : f32
    memref.store %4, %arg0[] {tag_name = "a"} : memref<f32>
    return
  }
  func.func private @callee(%arg0: f32) -> f32 {
    %0 = arith.mulf %arg0, %arg0 : f32
    %1 = arith.mulf %0, %0 : f32
    return %1 : f32
  }
}

// -----
module {
  func.func private @callee(%arg0: f32) -> f32 {
    %0 = arith.mulf %arg0, %arg0 : f32
    return %0 : f32
  }
  func.func @test_caller_below_callee(%arg0: memref<f32>, %arg1: f32) {
    %0 = arith.subf %arg1, %arg1 {tag = "sub"} : f32
    %1 = call @callee(%0) : (f32) -> f32
    memref.store %1, %arg0[] {tag_name = "a"} : memref<f32>
    return
  }
}

// -----
module {
  func.func private @callee1(%arg0: f32) -> f32 {
    %0 = call @callee2(%arg0) : (f32) -> f32
    return %0 : f32
  }
  func.func private @callee2(%arg0: f32) -> f32 {
    %0 = call @callee3(%arg0) : (f32) -> f32
    return %0 : f32
  }
  func.func private @callee3(%arg0: f32) -> f32 {
    return %arg0 : f32
  }
  func.func @test_callchain(%arg0: memref<f32>, %arg1: f32) {
    %0 = arith.mulf %arg1, %arg1 {tag = "mul"} : f32
    %1 = call @callee1(%0) : (f32) -> f32
    memref.store %1, %arg0[] {tag_name = "a"} : memref<f32>
    return
  }
}

// -----
module {
  func.func @test_while(%arg0: memref<i32>, %arg1: i32, %arg2: i1) {
    %c0_i32 = arith.constant {tag = "zero"} 0 : i32
    %0 = arith.addi %arg1, %arg1 {tag = "init"} : i32
    %1:2 = scf.while (%arg3 = %c0_i32, %arg4 = %0) : (i32, i32) -> (i32, i32) {
      memref.store %arg4, %arg0[] {tag_name = "a"} : memref<i32>
      scf.condition(%arg2) {tag = "condition"} %arg3, %arg4 : i32, i32
    } do {
    ^bb0(%arg3: i32, %arg4: i32):
      memref.store %arg3, %arg0[] {tag_name = "c"} : memref<i32>
      %2 = arith.addi %arg4, %arg4 : i32
      scf.yield %2, %2 : i32, i32
    }
    memref.store %1#1, %arg0[] {tag_name = "b"} : memref<i32>
    return
  }
}

// -----
module {
  func.func @test_complex_while(%arg0: memref<i32>, %arg1: i1) {
    %c0_i32 = arith.constant {tag = "zero"} 0 : i32
    %c1_i32 = arith.constant {tag = "one"} 1 : i32
    %0 = scf.while (%arg2 = %c0_i32, %arg3 = %c1_i32) : (i32, i32) -> i32 {
      scf.condition(%arg1) {tag = "condition"} %arg3 : i32
    } do {
    ^bb0(%arg2: i32):
      scf.yield %arg2, %arg2 : i32, i32
    }
    memref.store %0, %arg0[] {tag_name = "a"} : memref<i32>
    return
  }
}

// -----
module {
  func.func @test_for(%arg0: memref<i32>) {
    %c0 = arith.constant {tag = "zero"} 0 : index
    %c10 = arith.constant {tag = "ten"} 10 : index
    %c1 = arith.constant {tag = "one"} 1 : index
    %c0_i32 = arith.constant {tag = "x"} 0 : i32
    %0 = scf.for %arg1 = %c0 to %c10 step %c1 iter_args(%arg2 = %c0_i32) -> (i32) {
      scf.yield %arg2 : i32
    }
    memref.store %0, %arg0[] {tag_name = "a"} : memref<i32>
    return
  }
}

// -----
module {
  func.func @test_switch(%arg0: index, %arg1: memref<i32>) {
    %0:2 = scf.index_switch %arg0 {tag = "switch"} -> i32, i32 
    case 1 {
      %c10_i32 = arith.constant {tag = "1a"} 10 : i32
      %c100_i32 = arith.constant {tag = "1b"} 100 : i32
      scf.yield %c10_i32, %c100_i32 : i32, i32
    }
    case 2 {
      %c20_i32 = arith.constant {tag = "2a"} 20 : i32
      %c200_i32 = arith.constant {tag = "2b"} 200 : i32
      scf.yield %c20_i32, %c200_i32 : i32, i32
    }
    default {
      %c30_i32 = arith.constant {tag = "default_a"} 30 : i32
      %c300_i32 = arith.constant {tag = "default_b"} 300 : i32
      scf.yield %c30_i32, %c300_i32 : i32, i32
    }
    memref.store %0#0, %arg1[] {tag_name = "a"} : memref<i32>
    memref.store %0#1, %arg1[] {tag_name = "b"} : memref<i32>
    return
  }
}

// -----
module {
  llvm.func @decl(i64)
  llvm.func @func(%arg0: i64) {
    llvm.call @decl(%arg0) : (i64) -> ()
    llvm.return
  }
}

// -----
module {
  func.func private @callee(%arg0: i32, %arg1: i32) -> i32 {
    return %arg0 : i32
  }
  func.func @test_call_on_device(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: memref<i32>) {
    %0 = test.call_on_device @callee(%arg0, %arg1), %arg2 {tag = "a"} : (i32, i32, i32) -> i32
    memref.store %0, %arg3[] {tag_name = "b"} : memref<i32>
    return
  }
}

// -----
module {
  func.func private @external_callee(i32) -> i32
  func.func @test_external_callee(%arg0: i32, %arg1: memref<i32>) {
    %0 = arith.addi %arg0, %arg0 {tag = "add_external"} : i32
    %1 = call @external_callee(%arg0) : (i32) -> i32
    memref.store %1, %arg1[] {tag_name = "a"} : memref<i32>
    return
  }
}

