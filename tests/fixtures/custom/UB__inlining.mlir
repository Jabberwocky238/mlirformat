module {
  func.func @func() -> i32 {
    %0 = ub.poison : i32
    return %0 : i32
  }
  func.func @test_inline(%arg0: !llvm.ptr) -> i32 {
    %0 = call @func() : () -> i32
    return %0 : i32
  }
}

