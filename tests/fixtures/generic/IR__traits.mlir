"builtin.module"() ({
  "func.func"() <{function_type = (tensor<10x10xf32>, tensor<1xf32>, vector<1xf32>, tensor<1xi32>, f32) -> (), sym_name = "succeededSameOperandsElementType"}> ({
  ^bb0(%arg0: tensor<10x10xf32>, %arg1: tensor<1xf32>, %arg2: vector<1xf32>, %arg3: tensor<1xi32>, %arg4: f32):
    %0 = "test.same_operand_element_type"(%arg1, %arg1) : (tensor<1xf32>, tensor<1xf32>) -> tensor<1xi32>
    %1 = "test.same_operand_element_type"(%arg1, %arg0) : (tensor<1xf32>, tensor<10x10xf32>) -> tensor<1xi32>
    %2 = "test.same_operand_element_type"(%arg0, %arg2) : (tensor<10x10xf32>, vector<1xf32>) -> tensor<1xi32>
    %3 = "test.same_operand_element_type"(%arg2, %arg1) : (vector<1xf32>, tensor<1xf32>) -> tensor<1xi32>
    %4 = "test.same_operand_element_type"(%arg2, %arg1) : (vector<1xf32>, tensor<1xf32>) -> tensor<121xi32>
    %5 = "test.same_operand_element_type"(%arg4, %arg4) : (f32, f32) -> i32
    %6 = "test.same_operand_element_type"(%arg4, %arg1) : (f32, tensor<1xf32>) -> tensor<121xi32>
    %7 = "test.same_operand_element_type"(%arg4, %arg2) : (f32, vector<1xf32>) -> tensor<121xi32>
    %8 = "test.same_operand_element_type"(%arg4, %arg0) : (f32, tensor<10x10xf32>) -> tensor<121xi32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<10x10xf32>, tensor<1xf32>, vector<1xf32>, tensor<1xi32>, f32) -> (), sym_name = "succeededSameOperandAndResultElementType"}> ({
  ^bb0(%arg0: tensor<10x10xf32>, %arg1: tensor<1xf32>, %arg2: vector<1xf32>, %arg3: tensor<1xi32>, %arg4: f32):
    %0 = "test.same_operand_and_result_element_type"(%arg1, %arg1) : (tensor<1xf32>, tensor<1xf32>) -> tensor<1xf32>
    %1 = "test.same_operand_and_result_element_type"(%arg1, %arg0) : (tensor<1xf32>, tensor<10x10xf32>) -> tensor<1xf32>
    %2 = "test.same_operand_and_result_element_type"(%arg0, %arg2) : (tensor<10x10xf32>, vector<1xf32>) -> tensor<1xf32>
    %3 = "test.same_operand_and_result_element_type"(%arg2, %arg1) : (vector<1xf32>, tensor<1xf32>) -> tensor<1xf32>
    %4 = "test.same_operand_and_result_element_type"(%arg2, %arg1) : (vector<1xf32>, tensor<1xf32>) -> tensor<121xf32>
    %5 = "test.same_operand_and_result_element_type"(%arg4, %arg4) : (f32, f32) -> f32
    %6 = "test.same_operand_and_result_element_type"(%arg4, %arg1) : (f32, tensor<1xf32>) -> tensor<121xf32>
    %7 = "test.same_operand_and_result_element_type"(%arg4, %arg2) : (f32, vector<1xf32>) -> tensor<121xf32>
    %8 = "test.same_operand_and_result_element_type"(%arg4, %arg0) : (f32, tensor<10x10xf32>) -> tensor<121xf32>
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
  "func.func"() <{function_type = (tensor<10x10xf32>, tensor<1xf32>, memref<10x10xi32>, tensor<*xf32>) -> (), sym_name = "succeededSameOperandShape"}> ({
  ^bb0(%arg0: tensor<10x10xf32>, %arg1: tensor<1xf32>, %arg2: memref<10x10xi32>, %arg3: tensor<*xf32>):
    "test.same_operand_shape"(%arg1, %arg1) : (tensor<1xf32>, tensor<1xf32>) -> ()
    "test.same_operand_shape"(%arg0, %arg0) : (tensor<10x10xf32>, tensor<10x10xf32>) -> ()
    "test.same_operand_shape"(%arg1, %arg3) : (tensor<1xf32>, tensor<*xf32>) -> ()
    "test.same_operand_shape"(%arg0, %arg2) : (tensor<10x10xf32>, memref<10x10xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<10x10xf32>, tensor<1xf32>, tensor<*xf32>, tensor<?xf32>) -> (), sym_name = "succeededSameOperandAndResultShape"}> ({
  ^bb0(%arg0: tensor<10x10xf32>, %arg1: tensor<1xf32>, %arg2: tensor<*xf32>, %arg3: tensor<?xf32>):
    %0 = "test.same_operand_and_result_shape"(%arg1, %arg1) : (tensor<1xf32>, tensor<1xf32>) -> tensor<1xf32>
    %1 = "test.same_operand_and_result_shape"(%arg0, %arg0) : (tensor<10x10xf32>, tensor<10x10xf32>) -> tensor<10x10xf32>
    %2 = "test.same_operand_and_result_shape"(%arg1, %arg2) : (tensor<1xf32>, tensor<*xf32>) -> tensor<1xf32>
    %3 = "test.same_operand_and_result_shape"(%arg1, %arg3) : (tensor<1xf32>, tensor<?xf32>) -> tensor<1xf32>
    %4 = "test.same_operand_and_result_shape"(%arg1, %arg3) : (tensor<1xf32>, tensor<?xf32>) -> memref<1xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<10x10xf32>, tensor<1xf32>, tensor<*xf32>, tensor<?xf32>, i32) -> (), sym_name = "succeededSameOperandAndResultType"}> ({
  ^bb0(%arg0: tensor<10x10xf32>, %arg1: tensor<1xf32>, %arg2: tensor<*xf32>, %arg3: tensor<?xf32>, %arg4: i32):
    %0 = "test.same_operand_and_result_type"(%arg1, %arg1) : (tensor<1xf32>, tensor<1xf32>) -> tensor<1xf32>
    %1 = "test.same_operand_and_result_type"(%arg0, %arg0) : (tensor<10x10xf32>, tensor<10x10xf32>) -> tensor<10x10xf32>
    %2 = "test.same_operand_and_result_type"(%arg1, %arg2) : (tensor<1xf32>, tensor<*xf32>) -> tensor<1xf32>
    %3 = "test.same_operand_and_result_type"(%arg1, %arg3) : (tensor<1xf32>, tensor<?xf32>) -> tensor<1xf32>
    %4 = "test.same_operand_and_result_type"(%arg4, %arg4) : (i32, i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>, tensor<5xf32>) -> (), sym_name = "elementwiseMappable_dynamic_shapes"}> ({
  ^bb0(%arg0: tensor<?xf32>, %arg1: tensor<5xf32>):
    %0 = "test.elementwise_mappable"(%arg0, %arg1) : (tensor<?xf32>, tensor<5xf32>) -> tensor<?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2xf32>) -> (), sym_name = "succeededElementwiseMappable"}> ({
  ^bb0(%arg0: vector<2xf32>):
    %0 = "test.elementwise_mappable"(%arg0) : (vector<2xf32>) -> vector<2xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "succeededParentOneOf"}> ({
    "test.parent"() ({
      "test.child_with_parent_one_of"() : () -> ()
      "test.finish"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "succeededParent1OneOf"}> ({
    "test.parent1"() ({
      "test.child_with_parent_one_of"() : () -> ()
      "test.finish"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "succeededHasAncestor_direct_parent"}> ({
    "test.parent"() ({
      "test.child_with_ancestor"() : () -> ()
      "test.finish"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "succeededHasAncestor_indirect"}> ({
    "test.parent"() ({
      "some.intermediate_op"() ({
        "test.child_with_ancestor"() : () -> ()
        "test.finish"() : () -> ()
      }) : () -> ()
      "test.finish"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "succeededAncestorOneOf"}> ({
    "test.parent"() ({
      "test.child_with_ancestor_one_of"() : () -> ()
      "test.finish"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "succeededAncestor1OneOf"}> ({
    "test.parent1"() ({
      "test.child_with_ancestor_one_of"() : () -> ()
      "test.finish"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "succeededAncestorOneOf_indirect"}> ({
    "test.parent1"() ({
      "some.intermediate_op"() ({
        "test.child_with_ancestor_one_of"() : () -> ()
        "test.finish"() : () -> ()
      }) : () -> ()
      "test.finish"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "test.symbol"() <{sym_name = "foo_3", sym_visibility = "nested"}> : () -> ()
  "test.symbol"() <{sym_name = "foo_4", sym_visibility = "private"}> : () -> ()
  "test.symbol"() <{sym_name = "foo_5", sym_visibility = "public"}> : () -> ()
  "test.symbol"() <{sym_name = "foo_6"}> : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "test.symbol_scope"() ({
    "func.func"() <{function_type = () -> (), sym_name = "foo", sym_visibility = "private"}> ({
    }) : () -> ()
    "test.finish"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "foo", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (), sym_name = "succeededOperandSizeAttr"}> ({
  ^bb0(%arg0: i32):
    "test.attr_sized_operands"(%arg0, %arg0, %arg0, %arg0) <{operandSegmentSizes = array<i32: 0, 2, 1, 1>}> : (i32, i32, i32, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "succeededResultSizeAttr"}> ({
    %0:4 = "test.attr_sized_results"() <{resultSegmentSizes = array<i32: 0, 2, 1, 1>}> : () -> (i32, i32, i32, i32)
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "succeededOilistTrivial"}> ({
    "test.oilist_with_keywords_only"() <{keyword}> : () -> ()
    "test.oilist_with_keywords_only"() <{otherKeyword}> : () -> ()
    "test.oilist_with_keywords_only"() <{keyword, otherKeyword}> : () -> ()
    "test.oilist_with_keywords_only"() <{keyword, otherKeyword}> : () -> ()
    "test.oilist_with_keywords_only"() <{diffNameUnitAttrKeyword}> : () -> ()
    "test.oilist_with_keywords_only"() <{diffNameUnitAttrKeyword, keyword}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "succeededOilistTrivialProperties"}> ({
    "test.oilist_with_keywords_only_properties"() <{diffNameUnitPropKeyword = false, keyword, otherKeyword = false}> : () -> ()
    "test.oilist_with_keywords_only_properties"() <{diffNameUnitPropKeyword = false, keyword = false, otherKeyword}> : () -> ()
    "test.oilist_with_keywords_only_properties"() <{diffNameUnitPropKeyword = false, keyword, otherKeyword}> : () -> ()
    "test.oilist_with_keywords_only_properties"() <{diffNameUnitPropKeyword = false, keyword, otherKeyword}> : () -> ()
    "test.oilist_with_keywords_only_properties"() <{diffNameUnitPropKeyword, keyword = false, otherKeyword = false}> : () -> ()
    "test.oilist_with_keywords_only_properties"() <{diffNameUnitPropKeyword, keyword, otherKeyword = false}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32, i32) -> (), sym_name = "succeededOilistSimple"}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i32):
    "test.oilist_with_simple_args"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i32) -> ()
    "test.oilist_with_simple_args"(%arg0) <{operandSegmentSizes = array<i32: 0, 1, 0>}> : (i32) -> ()
    "test.oilist_with_simple_args"(%arg0) <{operandSegmentSizes = array<i32: 0, 0, 1>}> : (i32) -> ()
    "test.oilist_with_simple_args"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0>}> : (i32, i32) -> ()
    "test.oilist_with_simple_args"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 0, 1>}> : (i32, i32) -> ()
    "test.oilist_with_simple_args"(%arg1, %arg0) <{operandSegmentSizes = array<i32: 0, 1, 1>}> : (i32, i32) -> ()
    "test.oilist_with_simple_args"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 1>}> : (i32, i32, i32) -> ()
    "test.oilist_with_simple_args"(%arg1, %arg0, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 1>}> : (i32, i32, i32) -> ()
    "test.oilist_with_simple_args"(%arg2, %arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 1>}> : (i32, i32, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32, i32) -> (), sym_name = "succeededOilistVariadic"}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i32):
    "test.oilist_variadic_with_parens"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 2, 0, 0>}> : (i32, i32) -> ()
    "test.oilist_variadic_with_parens"(%arg0, %arg1, %arg2, %arg1) <{operandSegmentSizes = array<i32: 2, 2, 0>}> : (i32, i32, i32, i32) -> ()
    "test.oilist_variadic_with_parens"(%arg0, %arg1, %arg0, %arg1, %arg2, %arg0, %arg1) <{operandSegmentSizes = array<i32: 2, 2, 3>}> : (i32, i32, i32, i32, i32, i32, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32, i32) -> (), sym_name = "succeededOilistCustom"}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i32):
    "test.oilist_custom"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 2, 0>}> : (i32, i32) -> ()
    "test.oilist_custom"(%arg0, %arg1) <{nowait, operandSegmentSizes = array<i32: 2, 0>}> : (i32, i32) -> ()
    "test.oilist_custom"(%arg0, %arg1, %arg1) <{nowait, operandSegmentSizes = array<i32: 2, 1>}> : (i32, i32, i32) -> ()
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
  "func.func"() <{function_type = () -> (), sym_name = "succeeded_type_traits"}> ({
    %0 = "test.result_type_with_trait"() : () -> !test.test_type_with_trait
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "succeeded_attr_traits"}> ({
    "test.attr_with_trait"() <{attr = #test.attr_with_trait}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
