"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x3x?x1xi32>) -> tensor<5x3xi32>, sym_name = "insert_slice_static_sizes", sym_visibility = "private"}> ({
  ^bb0(%arg1: tensor<?x3x?x1xi32>):
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index
    %2 = "tensor.empty"() : () -> tensor<5x3xi32>
    %3 = "tensor.extract_slice"(%arg1, %1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: 0, -9223372036854775808, 0, 0>, static_sizes = array<i64: 1, 1, 5, 1>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<?x3x?x1xi32>, index) -> tensor<5x1xi32>
    %4 = "tensor.insert_slice"(%3, %2, %1) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0>, static_offsets = array<i64: 0, -9223372036854775808>, static_sizes = array<i64: 5, 1>, static_strides = array<i64: 1, 1>}> : (tensor<5x1xi32>, tensor<5x3xi32>, index) -> tensor<5x3xi32>
    "func.return"(%4) : (tensor<5x3xi32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.insert_slice"]}> : (!transform.any_op) -> !transform.any_op
      "transform.structured.vectorize"(%0) <{scalable_sizes = array<i1: false, false>, static_vector_sizes = array<i64: 8, 1>}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x3x?x1xi32>, index) -> tensor<5x3xi32>, sym_name = "insert_slice_dynamic_src_dim", sym_visibility = "private"}> ({
  ^bb0(%arg1: tensor<?x3x?x1xi32>, %arg2: index):
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index
    %2 = "tensor.empty"() : () -> tensor<5x3xi32>
    %3 = "tensor.extract_slice"(%arg1, %1, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 0, -9223372036854775808, 0, 0>, static_sizes = array<i64: 1, 1, -9223372036854775808, 1>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<?x3x?x1xi32>, index, index) -> tensor<?x1xi32>
    %4 = "tensor.insert_slice"(%3, %2, %1, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 0>, static_offsets = array<i64: 0, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, 1>, static_strides = array<i64: 1, 1>}> : (tensor<?x1xi32>, tensor<5x3xi32>, index, index) -> tensor<5x3xi32>
    "func.return"(%4) : (tensor<5x3xi32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.insert_slice"]}> : (!transform.any_op) -> !transform.any_op
      "transform.structured.vectorize"(%0) <{scalable_sizes = array<i1: false, false>, static_vector_sizes = array<i64: 8, 1>}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x3x?x1xi32>, index) -> tensor<?x3xi32>, sym_name = "insert_slice_dynamic_dest_dim", sym_visibility = "private"}> ({
  ^bb0(%arg1: tensor<?x3x?x1xi32>, %arg2: index):
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index
    %2 = "tensor.empty"(%arg2) : (index) -> tensor<?x3xi32>
    %3 = "tensor.extract_slice"(%arg1, %1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: 0, -9223372036854775808, 0, 0>, static_sizes = array<i64: 1, 1, 5, 1>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<?x3x?x1xi32>, index) -> tensor<5x1xi32>
    %4 = "tensor.insert_slice"(%3, %2, %1) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0>, static_offsets = array<i64: 0, -9223372036854775808>, static_sizes = array<i64: 5, 1>, static_strides = array<i64: 1, 1>}> : (tensor<5x1xi32>, tensor<?x3xi32>, index) -> tensor<?x3xi32>
    "func.return"(%4) : (tensor<?x3xi32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.insert_slice"]}> : (!transform.any_op) -> !transform.any_op
      "transform.structured.vectorize"(%0) <{scalable_sizes = array<i1: false, false>, static_vector_sizes = array<i64: 8, 1>}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x3x?x1xi32>, index) -> tensor<?x3xi32>, sym_name = "insert_slice_dynamic_source_and_dest_dim", sym_visibility = "private"}> ({
  ^bb0(%arg1: tensor<?x3x?x1xi32>, %arg2: index):
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index
    %2 = "tensor.empty"(%arg2) : (index) -> tensor<?x3xi32>
    %3 = "tensor.extract_slice"(%arg1, %1, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 0, -9223372036854775808, 0, 0>, static_sizes = array<i64: 1, 1, -9223372036854775808, 1>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<?x3x?x1xi32>, index, index) -> tensor<?x1xi32>
    %4 = "tensor.insert_slice"(%3, %2, %1, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 0>, static_offsets = array<i64: 0, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, 1>, static_strides = array<i64: 1, 1>}> : (tensor<?x1xi32>, tensor<?x3xi32>, index, index) -> tensor<?x3xi32>
    "func.return"(%4) : (tensor<?x3xi32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.insert_slice"]}> : (!transform.any_op) -> !transform.any_op
      "transform.structured.vectorize"(%0) <{scalable_sizes = array<i1: false, false>, static_vector_sizes = array<i64: 8, 1>}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x3x?x1xi32>, index) -> tensor<?x3xi32>, sym_name = "insert_slice_non_zero_offset_for_dyn_dim", sym_visibility = "private"}> ({
  ^bb0(%arg1: tensor<?x3x?x1xi32>, %arg2: index):
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index
    %2 = "tensor.empty"(%arg2) : (index) -> tensor<?x3xi32>
    %3 = "tensor.extract_slice"(%arg1, %1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: 0, -9223372036854775808, 0, 0>, static_sizes = array<i64: 1, 1, 6, 1>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<?x3x?x1xi32>, index) -> tensor<6x1xi32>
    %4 = "tensor.insert_slice"(%3, %2, %1) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: 6, 1>, static_strides = array<i64: 1, 1>}> : (tensor<6x1xi32>, tensor<?x3xi32>, index) -> tensor<?x3xi32>
    "func.return"(%4) : (tensor<?x3xi32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.insert_slice"]}> : (!transform.any_op) -> !transform.any_op
      "transform.structured.vectorize"(%0) <{scalable_sizes = array<i1: false, false>, static_vector_sizes = array<i64: 8, 1>}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

