module {
  func.func @f(%arg0: f32 {test.erase_this_arg}) {
    return
  }
}

// -----
module {
  func.func @f(%arg0: f32 {test.erase_this_arg}, %arg1: f32 {test.A}) {
    return
  }
}

// -----
module {
  func.func @f(%arg0: f32 {test.A}, %arg1: f32 {test.erase_this_arg}) {
    return
  }
}

// -----
module {
  func.func @f(%arg0: f32 {test.A}, %arg1: f32 {test.erase_this_arg}, %arg2: f32 {test.B}) {
    return
  }
}

// -----
module {
  func.func @f(%arg0: f32 {test.A}, %arg1: f32 {test.erase_this_arg}, %arg2: f32 {test.erase_this_arg}, %arg3: f32 {test.B}) {
    return
  }
}

// -----
module {
  func.func @f(%arg0: f32 {test.A}, %arg1: f32 {test.erase_this_arg}, %arg2: f32 {test.B}, %arg3: f32 {test.erase_this_arg}, %arg4: f32 {test.C}) {
    return
  }
}

// -----
module {
  func.func @f(%arg0: tensor<1xf32>, %arg1: f32 {test.erase_this_arg}, %arg2: tensor<2xf32>, %arg3: f32 {test.erase_this_arg}, %arg4: tensor<3xf32>) {
    return
  }
}

