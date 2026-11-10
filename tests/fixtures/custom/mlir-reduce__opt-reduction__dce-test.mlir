module {
  func.func private @dead_private_function()
  func.func nested @dead_nested_function()
  func.func @simple1(%arg0: i1, %arg1: memref<2xf32>, %arg2: memref<2xf32>) {
    "test.op_crash"() : () -> ()
    return
  }
}

