module {
  func.func @f() attributes {test.insert_args = [[0, i1, {test.A}]]} {
    return
  }
}

// -----
module {
  func.func @f(%arg0: i2 {test.B}) attributes {test.insert_args = [[0, i1, {test.A}]]} {
    return
  }
}

// -----
module {
  func.func @f(%arg0: i1 {test.A}) attributes {test.insert_args = [[1, i2, {test.B}]]} {
    return
  }
}

// -----
module {
  func.func @f(%arg0: i1 {test.A}, %arg1: i3 {test.C}) attributes {test.insert_args = [[1, i2, {test.B}]]} {
    return
  }
}

// -----
module {
  func.func @f(%arg0: i2 {test.B}) attributes {test.insert_args = [[0, i1, {test.A}], [1, i3, {test.C}]]} {
    return
  }
}

// -----
module {
  func.func @f(%arg0: i3 {test.C}) attributes {test.insert_args = [[0, i1, {test.A}], [0, i2, {test.B}]]} {
    return
  }
}

