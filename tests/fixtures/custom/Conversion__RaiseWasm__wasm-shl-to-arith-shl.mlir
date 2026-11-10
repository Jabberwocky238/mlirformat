module {
  wasmssa.func exported @shl_i32(%arg0: !wasmssa<local ref to i32>, %arg1: !wasmssa<local ref to i32>) -> i32 {
    %0 = wasmssa.local_get %arg0 : ref to i32
    %1 = wasmssa.local_get %arg1 : ref to i32
    %2 = wasmssa.shl %0 by %1 bits : i32
    wasmssa.return %2 : i32
  }
  wasmssa.func exported @shl_i64(%arg0: !wasmssa<local ref to i64>, %arg1: !wasmssa<local ref to i64>) -> i64 {
    %0 = wasmssa.local_get %arg0 : ref to i64
    %1 = wasmssa.local_get %arg1 : ref to i64
    %2 = wasmssa.shl %0 by %1 bits : i64
    wasmssa.return %2 : i64
  }
}

