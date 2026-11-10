module {
  func.func @yield_alloc_dominance_test_2(%arg0: f32, %arg1: index, %arg2: index) -> f32 {
    %0 = bufferization.alloc_tensor(%arg1) : tensor<?xf32>
    %1 = scf.execute_region -> tensor<?xf32> {
      scf.yield %0 : tensor<?xf32>
    }
    %inserted = tensor.insert %arg0 into %1[%arg1] : tensor<?xf32>
    %extracted = tensor.extract %inserted[%arg2] : tensor<?xf32>
    return %extracted : f32
  }
}

