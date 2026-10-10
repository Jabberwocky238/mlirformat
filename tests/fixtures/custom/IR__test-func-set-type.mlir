module {
}

// -----
module {
  func.func private @t(f32)
  func.func private @erase_arg(f32 {test.A}, f32 {test.B}) attributes {test.set_type_from = @t}
}

// -----
module {
  func.func private @t() -> f32
  func.func private @erase_result() -> (f32 {test.A}, f32 {test.B}) attributes {test.set_type_from = @t}
}

