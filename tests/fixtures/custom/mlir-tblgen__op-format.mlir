module {
  %0 = "foo.op"() : () -> i64
  %1 = "foo.op"() : () -> i32
  %2 = "foo.op"() : () -> memref<1xf64>
  test.format_literal_op keyword_$. -> :, = <> () []( ) ? + * {
  } {foo.some_attr}
  test.format_attr_op 10
  test.format_opt_attr_op_a(10)
  test.format_opt_attr_op_a
  test.format_opt_attr_op_b 10
  test.format_opt_attr_op_b
  test.format_symbol_name_attr_op @name
  test.format_symbol_name_attr_op @opt_name
  test.format_opt_symbol_name_attr_op
  test.format_opt_symbol_ref_attr_op @foo {test.unit}
  test.format_opt_symbol_ref_attr_op {test.unit}
  test.format_attr_dict_w_keyword attributes {attr = 10 : i64}
  test.format_attr_dict_w_keyword attributes {attr = 10 : i64, opt_attr = 10 : i64}
  %3 = test.format_buildable_type_op %0
  test.format_region_a_op {
    "test.return"() : () -> ()
  }
  test.format_region_b_op {
    "test.return"() : () -> ()
  }
  test.format_region_c_op region {
    "test.return"() : () -> ()
  }
  test.format_region_c_op
  test.format_variadic_region_a_op {
    "test.return"() : () -> ()
  }, {
    "test.return"() : () -> ()
  }
  test.format_variadic_region_b_op {
    "test.return"() : () -> ()
  }, {
    "test.return"() : () -> ()
  } found_regions
  test.format_variadic_region_b_op
  test.format_implicit_terminator_region_a_op {
  }
  test.format_implicit_terminator_region_a_op {
    "test.return"() {foo.attr} : () -> ()
  }
  test.format_implicit_terminator_region_a_op {
    "test.return"(%0) : (i64) -> ()
  }
  %buildable_res, %result = test.format_result_a_op memref<1xf64>
  %buildable_res_0, %result_1 = test.format_result_b_op i64, memref<1xf64>
  %buildable_res_2, %result_3 = test.format_result_c_op (i64) -> memref<1xf64>
  %4:3 = test.format_variadic_result : i64, i64, i64
  %result0:3, %result1:2 = test.format_multiple_variadic_results : (i64, i64, i64), (i32, i32)
  test.format_operand_a_op %0, %2 : i64, memref<1xf64>
  test.format_operand_b_op %0, %2 : memref<1xf64>
  test.format_operand_c_op %0, %2 : i64, memref<1xf64>
  test.format_operand_d_op %0, %2 : memref<1xf64>
  test.format_operand_e_op %0, %2 : i64, memref<1xf64>
  test.format_variadic_operand %0, %0, %0 : i64, i64, i64
  test.format_variadic_of_variadic_operand (%0, %0), (), (%0) : (i64, i64), (), (i64)
  test.format_multiple_variadic_operands (%0, %0, %0), (%0, %1 : i64, i32)
  "foo.successor_test_region"() ({
    test.format_successor_a_op ^bb1 {attr}
  ^bb1:  // 2 preds: ^bb0, ^bb1
    test.format_successor_a_op ^bb1, ^bb2 {attr}
  ^bb2:  // pred: ^bb1
    test.format_successor_a_op  {attr}
  }) {arg_names = ["i", "j", "k"]} : () -> ()
  test.format_optional_unit_attribute is_optional
  test.format_optional_unit_attribute
  test.format_optional_unit_attribute_no_elide unit
  test.format_optional_unit_property is_optional
  test.format_optional_unit_property
  test.format_optional_unit_property_no_elide unit
  test.format_optional_enum_attr case5
  test.format_optional_enum_attr
  test.format_optional_default_attrs "foo" @foo case10
  test.format_optional_default_attrs
  test.format_optional_default_enum_attr case10
  test.format_optional_default_enum_attr
  %5 = test.format_optional_operand_result_a_op(%0 : i64) : i64
  %6 = test.format_optional_operand_result_a_op( : ) : i64
  test.format_optional_operand_result_a_op(%0 : i64) : 
  test.format_optional_operand_result_a_op(%0 : i64) : [%0, %0]
  %7 = test.format_optional_operand_result_b_op(%0 : i64) : i64
  %8 = test.format_optional_operand_result_b_op : i64
  %9 = test.format_optional_operand_result_b_op : i64
  test.format_optional_result_a_op
  %optional, %variadic:2 = test.format_optional_result_a_op : i64 -> i64, i64
  test.format_optional_result_b_op
  %optional_4, %variadic_5:2 = test.format_optional_result_b_op : i64 -> i64, i64
  %optional_6, %variadic_7:2 = test.format_optional_result_c_op : (i64) -> (i64, i64)
  test.format_optional_else then
  test.format_optional_else else
  test.format_optional_prop_dict 
  test.format_optional_prop_dict 
  test.format_optional_prop_dict 
  test.format_optional_prop_dict <{a = ["foo"]}>
  test.format_optional_prop_dict <{b = 2 : i32}>
  test.format_optional_prop_dict <{a = ["foo"], b = 2 : i32}>
  test.format_compound_attr <1, !test.smpla, [5, 6]>
  module attributes {test.nested = #test.cmpnd_nested<nested = <1, !test.smpla, [5, 6]>>} {
  }
  module attributes {test.nested = #test.cmpnd_nested<nested = <1, !test.smpla, [5, 6]>>} {
  }
  test.format_nested_attr <nested = <1, !test.smpla, [5, 6]>>
  test.format_nested_attr <nested = <1, !test.smpla, [5, 6]>>
  module attributes {test.someAttr = #test.cmpnd_nested_inner<42 <1, !test.smpla, [5, 6]>>} {
  }
  module attributes {test.someAttr = #test.cmpnd_nested_outer<i <42 <1, !test.smpla, [5, 6]>>>} {
  }
  test.format_cpmd_nested_attr nested <i <42 <1, !test.smpla, [5, 6]>>>
  test.format_qual_cpmd_nested_attr nested #test.cmpnd_nested_outer<i <42 <1, !test.smpla, [5, 6]>>>
  func.func @qualifiedCompoundNestedExplicit(%arg0: !test.cmpnd_nested_outer<i <42 <1, !test.smpla, [5, 6]>>>) {
    test.format_qual_cpmd_nested_type %arg0 nested !test.cmpnd_nested_outer<i <42 <1, !test.smpla, [5, 6]>>>
    return
  }
  test.format_custom_directive_operands %0, %0 -> (%0)
  test.format_custom_directive_operands %0 -> (%0)
  test.format_custom_directive_operands_and_types %0, %0 -> (%0) : i64, i64 -> (i64)
  test.format_custom_directive_operands_and_types %0 -> (%0) : i64 -> (i64)
  test.format_custom_directive_attributes 54 : i64
  test.format_custom_directive_attributes 54 : i64, 46 : i64
  test.format_custom_directive_regions {
    "test.return"() : () -> ()
  }
  test.format_custom_directive_regions {
    "test.return"() : () -> ()
  }, {
    "test.return"() : () -> ()
  }
  %result_8, %optResult, %varResults = test.format_custom_directive_results  : i64, i64 -> (i64)
  %result_9, %varResults_10 = test.format_custom_directive_results  : i64 -> (i64)
  %result_11, %optResult_12, %varResults_13 = test.format_custom_directive_results_with_type_refs  : i64, i64 -> (i64)  type_refs_capture  : i64, i64 -> (i64)
  %result_14, %varResults_15 = test.format_custom_directive_results_with_type_refs  : i64 -> (i64)  type_refs_capture  : i64 -> (i64)
  test.format_custom_directive_with_optional_operand_ref %0 : 1
  test.format_custom_directive_with_optional_operand_ref : 0
  func.func @foo() {
    test.format_custom_directive_successors ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    test.format_custom_directive_successors ^bb2
  ^bb2:  // 3 preds: ^bb0, ^bb0, ^bb1
    return
  }
  test.format_custom_directive_spacing "a" "b"
  test.format_literal_following_optional_group(5 : i32) : i32 {a}
  func.func @variadic(%arg0: i32) {
    test.ellipsis(%arg0 ...) : i32 ...
    return
  }
  %10 = test.format_infer_variadic_type_from_non_variadic %0, %0 : i64
  %11 = test.format_all_types_match_var %0, %0 : i64
  %12 = test.format_all_types_match_attr 1 : i64, %0
  %13 = test.format_types_match_var %0 : i64
  %14:3 = test.format_types_match_variadic %0, %0, %0 : i64, i64, i64
  %15 = test.format_types_match_attr 1 : i64
  %16 = test.format_types_match_context %0 : i64
  %17 = test.format_types_match_optional(%0 : i64)
  test.format_types_match_optional
  %18 = test.format_infer_type
  %19 = test.format_infer_type2
  %20:2 = test.format_infer_type_all_operands_and_types(%0, %1) : i64, i32
  %21:2 = test.format_infer_type_all_types_one_operand(%0, %1) : i64, i32
  %22:4 = test.format_infer_type_all_types_two_operands(%0, %1) (%0, %1) : i64, i32, i64, i32
  %23:2 = test.format_infer_type_all_types(%0, %1) : i64, i32
  %24:2 = test.format_infer_type_regions {
  ^bb0(%arg0: i32, %arg1: f32):
    "test.terminator"() : () -> ()
  }
  %25:4 = test.format_infer_type_variadic_operands(%1, %1 : i32, i32) (%0, %0 : i64, i64)
  test.with_properties_and_attr 16 <{rhs = 16 : i64}>
  %26 = test.with_properties_and_inferred_type 16 <{packed, rhs = 16 : i64}>
  %27 = test.format_all_types_match_var %26, %1 : i32
  test.using_property_in_custom_and_other [1, 4, 20] <{other = 16 : i64}>
  test.has_str_value
  func.func @else_anchor_op(%arg0: !test.else_anchor<?>, %arg1: !test.else_anchor<5>) {
    test.else_anchor(?) {a = !test.else_anchor_struct<?>}
    test.else_anchor(%arg0 : !test.else_anchor<?>) {a = !test.else_anchor_struct<a = 0>}
    test.else_anchor(%arg1 : !test.else_anchor<5>) {a = !test.else_anchor_struct<b = 0>}
    return
  }
}

