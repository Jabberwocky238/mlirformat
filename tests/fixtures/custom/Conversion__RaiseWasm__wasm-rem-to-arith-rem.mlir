module {
  wasmssa.func exported @rem_ui_32(%arg0: !wasmssa<local ref to i32>, %arg1: !wasmssa<local ref to i32>) -> i32 {
    %0 = wasmssa.local_get %arg0 : ref to i32
    %1 = wasmssa.local_get %arg1 : ref to i32
    %2 = wasmssa.rem_ui %0 %1 : i32
    wasmssa.return %2 : i32
  }
  wasmssa.func exported @rem_si_32(%arg0: !wasmssa<local ref to i32>, %arg1: !wasmssa<local ref to i32>) -> i32 {
    %0 = wasmssa.local_get %arg0 : ref to i32
    %1 = wasmssa.local_get %arg1 : ref to i32
    %2 = wasmssa.rem_si %0 %1 : i32
    wasmssa.return %2 : i32
  }
  wasmssa.func exported @rem_ui_64(%arg0: !wasmssa<local ref to i64>, %arg1: !wasmssa<local ref to i64>) -> i64 {
    %0 = wasmssa.local_get %arg0 : ref to i64
    %1 = wasmssa.local_get %arg1 : ref to i64
    %2 = wasmssa.rem_ui %0 %1 : i64
    wasmssa.return %2 : i64
  }
  wasmssa.func exported @rem_si_64(%arg0: !wasmssa<local ref to i64>, %arg1: !wasmssa<local ref to i64>) -> i64 {
    %0 = wasmssa.local_get %arg0 : ref to i64
    %1 = wasmssa.local_get %arg1 : ref to i64
    %2 = wasmssa.rem_si %0 %1 : i64
    wasmssa.return %2 : i64
  }
}

