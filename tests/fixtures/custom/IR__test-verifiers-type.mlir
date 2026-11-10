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
// -----
module {
  %0 = "test.type_producer"() : () -> !test.type_pred_trait<5>
}

// -----
// -----
module {
  %0 = "test.type_producer"() : () -> !test.type_pred_trait_multi<5, 3>
}

// -----
module {
  %0 = "test.type_producer"() : () -> !test.type_pred_trait_multi<3, 3>
}

// -----
// -----
module {
  %0 = "test.type_producer"() : () -> !test.type_pred_trait_combined<3, [1, 2, 3], i32>
}

// -----
// -----
