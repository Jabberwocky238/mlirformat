module {
  func.func @test_math(%arg0: f32) {
    %c2 = arith.constant 2 : index
    %c1 = arith.constant 1 : index
    gpu.launch blocks(%arg1, %arg2, %arg3) in (%arg7 = %c1, %arg8 = %c1, %arg9 = %c1) threads(%arg4, %arg5, %arg6) in (%arg10 = %c2, %arg11 = %c1, %arg12 = %c1) {
      %0 = math.exp %arg0 : f32
      gpu.printf "%f", %0 : f32
      gpu.terminator
    }
    return
  }
}

