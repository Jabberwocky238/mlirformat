"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "verifyFusedLocs"}> ({
  ^bb0(%arg93: i32):
    %97 = "test.op_a"(%arg93) <{attr = 10 : i32}> : (i32) -> i32
    %98 = "test.op_a"(%97) <{attr = 20 : i32}> : (i32) -> i32
    "func.return"(%98) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "verifyDesignatedLoc"}> ({
  ^bb0(%arg92: i32):
    %94 = "test.loc_src"(%arg92) : (i32) -> i32
    %95 = "test.loc_src"(%94) : (i32) -> i32
    %96 = "test.loc_src"(%95) : (i32) -> i32
    "test.loc_src_no_res"(%96) : (i32) -> ()
    "func.return"(%95) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "verifyZeroResult"}> ({
  ^bb0(%arg91: i32):
    "test.op_h"(%arg91) : (i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i32, sym_name = "verifyZeroArg"}> ({
    %93 = "test.op_j"() : () -> i32
    "func.return"(%93) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, f32) -> (), sym_name = "testIgnoreArgMatch"}> ({
  ^bb0(%arg87: i32, %arg88: i32, %arg89: i32, %arg90: f32):
    "test.ignore_arg_match_src"(%arg87, %arg88, %arg89) <{d = 42 : i64, e = 24 : i64, f = 15 : i64}> : (i32, i32, i32) -> ()
    "test.ignore_arg_match_src"(%arg87, %arg88, %arg90) <{d = 42 : i64, e = 24 : i64, f = 15 : i64}> : (i32, i32, f32) -> ()
    "test.ignore_arg_match_src"(%arg87, %arg88, %arg89) <{d = 42 : i32, e = 24 : i64, f = 15 : i64}> : (i32, i32, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "verifyInterleavedOperandAttribute"}> ({
  ^bb0(%arg85: i32, %arg86: i32):
    "test.interleaved_operand_attr1"(%arg85, %arg86) <{attr1 = 15 : i64, attr2 = 42 : i64}> : (i32, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "verifyBenefit"}> ({
  ^bb0(%arg84: i32):
    %90 = "test.op_d"(%arg84) : (i32) -> i32
    %91 = "test.op_g"(%arg84) : (i32) -> i32
    %92 = "test.op_g"(%91) : (i32) -> i32
    "func.return"(%90) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> (i32, i32), sym_name = "verifyNativeCodeCall"}> ({
  ^bb0(%arg82: i32, %arg83: i32):
    %88 = "test.native_code_call1"(%arg82, %arg83) <{attr1 = 42 : i64, attr2 = 24 : i64, choice = true}> : (i32, i32) -> i32
    %89 = "test.native_code_call1"(%arg82, %arg83) <{attr1 = 42 : i64, attr2 = 24 : i64, choice = false}> : (i32, i32) -> i32
    "func.return"(%88, %89) : (i32, i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "verifyAuxiliaryNativeCodeCall"}> ({
  ^bb0(%arg81: i32):
    %87 = "test.native_code_call3"(%arg81) : (i32) -> i32
    "func.return"(%87) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "verifyNativeCodeCallBinding"}> ({
  ^bb0(%arg80: i32):
    %83 = "test.op_k"() : () -> i32
    %84:2 = "test.native_code_call4"(%83) : (i32) -> (i32, i32)
    %85 = "test.constant"() <{value = 1 : i8}> : () -> i8
    %86:2 = "test.native_code_call4"(%85) : (i8) -> (i32, i32)
    "func.return"(%84#0) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "verifyMultipleNativeCodeCallBinding"}> ({
  ^bb0(%arg79: i32):
    %80 = "test.op_k"() : () -> i32
    %81 = "test.op_k"() : () -> i32
    %82:2 = "test.native_code_call6"(%80, %81) : (i32, i32) -> (i32, i32)
    "func.return"(%82#0) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (i32, i32, i32), sym_name = "verifyAllAttrConstraintOf"}> ({
    %77 = "test.all_attr_constraint_of1"() <{attr = [0, 1]}> : () -> i32
    %78 = "test.all_attr_constraint_of1"() <{attr = [0, 2]}> : () -> i32
    %79 = "test.all_attr_constraint_of1"() <{attr = [-1, 1]}> : () -> i32
    "func.return"(%77, %78, %79) : (i32, i32, i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "verifyManyArgs"}> ({
  ^bb0(%arg78: i32):
    "test.many_arguments"(%arg78, %arg78, %arg78, %arg78, %arg78, %arg78, %arg78, %arg78, %arg78) <{attr1 = 42 : i64, attr2 = 42 : i64, attr3 = 42 : i64, attr4 = 42 : i64, attr5 = 42 : i64, attr6 = 42 : i64, attr7 = 42 : i64, attr8 = 42 : i64, attr9 = 42 : i64}> : (i32, i32, i32, i32, i32, i32, i32, i32, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "verifyEqualArgs"}> ({
  ^bb0(%arg76: i32, %arg77: i32):
    %75 = "test.op_n"(%arg76, %arg76) : (i32, i32) -> i32
    %76 = "test.op_n"(%arg76, %arg77) : (i32, i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32, i32, i32) -> (), sym_name = "verifyNestedOpEqualArgs"}> ({
  ^bb0(%arg70: i32, %arg71: i32, %arg72: i32, %arg73: i32, %arg74: i32, %arg75: i32):
    %69 = "test.op_p"(%arg70, %arg71, %arg72, %arg73, %arg74, %arg75) : (i32, i32, i32, i32, i32, i32) -> i32
    %70 = "test.op_n"(%arg71, %69) : (i32, i32) -> i32
    %71 = "test.op_o"(%70) : (i32) -> i32
    %72 = "test.op_p"(%arg70, %arg71, %arg72, %arg73, %arg74, %arg75) : (i32, i32, i32, i32, i32, i32) -> i32
    %73 = "test.op_n"(%arg70, %72) : (i32, i32) -> i32
    %74 = "test.op_o"(%73) : (i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "verifyNestedSameOpAndSameArgEquality"}> ({
  ^bb0(%arg68: i32, %arg69: i32):
    %67 = "test.op_n"(%arg69, %arg68) : (i32, i32) -> i32
    %68 = "test.op_n"(%67, %arg68) : (i32, i32) -> i32
    "func.return"(%68) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32, i32) -> (), sym_name = "verifyMultipleEqualArgs"}> ({
  ^bb0(%arg63: i32, %arg64: i32, %arg65: i32, %arg66: i32, %arg67: i32):
    %63 = "test.op_p"(%arg63, %arg64, %arg63, %arg63, %arg64, %arg65) : (i32, i32, i32, i32, i32, i32) -> i32
    %64 = "test.op_p"(%arg63, %arg64, %arg63, %arg63, %arg63, %arg65) : (i32, i32, i32, i32, i32, i32) -> i32
    %65 = "test.op_p"(%arg63, %arg64, %arg64, %arg63, %arg64, %arg65) : (i32, i32, i32, i32, i32, i32) -> i32
    %66 = "test.op_p"(%arg63, %arg64, %arg65, %arg65, %arg66, %arg67) : (i32, i32, i32, i32, i32, i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, f32) -> (), sym_name = "verifyEqualArgsCheckBeforeUserConstraints"}> ({
  ^bb0(%arg61: i32, %arg62: f32):
    %61 = "test.op_q"(%arg61, %arg62) : (i32, f32) -> i32
    %62 = "test.op_q"(%arg62, %arg61) : (f32, i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "symbolBinding"}> ({
  ^bb0(%arg60: i32):
    %59 = "test.symbol_binding_a"(%arg60) <{attr = 42 : i64}> : (i32) -> i32
    %60 = "test.symbol_binding_a"(%arg60) <{attr = 42 : i64}> : (i32) -> i32
    "func.return"(%59) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "symbolBindingNoResult"}> ({
  ^bb0(%arg59: i32):
    "test.symbol_binding_no_result"(%arg59) : (i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i32, sym_name = "succeedMatchOpAttr"}> ({
    %58 = "test.match_op_attribute1"() <{default_valued_attr = 3 : i32, more_attr = 4 : i32, optional_attr = 2 : i32, required_attr = 1 : i32}> : () -> i32
    "func.return"(%58) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i32, sym_name = "succeedMatchMissingOptionalAttr"}> ({
    %57 = "test.match_op_attribute1"() <{default_valued_attr = 3 : i32, more_attr = 4 : i32, required_attr = 1 : i32}> : () -> i32
    "func.return"(%57) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i32, sym_name = "succeedMatchMissingDefaultValuedAttr"}> ({
    %56 = "test.match_op_attribute1"() <{default_valued_attr = 42 : i32, more_attr = 4 : i32, optional_attr = 2 : i32, required_attr = 1 : i32}> : () -> i32
    "func.return"(%56) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i32, sym_name = "failedMatchAdditionalConstraintNotSatisfied"}> ({
    %55 = "test.match_op_attribute1"() <{default_valued_attr = 42 : i32, more_attr = 5 : i32, optional_attr = 2 : i32, required_attr = 1 : i32}> : () -> i32
    "func.return"(%55) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "verifyConstantAttr"}> ({
  ^bb0(%arg58: i32):
    %54 = "test.op_c"(%arg58) : (i32) -> i32
    "func.return"(%54) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (i32, i32), sym_name = "verifyUnitAttr"}> ({
    %52 = "test.match_op_attribute3"() <{attr}> : () -> i32
    %53 = "test.match_op_attribute3"() : () -> i32
    "func.return"(%52, %53) : (i32, i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i32, sym_name = "testConstOp"}> ({
    %51 = "test.constant"() <{value = 1 : i32}> : () -> i32
    "func.return"(%51) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i32, sym_name = "testConstOpUsed"}> ({
    %49 = "test.constant"() <{value = 1 : i32}> : () -> i32
    %50 = "test.op_s"(%49) <{value = 1 : i32}> : (i32) -> i32
    "func.return"(%50) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i32, sym_name = "testConstOpReplaced"}> ({
    %46 = "test.constant"() <{value = 1 : i32}> : () -> i32
    %47 = "test.constant"() <{value = 2 : i32}> : () -> i32
    %48 = "test.op_r"(%46, %47) : (i32, i32) -> i32
    "func.return"(%48) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i64, sym_name = "testConstOpMatchFailure"}> ({
    %43 = "test.constant"() <{value = 1 : i64}> : () -> i64
    %44 = "test.constant"() <{value = 2 : i64}> : () -> i64
    %45 = "test.op_r"(%43, %44) : (i64, i64) -> i64
    "func.return"(%45) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "testConstOpMatchNonConst"}> ({
  ^bb0(%arg57: i32):
    %41 = "test.constant"() <{value = 1 : i32}> : () -> i32
    %42 = "test.op_r"(%41, %arg57) : (i32, i32) -> i32
    "func.return"(%42) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i32, sym_name = "verifyI32EnumAttr"}> ({
    %40 = "test.i32_enum_attr"() <{attr = 5 : i32}> : () -> i32
    "func.return"(%40) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i32, sym_name = "verifyI64EnumAttr"}> ({
    %39 = "test.i64_enum_attr"() <{attr = 5 : i64}> : () -> i32
    "func.return"(%39) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "rewrite_i32elementsattr"}> ({
    "test.i32ElementsAttr"() <{attr = dense<[3, 5]> : tensor<2xi32>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "rewrite_f64elementsattr"}> ({
    "test.float_elements_attr"() <{scalar_f32_attr = dense<[3.000000e+00, 4.000000e+00]> : tensor<2xf32>, tensor_f64_attr = dense<6.000000e+00> : tensor<4x8xf64>}> : () -> ()
    "test.float_elements_attr"() <{scalar_f32_attr = dense<7.000000e+00> : tensor<2xf32>, tensor_f64_attr = dense<3.000000e+00> : tensor<4x8xf64>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (i32, f32, f32), sym_name = "useMultiResultOpToReplaceWhole"}> ({
    %38:3 = "test.three_result"() <{kind = 1 : i64}> : () -> (i32, f32, f32)
    "func.return"(%38#0, %38#1, %38#2) : (i32, f32, f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (i32, f32, f32), sym_name = "useMultiResultOpToReplacePartial1"}> ({
    %37:3 = "test.three_result"() <{kind = 2 : i64}> : () -> (i32, f32, f32)
    "func.return"(%37#0, %37#1, %37#2) : (i32, f32, f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (i32, f32, f32), sym_name = "useMultiResultOpToReplacePartial2"}> ({
    %36:3 = "test.three_result"() <{kind = 3 : i64}> : () -> (i32, f32, f32)
    "func.return"(%36#0, %36#1, %36#2) : (i32, f32, f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (i32, f32, f32), sym_name = "useMultiResultOpResultsSeparately"}> ({
    %35:3 = "test.three_result"() <{kind = 4 : i64}> : () -> (i32, f32, f32)
    "func.return"(%35#0, %35#1, %35#2) : (i32, f32, f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (i32, f32, i32), sym_name = "constraintOnSourceOpResult"}> ({
    %33:2 = "test.two_result"() <{kind = 5 : i64}> : () -> (i32, f32)
    %34:2 = "test.two_result"() <{kind = 5 : i64}> : () -> (i32, f32)
    "func.return"(%33#0, %33#1, %34#0) : (i32, f32, i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (i32, f32, f32), sym_name = "useAuxiliaryOpToReplaceMultiResultOp"}> ({
    %32:3 = "test.three_result"() <{kind = 6 : i64}> : () -> (i32, f32, f32)
    "func.return"(%32#0, %32#1, %32#2) : (i32, f32, f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32) -> (i32, i32, i32, i32, i32, i32), sym_name = "replaceOneVariadicOutOneVariadicInOp"}> ({
  ^bb0(%arg54: i32, %arg55: i32, %arg56: i32):
    %29 = "test.one_variadic_out_one_variadic_in1"(%arg54) : (i32) -> i32
    %30:2 = "test.one_variadic_out_one_variadic_in1"(%arg54, %arg55) : (i32, i32) -> (i32, i32)
    %31:3 = "test.one_variadic_out_one_variadic_in1"(%arg54, %arg55, %arg56) : (i32, i32, i32) -> (i32, i32, i32)
    "func.return"(%29, %30#0, %30#1, %31#0, %31#1, %31#2) : (i32, i32, i32, i32, i32, i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, f32, i32) -> (), sym_name = "replaceMixedVariadicInputOp"}> ({
  ^bb0(%arg51: i32, %arg52: f32, %arg53: i32):
    "test.mixed_variadic_in1"(%arg52) : (f32) -> ()
    "test.mixed_variadic_in1"(%arg51, %arg52, %arg53) : (i32, f32, i32) -> ()
    "test.mixed_variadic_in1"(%arg51, %arg51, %arg52, %arg53, %arg53) : (i32, i32, f32, i32, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (f32, i32, f32, i32, i32, i32, f32, i32, i32), sym_name = "replaceMixedVariadicOutputOp"}> ({
    %26 = "test.mixed_variadic_out1"() : () -> f32
    %27:3 = "test.mixed_variadic_out1"() : () -> (i32, f32, i32)
    %28:5 = "test.mixed_variadic_out1"() : () -> (i32, i32, f32, i32, i32)
    "func.return"(%26, %27#0, %27#1, %27#2, %28#0, %28#1, %28#2, %28#3, %28#4) : (f32, i32, f32, i32, i32, i32, f32, i32, i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i32, sym_name = "generateVariadicOutputOpInNestedPattern"}> ({
    %25 = "test.one_i32_out"() : () -> i32
    "func.return"(%25) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32) -> (), sym_name = "testMatchVariadic"}> ({
  ^bb0(%arg47: i32, %arg48: i32, %arg49: i32, %arg50: i32):
    "test.mixed_variadic_in4"(%arg47, %arg48, %arg49) <{attr1 = 0 : i32}> : (i32, i32, i32) -> ()
    "test.mixed_variadic_in4"(%arg47, %arg48, %arg49, %arg50) <{attr1 = 0 : i32}> : (i32, i32, i32, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32) -> (), sym_name = "testReplaceVariadic"}> ({
  ^bb0(%arg43: i32, %arg44: i32, %arg45: i32, %arg46: i32):
    "test.mixed_variadic_in5"(%arg43, %arg44, %arg45) <{attr1 = 0 : i32, pattern_name = "MatchInverseVariadic"}> : (i32, i32, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32) -> (), sym_name = "testMatchVariadicSubDag"}> ({
  ^bb0(%arg40: i32, %arg41: i32, %arg42: i32):
    %23 = "test.mixed_variadic_in_out_i32"(%arg40) : (i32) -> i32
    %24 = "test.mixed_variadic_in_out_i32"(%arg41) : (i32) -> i32
    "test.mixed_variadic_in4"(%23, %24, %arg42) <{attr1 = 1 : i32}> : (i32, i32, i32) -> ()
    "test.mixed_variadic_in4"(%arg40, %arg41, %arg42) <{attr1 = 1 : i32}> : (i32, i32, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32) -> (), sym_name = "testMatchVariadicSameSymbol"}> ({
  ^bb0(%arg37: i32, %arg38: i32, %arg39: i32):
    "test.mixed_variadic_in4"(%arg37, %arg37, %arg39) <{attr1 = 2 : i32}> : (i32, i32, i32) -> ()
    "test.mixed_variadic_in4"(%arg37, %arg38, %arg39) <{attr1 = 2 : i32}> : (i32, i32, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32) -> (), sym_name = "testMatchAndRewriteVariadicFullRange"}> ({
  ^bb0(%arg33: i32, %arg34: i32, %arg35: i32, %arg36: i32):
    "test.mixed_variadic_in6"(%arg33, %arg34, %arg35, %arg36) <{attr1 = 1 : i32}> : (i32, i32, i32, i32) -> ()
    "test.mixed_variadic_in6"(%arg33, %arg34) <{attr1 = 1 : i32}> : (i32, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32) -> (), sym_name = "testMatchMultiVariadicSubSymbol"}> ({
  ^bb0(%arg29: i32, %arg30: i32, %arg31: i32, %arg32: i32):
    "test.mixed_variadic_in6"(%arg29, %arg30, %arg31, %arg32) <{attr1 = 2 : i32}> : (i32, i32, i32, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32) -> (), sym_name = "testMatchMixedVaradicOptional"}> ({
  ^bb0(%arg25: i32, %arg26: i32, %arg27: i32, %arg28: i32):
    "test.mixed_variadic_optional_in7"(%arg25, %arg26, %arg27) <{attr1 = 2 : i32, operandSegmentSizes = array<i32: 2, 1>}> : (i32, i32, i32) -> ()
    "test.mixed_variadic_optional_in7"(%arg25, %arg26) <{attr1 = 2 : i32, operandSegmentSizes = array<i32: 2, 0>}> : (i32, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "testSimplePropertyRewrite"}> ({
    %20 = "test.prop_pattern_op_1"() <{cond = false, tag = "o1", val = 1 : i64}> : () -> i32
    %21 = "test.prop_pattern_op_1"() <{cond = false, tag = "o2", val = -1 : i64}> : () -> i32
    %22 = "test.prop_pattern_op_1"() <{cond = true, tag = "o3", val = 1 : i64}> : () -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "testNestedPropertyRewrite"}> ({
    %19 = "test.prop_pattern_op_1"() <{cond = false, tag = "s1", val = 1 : i64}> : () -> i32
    "test.prop_pattern_op_2"(%19) <{tag = "t1"}> : (i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "redundantTest"}> ({
  ^bb0(%arg24: i32):
    %18 = "test.op_m"(%arg24) : (i32) -> i32
    "func.return"(%18) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i16, i8) -> (), sym_name = "eitherDagLeafOnly"}> ({
  ^bb0(%arg21: i32, %arg22: i16, %arg23: i8):
    %16 = "test.either_op_a"(%arg21, %arg22, %arg23) : (i32, i16, i8) -> i32
    %17 = "test.either_op_a"(%arg22, %arg21, %arg23) : (i16, i32, i8) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i16, i8) -> (), sym_name = "eitherDagLeafDagNode"}> ({
  ^bb0(%arg18: i32, %arg19: i16, %arg20: i8):
    %13 = "test.either_op_b"(%arg18, %arg18) : (i32, i32) -> i32
    %14 = "test.either_op_a"(%13, %arg19, %arg20) : (i32, i16, i8) -> i32
    %15 = "test.either_op_a"(%arg19, %13, %arg20) : (i16, i32, i8) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i16, i8) -> (), sym_name = "eitherDagNodeDagNode"}> ({
  ^bb0(%arg15: i32, %arg16: i16, %arg17: i8):
    %9 = "test.either_op_b"(%arg15, %arg15) : (i32, i32) -> i32
    %10 = "test.either_op_b"(%arg16, %arg16) : (i16, i16) -> i32
    %11 = "test.either_op_a"(%9, %10, %arg17) : (i32, i32, i8) -> i32
    %12 = "test.either_op_a"(%10, %9, %arg17) : (i32, i32, i8) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i16) -> (), sym_name = "testEitherOpWithAttr"}> ({
  ^bb0(%arg13: i32, %arg14: i16):
    %6 = "test.either_op_c"(%arg13, %arg14) <{attr = 0 : i32}> : (i32, i16) -> i32
    %7 = "test.either_op_c"(%arg14, %arg13) <{attr = 0 : i32}> : (i16, i32) -> i32
    %8 = "test.either_op_c"(%arg13, %arg14) <{attr = 1 : i32}> : (i32, i16) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64) -> i8, sym_name = "explicitReturnTypeTest"}> ({
  ^bb0(%arg12: i64):
    %5 = "test.source_op"(%arg12) <{tag = 11 : i32}> : (i64) -> i8
    "func.return"(%5) : (i8) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> i8, sym_name = "returnTypeBuilderTest"}> ({
  ^bb0(%arg11: i1):
    %4 = "test.source_op"(%arg11) <{tag = 22 : i32}> : (i1) -> i8
    "func.return"(%4) : (i8) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> i1, sym_name = "multipleReturnTypeBuildTest"}> ({
  ^bb0(%arg10: i1):
    %3 = "test.source_op"(%arg10) <{tag = 33 : i32}> : (i1) -> i1
    "func.return"(%3) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i8) -> i32, sym_name = "copyValueType"}> ({
  ^bb0(%arg9: i8):
    %2 = "test.source_op"(%arg9) <{tag = 44 : i32}> : (i8) -> i32
    "func.return"(%2) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> i64, sym_name = "multipleReturnTypeDifferent"}> ({
  ^bb0(%arg8: i1):
    %1 = "test.source_op"(%arg8) <{tag = 55 : i32}> : (i1) -> i64
    "func.return"(%1) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i1, sym_name = "returnTypeAndLocation"}> ({
  ^bb0(%arg7: i32):
    %0 = "test.source_op"(%arg7) <{tag = 66 : i32}> : (i32) -> i1
    "func.return"(%0) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "testConstantStrAttr"}> ({
    "test.no_str_value"() <{value = "bar"}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i64, f32, f32, f32, f32) -> (), sym_name = "testVariadic"}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i64, %arg3: f32, %arg4: f32, %arg5: f32, %arg6: f32):
    "test.variadic_rewrite_src_op"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5, %arg6) <{operandSegmentSizes = array<i32: 2, 1, 4>}> : (i32, i32, i64, f32, f32, f32, f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

