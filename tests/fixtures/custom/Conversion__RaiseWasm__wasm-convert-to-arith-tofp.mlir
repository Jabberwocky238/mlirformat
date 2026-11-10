module {
  wasmssa.func @convert_i32_u_to_f32() -> f32 {
    %0 = wasmssa.const 10 : i32
    %1 = wasmssa.convert_u %0 : i32 to f32
    wasmssa.return %1 : f32
  }
  wasmssa.func @convert_i32_s_to_f32() -> f32 {
    %0 = wasmssa.const 42 : i32
    %1 = wasmssa.convert_s %0 : i32 to f32
    wasmssa.return %1 : f32
  }
  wasmssa.func @convert_i64_u_to_f32() -> f32 {
    %0 = wasmssa.const 17 : i64
    %1 = wasmssa.convert_u %0 : i64 to f32
    wasmssa.return %1 : f32
  }
  wasmssa.func @convert_i64s_to_f32() -> f32 {
    %0 = wasmssa.const 10 : i64
    %1 = wasmssa.convert_s %0 : i64 to f32
    wasmssa.return %1 : f32
  }
  wasmssa.func @convert_i32_u_to_f64() -> f64 {
    %0 = wasmssa.const 10 : i32
    %1 = wasmssa.convert_u %0 : i32 to f64
    wasmssa.return %1 : f64
  }
  wasmssa.func @convert_i32_s_to_f64() -> f64 {
    %0 = wasmssa.const 42 : i32
    %1 = wasmssa.convert_s %0 : i32 to f64
    wasmssa.return %1 : f64
  }
  wasmssa.func @convert_i64_u_to_f64() -> f64 {
    %0 = wasmssa.const 17 : i64
    %1 = wasmssa.convert_u %0 : i64 to f64
    wasmssa.return %1 : f64
  }
  wasmssa.func @convert_i64s_to_f64() -> f64 {
    %0 = wasmssa.const 10 : i64
    %1 = wasmssa.convert_s %0 : i64 to f64
    wasmssa.return %1 : f64
  }
}

