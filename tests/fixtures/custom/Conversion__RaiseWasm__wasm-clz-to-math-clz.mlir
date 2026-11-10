module {
  wasmssa.func exported @clz_i32(%arg0: !wasmssa<local ref to i32>) -> i32 {
    %0 = wasmssa.local_get %arg0 : ref to i32
    %1 = wasmssa.clz %0 : i32
    wasmssa.return %1 : i32
  }
  wasmssa.func exported @clz_i64(%arg0: !wasmssa<local ref to i64>) -> i64 {
    %0 = wasmssa.local_get %arg0 : ref to i64
    %1 = wasmssa.clz %0 : i64
    wasmssa.return %1 : i64
  }
}

