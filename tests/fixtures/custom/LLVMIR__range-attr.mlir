module {
  llvm.func @foo1(!llvm.ptr, i64) -> (i32 {llvm.range = #llvm.constant_range<i32, 0, 12>})
  llvm.func @foo2(!llvm.ptr, i64) -> (i8 {llvm.range = #llvm.constant_range<i8, 1, 10>})
  llvm.func @foo3(!llvm.ptr, i64) -> (i64 {llvm.range = #llvm.constant_range<i64, 0, 2147483648>})
  llvm.func @foo4(!llvm.ptr, i64) -> (i32 {llvm.range = #llvm.constant_range<i32, 1, -2147483648>})
}

