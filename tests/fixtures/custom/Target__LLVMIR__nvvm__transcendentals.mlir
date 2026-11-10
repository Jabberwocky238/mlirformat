module {
  llvm.func @nvvm_sin(%arg0: f32) -> f32 {
    %0 = nvvm.sin %arg0 : f32
    llvm.return %0 : f32
  }
  llvm.func @nvvm_sin_ftz(%arg0: f32) -> f32 {
    %0 = nvvm.sin %arg0 {ftz = true} : f32
    llvm.return %0 : f32
  }
  llvm.func @nvvm_cos(%arg0: f32) -> f32 {
    %0 = nvvm.cos %arg0 : f32
    llvm.return %0 : f32
  }
  llvm.func @nvvm_cos_ftz(%arg0: f32) -> f32 {
    %0 = nvvm.cos %arg0 {ftz = true} : f32
    llvm.return %0 : f32
  }
  llvm.func @nvvm_lg2(%arg0: f32) -> f32 {
    %0 = nvvm.log2 %arg0 : f32
    llvm.return %0 : f32
  }
  llvm.func @nvvm_lg2_ftz(%arg0: f32) -> f32 {
    %0 = nvvm.log2 %arg0 {ftz = true} : f32
    llvm.return %0 : f32
  }
  llvm.func @nvvm_ex2(%arg0: f32) -> f32 {
    %0 = nvvm.ex2 %arg0 : f32
    llvm.return %0 : f32
  }
  llvm.func @nvvm_ex2_ftz(%arg0: f32) -> f32 {
    %0 = nvvm.ex2 %arg0 {ftz = true} : f32
    llvm.return %0 : f32
  }
}

