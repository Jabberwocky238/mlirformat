module {
  wasmssa.func exported @get_some_const() -> (i32, i64, f32, f64) {
    %0 = wasmssa.const 17 : i32
    %1 = wasmssa.const -163 : i64
    %2 = wasmssa.const 3.140000e+00 : f32
    %3 = wasmssa.const -1.575000e+02 : f64
    wasmssa.return %0, %1, %2, %3 : i32, i64, f32, f64
  }
}

