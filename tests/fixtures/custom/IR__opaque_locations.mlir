module {
  func.func @inline_notation() -> i32 {
    %0 = "test.foo"() : () -> i32
    %c4 = arith.constant 4 : index
    affine.for %arg0 = 0 to 8 {
    }
    affine.for %arg0 = 0 to 8 {
    }
    return %0 : i32
  }
}

