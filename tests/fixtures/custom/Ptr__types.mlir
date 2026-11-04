module {
  func.func @ptr_test(%arg0: !ptr.ptr<#test.const_memory_space>, %arg1: !ptr.ptr<#test.const_memory_space<1>>) -> (!ptr.ptr<#test.const_memory_space<1>>, !ptr.ptr<#test.const_memory_space>) {
    return %arg1, %arg0 : !ptr.ptr<#test.const_memory_space<1>>, !ptr.ptr<#test.const_memory_space>
  }
}

// -----
module {
  func.func @ptr_test(%arg0: memref<!ptr.ptr<#test.const_memory_space>>) {
    return
  }
  func.func @ptr_test_1(%arg0: !ptr.ptr<#test.const_memory_space>, %arg1: !ptr.ptr<#test.const_memory_space<3>>) {
    return
  }
}

