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
// -----
"builtin.module"() ({
  %0 = "test.type_producer"() : () -> !test.type_pred_trait<5>
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  %0 = "test.type_producer"() : () -> !test.type_pred_trait_multi<5, 3>
}) : () -> ()

// -----
"builtin.module"() ({
  %0 = "test.type_producer"() : () -> !test.type_pred_trait_multi<3, 3>
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  %0 = "test.type_producer"() : () -> !test.type_pred_trait_combined<3, [1, 2, 3], i32>
}) : () -> ()

// -----
// -----
