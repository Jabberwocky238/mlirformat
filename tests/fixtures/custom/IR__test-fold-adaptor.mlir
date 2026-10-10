module {
  func.func @test() -> i32 {
    %0 = "test.constant"() <{value = 5 : i32}> : () -> i32
    %1 = "test.constant"() <{value = 1 : i32}> : () -> i32
    %2 = "test.constant"() <{value = 2 : i32}> : () -> i32
    %3 = "test.constant"() <{value = 3 : i32}> : () -> i32
    %4 = test.fold_with_fold_adaptor %0, [%1, %2], {(%3), (%3)} {
      %5 = "test.constant"() <{value = 0 : i32}> : () -> i32
    }
    return %4 : i32
  }
}

