module {
  func.func @main() {
    %false = arith.constant false
    cf.assert %false, "assertion foo"
    return
  }
}

