module {
  func.func private @f() -> (f32 {test.erase_this_result})
}

// -----
module {
  func.func private @f() -> (f32 {test.erase_this_result}, f32 {test.A})
}

// -----
module {
  func.func private @f() -> (f32 {test.A}, f32 {test.erase_this_result})
}

// -----
module {
  func.func private @f() -> (f32 {test.A}, f32 {test.erase_this_result}, f32 {test.B})
}

// -----
module {
  func.func private @f() -> (f32 {test.A}, f32 {test.erase_this_result}, f32 {test.erase_this_result}, f32 {test.B})
}

// -----
module {
  func.func private @f() -> (f32 {test.A}, f32 {test.erase_this_result}, f32 {test.B}, f32 {test.erase_this_result}, f32 {test.C})
}

// -----
module {
  func.func private @f() -> (tensor<1xf32>, f32 {test.erase_this_result}, tensor<2xf32>, f32 {test.erase_this_result}, tensor<3xf32>)
}

// -----
module {
  llvm.func @llvm_func(!llvm.ptr, i64)
}

