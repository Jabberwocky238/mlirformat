module {
  wasmssa.func @div_i32_si(%arg0: !wasmssa<local ref to i32>, %arg1: !wasmssa<local ref to i32>) -> i32 {
    %0 = wasmssa.local_get %arg0 : ref to i32
    %1 = wasmssa.local_get %arg1 : ref to i32
    %2 = wasmssa.div_si %0 %1 : i32
    wasmssa.return %2 : i32
  }
  wasmssa.func @div_i64_si(%arg0: !wasmssa<local ref to i64>, %arg1: !wasmssa<local ref to i64>) -> i64 {
    %0 = wasmssa.local_get %arg0 : ref to i64
    %1 = wasmssa.local_get %arg1 : ref to i64
    %2 = wasmssa.div_si %0 %1 : i64
    wasmssa.return %2 : i64
  }
  wasmssa.func @div_i32_ui(%arg0: !wasmssa<local ref to i32>, %arg1: !wasmssa<local ref to i32>) -> i32 {
    %0 = wasmssa.local_get %arg0 : ref to i32
    %1 = wasmssa.local_get %arg1 : ref to i32
    %2 = wasmssa.div_ui %0 %1 : i32
    wasmssa.return %2 : i32
  }
  wasmssa.func @div_i64_ui(%arg0: !wasmssa<local ref to i64>, %arg1: !wasmssa<local ref to i64>) -> i64 {
    %0 = wasmssa.local_get %arg0 : ref to i64
    %1 = wasmssa.local_get %arg1 : ref to i64
    %2 = wasmssa.div_ui %0 %1 : i64
    wasmssa.return %2 : i64
  }
  wasmssa.func @div_f32(%arg0: !wasmssa<local ref to f32>, %arg1: !wasmssa<local ref to f32>) -> f32 {
    %0 = wasmssa.local_get %arg0 : ref to f32
    %1 = wasmssa.local_get %arg1 : ref to f32
    %2 = wasmssa.div %0 %1 : f32
    wasmssa.return %2 : f32
  }
  wasmssa.func @div_f64(%arg0: !wasmssa<local ref to f64>, %arg1: !wasmssa<local ref to f64>) -> f64 {
    %0 = wasmssa.local_get %arg0 : ref to f64
    %1 = wasmssa.local_get %arg1 : ref to f64
    %2 = wasmssa.div %0 %1 : f64
    wasmssa.return %2 : f64
  }
}

