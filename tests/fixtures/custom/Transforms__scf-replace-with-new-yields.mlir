module {
  func.func @doubleup(%arg0: index, %arg1: index, %arg2: index, %arg3: f32) -> f32 {
    %0 = scf.for %arg4 = %arg0 to %arg1 step %arg2 iter_args(%arg5 = %arg3) -> (f32) {
      %1 = arith.addf %arg5, %arg5 : f32
      scf.yield %1 : f32
    }
    return %0 : f32
  }
}

