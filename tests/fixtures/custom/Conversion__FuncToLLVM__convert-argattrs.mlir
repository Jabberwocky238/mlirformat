module {
  func.func @check_attributes(%arg0: i64 {dialect.a = true, dialect.b = 4 : i64}) {
    return
  }
  func.func @check_memref(%arg0: memref<10x20xf32> {llvm.noalias}) {
    return
  }
  func.func @check_multiple(%arg0: f32 {first.arg = true}, %arg1: i64 {second.arg = 42 : i32}) {
    return
  }
}

