module {
  wasmssa.func exported @func_0() -> f32 {
    %0 = wasmssa.local of type f32
    %1 = wasmssa.local of type f32
    %2 = wasmssa.const 8.000000e+00 : f32
    wasmssa.local_set %0 : ref to f32 to %2 : f32
    %3 = wasmssa.local_get %0 : ref to f32
    %4 = wasmssa.const 1.200000e+01 : f32
    %5 = wasmssa.local_tee %1 : ref to f32 to %4 : f32
    %6 = wasmssa.add %3 %5 : f32
    wasmssa.return %6 : f32
  }
  wasmssa.func exported @func_1() -> i32 {
    %0 = wasmssa.local of type i32
    %1 = wasmssa.local of type i32
    %2 = wasmssa.const 8 : i32
    wasmssa.local_set %0 : ref to i32 to %2 : i32
    %3 = wasmssa.local_get %0 : ref to i32
    %4 = wasmssa.const 12 : i32
    %5 = wasmssa.local_tee %1 : ref to i32 to %4 : i32
    %6 = wasmssa.add %3 %5 : i32
    wasmssa.return %6 : i32
  }
  wasmssa.func exported @func_2(%arg0: !wasmssa<local ref to i32>) -> i32 {
    %0 = wasmssa.const 3 : i32
    wasmssa.local_set %arg0 : ref to i32 to %0 : i32
    %1 = wasmssa.local_get %arg0 : ref to i32
    wasmssa.return %1 : i32
  }
}

