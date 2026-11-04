module {
  func.func @calee(%arg0: f32) -> f32 {
    %0 = amdgpu.permlane_swap %arg0 32 : f32
    return %0 : f32
  }
  func.func @caller(%arg0: f32) -> f32 {
    %0 = call @calee(%arg0) : (f32) -> f32
    return %0 : f32
  }
}

