"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "any_attr_of_pass"}> ({
    "test.any_attr_of_i32_str"() <{attr = 3 : i32}> : () -> ()
    "test.any_attr_of_i32_str"() <{attr = "string_data"}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "float_attrs_pass"}> ({
    "test.float_attrs"() <{float_attr = 2.000000e+00 : f4E2M1FN}> : () -> ()
    "test.float_attrs"() <{float_attr = 2.000000e+00 : f6E2M3FN}> : () -> ()
    "test.float_attrs"() <{float_attr = 2.000000e+00 : f6E3M2FN}> : () -> ()
    "test.float_attrs"() <{float_attr = 2.000000e+00 : f8E5M2}> : () -> ()
    "test.float_attrs"() <{float_attr = 2.000000e+00 : f8E4M3}> : () -> ()
    "test.float_attrs"() <{float_attr = 2.000000e+00 : f8E4M3FN}> : () -> ()
    "test.float_attrs"() <{float_attr = 2.000000e+00 : f8E5M2FNUZ}> : () -> ()
    "test.float_attrs"() <{float_attr = 2.000000e+00 : f8E4M3FNUZ}> : () -> ()
    "test.float_attrs"() <{float_attr = 2.000000e+00 : f8E4M3B11FNUZ}> : () -> ()
    "test.float_attrs"() <{float_attr = 2.000000e+00 : f8E3M4}> : () -> ()
    "test.float_attrs"() <{float_attr = 2.000000e+00 : f8E8M0FNU}> : () -> ()
    "test.float_attrs"() <{float_attr = 2.000000e+00 : f16}> : () -> ()
    "test.float_attrs"() <{float_attr = 2.000000e+00 : bf16}> : () -> ()
    "test.float_attrs"() <{float_attr = 2.000000e+00 : tf32}> : () -> ()
    "test.float_attrs"() <{float_attr = 2.000000e+00 : f32}> : () -> ()
    "test.float_attrs"() <{float_attr = 2.000000e+00 : f64}> : () -> ()
    "test.float_attrs"() <{float_attr = 2.000000e+00 : f80}> : () -> ()
    "test.float_attrs"() <{float_attr = 2.000000e+00 : f128}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "int_attrs_pass"}> ({
    "test.int_attrs"() <{any_i32_attr = 5 : ui32, index_attr = 8 : index, si32_attr = 7 : si32, ui32_attr = 6 : ui32}> : () -> ()
    "test.int_attrs"() <{any_i32_attr = 5 : si32, index_attr = 8 : index, si32_attr = 7 : si32, ui32_attr = 6 : ui32}> : () -> ()
    "test.int_attrs"() <{any_i32_attr = 5 : i32, index_attr = 8 : index, si32_attr = 7 : si32, ui32_attr = 6 : ui32}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "int_attrs_pass"}> ({
    "test.in_range_attrs"() {attr_00 = -128 : i8, attr_01 = 127 : i8, attr_02 = -128 : si8, attr_03 = 127 : si8, attr_04 = 255 : ui8, attr_05 = -32768 : i16, attr_06 = 32767 : i16, attr_07 = -32768 : si16, attr_08 = 32767 : si16, attr_09 = 65535 : ui16, attr_10 = -2147483647 : i32, attr_11 = 2147483646 : i32, attr_12 = -2147483647 : si32, attr_13 = 2147483646 : si32, attr_14 = 4294967295 : ui32, attr_15 = -9223372036854775808 : i64, attr_16 = 9223372036854775807 : i64, attr_17 = -9223372036854775808 : si64, attr_18 = 9223372036854775807 : si64, attr_19 = 18446744073709551615 : ui64, attr_20 = 1 : ui1, attr_21 = -1 : si1, attr_22 = 79228162514264337593543950335 : ui96, attr_23 = -39614081257132168796771975168 : si96} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "int_attrs_pass"}> ({
    "test.i8_attr"() {attr_00 = -1 : i8, attr_01 = -1 : i16, attr_02 = -1 : i32, attr_03 = -1 : i64} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "int0_attrs_pass"}> ({
    "test.i0_attr"() {attr_00 = 0 : i0, attr_01 = 0 : si0, attr_02 = 0 : ui0, attr_03 = 0 : i0, attr_04 = 0 : si0, attr_05 = 0 : ui0} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "non_negative_int_attr_pass"}> ({
    "test.non_negative_int_attr"() <{i32attr = 5 : i32, i64attr = 10 : i64}> : () -> ()
    "test.non_negative_int_attr"() <{i32attr = 0 : i32, i64attr = 0 : i64}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "positive_int_attr_pass"}> ({
    "test.positive_int_attr"() <{i32attr = 5 : i32, i64attr = 10 : i64}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "correct_type_array_attr_pass"}> ({
    "test.type_array_attr"() <{attr = [i32, f32]}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "string_attr_custom_type_valid"}> ({
    "test.string_attr_with_type"() <{attr = "string_data" : i64}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "string_attr_custom_mixed_type"}> ({
    "test.string_attr_with_mixed_type"() <{attr = "string_data" : i64}> : () -> ()
    "test.string_attr_with_mixed_type"() <{attr = 42 : i64}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "allowed_cases_pass"}> ({
    %0 = "test.i32_enum_attr"() <{attr = 5 : i32}> : () -> i32
    %1 = "test.i32_enum_attr"() <{attr = 10 : i32}> : () -> i32
    %2 = "test.i32_enum_attr"() <{attr = -2147483648 : i32}> : () -> i32
    %3 = "test.i32_enum_attr"() <{attr = -1 : i32}> : () -> i32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "allowed_cases_pass"}> ({
    %0 = "test.i64_enum_attr"() <{attr = 5 : i64}> : () -> i32
    %1 = "test.i64_enum_attr"() <{attr = 10 : i64}> : () -> i32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "allowed_cases_pass"}> ({
    "test.op_with_bit_enum"() <{value = #test.bit_enum<read, write>}> : () -> ()
    "test.op_with_bit_enum"() <{value = #test.bit_enum<read, execute>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "allowed_cases_pass"}> ({
    "test.op_with_bit_enum_vbar"() <{value = #test.bit_enum_vbar<user | group>}> : () -> ()
    "test.op_with_bit_enum_vbar"() <{value = #test.bit_enum_vbar<user | group | other>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "correct_type_pass"}> ({
    "test.float_elements_attr"() <{scalar_f32_attr = dense<5.000000e+00> : tensor<2xf32>, tensor_f64_attr = dense<6.000000e+00> : tensor<4x8xf64>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "tf32_elements_attr"}> ({
    "foo"() {attr = dense<4.000000e+00> : tensor<tf32>} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "simple_scalar_example"}> ({
    "test.string_elements_attr"() <{scalar_string_attr = dense<"example"> : tensor<2x!unknown<"">>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "escape_string_example"}> ({
    "test.string_elements_attr"() <{scalar_string_attr = dense<"new\0Aline"> : tensor<2x!unknown<"">>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "simple_scalar_example"}> ({
    "test.string_elements_attr"() <{scalar_string_attr = dense<["example1", "example2"]> : tensor<2x!unknown<"">>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "dense_array_attr"}> ({
    "test.dense_array_attr"() <{emptyattr = array<i32>, f32attr = array<f32: 1.024000e+03, 4.530000e+02, -6.435000e+03>, f64attr = array<f64: -1.420000e+02>, i16attr = array<i16: 3, 5, -4, 10>, i1attr = array<i1: true, false, true>, i32attr = array<i32: 1024, 453, -6435>, i64attr = array<i64: -142>, i8attr = array<i8: 1, -2, 3>}> : () -> ()
    "array.sizes"() {x0_i0 = array<i0: 0, 0>, x1_ui0 = array<ui0: 0, 0>, x2_si0 = array<si0: 0, 0>, x3_i24 = array<i24: -42, 42, 8388607>, x4_ui24 = array<ui24: 16777215>, x5_si24 = array<si24: -8388608>, x6_bf16 = array<bf16: 1.203130e+00, 3.406250e+00>, x7_f16 = array<f16: 1.000000e+00, 3.000000e+00>} : () -> ()
    "func.return"() : () -> ()
  }) {emptyf32attr = array<f32>, emptyf64attr = array<f64>, emptyi16attr = array<i16>, emptyi1attr = array<i1>, emptyi32attr = array<i32>, emptyi64attr = array<i64>, emptyi8attr = array<i8>, f32attr = array<f32: 1.024000e+03, 4.530000e+02, -6.435000e+03>, f64attr = array<f64: -1.420000e+02>, i16attr = array<i16: 3, 5, -4, 10>, i1attr = array<i1: true, false, true>, i32attr = array<i32: 1024, 453, -6435>, i64attr = array<i64: -142>, i8attr = array<i8: 1, -2, 3>} : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "testConfinedDenseArrayAttr"}> ({
    "test.confined_dense_array_attr"() <{emptyattr = array<i16>, i32attr = array<i32: 1>, i64attr = array<i64: 0, 2, 3>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "testConfinedStrictlyPositiveDenseArrayAttr"}> ({
    "test.confined_strictly_positive_attr"() <{emptyattr = array<i16>, f32attr = array<f32: 1.100000e+00, 2.100000e+00>, f64attr = array<f64: 2.100000e+00, 3.100000e+00>, i16attr = array<i16: 20, 30>, i32attr = array<i32: 1>, i64attr = array<i64: 1, 2, 3>, i8attr = array<i8: 2, 3>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "testConfinedNonNegativeDenseArrayAttr"}> ({
    "test.confined_non_negative_attr"() <{emptyattr = array<i16>, f32attr = array<f32: 0.000000e+00, 2.100000e+00>, f64attr = array<f64: 0.000000e+00, 3.100000e+00>, i16attr = array<i16: 0, 30>, i32attr = array<i32: 1>, i64attr = array<i64: 1, 0, 3>, i8attr = array<i8: 0, 3>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "fn"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
  "test.symbol_ref_attr"() {symbol = @fn} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "correct_int_elements_attr_pass"}> ({
    "test.int_elements_attr"() <{any_i32_attr = dense<5> : tensor<1x2x3x4xui32>, i32_attr = dense<5> : tensor<6xi32>}> : () -> ()
    "test.int_elements_attr"() <{any_i32_attr = dense<5> : tensor<1x2x3x4xsi32>, i32_attr = dense<5> : tensor<6xi32>}> : () -> ()
    "test.int_elements_attr"() <{any_i32_attr = dense<5> : tensor<1x2x3x4xi32>, i32_attr = dense<5> : tensor<6xi32>}> : () -> ()
    "test.index_elements_attr"() {any_index_attr = dense<5> : tensor<1x2x3x4xindex>, index_attr = dense<5> : tensor<6xindex>} : () -> ()
    "test.hex_index_elements_attr"() {hex_index_attr = dense<"0x00000C000000000000080C000000000000080C000000000000080C000000000000080C000000000000080C000000000000080C000000000000080C000000000000080C000000000000080C000000000000080C000000000000080C000000000000080C000000000000080C000000000000080C000000000000080C000000000000080C000000000000080C000000000000080C000000000000080C000000000000080C000000000000080C000000000000080C000000000000080C000000000000100C000000000000100C000000000000100C000000000000100C000000000000100C000000000000100C000000000000100C000000000000100C000000000000100C000000000000100C000000000000100C000000000000100C000000000000100C000000000000100C000000000000100C000000000000100C000000000000100C000000000000100C000000000000100C000000000000100C000000000000100C000000000000100C000000000000100C000000000000180C000000000000180C000000000000180C000000000000180C000000000000180C000000000000180C000000000000180C000000000000180C000000000000180C000000000000180C000000000000180C000000000000180C000000000000180C000000000000180C000000000000180C000000000000180C000000000000180C000000000000180C000000000000180C000000000000180C000000000000180C000000000000180C000000000000080C0000000000001A150000000000005078000000000000B659010000000000ECBC010000000000FEC5010000000000342902000000000046320200000000007C950200000000008E9E020000000000C401030000000000D60A0300000000000C6E0300000000001E7703000000000054DA03000000000066E30300000000009C46040000000000AE4F040000000000E4B2040000000000F6BB0400000000002C1F050000000000628100000000000098E40000000000000E0C00000000000020150000000000005678000000000000BC59010000000000F2BC01000000000004C60100000000003A290200000000004C320200000000008295020000000000949E020000000000CA01030000000000DC0A030000000000126E03000000000024770300000000005ADA0300000000006CE3030000000000A246040000000000B44F040000000000EAB2040000000000FCBB040000000000321F05000000000068810000000000009EE40000000000"> : tensor<23x5xindex>} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "correct_type_pass"}> ({
    "test.ranked_int_elements_attr"() <{matrix_i64_attr = dense<6> : tensor<4x8xi64>, vector_i32_attr = dense<5> : tensor<2xi32>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (), sym_name = "default_value_printing"}> ({
  ^bb0(%arg0: i32):
    "test.default_value_print"(%arg0) <{value_with_default = 0 : i32}> : (i32) -> ()
    "test.default_value_print"(%arg0) <{value_with_default = 1 : i32}> : (i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
