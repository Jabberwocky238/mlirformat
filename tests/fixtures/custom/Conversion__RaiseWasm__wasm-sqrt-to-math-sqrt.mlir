module {
  wasmssa.func @sqrt_f32(%arg0: !wasmssa<local ref to f32>) -> f32 {
    %0 = wasmssa.local_get %arg0 : ref to f32
    %1 = wasmssa.sqrt %0 : f32
    wasmssa.return %1 : f32
  }
  wasmssa.func @sqrt_f64(%arg0: !wasmssa<local ref to f64>) -> f64 {
    %0 = wasmssa.local_get %arg0 : ref to f64
    %1 = wasmssa.sqrt %0 : f64
    wasmssa.return %1 : f64
  }
}

