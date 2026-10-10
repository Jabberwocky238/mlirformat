module {
  func.func private @f() attributes {test.insert_results = [[0, f32, {test.A}]]}
}

// -----
module {
  func.func private @f() -> (f32 {test.B}) attributes {test.insert_results = [[0, f32, {test.A}]]}
}

// -----
module {
  func.func private @f() -> (f32 {test.A}) attributes {test.insert_results = [[1, f32, {test.B}]]}
}

// -----
module {
  func.func private @f() -> (f32 {test.A}, f32 {test.C}) attributes {test.insert_results = [[1, f32, {test.B}]]}
}

// -----
module {
  func.func private @f() -> (f32 {test.B}) attributes {test.insert_results = [[0, f32, {test.A}], [1, f32, {test.C}]]}
}

// -----
module {
  func.func private @f() -> (f32 {test.C}) attributes {test.insert_results = [[0, f32, {test.A}], [0, f32, {test.B}]]}
}

