module {
  llvm.func @entry_point_void()
  llvm.func @entry_inputs_void(%arg0: i32) {
    llvm.return
  }
  llvm.func @entry_result_void() -> i32 {
    %0 = llvm.mlir.constant(0 : index) : i32
    llvm.return %0 : i32
  }
  llvm.func @entry_point_i32() -> i32
  llvm.func @entry_inputs_i32(%arg0: i32) {
    llvm.return
  }
  llvm.func @entry_result_i32() -> i64 {
    %0 = llvm.mlir.constant(0 : index) : i64
    llvm.return %0 : i64
  }
  llvm.func @entry_result_i64() -> i32 {
    %0 = llvm.mlir.constant(0 : index) : i32
    llvm.return %0 : i32
  }
  llvm.func @entry_result_f32() -> i32 {
    %0 = llvm.mlir.constant(0 : index) : i32
    llvm.return %0 : i32
  }
}

