module {
  func.func @f() {
    return
  }
  module @inner_mod1 {
    module @foo {
    }
    module @baz {
    }
  }
}

