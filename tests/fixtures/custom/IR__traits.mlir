module {
  func.func @succeededSameOperandsElementType(%arg0: tensor<10x10xf32>, %arg1: tensor<1xf32>, %arg2: vector<1xf32>, %arg3: tensor<1xi32>, %arg4: f32) {
    %0 = "test.same_operand_element_type"(%arg1, %arg1) : (tensor<1xf32>, tensor<1xf32>) -> tensor<1xi32>
    %1 = "test.same_operand_element_type"(%arg1, %arg0) : (tensor<1xf32>, tensor<10x10xf32>) -> tensor<1xi32>
    %2 = "test.same_operand_element_type"(%arg0, %arg2) : (tensor<10x10xf32>, vector<1xf32>) -> tensor<1xi32>
    %3 = "test.same_operand_element_type"(%arg2, %arg1) : (vector<1xf32>, tensor<1xf32>) -> tensor<1xi32>
    %4 = "test.same_operand_element_type"(%arg2, %arg1) : (vector<1xf32>, tensor<1xf32>) -> tensor<121xi32>
    %5 = "test.same_operand_element_type"(%arg4, %arg4) : (f32, f32) -> i32
    %6 = "test.same_operand_element_type"(%arg4, %arg1) : (f32, tensor<1xf32>) -> tensor<121xi32>
    %7 = "test.same_operand_element_type"(%arg4, %arg2) : (f32, vector<1xf32>) -> tensor<121xi32>
    %8 = "test.same_operand_element_type"(%arg4, %arg0) : (f32, tensor<10x10xf32>) -> tensor<121xi32>
    return
  }
}

// -----
// -----
// -----
// -----
module {
  func.func @succeededSameOperandAndResultElementType(%arg0: tensor<10x10xf32>, %arg1: tensor<1xf32>, %arg2: vector<1xf32>, %arg3: tensor<1xi32>, %arg4: f32) {
    %0 = "test.same_operand_and_result_element_type"(%arg1, %arg1) : (tensor<1xf32>, tensor<1xf32>) -> tensor<1xf32>
    %1 = "test.same_operand_and_result_element_type"(%arg1, %arg0) : (tensor<1xf32>, tensor<10x10xf32>) -> tensor<1xf32>
    %2 = "test.same_operand_and_result_element_type"(%arg0, %arg2) : (tensor<10x10xf32>, vector<1xf32>) -> tensor<1xf32>
    %3 = "test.same_operand_and_result_element_type"(%arg2, %arg1) : (vector<1xf32>, tensor<1xf32>) -> tensor<1xf32>
    %4 = "test.same_operand_and_result_element_type"(%arg2, %arg1) : (vector<1xf32>, tensor<1xf32>) -> tensor<121xf32>
    %5 = "test.same_operand_and_result_element_type"(%arg4, %arg4) : (f32, f32) -> f32
    %6 = "test.same_operand_and_result_element_type"(%arg4, %arg1) : (f32, tensor<1xf32>) -> tensor<121xf32>
    %7 = "test.same_operand_and_result_element_type"(%arg4, %arg2) : (f32, vector<1xf32>) -> tensor<121xf32>
    %8 = "test.same_operand_and_result_element_type"(%arg4, %arg0) : (f32, tensor<10x10xf32>) -> tensor<121xf32>
    return
  }
}

// -----
// -----
// -----
// -----
// -----
// -----
module {
  func.func @succeededSameOperandShape(%arg0: tensor<10x10xf32>, %arg1: tensor<1xf32>, %arg2: memref<10x10xi32>, %arg3: tensor<*xf32>) {
    "test.same_operand_shape"(%arg1, %arg1) : (tensor<1xf32>, tensor<1xf32>) -> ()
    "test.same_operand_shape"(%arg0, %arg0) : (tensor<10x10xf32>, tensor<10x10xf32>) -> ()
    "test.same_operand_shape"(%arg1, %arg3) : (tensor<1xf32>, tensor<*xf32>) -> ()
    "test.same_operand_shape"(%arg0, %arg2) : (tensor<10x10xf32>, memref<10x10xi32>) -> ()
    return
  }
}

