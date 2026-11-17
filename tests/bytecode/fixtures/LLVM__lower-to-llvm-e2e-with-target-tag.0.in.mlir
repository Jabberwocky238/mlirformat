"builtin.module"() ({
  "builtin.module"() ({
    "func.func"() <{function_type = (memref<64x4xf32, strided<[4, 1]>>, index, index, index) -> memref<?x?xf32, strided<[?, ?], offset: ?>>, sym_name = "subview"}> ({
    ^bb0(%arg1: memref<64x4xf32, strided<[4, 1]>> loc("<stdin>":4:10), %arg2: index loc("<stdin>":4:52), %arg3: index loc("<stdin>":4:66), %arg4: index loc("<stdin>":4:80)):
      %1 = "memref.subview"(%arg1, %arg2, %arg3, %arg2, %arg3, %arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 2, 2, 2>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: -9223372036854775808, -9223372036854775808>}> : (memref<64x4xf32, strided<[4, 1]>>, index, index, index, index, index, index) -> memref<?x?xf32, strided<[?, ?], offset: ?>> loc("<stdin>":5:12)
      "func.return"(%1) : (memref<?x?xf32, strided<[?, ?], offset: ?>>) -> () loc("<stdin>":6:7)
    }) : () -> () loc("<stdin>":3:5)
  }) {transform.target_tag = "payload"} : () -> () loc("<stdin>":2:3)
  "builtin.module"() <{sym_name = "named_inclusion_in_named"}> ({
    "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> !transform.any_op, sym_name = "lower_to_cpu", sym_visibility = "private"}> ({
    }) : () -> () loc("<stdin>":10:5)
    "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":13:10)):
      %0 = "transform.include"(%arg0) <{failure_propagation_mode = 2 : i32, target = @lower_to_cpu}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":14:12)
      "transform.yield"() : () -> () loc("<stdin>":15:7)
    }) : () -> () loc("<stdin>":12:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":9:3)
}) : () -> () loc("<stdin>":1:1)
