module {
  wasmssa.global @global_i32 i32 mutable : {
    %0 = wasmssa.const 66560 : i32
    wasmssa.return %0 : i32
  }
  wasmssa.global @global_i64 i64 mutable : {
    %0 = wasmssa.const 37017 : i64
    wasmssa.return %0 : i64
  }
  wasmssa.global @global_f32 f32 mutable : {
    %0 = wasmssa.const 1.250000e-01 : f32
    wasmssa.return %0 : f32
  }
  wasmssa.global @global_f64 f64 mutable : {
    %0 = wasmssa.const 3.140000e+00 : f64
    wasmssa.return %0 : f64
  }
  wasmssa.global @global_user0 i32 mutable : {
    %0 = wasmssa.global_get @global_top_define : i32
    wasmssa.return %0 : i32
  }
  wasmssa.import_global "extern_global_var" from "module" as @global_top_define : i32
}

