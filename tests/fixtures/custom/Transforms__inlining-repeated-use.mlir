module {
  func.func @A() {
    call @B() {inA} : () -> ()
    return
  }
  func.func @B() {
    call @E() : () -> ()
    return
  }
  func.func @C() {
    call @D() : () -> ()
    return
  }
  func.func private @D() {
    call @B() {inD} : () -> ()
    return
  }
  func.func @E() {
    call @fabsf() : () -> ()
    return
  }
  func.func private @fabsf()
}

