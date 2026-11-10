"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>) -> tensor<?xf32>, sym_name = "hoist_outer_loop_only"}> ({
  ^bb0(%arg1: tensor<?xf32>):
    %2 = "test.foo"() : () -> index
    %3 = "test.foo"() : () -> index
    %4 = "test.foo"() : () -> index
    %5 = "scf.for"(%2, %3, %4, %arg1) ({
    ^bb0(%arg2: index, %arg3: tensor<?xf32>):
      %6 = "tensor.extract_slice"(%arg3) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 5>, static_strides = array<i64: 1>}> : (tensor<?xf32>) -> tensor<5xf32>
      %7 = "test.foo"(%6) : (tensor<5xf32>) -> tensor<5xf32>
      %8 = "tensor.insert_slice"(%7, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 5>, static_strides = array<i64: 1>}> : (tensor<5xf32>, tensor<?xf32>) -> tensor<?xf32>
      %9 = "scf.for"(%2, %3, %4, %8) ({
      ^bb0(%arg4: index, %arg5: tensor<?xf32>):
        %10 = "tensor.extract_slice"(%arg5) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 5>, static_sizes = array<i64: 5>, static_strides = array<i64: 1>}> : (tensor<?xf32>) -> tensor<5xf32>
        %11 = "test.foo"(%10) : (tensor<5xf32>) -> tensor<5xf32>
        %12 = "tensor.insert_slice"(%11, %arg5) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>, static_offsets = array<i64: 5>, static_sizes = array<i64: 5>, static_strides = array<i64: 1>}> : (tensor<5xf32>, tensor<?xf32>) -> tensor<?xf32>
        "scf.yield"(%12) : (tensor<?xf32>) -> ()
      }) : (index, index, index, tensor<?xf32>) -> tensor<?xf32>
      "scf.yield"(%9) : (tensor<?xf32>) -> ()
    }) : (index, index, index, tensor<?xf32>) -> tensor<?xf32>
    "func.return"(%5) : (tensor<?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.split_handle"(%0) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.loop.hoist_loop_invariant_subsets"(%1#1) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>) -> tensor<?xf32>, sym_name = "test_mixed_loop_extension_scf_transform"}> ({
  ^bb0(%arg1: tensor<?xf32>):
    %1 = "test.foo"() : () -> index
    %2 = "test.foo"() : () -> index
    %3 = "test.foo"() : () -> index
    %4 = "scf.for"(%1, %2, %3, %arg1) ({
    ^bb0(%arg2: index, %arg3: tensor<?xf32>):
      %5 = "test.foo"(%arg3) : (tensor<?xf32>) -> tensor<?xf32>
      "scf.yield"(%5) : (tensor<?xf32>) -> ()
    }) : (index, index, index, tensor<?xf32>) -> tensor<?xf32>
    "func.return"(%4) : (tensor<?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op
      "transform.loop.hoist_loop_invariant_subsets"(%0) : (!transform.any_op) -> ()
      "transform.loop.unroll"(%0) <{factor = 4 : i64}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

