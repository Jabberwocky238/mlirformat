module {
  func.func @sincos_fusion(%arg0: f32, %arg1: f32) -> (f32, f32, f32, f32) {
    %0 = math.sin %arg0 : f32
    %1 = math.cos %arg0 : f32
    %2 = math.cos %arg1 : f32
    %3 = math.sin %arg1 : f32
    return %0, %1, %2, %3 : f32, f32, f32, f32
  }
  func.func private @sink(f32)
  func.func @sincos_ensure_ssa_dominance(%arg0: f32, %arg1: f32) -> (f32, f32, f32, f32) {
    %0 = math.sin %arg0 : f32
    call @sink(%0) : (f32) -> ()
    %1 = math.cos %arg0 : f32
    %2 = math.cos %arg1 : f32
    call @sink(%2) : (f32) -> ()
    %3 = math.sin %arg1 : f32
    return %0, %1, %2, %3 : f32, f32, f32, f32
  }
  func.func @sincos_fusion_no_match_fmf(%arg0: f32) -> (f32, f32) {
    %0 = math.sin %arg0 fastmath<contract> : f32
    %1 = math.cos %arg0 : f32
    return %0, %1 : f32, f32
  }
  func.func @sincos_no_fusion_different_block(%arg0: f32, %arg1: i1) -> f32 {
    %0 = scf.if %arg1 -> (f32) {
      %1 = math.sin %arg0 : f32
      scf.yield %1 : f32
    } else {
      %1 = math.cos %arg0 : f32
      scf.yield %1 : f32
    }
    return %0 : f32
  }
  func.func @sincos_fusion_preserve_fastmath(%arg0: f32) -> (f32, f32) {
    %0 = math.sin %arg0 fastmath<contract> : f32
    %1 = math.cos %arg0 fastmath<contract> : f32
    return %0, %1 : f32, f32
  }
}

