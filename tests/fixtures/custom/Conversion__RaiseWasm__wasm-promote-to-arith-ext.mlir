module {
  wasmssa.func @promote_f32_to_f64() -> f64 {
    %0 = wasmssa.const 3.140000e+00 : f32
    %1 = wasmssa.promote %0 : f32 to f64
    wasmssa.return %1 : f64
  }
}

