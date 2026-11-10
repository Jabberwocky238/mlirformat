module {
  wasmssa.func @i32.reinterpret_f32() -> i32 {
    %0 = wasmssa.const -1.000000e+00 : f32
    %1 = wasmssa.reinterpret %0 : f32 as i32
    wasmssa.return %1 : i32
  }
  wasmssa.func @i64.reinterpret_f64() -> i64 {
    %0 = wasmssa.const -1.000000e+00 : f64
    %1 = wasmssa.reinterpret %0 : f64 as i64
    wasmssa.return %1 : i64
  }
  wasmssa.func @f32.reinterpret_i32() -> f32 {
    %0 = wasmssa.const -1 : i32
    %1 = wasmssa.reinterpret %0 : i32 as f32
    wasmssa.return %1 : f32
  }
  wasmssa.func @f64.reinterpret_i64() -> f64 {
    %0 = wasmssa.const -1 : i64
    %1 = wasmssa.reinterpret %0 : i64 as f64
    wasmssa.return %1 : f64
  }
}

