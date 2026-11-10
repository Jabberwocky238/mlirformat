"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "update_tracked_op_mapping"}> ({
    "test.container"() ({
      %2 = "test.foo"() {replace_with_new_op = "test.foo"} : () -> i32
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["test.container"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{ops = ["test.foo"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.transform.test_patterns"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.annotate"(%1) <{name = "annotated"}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "limited_updates"}> ({
    "test.container"() ({
      %2 = "test.foo"() {replace_with_new_op = "test.foo"} : () -> i32
      %3 = "test.foo"() {replace_with_new_op = "test.foo"} : () -> i32
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      "transform.sequence"(%arg0) <{failure_propagation_mode = 2 : i32, operandSegmentSizes = array<i32: 1, 0>}> ({
      ^bb0(%arg1: !transform.any_op):
        %0 = "transform.structured.match"(%arg1) <{ops = ["test.container"]}> : (!transform.any_op) -> !transform.any_op
        %1 = "transform.structured.match"(%arg1) <{ops = ["test.foo"]}> : (!transform.any_op) -> !transform.any_op
        "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = 1 : i64}> ({
          "transform.apply_patterns.transform.test_patterns"() : () -> ()
        }) : (!transform.any_op) -> ()
        "transform.yield"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "replacement_op_for_dead_handle_not_found"}> ({
    "test.container"() ({
      %2 = "test.foo"() {replace_with_new_op = "test.bar"} : () -> i32
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["test.container"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{ops = ["test.foo"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.transform.test_patterns"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "replacement_op_not_found_silenced"}> ({
    "test.container"() ({
      %2 = "test.foo"() {replace_with_new_op = "test.bar"} : () -> i32
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["test.container"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{ops = ["test.foo"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.transform.test_patterns"() : () -> ()
      }) {transform.silence_tracking_failures} : (!transform.any_op) -> ()
      "transform.annotate"(%1) <{name = "annotated"}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "patterns_apply_only_to_target_body"}> ({
    %1 = "test.foo"() {replace_with_new_op = "test.bar"} : () -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["test.foo"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.transform.test_patterns"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<5xf32>) -> index, sym_name = "canonicalization"}> ({
  ^bb0(%arg1: tensor<5xf32>):
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "tensor.dim"(%arg1, %2) : (tensor<5xf32>, index) -> index
    "func.return"(%3) : (index) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.dim"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%1) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.canonicalization"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<5xf32>) -> (), sym_name = "canonicalization_and_cse"}> ({
  ^bb0(%arg1: memref<5xf32>):
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index
    %2 = "memref.subview"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 1>, static_sizes = array<i64: 2>, static_strides = array<i64: 1>}> : (memref<5xf32>) -> memref<2xf32, strided<[1], offset: 1>>
    %3 = "memref.subview"(%arg1, %1) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>, static_offsets = array<i64: 1>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (memref<5xf32>, index) -> memref<?xf32, strided<[1], offset: 1>>
    "memref.copy"(%2, %3) : (memref<2xf32, strided<[1], offset: 1>>, memref<?xf32, strided<[1], offset: 1>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%0) <{apply_cse, max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.canonicalization"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<5xf32>, sym_name = "full_dialect_conversion"}> ({
    %1 = "test.foo"() {replace_with_new_op = "test.bar"} : () -> tensor<5xf32>
    "func.return"(%1) : (tensor<5xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_conversion_patterns"(%0) <{legal_ops = ["func.func", "func.return", "test.new_op"]}> ({
        "transform.apply_conversion_patterns.transform.test_conversion_patterns"() : () -> ()
      }, {
        "transform.apply_conversion_patterns.transform.test_type_converter"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<5xf32>, sym_name = "partial_dialect_conversion"}> ({
    %1 = "test.foo"() {replace_with_new_op = "test.bar"} : () -> tensor<5xf32>
    "test.bar"() : () -> ()
    "func.return"(%1) : (tensor<5xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_conversion_patterns"(%0) <{legal_ops = ["func.func", "func.return", "test.new_op"], partial_conversion}> ({
        "transform.apply_conversion_patterns.transform.test_conversion_patterns"() : () -> ()
      }, {
        "transform.apply_conversion_patterns.transform.test_type_converter"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "replacement_op_not_found"}> ({
    "test.container"() ({
      %2 = "test.foo"() {replace_with_new_op = "test.bar"} : () -> i32
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "patterns"}> ({
  ^bb0(%arg1: !transform.any_op):
    "transform.apply_patterns"(%arg1) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
      "transform.apply_patterns.transform.test_patterns"() : () -> ()
    }) : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg0: !transform.any_op):
    %0 = "transform.structured.match"(%arg0) <{ops = ["test.container"]}> : (!transform.any_op) -> !transform.any_op
    %1 = "transform.structured.match"(%arg0) <{ops = ["test.foo"]}> : (!transform.any_op) -> !transform.any_op
    "transform.annotate"(%1) <{name = "annotated"}> : (!transform.any_op) -> ()
    "transform.include"(%0) <{failure_propagation_mode = 1 : i32, target = @patterns}> : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
}) {transform.with_named_sequence} : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<5xf32>, sym_name = "dialect_conversion_tracking"}> ({
    %2 = "test.foo"() {replace_with_new_op = "test.bar"} : () -> tensor<5xf32>
    "func.return"(%2) : (tensor<5xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%0) <{ops = ["test.foo"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_conversion_patterns"(%0) <{legal_ops = ["func.func", "func.return", "test.new_op"], preserve_handles}> ({
        "transform.apply_conversion_patterns.transform.test_conversion_patterns"() : () -> ()
      }, {
        "transform.apply_conversion_patterns.transform.test_type_converter"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.annotate"(%1) <{name = "annotated"}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

