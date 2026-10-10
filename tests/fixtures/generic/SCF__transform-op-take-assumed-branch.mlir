"builtin.module"() ({
  "func.func"() <{function_type = (i1, index, memref<?xf32>, i8) -> (), sym_name = "if_no_else"}> ({
  ^bb0(%arg1: i1, %arg2: index, %arg3: memref<?xf32>, %arg4: i8):
    "scf.if"(%arg1) ({
      "some_op"(%arg1, %arg3) : (i1, memref<?xf32>) -> ()
      "scf.yield"() : () -> ()
    }, {
    }) : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["scf.if"]}> : (!transform.any_op) -> !transform.any_op
      "transform.scf.take_assumed_branch"(%0) <{take_else_branch}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1, index, memref<?xf32>, i8) -> (), sym_name = "if_no_else"}> ({
  ^bb0(%arg1: i1, %arg2: index, %arg3: memref<?xf32>, %arg4: i8):
    "scf.if"(%arg1) ({
      "some_op"(%arg1, %arg3) : (i1, memref<?xf32>) -> ()
      "scf.yield"() : () -> ()
    }, {
    }) : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["scf.if"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{ops = ["some_op"]}> : (!transform.any_op) -> !transform.any_op
      "transform.scf.take_assumed_branch"(%0) : (!transform.any_op) -> ()
      "transform.print"(%1) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, f32, index, index) -> tensor<20x40xf32>, sym_name = "tile_tensor_pad"}> ({
  ^bb0(%arg1: tensor<?x?xf32>, %arg2: f32, %arg3: index, %arg4: index):
    %3 = "tensor.pad"(%arg1, %arg3, %arg3, %arg4, %arg4) <{nofold, operandSegmentSizes = array<i32: 1, 2, 2>, static_high = array<i64: -9223372036854775808, -9223372036854775808>, static_low = array<i64: -9223372036854775808, -9223372036854775808>}> ({
    ^bb0(%arg5: index, %arg6: index):
      "tensor.yield"(%arg2) : (f32) -> ()
    }) : (tensor<?x?xf32>, index, index, index, index) -> tensor<20x40xf32>
    "func.return"(%3) : (tensor<20x40xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.pad"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.tile_using_forall"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 0>, static_tile_sizes = array<i64: 1, 1>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2 = "transform.structured.match"(%arg0) <{ops = ["scf.if"]}> : (!transform.any_op) -> !transform.any_op
      "transform.scf.take_assumed_branch"(%2) <{take_else_branch}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

