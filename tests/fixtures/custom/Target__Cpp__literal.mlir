module {
  func.func @emitc_literal(%arg0: f32) {
    %0 = emitc.literal "M_PI" : f32
    %1 = emitc.add %arg0, %0 : (f32, f32) -> f32
    return
  }
}

