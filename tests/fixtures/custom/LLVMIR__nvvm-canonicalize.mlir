module {
  llvm.func @subf_canonicalize(%arg0: f32, %arg1: f32) -> f32 {
    %0 = nvvm.subf %arg0, %arg1 : f32
    llvm.return %0 : f32
  }
}

