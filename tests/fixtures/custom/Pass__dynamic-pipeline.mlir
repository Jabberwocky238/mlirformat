module {
  func.func @f() {
    return
  }
  module @inner_mod1 {
    func.func @foo() {
      return
    }
    func.func @baz() {
      return
    }
  }
  module @inner_mod2 {
    func.func @foo() {
      return
    }
  }
}

