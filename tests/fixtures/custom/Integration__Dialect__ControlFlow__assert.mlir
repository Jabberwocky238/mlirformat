module {
  func.func @main() {
    %false = arith.constant false
    %true = arith.constant true
    cf.assert %false, "assertion foo"
    cf.assert %true, "assertion bar"
    return
  }
}

