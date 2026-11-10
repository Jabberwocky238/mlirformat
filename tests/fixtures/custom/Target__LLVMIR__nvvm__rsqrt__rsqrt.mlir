module {
  llvm.func @rsqrt_f32(%arg0: f32) -> f32 {
    %0 = nvvm.rsqrt %arg0 : f32
    %1 = nvvm.rsqrt %0 {ftz = true} : f32
    llvm.return %1 : f32
  }
  llvm.func @rsqrt_f64(%arg0: f64) -> f64 {
    %0 = nvvm.rsqrt %arg0 : f64
    %1 = nvvm.rsqrt %0 {ftz = true} : f64
    llvm.return %1 : f64
  }
}

