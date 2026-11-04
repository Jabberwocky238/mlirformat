module {
  func.func @foo() {
    return
  }
  module {
    func.func @foo() {
      return
    }
  }
}

