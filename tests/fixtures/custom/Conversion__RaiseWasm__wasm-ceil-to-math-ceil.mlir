module {
  wasmssa.func exported @func_0() -> f64 {
    %0 = wasmssa.const -1.210000e+01 : f64
    %1 = wasmssa.ceil %0 : f64
    wasmssa.return %1 : f64
  }
  wasmssa.func exported @func_1() -> f32 {
    %0 = wasmssa.const 1.618000e+00 : f32
    %1 = wasmssa.ceil %0 : f32
    wasmssa.return %1 : f32
  }
}

