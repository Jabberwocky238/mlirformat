"builtin.module"() ({
  %0 = "test.type_producer"() : () -> !test.type_verification<i16>
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  %0 = "test.type_producer"() : () -> vector<!ptr.ptr<#test.const_memory_space>>
}) : () -> ()

// -----
"builtin.module"() ({
  %0 = "test.type_producer"() : () -> vector<!llvm.ptr<1>>
}) : () -> ()

// -----
