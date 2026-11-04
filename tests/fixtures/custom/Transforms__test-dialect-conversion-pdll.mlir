module {
  func.func @TestSingleConversion() {
    %0 = "test.cast"() : () -> i64
    "test.return"(%0) : (i64) -> ()
  }
  func.func @TestLingeringConversion() -> i64 {
    %0 = "test.cast"() : () -> i64
    return %0 : i64
  }
}