// -----
// -----
// -----
module {
  func.func @succeededSameOperandAndResultShape(%arg0: tensor<10x10xf32>, %arg1: tensor<1xf32>, %arg2: tensor<*xf32>, %arg3: tensor<?xf32>) {
    %0 = "test.same_operand_and_result_shape"(%arg1, %arg1) : (tensor<1xf32>, tensor<1xf32>) -> tensor<1xf32>
    %1 = "test.same_operand_and_result_shape"(%arg0, %arg0) : (tensor<10x10xf32>, tensor<10x10xf32>) -> tensor<10x10xf32>
    %2 = "test.same_operand_and_result_shape"(%arg1, %arg2) : (tensor<1xf32>, tensor<*xf32>) -> tensor<1xf32>
    %3 = "test.same_operand_and_result_shape"(%arg1, %arg3) : (tensor<1xf32>, tensor<?xf32>) -> tensor<1xf32>
    %4 = "test.same_operand_and_result_shape"(%arg1, %arg3) : (tensor<1xf32>, tensor<?xf32>) -> memref<1xf32>
    return
  }
}

// -----
// -----
// -----
// -----
// -----
module {
  func.func @succeededSameOperandAndResultType(%arg0: tensor<10x10xf32>, %arg1: tensor<1xf32>, %arg2: tensor<*xf32>, %arg3: tensor<?xf32>, %arg4: i32) {
    %0 = "test.same_operand_and_result_type"(%arg1, %arg1) : (tensor<1xf32>, tensor<1xf32>) -> tensor<1xf32>
    %1 = "test.same_operand_and_result_type"(%arg0, %arg0) : (tensor<10x10xf32>, tensor<10x10xf32>) -> tensor<10x10xf32>
    %2 = "test.same_operand_and_result_type"(%arg1, %arg2) : (tensor<1xf32>, tensor<*xf32>) -> tensor<1xf32>
    %3 = "test.same_operand_and_result_type"(%arg1, %arg3) : (tensor<1xf32>, tensor<?xf32>) -> tensor<1xf32>
    %4 = "test.same_operand_and_result_type"(%arg4, %arg4) : (i32, i32) -> i32
    return
  }
}

// -----
// -----
// -----
// -----
// -----
module {
  func.func @elementwiseMappable_dynamic_shapes(%arg0: tensor<?xf32>, %arg1: tensor<5xf32>) {
    %0 = "test.elementwise_mappable"(%arg0, %arg1) : (tensor<?xf32>, tensor<5xf32>) -> tensor<?xf32>
    return
  }
}

// -----
// -----
// -----
// -----
// -----
// -----
// -----
module {
  func.func @succeededElementwiseMappable(%arg0: vector<2xf32>) {
    %0 = "test.elementwise_mappable"(%arg0) : (vector<2xf32>) -> vector<2xf16>
    return
  }
}

// -----
// -----
module {
  func.func @succeededParentOneOf() {
    "test.parent"() ({
      "test.child_with_parent_one_of"() : () -> ()
      "test.finish"() : () -> ()
    }) : () -> ()
    return
  }
}

// -----
module {
  func.func @succeededParent1OneOf() {
    "test.parent1"() ({
      "test.child_with_parent_one_of"() : () -> ()
      "test.finish"() : () -> ()
    }) : () -> ()
    return
  }
}

// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
module {
  "test.symbol"() <{sym_name = "foo_3", sym_visibility = "nested"}> : () -> ()
  "test.symbol"() <{sym_name = "foo_4", sym_visibility = "private"}> : () -> ()
  "test.symbol"() <{sym_name = "foo_5", sym_visibility = "public"}> : () -> ()
  "test.symbol"() <{sym_name = "foo_6"}> : () -> ()
}

// -----
module {
  "test.symbol_scope"() ({
    func.func private @foo()
    "test.finish"() : () -> ()
  }) : () -> ()
  func.func private @foo()
}

// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
module {
  func.func @succeededOperandSizeAttr(%arg0: i32) {
    "test.attr_sized_operands"(%arg0, %arg0, %arg0, %arg0) <{operandSegmentSizes = array<i32: 0, 2, 1, 1>}> : (i32, i32, i32, i32) -> ()
    return
  }
}

// -----
// -----
// -----
// -----
// -----
// -----
// -----
module {
  func.func @succeededResultSizeAttr() {
    %b:2, %c, %d = "test.attr_sized_results"() <{resultSegmentSizes = array<i32: 0, 2, 1, 1>}> : () -> (i32, i32, i32, i32)
    return
  }
}

// -----
module {
  func.func @succeededOilistTrivial() {
    test.oilist_with_keywords_only keyword
    test.oilist_with_keywords_only otherKeyword
    test.oilist_with_keywords_only keyword otherKeyword
    test.oilist_with_keywords_only keyword otherKeyword
    test.oilist_with_keywords_only thirdKeyword
    test.oilist_with_keywords_only keyword thirdKeyword
    return
  }
}

// -----
module {
  func.func @succeededOilistTrivialProperties() {
    test.oilist_with_keywords_only_properties keyword
    test.oilist_with_keywords_only_properties otherKeyword
    test.oilist_with_keywords_only_properties keyword otherKeyword
    test.oilist_with_keywords_only_properties keyword otherKeyword
    test.oilist_with_keywords_only_properties thirdKeyword
    test.oilist_with_keywords_only_properties keyword thirdKeyword
    return
  }
}

// -----
module {
  func.func @succeededOilistSimple(%arg0: i32, %arg1: i32, %arg2: i32) {
    test.oilist_with_simple_args keyword %arg0 : i32
    test.oilist_with_simple_args otherKeyword %arg0 : i32
    test.oilist_with_simple_args thirdKeyword %arg0 : i32
    test.oilist_with_simple_args keyword %arg0 : i32 otherKeyword %arg1 : i32
    test.oilist_with_simple_args keyword %arg0 : i32 thirdKeyword %arg1 : i32
    test.oilist_with_simple_args otherKeyword %arg1 : i32 thirdKeyword %arg0 : i32
    test.oilist_with_simple_args keyword %arg0 : i32 otherKeyword %arg1 : i32 thirdKeyword %arg2 : i32
    test.oilist_with_simple_args keyword %arg1 : i32 otherKeyword %arg0 : i32 thirdKeyword %arg2 : i32
    test.oilist_with_simple_args keyword %arg2 : i32 otherKeyword %arg0 : i32 thirdKeyword %arg1 : i32
    return
  }
}

// -----
module {
  func.func @succeededOilistVariadic(%arg0: i32, %arg1: i32, %arg2: i32) {
    test.oilist_variadic_with_parens keyword(%arg0, %arg1 : i32, i32)
    test.oilist_variadic_with_parens keyword(%arg0, %arg1 : i32, i32) otherKeyword(%arg2, %arg1 : i32, i32)
    test.oilist_variadic_with_parens keyword(%arg0, %arg1 : i32, i32) otherKeyword(%arg0, %arg1 : i32, i32) thirdKeyword(%arg2, %arg0, %arg1 : i32, i32, i32)
    return
  }
}

// -----
module {
  func.func @succeededOilistCustom(%arg0: i32, %arg1: i32, %arg2: i32) {
    test.oilist_custom private(%arg0, %arg1 : i32, i32)
    test.oilist_custom private(%arg0, %arg1 : i32, i32) nowait
    test.oilist_custom private(%arg0, %arg1 : i32, i32) reduction (%arg1)  nowait
    return
  }
}

// -----
// -----
// -----
// -----
// -----
// -----
module {
  func.func @succeeded_type_traits() {
    %0 = "test.result_type_with_trait"() : () -> !test.test_type_with_trait
    return
  }
}

// -----
// -----
module {
  func.func @succeeded_attr_traits() {
    "test.attr_with_trait"() <{attr = #test.attr_with_trait}> : () -> ()
    return
  }
}

// -----
