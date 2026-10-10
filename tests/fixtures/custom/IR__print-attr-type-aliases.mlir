!test_tuple = tuple<!test.smpla, !test.smpla, !test.smpla, !test.smpla, !test.smpla, !test.smpla, !test.smpla, !test.smpla, !test.smpla, !test.smpla, !test.smpla, !test.smpla, !test.smpla, !test.smpla, !test.smpla, !test.smpla, !test.smpla, !test.smpla>
!test_ui8 = !test.int<unsigned, 8>
!tuple = tuple<i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32>
#_0_test_alias = "alias_test:prefixed_digit"
#_25test = "alias_test:prefixed_symbol"
#loc = loc("nested")
#loc1 = loc("test.mlir":10:8)
#test2Ealias = "alias_test:dot_in_name"
#test_alias0 = "alias_test:trailing_digit"
#test_alias_conflict0 = "alias_test:trailing_digit_conflict_b"
#test_alias_conflict0_1 = "alias_test:trailing_digit_conflict_c"
#test_alias_conflict0_ = "alias_test:trailing_digit_conflict_d"
#test_alias_conflict0_1_1 = "alias_test:trailing_digit_conflict_e"
#test_alias_conflict0_1_2 = "alias_test:trailing_digit_conflict_f"
#test_alias_conflict0_1_ = "alias_test:trailing_digit_conflict_g"
#test_alias_conflict0_1_1_1 = "alias_test:trailing_digit_conflict_h"
#test_alias_conflict0_1_1_1_1 = "alias_test:trailing_digit_conflict_a"
#test_encoding = "alias_test:tensor_encoding"
#loc2 = loc(fused<#loc>[#loc1])
module {
  "test.op"() {alias_test = #test2Ealias} : () -> ()
  "test.op"() {alias_test = #test_alias0} : () -> ()
  "test.op"() {alias_test = #_0_test_alias} : () -> ()
  "test.op"() {alias_test = #_25test} : () -> ()
  "test.op"() {alias_test = [#test_alias_conflict0_1_1_1_1, #test_alias_conflict0, #test_alias_conflict0_1, #test_alias_conflict0_, #test_alias_conflict0_1_1, #test_alias_conflict0_1_2, #test_alias_conflict0_1_, #test_alias_conflict0_1_1_1]} : () -> ()
  %0 = "test.op"() {alias_test = "alias_test:large_tuple"} : () -> !tuple
  %1 = "test.op"() {alias_test = "alias_test:large_tuple"} : () -> !test_tuple
  %2 = "test.op"() : () -> tensor<32xf32, #test_encoding>
  %3 = "test.op"() : () -> tensor<32x!test_ui8>
  "test.op"() {alias_test = #loc2} : () -> ()
}

// -----
!tuple = tuple<i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32>
#loc = loc("test.mlir":10:8)
#loc1 = loc(fused<!tuple>[#loc])
module {
  "test.op"() {alias_test = #loc1} : () -> ()
}

// -----
!test_ui8 = !test.int<unsigned, 8>
module {
  "test.op"() {alias_test = #test.attr_with_self_type_param : !test_ui8} : () -> ()
}

// -----
#loc = loc("test.mlir":10:8)
#loc1 = loc(fused<memref<1xi32>>[#loc])
module {
  "test.op"() {alias_test = #loc1} : () -> ()
}

// -----
#test2Ealias = "alias_test:dot_in_name"
#test_encoding = "alias_test:tensor_encoding"
module {
  "test.op"() {attr = #test.conditional_alias<hello>} : () -> ()
  "test.op"() {attr = #test.conditional_alias<#test_encoding>} : () -> ()
  "test.op"() {attr = #test.conditional_alias<goodbye>} : () -> ()
  "test.op"() {attr = #test.conditional_alias<#test2Ealias>} : () -> ()
}

// -----
#loc = loc("test.mlir":1:1)
#test2Ealias = "alias_test:dot_in_name"
#loc1 = loc(fused<#test.conditional_alias<#test2Ealias>>[#loc])
module {
  "test.op"() {attr = #loc1} : () -> ()
}

// -----
#unique_base = #test.nested_alias<"alias_test:trailing_digit_conflict_base">
#unique_base1 = #test.nested_alias<"alias_test:trailing_digit_conflict_base1">
#unique_base2 = #test.nested_alias<"alias_test:trailing_digit_conflict_base_conflict", #unique_base1>
module {
  "test.op"() {alias_test = #test.nested_alias<"alias_test:trailing_digit_conflict_other", #unique_base>} : () -> ()
  "test.op"() {alias_test = #unique_base2} : () -> ()
}

