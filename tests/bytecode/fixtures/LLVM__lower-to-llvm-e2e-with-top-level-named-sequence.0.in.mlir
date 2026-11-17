"builtin.module"() ({
  "func.func"() <{function_type = (memref<64x4xf32, strided<[4, 1]>>, index, index, index) -> memref<?x?xf32, strided<[?, ?], offset: ?>>, sym_name = "subview"}> ({
  ^bb0(%arg1: memref<64x4xf32, strided<[4, 1]>> loc("<stdin>":3:8), %arg2: index loc("<stdin>":3:50), %arg3: index loc("<stdin>":3:64), %arg4: index loc("<stdin>":3:78)):
    %1 = "memref.subview"(%arg1, %arg2, %arg3, %arg2, %arg3, %arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 2, 2, 2>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: -9223372036854775808, -9223372036854775808>}> : (memref<64x4xf32, strided<[4, 1]>>, index, index, index, index, index, index) -> memref<?x?xf32, strided<[?, ?], offset: ?>> loc("<stdin>":4:10)
    "func.return"(%1) : (memref<?x?xf32, strided<[?, ?], offset: ?>>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "builtin.module"() <{sym_name = "named_inclusion_in_named"}> ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> !transform.any_op, sym_name = "lower_to_llvm", sym_visibility = "private"}> ({
    }) : () -> () loc("<stdin>":8:5)
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "entry_point"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":11:10)):
      %0 = "transform.include"(%arg0) <{failure_propagation_mode = 2 : i32, target = @lower_to_llvm}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":12:12)
      "transform.yield"() : () -> () loc("<stdin>":13:7)
    }) : () -> () loc("<stdin>":10:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":7:3)
}) : () -> () loc("<stdin>":1:1)
