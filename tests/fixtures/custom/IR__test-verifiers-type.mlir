module {
  %0 = "test.type_producer"() : () -> !test.type_verification<i16>
}

// -----
// -----
module {
  %0 = "test.type_producer"() : () -> vector<!ptr.ptr<#test.const_memory_space>>
}

// -----
module {
  %0 = "test.type_producer"() : () -> vector<!llvm.ptr<1>>
}

// -----
