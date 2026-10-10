module {
  func.func @if(%arg0: i1, %arg1: tensor<?xf32>, %arg2: tensor<?xf32>) -> tensor<?xf32> {
    %0 = scf.if %arg0 -> (tensor<?xf32>) {
      scf.yield %arg1 : tensor<?xf32>
    } else {
      scf.yield %arg2 : tensor<?xf32>
    }
    return %0 : tensor<?xf32>
  }
}

// -----
module {
  func.func @for(%arg0: tensor<f32>, %arg1: index, %arg2: index, %arg3: index) -> tensor<f32> {
    %0 = scf.for %arg4 = %arg1 to %arg2 step %arg3 iter_args(%arg5 = %arg0) -> (tensor<f32>) {
      scf.yield %arg5 : tensor<f32>
    } {some_attr}
    return %0 : tensor<f32>
  }
}

// -----
module {
  func.func @if_correct_recursive_legalization_behavior(%arg0: i1, %arg1: tensor<f32>) -> tensor<f32> {
    %0 = scf.if %arg0 -> (tensor<f32>) {
      %1 = "test.munge_tensor"(%arg1) : (tensor<f32>) -> tensor<f32>
      scf.yield %1 : tensor<f32>
    } else {
      %1 = "test.munge_tensor"(%arg1) : (tensor<f32>) -> tensor<f32>
      scf.yield %1 : tensor<f32>
    }
    return %0 : tensor<f32>
  }
}

// -----
module {
  func.func @for_correct_recursive_legalization_behavior(%arg0: tensor<f32>, %arg1: index) -> tensor<f32> {
    %0 = scf.for %arg2 = %arg1 to %arg1 step %arg1 iter_args(%arg3 = %arg0) -> (tensor<f32>) {
      %1 = "test.munge_tensor"(%arg3) : (tensor<f32>) -> tensor<f32>
      scf.yield %1 : tensor<f32>
    }
    return %0 : tensor<f32>
  }
}

// -----
module {
  func.func @bufferize_while(%arg0: i64, %arg1: i64, %arg2: tensor<f32>) -> (i64, tensor<f32>) {
    %c2_i64 = arith.constant 2 : i64
    %0:3 = scf.while (%arg3 = %arg0, %arg4 = %arg2) : (i64, tensor<f32>) -> (i64, i64, tensor<f32>) {
      %1 = arith.cmpi slt, %arg3, %arg1 : i64
      scf.condition(%1) %arg3, %arg3, %arg4 : i64, i64, tensor<f32>
    } do {
    ^bb0(%arg3: i64, %arg4: i64, %arg5: tensor<f32>):
      %1 = arith.muli %arg4, %c2_i64 : i64
      scf.yield %1, %arg5 : i64, tensor<f32>
    }
    return %0#1, %0#2 : i64, tensor<f32>
  }
}

