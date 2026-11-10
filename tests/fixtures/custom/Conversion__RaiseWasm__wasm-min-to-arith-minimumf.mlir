module {
  wasmssa.func exported @min_f32(%arg0: !wasmssa<local ref to f32>, %arg1: !wasmssa<local ref to f32>) -> f32 {
    %0 = wasmssa.local_get %arg0 : ref to f32
    %1 = wasmssa.local_get %arg1 : ref to f32
    %2 = wasmssa.min %0 %1 : f32
    wasmssa.return %2 : f32
  }
  wasmssa.func exported @min_f64(%arg0: !wasmssa<local ref to f64>, %arg1: !wasmssa<local ref to f64>) -> f64 {
    %0 = wasmssa.local_get %arg0 : ref to f64
    %1 = wasmssa.local_get %arg1 : ref to f64
    %2 = wasmssa.min %0 %1 : f64
    wasmssa.return %2 : f64
  }
}

