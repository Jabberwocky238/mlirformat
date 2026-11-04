module {
  func.func @foo() {
    return
  }
  func.func @bar() {
    return
  }
  func.func @baz() {
    return
  }
  func.func @foobar() {
    return
  }
  module {
    func.func @baz() {
      return
    }
    func.func @foobar() {
      return
    }
  }
}

