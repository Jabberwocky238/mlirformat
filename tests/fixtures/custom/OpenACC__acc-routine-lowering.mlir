module {
  acc.routine @routine_seq func(@host_foo) seq 
  func.func @host_foo(%arg0: memref<8xi32>) {
    %c0 = arith.constant 0 : index
    %c0_i32 = arith.constant 0 : i32
    memref.store %c0_i32, %arg0[%c0] : memref<8xi32>
    return
  }
}

// -----
module {
  acc.routine @routine_vec func(@host_bar) vector 
  func.func @host_bar(%arg0: memref<4xi32>) {
    %c0 = arith.constant 0 : index
    %c0_i32 = arith.constant 0 : i32
    memref.store %c0_i32, %arg0[%c0] : memref<4xi32>
    return
  }
}

// -----
module {
  acc.routine @routine_worker func(@host_worker) worker 
  func.func @host_worker(%arg0: i32) {
    return
  }
}

// -----
module {
  acc.routine @routine_gang func(@host_gang) gang
  func.func @host_gang() {
    return
  }
}

// -----
module {
  acc.routine @routine_ret func(@host_ret) seq 
  func.func @host_ret(%arg0: i1) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    %0 = arith.select %arg0, %c0_i32, %c1_i32 : i32
    return %0 : i32
  }
}

// -----
module {
  acc.routine @routine_cf func(@host_cf) seq 
  func.func @host_cf(%arg0: i1) -> i32 {
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    %c0_i32 = arith.constant 0 : i32
    return %c0_i32 : i32
  ^bb2:  // pred: ^bb0
    %c1_i32 = arith.constant 1 : i32
    return %c1_i32 : i32
  }
}

// -----
module {
  acc.routine @routine_bind func(@host_bind) bind("myname") seq 
  func.func @host_bind() {
    return
  }
}

// -----
module {
  acc.routine @r_a func(@f_a) seq 
  acc.routine @r_b func(@f_a) vector 
  func.func @f_a() {
    return
  }
}

