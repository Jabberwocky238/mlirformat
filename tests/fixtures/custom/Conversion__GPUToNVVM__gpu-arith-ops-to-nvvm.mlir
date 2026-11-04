module {
  gpu.module @test_module_54 {
    func.func @gpu_fminmax(%arg0: f32, %arg1: f32, %arg2: f64, %arg3: f64) -> (f32, f32, f64, f64) {
      %0 = arith.maxnumf %arg0, %arg1 : f32
      %1 = arith.minnumf %arg0, %arg1 : f32
      %2 = arith.maxnumf %arg2, %arg3 : f64
      %3 = arith.minnumf %arg2, %arg3 : f64
      return %0, %1, %2, %3 : f32, f32, f64, f64
    }
  }
}

