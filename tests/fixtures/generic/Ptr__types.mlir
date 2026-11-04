"builtin.module"() ({
  "func.func"() <{function_type = (!ptr.ptr<#test.const_memory_space>, !ptr.ptr<#test.const_memory_space<1>>) -> (!ptr.ptr<#test.const_memory_space<1>>, !ptr.ptr<#test.const_memory_space>), sym_name = "ptr_test"}> ({
  ^bb0(%arg0: !ptr.ptr<#test.const_memory_space>, %arg1: !ptr.ptr<#test.const_memory_space<1>>):
    "func.return"(%arg1, %arg0) : (!ptr.ptr<#test.const_memory_space<1>>, !ptr.ptr<#test.const_memory_space>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<!ptr.ptr<#test.const_memory_space>>) -> (), sym_name = "ptr_test"}> ({
  ^bb0(%arg2: memref<!ptr.ptr<#test.const_memory_space>>):
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!ptr.ptr<#test.const_memory_space>, !ptr.ptr<#test.const_memory_space<3>>) -> (), sym_name = "ptr_test_1"}> ({
  ^bb0(%arg0: !ptr.ptr<#test.const_memory_space>, %arg1: !ptr.ptr<#test.const_memory_space<3>>):
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

