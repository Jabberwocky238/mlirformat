module attributes {test.name = "simple"} {
  func.func @func_a() {
    return
  }
  func.func private @func_b()
  func.func @func_c() {
    call @func_b() : () -> ()
    return
  }
  func.func @func_d() {
    call @func_c() : () -> ()
    return
  }
  func.func @func_e() {
    call @func_c() : () -> ()
    call @func_d() : () -> ()
    call @func_e() : () -> ()
    return
  }
  func.func @func_f() {
    %0 = "test.functional_region_op"() ({
      func.call @func_f() : () -> ()
      "test.return"() : () -> ()
    }) : () -> (() -> ())
    call_indirect %0() : () -> ()
    return
  }
}

// -----
module attributes {test.name = "nested"} {
  module @nested_module {
    func.func @func_a() {
      return
    }
  }
  func.func @func_b() {
    "test.conversion_call_op"() <{callee = @nested_module::@func_a}> : () -> ()
    return
  }
}

// -----
module attributes {test.name = "SCC"} {
  func.func @foo(%arg0: () -> ()) {
    call_indirect %arg0() : () -> ()
    return
  }
  func.func @bar(%arg0: () -> ()) {
    call_indirect %arg0() : () -> ()
    return
  }
}

