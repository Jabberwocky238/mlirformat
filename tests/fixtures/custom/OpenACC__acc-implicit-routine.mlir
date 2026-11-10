module {
}

// -----
module {
  func.func @callee() {
    return
  }
  func.func @test_serial_call() {
    acc.serial {
      func.call @callee() : () -> ()
      acc.yield
    }
    return
  }
}

// -----
module {
  func.func @leaf() {
    return
  }
  func.func @middle() {
    call @leaf() : () -> ()
    return
  }
  func.func @test_nested_calls() {
    acc.serial {
      func.call @middle() : () -> ()
      acc.yield
    }
    return
  }
}

// -----
module {
  func.func @loop_callee() {
    return
  }
  func.func @test_loop_call() {
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    acc.parallel {
      acc.loop control(%arg0 : index) = (%c1 : index) to (%c10 : index)  step (%c1 : index) {
        func.call @loop_callee() : () -> ()
        acc.yield
      } attributes {independent = [#acc.device_type<none>]}
      acc.yield
    }
    return
  }
}

// -----
module {
  func.func @kernels_callee() {
    return
  }
  func.func @test_kernels_call() {
    acc.kernels {
      func.call @kernels_callee() : () -> ()
      acc.terminator
    }
    return
  }
}

// -----
module {
  func.func @cycle_a() {
    call @cycle_b() : () -> ()
    return
  }
  func.func @cycle_b() {
    call @cycle_a() : () -> ()
    return
  }
  func.func @test_cyclic_calls() {
    acc.serial {
      func.call @cycle_a() : () -> ()
      acc.yield
    }
    return
  }
}

// -----
module {
  acc.routine @r_explicit func(@host_fn) seq 
  func.func @host_fn() attributes {acc.routine_info = #acc.routine_info<[@r_explicit]>} {
    return
  }
  func.func @test_explicit_routine_callee() {
    acc.serial {
      func.call @host_fn() : () -> ()
      acc.yield
    }
    return
  }
}

// -----
module {
  acc.routine @r_bind func(@foo) bind(@bar) seq 
  func.func @foo() attributes {acc.routine_info = #acc.routine_info<[@r_bind]>} {
    call @only_in_bound_routine() : () -> ()
    return
  }
  func.func @bar() {
    return
  }
  func.func @only_in_bound_routine() {
    return
  }
  func.func @test_bind_skips_recursive() {
    acc.serial {
      func.call @foo() : () -> ()
      acc.yield
    }
    return
  }
}

// -----
module {
  func.func private @llvm.sqrt.f32(f32) -> f32
  func.func @test_llvm_intrinsic(%arg0: f32) {
    acc.serial {
      %0 = func.call @llvm.sqrt.f32(%arg0) : (f32) -> f32
      acc.yield
    }
    return
  }
}

// -----
module {
  func.func @outside_callee() {
    return
  }
  func.func @test_call_outside_region() {
    call @outside_callee() : () -> ()
    acc.serial {
      acc.yield
    }
    return
  }
}

// -----
module {
  func.func @test_indirect_in_serial(%arg0: () -> ()) {
    acc.serial {
      func.call_indirect %arg0() : () -> ()
      acc.yield
    }
    return
  }
}

// -----
module {
  acc.routine @explicit_routine func(@routine_caller) seq 
  func.func @routine_caller(%arg0: () -> ()) attributes {acc.routine_info = #acc.routine_info<[@explicit_routine]>} {
    call_indirect %arg0() : () -> ()
    return
  }
}

// -----
module {
  func.func @test_undefined_callee() {
    %alloca = memref.alloca() : memref<f32>
    acc.serial {
      test.call_and_store @undefined_callee(%alloca), %alloca {store_before_call = false} : (memref<f32>, memref<f32>) -> ()
      acc.yield
    }
    return
  }
}

