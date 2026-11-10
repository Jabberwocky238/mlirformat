module {
  wasmssa.func exported @callee(%arg0: !wasmssa<local ref to i32>) -> i32 {
    %0 = wasmssa.local_get %arg0 : ref to i32
    wasmssa.return %0 : i32
  }
  wasmssa.func exported @caller(%arg0: !wasmssa<local ref to i32>) -> i32 {
    %0 = wasmssa.local_get %arg0 : ref to i32
    %1 = wasmssa.call @callee(%0) : (i32) -> i32
    wasmssa.return %1 : i32
  }
  wasmssa.import_func "foo" from "my_module" as @func_0 {sym_visibility = "nested", type = () -> i32}
  wasmssa.func exported @user_of_func0() -> i32 {
    %0 = wasmssa.call @func_0 : () -> i32
    wasmssa.return %0 : i32
  }
}

