"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "spec"}> ({
    %0 = "test.data_layout_query"() : () -> !ptr.ptr<#test.const_memory_space>
    %1 = "test.data_layout_query"() : () -> !ptr.ptr<#test.const_memory_space<3>>
    %2 = "test.data_layout_query"() : () -> !ptr.ptr<#test.const_memory_space<5>>
    %3 = "test.data_layout_query"() : () -> !ptr.ptr<#test.const_memory_space<4>>
    "func.return"() : () -> ()
  }) : () -> ()
}) {dlti.dl_spec = #dlti.dl_spec<!ptr.ptr<#test.const_memory_space> = #ptr.spec<size = 32, abi = 32, preferred = 64>, !ptr.ptr<#test.const_memory_space<5>> = #ptr.spec<size = 64, abi = 64, preferred = 64>, !ptr.ptr<#test.const_memory_space<4>> = #ptr.spec<size = 32, abi = 64, preferred = 64, index = 24>, "dlti.default_memory_space" = #test.const_memory_space<7>, "dlti.alloca_memory_space" = #test.const_memory_space<5>, "dlti.global_memory_space" = #test.const_memory_space<2>, "dlti.program_memory_space" = #test.const_memory_space<3>, "dlti.stack_alignment" = 128 : i64>} : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "default_memory_space"}> ({
    %0 = "test.data_layout_query"() : () -> !ptr.ptr<#test.const_memory_space>
    %1 = "test.data_layout_query"() : () -> !ptr.ptr<#test.const_memory_space<1>>
    %2 = "test.data_layout_query"() : () -> !ptr.ptr<#test.const_memory_space<2>>
    "func.return"() : () -> ()
  }) : () -> ()
}) {dlti.dl_spec = #dlti.dl_spec<!ptr.ptr<#test.const_memory_space> = #ptr.spec<size = 32, abi = 32, preferred = 32>, "dlti.default_memory_space" = #test.const_memory_space>} : () -> ()

// -----
// -----
// -----
// -----
// -----
