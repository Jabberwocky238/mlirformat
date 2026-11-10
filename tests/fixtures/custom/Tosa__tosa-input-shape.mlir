module {
  func.func @test_empty_func(%arg0: tensor<2x?xi32>, %arg1: tensor<?x256xf32>, %arg2: tensor<?x9xf32>) -> (tensor<2x?xi32>, tensor<?x256xf32>, tensor<?x9xf32>) {
    return %arg0, %arg1, %arg2 : tensor<2x?xi32>, tensor<?x256xf32>, tensor<?x9xf32>
  }
}

// -----
module {
  func.func @test_func_with_ops(%arg0: tensor<2x?xi32>, %arg1: tensor<?x256xf32>, %arg2: tensor<?x9xf32>) -> (tensor<2x?xi32>, tensor<?x256xf32>, tensor<?x9xf32>) {
    %0 = tosa.add %arg0, %arg0 : (tensor<2x?xi32>, tensor<2x?xi32>) -> tensor<2x?xi32>
    %1 = tosa.reciprocal %arg1 : (tensor<?x256xf32>) -> tensor<?x256xf32>
    %2 = tosa.sub %arg2, %arg2 : (tensor<?x9xf32>, tensor<?x9xf32>) -> tensor<?x9xf32>
    return %0, %1, %2 : tensor<2x?xi32>, tensor<?x256xf32>, tensor<?x9xf32>
  }
}

// -----
module {
  func.func @test_controlflow(%arg0: tensor<2x?xi32>, %arg1: tensor<?x256xf32>, %arg2: tensor<?x9xf32>, %arg3: tensor<i1>) -> (tensor<2x?xi32>, tensor<?x256xf32>, tensor<?x9xf32>) {
    %0:3 = tosa.cond_if %arg3 (%arg4 = %arg0, %arg5 = %arg1, %arg6 = %arg2) : tensor<i1> (tensor<2x?xi32>, tensor<?x256xf32>, tensor<?x9xf32>) -> (tensor<2x?xi32>, tensor<?x256xf32>, tensor<?x9xf32>) {
    ^bb0(%arg4: tensor<2x?xi32>, %arg5: tensor<?x256xf32>, %arg6: tensor<?x9xf32>):
      tosa.yield %arg4, %arg5, %arg6 : tensor<2x?xi32>, tensor<?x256xf32>, tensor<?x9xf32>
    } else {
    ^bb0(%arg4: tensor<2x?xi32>, %arg5: tensor<?x256xf32>, %arg6: tensor<?x9xf32>):
      tosa.yield %arg4, %arg5, %arg6 : tensor<2x?xi32>, tensor<?x256xf32>, tensor<?x9xf32>
    }
    return %0#0, %0#1, %0#2 : tensor<2x?xi32>, tensor<?x256xf32>, tensor<?x9xf32>
  }
}

// -----
module {
  func.func private @test_func_decl(tensor<2x?xi32>, f32, tensor<?x9xi32>) -> tensor<?x256xf32>
}

