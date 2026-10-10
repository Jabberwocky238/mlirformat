"builtin.module"() ({
  "func.func"() <{function_type = (index) -> tensor<index>, sym_name = "tensor_from_elements_0d"}> ({
  ^bb0(%arg1: index):
    %2 = "tensor.from_elements"(%arg1) : (index) -> tensor<index>
    "func.return"(%2) : (tensor<index>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.from_elements"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.rewrite_in_destination_passing_style"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> tensor<2xindex>, sym_name = "tensor_from_elements_1d"}> ({
  ^bb0(%arg1: index, %arg2: index):
    %2 = "tensor.from_elements"(%arg1, %arg2) : (index, index) -> tensor<2xindex>
    "func.return"(%2) : (tensor<2xindex>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.from_elements"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.rewrite_in_destination_passing_style"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> tensor<3x2xindex>, sym_name = "tensor_from_elements_2d"}> ({
  ^bb0(%arg1: index, %arg2: index):
    %2 = "tensor.from_elements"(%arg1, %arg2, %arg1, %arg2, %arg1, %arg2) : (index, index, index, index, index, index) -> tensor<3x2xindex>
    "func.return"(%2) : (tensor<3x2xindex>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.from_elements"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.rewrite_in_destination_passing_style"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> tensor<?x?xindex>, sym_name = "tensor_generate"}> ({
  ^bb0(%arg1: index, %arg2: index):
    %2 = "tensor.generate"(%arg1, %arg2) ({
    ^bb0(%arg3: index, %arg4: index):
      %3 = "arith.addi"(%arg3, %arg4) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      "tensor.yield"(%3) : (index) -> ()
    }) : (index, index) -> tensor<?x?xindex>
    "func.return"(%2) : (tensor<?x?xindex>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.generate"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.rewrite_in_destination_passing_style"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x10xindex>, index, index, index) -> tensor<?x?xindex>, sym_name = "tensor_pad"}> ({
  ^bb0(%arg1: tensor<?x10xindex>, %arg2: index, %arg3: index, %arg4: index):
    %2 = "tensor.pad"(%arg1, %arg2, %arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 2>, static_high = array<i64: -9223372036854775808, -9223372036854775808>, static_low = array<i64: 5, -9223372036854775808>}> ({
    ^bb0(%arg5: index, %arg6: index):
      %3 = "arith.muli"(%arg5, %arg6) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      "tensor.yield"(%3) : (index) -> ()
    }) : (tensor<?x10xindex>, index, index, index) -> tensor<?x?xindex>
    "func.return"(%2) : (tensor<?x?xindex>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.pad"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.rewrite_in_destination_passing_style"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x10xindex>, index, index, index) -> tensor<?x?xindex>, sym_name = "tensor_pad_constant"}> ({
  ^bb0(%arg1: tensor<?x10xindex>, %arg2: index, %arg3: index, %arg4: index):
    %2 = "tensor.pad"(%arg1, %arg2, %arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 2>, static_high = array<i64: -9223372036854775808, -9223372036854775808>, static_low = array<i64: 5, -9223372036854775808>}> ({
    ^bb0(%arg5: index, %arg6: index):
      %3 = "arith.constant"() <{value = 50 : index}> : () -> index
      "tensor.yield"(%3) : (index) -> ()
    }) : (tensor<?x10xindex>, index, index, index) -> tensor<?x?xindex>
    "func.return"(%2) : (tensor<?x?xindex>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.pad"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.rewrite_in_destination_passing_style"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x10xindex>, index, index, index, index) -> tensor<?x?xindex>, sym_name = "tensor_pad_invariant"}> ({
  ^bb0(%arg1: tensor<?x10xindex>, %arg2: index, %arg3: index, %arg4: index, %arg5: index):
    %2 = "tensor.pad"(%arg1, %arg2, %arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 2>, static_high = array<i64: -9223372036854775808, -9223372036854775808>, static_low = array<i64: 5, -9223372036854775808>}> ({
    ^bb0(%arg6: index, %arg7: index):
      "tensor.yield"(%arg5) : (index) -> ()
    }) : (tensor<?x10xindex>, index, index, index) -> tensor<?x?xindex>
    "func.return"(%2) : (tensor<?x?xindex>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.pad"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.rewrite_in_destination_passing_style"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xindex>, index) -> tensor<?x?xindex>, sym_name = "tensor_pad_nofold"}> ({
  ^bb0(%arg1: tensor<?x?xindex>, %arg2: index):
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "tensor.pad"(%arg1, %2, %2) <{nofold, operandSegmentSizes = array<i32: 1, 1, 1>, static_high = array<i64: -9223372036854775808, 0>, static_low = array<i64: 0, -9223372036854775808>}> ({
    ^bb0(%arg3: index, %arg4: index):
      "tensor.yield"(%arg2) : (index) -> ()
    }) : (tensor<?x?xindex>, index, index) -> tensor<?x?xindex>
    "func.return"(%3) : (tensor<?x?xindex>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.pad"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.rewrite_in_destination_passing_style"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

