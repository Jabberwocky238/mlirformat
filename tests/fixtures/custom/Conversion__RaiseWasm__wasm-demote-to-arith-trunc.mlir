module {
  wasmssa.func @func_0() -> f32 {
    %0 = wasmssa.const 2.240000e+00 : f64
    %1 = wasmssa.demote %0 : f64 to f32
    wasmssa.return %1 : f32
  }
}

