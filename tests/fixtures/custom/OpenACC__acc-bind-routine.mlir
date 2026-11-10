module {
  acc.routine @r_bind func(@foo) bind(@bar) seq 
  func.func @foo() attributes {acc.routine_info = #acc.routine_info<[@r_bind]>} {
    return
  }
  func.func @bar() {
    return
  }
  func.func @main() {
    acc.serial {
      func.call @foo() : () -> ()
      acc.yield
    }
    return
  }
}

// -----
module {
  acc.routine @r_bind_str func(@wrapped) bind("actual_impl") seq 
  func.func @wrapped() attributes {acc.routine_info = #acc.routine_info<[@r_bind_str]>} {
    return
  }
  func.func @actual_impl() {
    return
  }
  func.func @entry() {
    acc.serial {
      func.call @wrapped() : () -> ()
      acc.yield
    }
    return
  }
}

// -----
module {
  acc.routine @r_bind func(@foo) bind(@bar) seq 
  func.func @foo() attributes {acc.routine_info = #acc.routine_info<[@r_bind]>} {
    return
  }
  func.func @bar() {
    return
  }
  func.func @main() {
    call @foo() : () -> ()
    acc.serial {
      func.call @foo() : () -> ()
      acc.yield
    }
    return
  }
}

// -----
module {
  acc.routine @r_bind func(@target) bind(@bound) seq 
  func.func @target() attributes {acc.routine_info = #acc.routine_info<[@r_bind]>} {
    return
  }
  func.func @bound() {
    return
  }
  func.func @caller(%arg0: () -> ()) {
    acc.serial {
      func.call_indirect %arg0() : () -> ()
      acc.yield
    }
    return
  }
}

// -----
module {
  acc.routine @acc_routine_0 func(@my_device_func) bind("__wrapper_my_device_func") seq 
  acc.routine @acc_routine_1 func(@my_device_sub) bind("__wrapper_my_device_sub") seq 
  func.func private @my_device_func(i32) -> i32 attributes {acc.routine_info = #acc.routine_info<[@acc_routine_0]>}
  func.func private @my_device_sub(i32, memref<i32>) attributes {acc.routine_info = #acc.routine_info<[@acc_routine_1]>}
  gpu.module @cuda_device_mod {
    gpu.func @test(%arg0: i32, %arg1: memref<i32>) {
      %0 = func.call @my_device_func(%arg0) : (i32) -> i32
      func.call @my_device_sub(%arg0, %arg1) : (i32, memref<i32>) -> ()
      gpu.return
    }
    func.func private @my_device_func(i32) -> i32 attributes {acc.routine_info = #acc.routine_info<[@acc_routine_0]>}
    func.func private @my_device_sub(i32, memref<i32>) attributes {acc.routine_info = #acc.routine_info<[@acc_routine_1]>}
  }
}

