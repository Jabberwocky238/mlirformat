module {
  wasmssa.func @i64_wrap(%arg0: !wasmssa<local ref to i64>) -> i32 {
    %0 = wasmssa.local_get %arg0 : ref to i64
    %1 = wasmssa.wrap %0 : i64 to i32
    wasmssa.return %1 : i32
  }
}

