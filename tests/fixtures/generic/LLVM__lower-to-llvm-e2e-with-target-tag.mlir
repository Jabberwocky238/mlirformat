"builtin.module"() ({
  "builtin.module"() ({
    "func.func"() <{function_type = (memref<64x4xf32, strided<[4, 1]>>, index, index, index) -> memref<?x?xf32, strided<[?, ?], offset: ?>>, sym_name = "subview"}> ({
    ^bb0(%arg1: memref<64x4xf32, strided<[4, 1]>>, %arg2: index, %arg3: index, %arg4: index):
      %1 = "memref.subview"(%arg1, %arg2, %arg3, %arg2, %arg3, %arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 2, 2, 2>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: -9223372036854775808, -9223372036854775808>}> : (memref<64x4xf32, strided<[4, 1]>>, index, index, index, index, index, index) -> memref<?x?xf32, strided<[?, ?], offset: ?>>
      "func.return"(%1) : (memref<?x?xf32, strided<[?, ?], offset: ?>>) -> ()
    }) : () -> ()
  }) {transform.target_tag = "payload"} : () -> ()
  "builtin.module"() <{sym_name = "named_inclusion_in_named"}> ({
    "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> !transform.any_op, sym_name = "lower_to_cpu", sym_visibility = "private"}> ({
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.include"(%arg0) <{failure_propagation_mode = 2 : i32, target = @lower_to_cpu}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

