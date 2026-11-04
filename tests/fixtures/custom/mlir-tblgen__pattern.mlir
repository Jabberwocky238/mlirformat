module {
  func.func @verifyFusedLocs(%arg0: i32) -> i32 {
    %0 = "test.op_a"(%arg0) <{attr = 10 : i32}> : (i32) -> i32
    %1 = "test.op_a"(%0) <{attr = 20 : i32}> : (i32) -> i32
    return %1 : i32
  }
  func.func @verifyDesignatedLoc(%arg0: i32) -> i32 {
    %0 = "test.loc_src"(%arg0) : (i32) -> i32
    %1 = "test.loc_src"(%0) : (i32) -> i32
    %2 = "test.loc_src"(%1) : (i32) -> i32
    "test.loc_src_no_res"(%2) : (i32) -> ()
    return %1 : i32
  }
  func.func @verifyZeroResult(%arg0: i32) {
    "test.op_h"(%arg0) : (i32) -> ()
    return
  }
  func.func @verifyZeroArg() -> i32 {
    %0 = "test.op_j"() : () -> i32
    return %0 : i32
  }
  func.func @testIgnoreArgMatch(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: f32) {
    "test.ignore_arg_match_src"(%arg0, %arg1, %arg2) <{d = 42 : i64, e = 24 : i64, f = 15 : i64}> : (i32, i32, i32) -> ()
    "test.ignore_arg_match_src"(%arg0, %arg1, %arg3) <{d = 42 : i64, e = 24 : i64, f = 15 : i64}> : (i32, i32, f32) -> ()
    "test.ignore_arg_match_src"(%arg0, %arg1, %arg2) <{d = 42 : i32, e = 24 : i64, f = 15 : i64}> : (i32, i32, i32) -> ()
    return
  }
  func.func @verifyInterleavedOperandAttribute(%arg0: i32, %arg1: i32) {
    "test.interleaved_operand_attr1"(%arg0, %arg1) <{attr1 = 15 : i64, attr2 = 42 : i64}> : (i32, i32) -> ()
    return
  }
  func.func @verifyBenefit(%arg0: i32) -> i32 {
    %0 = "test.op_d"(%arg0) : (i32) -> i32
    %1 = "test.op_g"(%arg0) : (i32) -> i32
    %2 = "test.op_g"(%1) : (i32) -> i32
    return %0 : i32
  }
  func.func @verifyNativeCodeCall(%arg0: i32, %arg1: i32) -> (i32, i32) {
    %0 = "test.native_code_call1"(%arg0, %arg1) <{attr1 = 42 : i64, attr2 = 24 : i64, choice = true}> : (i32, i32) -> i32
    %1 = "test.native_code_call1"(%arg0, %arg1) <{attr1 = 42 : i64, attr2 = 24 : i64, choice = false}> : (i32, i32) -> i32
    return %0, %1 : i32, i32
  }
  func.func @verifyAuxiliaryNativeCodeCall(%arg0: i32) -> i32 {
    %0 = "test.native_code_call3"(%arg0) : (i32) -> i32
    return %0 : i32
  }
  func.func @verifyNativeCodeCallBinding(%arg0: i32) -> i32 {
    %0 = "test.op_k"() : () -> i32
    %output1, %output2 = "test.native_code_call4"(%0) : (i32) -> (i32, i32)
    %1 = "test.constant"() <{value = 1 : i8}> : () -> i8
    %output1_0, %output2_1 = "test.native_code_call4"(%1) : (i8) -> (i32, i32)
    return %output1 : i32
  }
  func.func @verifyMultipleNativeCodeCallBinding(%arg0: i32) -> i32 {
    %0 = "test.op_k"() : () -> i32
    %1 = "test.op_k"() : () -> i32
    %output1, %output2 = "test.native_code_call6"(%0, %1) : (i32, i32) -> (i32, i32)
    return %output1 : i32
  }
  func.func @verifyAllAttrConstraintOf() -> (i32, i32, i32) {
    %0 = "test.all_attr_constraint_of1"() <{attr = [0, 1]}> : () -> i32
    %1 = "test.all_attr_constraint_of1"() <{attr = [0, 2]}> : () -> i32
    %2 = "test.all_attr_constraint_of1"() <{attr = [-1, 1]}> : () -> i32
    return %0, %1, %2 : i32, i32, i32
  }
  func.func @verifyManyArgs(%arg0: i32) {
    "test.many_arguments"(%arg0, %arg0, %arg0, %arg0, %arg0, %arg0, %arg0, %arg0, %arg0) <{attr1 = 42 : i64, attr2 = 42 : i64, attr3 = 42 : i64, attr4 = 42 : i64, attr5 = 42 : i64, attr6 = 42 : i64, attr7 = 42 : i64, attr8 = 42 : i64, attr9 = 42 : i64}> : (i32, i32, i32, i32, i32, i32, i32, i32, i32) -> ()
    return
  }
  func.func @verifyEqualArgs(%arg0: i32, %arg1: i32) {
    %0 = "test.op_n"(%arg0, %arg0) : (i32, i32) -> i32
    %1 = "test.op_n"(%arg0, %arg1) : (i32, i32) -> i32
    return
  }
  func.func @verifyNestedOpEqualArgs(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32) {
    %0 = "test.op_p"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5) : (i32, i32, i32, i32, i32, i32) -> i32
    %1 = "test.op_n"(%arg1, %0) : (i32, i32) -> i32
    %2 = "test.op_o"(%1) : (i32) -> i32
    %3 = "test.op_p"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5) : (i32, i32, i32, i32, i32, i32) -> i32
    %4 = "test.op_n"(%arg0, %3) : (i32, i32) -> i32
    %5 = "test.op_o"(%4) : (i32) -> i32
    return
  }
  func.func @verifyNestedSameOpAndSameArgEquality(%arg0: i32, %arg1: i32) -> i32 {
    %0 = "test.op_n"(%arg1, %arg0) : (i32, i32) -> i32
    %1 = "test.op_n"(%0, %arg0) : (i32, i32) -> i32
    return %1 : i32
  }
  func.func @verifyMultipleEqualArgs(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32) {
    %0 = "test.op_p"(%arg0, %arg1, %arg0, %arg0, %arg1, %arg2) : (i32, i32, i32, i32, i32, i32) -> i32
    %1 = "test.op_p"(%arg0, %arg1, %arg0, %arg0, %arg0, %arg2) : (i32, i32, i32, i32, i32, i32) -> i32
    %2 = "test.op_p"(%arg0, %arg1, %arg1, %arg0, %arg1, %arg2) : (i32, i32, i32, i32, i32, i32) -> i32
    %3 = "test.op_p"(%arg0, %arg1, %arg2, %arg2, %arg3, %arg4) : (i32, i32, i32, i32, i32, i32) -> i32
    return
  }
  func.func @verifyEqualArgsCheckBeforeUserConstraints(%arg0: i32, %arg1: f32) {
    %0 = "test.op_q"(%arg0, %arg1) : (i32, f32) -> i32
    %1 = "test.op_q"(%arg1, %arg0) : (f32, i32) -> i32
    return
  }
  func.func @symbolBinding(%arg0: i32) -> i32 {
    %0 = "test.symbol_binding_a"(%arg0) <{attr = 42 : i64}> : (i32) -> i32
    %1 = "test.symbol_binding_a"(%arg0) <{attr = 42 : i64}> : (i32) -> i32
    return %0 : i32
  }
  func.func @symbolBindingNoResult(%arg0: i32) {
    "test.symbol_binding_no_result"(%arg0) : (i32) -> ()
    return
  }
  func.func @succeedMatchOpAttr() -> i32 {
    %0 = "test.match_op_attribute1"() <{default_valued_attr = 3 : i32, more_attr = 4 : i32, optional_attr = 2 : i32, required_attr = 1 : i32}> : () -> i32
    return %0 : i32
  }
  func.func @succeedMatchMissingOptionalAttr() -> i32 {
    %0 = "test.match_op_attribute1"() <{default_valued_attr = 3 : i32, more_attr = 4 : i32, required_attr = 1 : i32}> : () -> i32
    return %0 : i32
  }
  func.func @succeedMatchMissingDefaultValuedAttr() -> i32 {
    %0 = "test.match_op_attribute1"() <{default_valued_attr = 42 : i32, more_attr = 4 : i32, optional_attr = 2 : i32, required_attr = 1 : i32}> : () -> i32
    return %0 : i32
  }
  func.func @failedMatchAdditionalConstraintNotSatisfied() -> i32 {
    %0 = "test.match_op_attribute1"() <{default_valued_attr = 42 : i32, more_attr = 5 : i32, optional_attr = 2 : i32, required_attr = 1 : i32}> : () -> i32
    return %0 : i32
  }
  func.func @verifyConstantAttr(%arg0: i32) -> i32 {
    %0 = "test.op_c"(%arg0) : (i32) -> i32
    return %0 : i32
  }
  func.func @verifyUnitAttr() -> (i32, i32) {
    %0 = "test.match_op_attribute3"() <{attr}> : () -> i32
    %1 = "test.match_op_attribute3"() : () -> i32
    return %0, %1 : i32, i32
  }
  func.func @testConstOp() -> i32 {
    %0 = "test.constant"() <{value = 1 : i32}> : () -> i32
    return %0 : i32
  }
  func.func @testConstOpUsed() -> i32 {
    %0 = "test.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "test.op_s"(%0) <{value = 1 : i32}> : (i32) -> i32
    return %1 : i32
  }
  func.func @testConstOpReplaced() -> i32 {
    %0 = "test.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "test.constant"() <{value = 2 : i32}> : () -> i32
    %2 = "test.op_r"(%0, %1) : (i32, i32) -> i32
    return %2 : i32
  }
  func.func @testConstOpMatchFailure() -> i64 {
    %0 = "test.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "test.constant"() <{value = 2 : i64}> : () -> i64
    %2 = "test.op_r"(%0, %1) : (i64, i64) -> i64
    return %2 : i64
  }
  func.func @testConstOpMatchNonConst(%arg0: i32) -> i32 {
    %0 = "test.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "test.op_r"(%0, %arg0) : (i32, i32) -> i32
    return %1 : i32
  }
  func.func @verifyI32EnumAttr() -> i32 {
    %0 = "test.i32_enum_attr"() <{attr = 5 : i32}> : () -> i32
    return %0 : i32
  }
  func.func @verifyI64EnumAttr() -> i32 {
    %0 = "test.i64_enum_attr"() <{attr = 5 : i64}> : () -> i32
    return %0 : i32
  }
  func.func @rewrite_i32elementsattr() {
    "test.i32ElementsAttr"() <{attr = dense<[3, 5]> : tensor<2xi32>}> : () -> ()
    return
  }
  func.func @rewrite_f64elementsattr() {
    "test.float_elements_attr"() <{scalar_f32_attr = dense<[3.000000e+00, 4.000000e+00]> : tensor<2xf32>, tensor_f64_attr = dense<6.000000e+00> : tensor<4x8xf64>}> : () -> ()
    "test.float_elements_attr"() <{scalar_f32_attr = dense<7.000000e+00> : tensor<2xf32>, tensor_f64_attr = dense<3.000000e+00> : tensor<4x8xf64>}> : () -> ()
    return
  }
  func.func @useMultiResultOpToReplaceWhole() -> (i32, f32, f32) {
    %result1, %result2, %result3 = "test.three_result"() <{kind = 1 : i64}> : () -> (i32, f32, f32)
    return %result1, %result2, %result3 : i32, f32, f32
  }
  func.func @useMultiResultOpToReplacePartial1() -> (i32, f32, f32) {
    %result1, %result2, %result3 = "test.three_result"() <{kind = 2 : i64}> : () -> (i32, f32, f32)
    return %result1, %result2, %result3 : i32, f32, f32
  }
  func.func @useMultiResultOpToReplacePartial2() -> (i32, f32, f32) {
    %result1, %result2, %result3 = "test.three_result"() <{kind = 3 : i64}> : () -> (i32, f32, f32)
    return %result1, %result2, %result3 : i32, f32, f32
  }
  func.func @useMultiResultOpResultsSeparately() -> (i32, f32, f32) {
    %result1, %result2, %result3 = "test.three_result"() <{kind = 4 : i64}> : () -> (i32, f32, f32)
    return %result1, %result2, %result3 : i32, f32, f32
  }
  func.func @constraintOnSourceOpResult() -> (i32, f32, i32) {
    %result1, %result2 = "test.two_result"() <{kind = 5 : i64}> : () -> (i32, f32)
    %result1_0, %result2_1 = "test.two_result"() <{kind = 5 : i64}> : () -> (i32, f32)
    return %result1, %result2, %result1_0 : i32, f32, i32
  }
  func.func @useAuxiliaryOpToReplaceMultiResultOp() -> (i32, f32, f32) {
    %result1, %result2, %result3 = "test.three_result"() <{kind = 6 : i64}> : () -> (i32, f32, f32)
    return %result1, %result2, %result3 : i32, f32, f32
  }
  func.func @replaceOneVariadicOutOneVariadicInOp(%arg0: i32, %arg1: i32, %arg2: i32) -> (i32, i32, i32, i32, i32, i32) {
    %0 = "test.one_variadic_out_one_variadic_in1"(%arg0) : (i32) -> i32
    %1:2 = "test.one_variadic_out_one_variadic_in1"(%arg0, %arg1) : (i32, i32) -> (i32, i32)
    %2:3 = "test.one_variadic_out_one_variadic_in1"(%arg0, %arg1, %arg2) : (i32, i32, i32) -> (i32, i32, i32)
    return %0, %1#0, %1#1, %2#0, %2#1, %2#2 : i32, i32, i32, i32, i32, i32
  }
  func.func @replaceMixedVariadicInputOp(%arg0: i32, %arg1: f32, %arg2: i32) {
    "test.mixed_variadic_in1"(%arg1) : (f32) -> ()
    "test.mixed_variadic_in1"(%arg0, %arg1, %arg2) : (i32, f32, i32) -> ()
    "test.mixed_variadic_in1"(%arg0, %arg0, %arg1, %arg2, %arg2) : (i32, i32, f32, i32, i32) -> ()
    return
  }
  func.func @replaceMixedVariadicOutputOp() -> (f32, i32, f32, i32, i32, i32, f32, i32, i32) {
    %output2 = "test.mixed_variadic_out1"() : () -> f32
    %output1, %output2_0, %output3 = "test.mixed_variadic_out1"() : () -> (i32, f32, i32)
    %output1_1:2, %output2_2, %output3_3:2 = "test.mixed_variadic_out1"() : () -> (i32, i32, f32, i32, i32)
    return %output2, %output1, %output2_0, %output3, %output1_1#0, %output1_1#1, %output2_2, %output3_3#0, %output3_3#1 : f32, i32, f32, i32, i32, i32, f32, i32, i32
  }
  func.func @generateVariadicOutputOpInNestedPattern() -> i32 {
    %0 = "test.one_i32_out"() : () -> i32
    return %0 : i32
  }
  func.func @testMatchVariadic(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32) {
    "test.mixed_variadic_in4"(%arg0, %arg1, %arg2) <{attr1 = 0 : i32}> : (i32, i32, i32) -> ()
    "test.mixed_variadic_in4"(%arg0, %arg1, %arg2, %arg3) <{attr1 = 0 : i32}> : (i32, i32, i32, i32) -> ()
    return
  }
  func.func @testReplaceVariadic(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32) {
    "test.mixed_variadic_in5"(%arg0, %arg1, %arg2) <{attr1 = 0 : i32, pattern_name = "MatchInverseVariadic"}> : (i32, i32, i32) -> ()
    return
  }
  func.func @testMatchVariadicSubDag(%arg0: i32, %arg1: i32, %arg2: i32) {
    %0 = "test.mixed_variadic_in_out_i32"(%arg0) : (i32) -> i32
    %1 = "test.mixed_variadic_in_out_i32"(%arg1) : (i32) -> i32
    "test.mixed_variadic_in4"(%0, %1, %arg2) <{attr1 = 1 : i32}> : (i32, i32, i32) -> ()
    "test.mixed_variadic_in4"(%arg0, %arg1, %arg2) <{attr1 = 1 : i32}> : (i32, i32, i32) -> ()
    return
  }
  func.func @testMatchVariadicSameSymbol(%arg0: i32, %arg1: i32, %arg2: i32) {
    "test.mixed_variadic_in4"(%arg0, %arg0, %arg2) <{attr1 = 2 : i32}> : (i32, i32, i32) -> ()
    "test.mixed_variadic_in4"(%arg0, %arg1, %arg2) <{attr1 = 2 : i32}> : (i32, i32, i32) -> ()
    return
  }
  func.func @testMatchAndRewriteVariadicFullRange(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32) {
    "test.mixed_variadic_in6"(%arg0, %arg1, %arg2, %arg3) <{attr1 = 1 : i32}> : (i32, i32, i32, i32) -> ()
    "test.mixed_variadic_in6"(%arg0, %arg1) <{attr1 = 1 : i32}> : (i32, i32) -> ()
    return
  }
  func.func @testMatchMultiVariadicSubSymbol(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32) {
    "test.mixed_variadic_in6"(%arg0, %arg1, %arg2, %arg3) <{attr1 = 2 : i32}> : (i32, i32, i32, i32) -> ()
    return
  }
  func.func @testMatchMixedVaradicOptional(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32) {
    "test.mixed_variadic_optional_in7"(%arg0, %arg1, %arg2) <{attr1 = 2 : i32, operandSegmentSizes = array<i32: 2, 1>}> : (i32, i32, i32) -> ()
    "test.mixed_variadic_optional_in7"(%arg0, %arg1) <{attr1 = 2 : i32, operandSegmentSizes = array<i32: 2, 0>}> : (i32, i32) -> ()
    return
  }
  func.func @testSimplePropertyRewrite() {
    %0 = test.prop_pattern_op_1 "o1" 1 false
    %1 = test.prop_pattern_op_1 "o2" -1 false
    %2 = test.prop_pattern_op_1 "o3" 1 true
    return
  }
  func.func @testNestedPropertyRewrite() {
    %0 = test.prop_pattern_op_1 "s1" 1 false
    test.prop_pattern_op_2 %0 "t1"
    return
  }
  func.func @redundantTest(%arg0: i32) -> i32 {
    %0 = "test.op_m"(%arg0) : (i32) -> i32
    return %0 : i32
  }
  func.func @eitherDagLeafOnly(%arg0: i32, %arg1: i16, %arg2: i8) {
    %0 = "test.either_op_a"(%arg0, %arg1, %arg2) : (i32, i16, i8) -> i32
    %1 = "test.either_op_a"(%arg1, %arg0, %arg2) : (i16, i32, i8) -> i32
    return
  }
  func.func @eitherDagLeafDagNode(%arg0: i32, %arg1: i16, %arg2: i8) {
    %0 = "test.either_op_b"(%arg0, %arg0) : (i32, i32) -> i32
    %1 = "test.either_op_a"(%0, %arg1, %arg2) : (i32, i16, i8) -> i32
    %2 = "test.either_op_a"(%arg1, %0, %arg2) : (i16, i32, i8) -> i32
    return
  }
  func.func @eitherDagNodeDagNode(%arg0: i32, %arg1: i16, %arg2: i8) {
    %0 = "test.either_op_b"(%arg0, %arg0) : (i32, i32) -> i32
    %1 = "test.either_op_b"(%arg1, %arg1) : (i16, i16) -> i32
    %2 = "test.either_op_a"(%0, %1, %arg2) : (i32, i32, i8) -> i32
    %3 = "test.either_op_a"(%1, %0, %arg2) : (i32, i32, i8) -> i32
    return
  }
  func.func @testEitherOpWithAttr(%arg0: i32, %arg1: i16) {
    %0 = "test.either_op_c"(%arg0, %arg1) <{attr = 0 : i32}> : (i32, i16) -> i32
    %1 = "test.either_op_c"(%arg1, %arg0) <{attr = 0 : i32}> : (i16, i32) -> i32
    %2 = "test.either_op_c"(%arg0, %arg1) <{attr = 1 : i32}> : (i32, i16) -> i32
    return
  }
  func.func @explicitReturnTypeTest(%arg0: i64) -> i8 {
    %0 = "test.source_op"(%arg0) <{tag = 11 : i32}> : (i64) -> i8
    return %0 : i8
  }
  func.func @returnTypeBuilderTest(%arg0: i1) -> i8 {
    %0 = "test.source_op"(%arg0) <{tag = 22 : i32}> : (i1) -> i8
    return %0 : i8
  }
  func.func @multipleReturnTypeBuildTest(%arg0: i1) -> i1 {
    %0 = "test.source_op"(%arg0) <{tag = 33 : i32}> : (i1) -> i1
    return %0 : i1
  }
  func.func @copyValueType(%arg0: i8) -> i32 {
    %0 = "test.source_op"(%arg0) <{tag = 44 : i32}> : (i8) -> i32
    return %0 : i32
  }
  func.func @multipleReturnTypeDifferent(%arg0: i1) -> i64 {
    %0 = "test.source_op"(%arg0) <{tag = 55 : i32}> : (i1) -> i64
    return %0 : i64
  }
  func.func @returnTypeAndLocation(%arg0: i32) -> i1 {
    %0 = "test.source_op"(%arg0) <{tag = 66 : i32}> : (i32) -> i1
    return %0 : i1
  }
  func.func @testConstantStrAttr() {
    test.no_str_value {value = "bar"}
    return
  }
  func.func @testVariadic(%arg0: i32, %arg1: i32, %arg2: i64, %arg3: f32, %arg4: f32, %arg5: f32, %arg6: f32) {
    "test.variadic_rewrite_src_op"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5, %arg6) <{operandSegmentSizes = array<i32: 2, 1, 4>}> : (i32, i32, i64, f32, f32, f32, f32) -> ()
    return
  }
}

