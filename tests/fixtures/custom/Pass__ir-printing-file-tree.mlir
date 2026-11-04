module @outer {
  func.func @"sym/A"() {
    return
  }
  func.func @"sym\\backslash"() {
    return
  }
  module @inner {
    func.func @symB() {
      return
    }
    func.func @symC() {
      return
    }
  }
}

