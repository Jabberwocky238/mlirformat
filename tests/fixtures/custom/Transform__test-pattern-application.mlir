module {
  func.func @update_tracked_op_mapping() {
    "test.container"() ({
      %0 = "test.foo"() {replace_with_new_op = "test.foo"} : () -> i32
    }) : () -> ()
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %0 = transform.structured.match ops{["test.container"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["test.foo"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.transform.test_patterns
      } : !transform.any_op
      transform.annotate %1 "annotated" : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @limited_updates() {
    "test.container"() ({
      %0 = "test.foo"() {replace_with_new_op = "test.foo"} : () -> i32
      %1 = "test.foo"() {replace_with_new_op = "test.foo"} : () -> i32
    }) : () -> ()
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      transform.sequence %arg0 : !transform.any_op failures(suppress) {
      ^bb0(%arg1: !transform.any_op):
        %0 = transform.structured.match ops{["test.container"]} in %arg1 : (!transform.any_op) -> !transform.any_op
        %1 = transform.structured.match ops{["test.foo"]} in %arg1 : (!transform.any_op) -> !transform.any_op
        apply_patterns to %0 {
          transform.apply_patterns.transform.test_patterns
        } {max_num_rewrites = 1 : i64} : !transform.any_op
      }
      transform.yield 
    }
  }
}

// -----
module {
  func.func @replacement_op_for_dead_handle_not_found() {
    "test.container"() ({
      %0 = "test.foo"() {replace_with_new_op = "test.bar"} : () -> i32
    }) : () -> ()
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %0 = transform.structured.match ops{["test.container"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["test.foo"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.transform.test_patterns
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @replacement_op_not_found_silenced() {
    "test.container"() ({
      %0 = "test.foo"() {replace_with_new_op = "test.bar"} : () -> i32
    }) : () -> ()
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %0 = transform.structured.match ops{["test.container"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["test.foo"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.transform.test_patterns
      } {transform.silence_tracking_failures} : !transform.any_op
      transform.annotate %1 "annotated" : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @patterns_apply_only_to_target_body() {
    %0 = "test.foo"() {replace_with_new_op = "test.bar"} : () -> i32
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %0 = transform.structured.match ops{["test.foo"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.transform.test_patterns
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @canonicalization(%arg0: tensor<5xf32>) -> index {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<5xf32>
    return %dim : index
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %0 = transform.structured.match ops{["tensor.dim"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %1 {
        transform.apply_patterns.canonicalization
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @canonicalization_and_cse(%arg0: memref<5xf32>) {
    %c2 = arith.constant 2 : index
    %subview = memref.subview %arg0[1] [2] [1] : memref<5xf32> to memref<2xf32, strided<[1], offset: 1>>
    %subview_0 = memref.subview %arg0[1] [%c2] [1] : memref<5xf32> to memref<?xf32, strided<[1], offset: 1>>
    memref.copy %subview, %subview_0 : memref<2xf32, strided<[1], offset: 1>> to memref<?xf32, strided<[1], offset: 1>>
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.canonicalization
      } {apply_cse} : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @full_dialect_conversion() -> tensor<5xf32> {
    %0 = "test.foo"() {replace_with_new_op = "test.bar"} : () -> tensor<5xf32>
    return %0 : tensor<5xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_conversion_patterns to %0 {
        transform.apply_conversion_patterns.transform.test_conversion_patterns
      } with type_converter {
        transform.apply_conversion_patterns.transform.test_type_converter
      } {legal_ops = ["func.func", "func.return", "test.new_op"]} : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @partial_dialect_conversion() -> tensor<5xf32> {
    %0 = "test.foo"() {replace_with_new_op = "test.bar"} : () -> tensor<5xf32>
    "test.bar"() : () -> ()
    return %0 : tensor<5xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_conversion_patterns to %0 {
        transform.apply_conversion_patterns.transform.test_conversion_patterns
      } with type_converter {
        transform.apply_conversion_patterns.transform.test_type_converter
      } {legal_ops = ["func.func", "func.return", "test.new_op"], partial_conversion} : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module attributes {transform.with_named_sequence} {
  func.func @replacement_op_not_found() {
    "test.container"() ({
      %0 = "test.foo"() {replace_with_new_op = "test.bar"} : () -> i32
    }) : () -> ()
    return
  }
  transform.named_sequence @patterns(%arg0: !transform.any_op {transform.readonly}) {
    transform.apply_patterns to %arg0 {
      transform.apply_patterns.transform.test_patterns
    } : !transform.any_op
    transform.yield 
  }
  transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
    %0 = transform.structured.match ops{["test.container"]} in %arg0 : (!transform.any_op) -> !transform.any_op
    %1 = transform.structured.match ops{["test.foo"]} in %arg0 : (!transform.any_op) -> !transform.any_op
    transform.annotate %1 "annotated" : !transform.any_op
    transform.include @patterns failures(propagate) (%0) : (!transform.any_op) -> ()
    transform.yield 
  }
}

// -----
module {
  func.func @dialect_conversion_tracking() -> tensor<5xf32> {
    %0 = "test.foo"() {replace_with_new_op = "test.bar"} : () -> tensor<5xf32>
    return %0 : tensor<5xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["test.foo"]} in %0 : (!transform.any_op) -> !transform.any_op
      transform.apply_conversion_patterns to %0 {
        transform.apply_conversion_patterns.transform.test_conversion_patterns
      } with type_converter {
        transform.apply_conversion_patterns.transform.test_type_converter
      } {legal_ops = ["func.func", "func.return", "test.new_op"], preserve_handles} : !transform.any_op
      transform.annotate %1 "annotated" : !transform.any_op
      transform.yield 
    }
  }
}

