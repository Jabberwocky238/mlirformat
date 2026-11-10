module {
  acc.routine @routine_seq func(@host_foo) seq 
  func.func @host_foo(%arg0: memref<8xi32>) attributes {acc.specialized_routine = #acc.specialized_routine<@routine_seq, <seq>, "host_foo">} {
    %c0 = arith.constant 0 : index
    %c0_i32 = arith.constant 0 : i32
    memref.store %c0_i32, %arg0[%c0] : memref<8xi32>
    return
  }
}

// -----
module {
  acc.routine @routine_seq func(@host_foo) seq 
  acc.routine @routine_bind func(@host_bind) bind("myname") seq 
  func.func @host_foo() attributes {acc.specialized_routine = #acc.specialized_routine<@routine_seq, <seq>, "host_foo">} {
    return
  }
  func.func @host_bind() {
    return
  }
}

// -----
module {
  acc.routine @acc_routine_0 func(@devicefunc)
  func.func @devicefunc() attributes {acc.specialized_routine = #acc.specialized_routine<@acc_routine_0, <seq>, "devicefunc">} {
    return
  }
  acc.routine @acc_routine_1 func(@declfunc)
  func.func private @declfunc()
}

// -----
module {
  acc.routine @acc_routine_0 func(@nohost_vec) vector  nohost
  func.func @nohost_vec(%arg0: i32) attributes {acc.specialized_routine = #acc.specialized_routine<@acc_routine_0, <vector>, "nohost_vec">} {
    return
  }
}

