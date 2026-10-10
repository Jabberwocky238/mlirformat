"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1x4x8x8x32xf32>, tensor<1x1x128x64xf32>) -> tensor<1x1x128x64xf32>, sym_name = "KCRSsr_to_KCRS"}> ({
  ^bb0(%arg1: tensor<1x1x4x8x8x32xf32>, %arg2: tensor<1x1x128x64xf32>):
    %2 = "linalg.unpack"(%arg1, %arg2) <{inner_dims_pos = array<i64: 3, 2>, static_inner_tiles = array<i64: 8, 32>}> : (tensor<1x1x4x8x8x32xf32>, tensor<1x1x128x64xf32>) -> tensor<1x1x128x64xf32>
    "func.return"(%2) : (tensor<1x1x128x64xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.unpack"]}> : (!transform.any_op) -> !transform.any_op
      %1:5 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false, false, false>, static_sizes = array<i64: 1, 1, 32, 8>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x8x8x2xf32>, tensor<13x15xf32>) -> tensor<13x15xf32>, sym_name = "unpack_and_extract_slice"}> ({
  ^bb0(%arg1: tensor<2x8x8x2xf32>, %arg2: tensor<13x15xf32>):
    %2 = "linalg.unpack"(%arg1, %arg2) <{inner_dims_pos = array<i64: 0, 1>, static_inner_tiles = array<i64: 8, 2>}> : (tensor<2x8x8x2xf32>, tensor<13x15xf32>) -> tensor<13x15xf32>
    "func.return"(%2) : (tensor<13x15xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.unpack"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 8, 2>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x4x32x8xf32>, tensor<128x256xf32>) -> tensor<128x256xf32>, sym_name = "CKkc_to_KC"}> ({
  ^bb0(%arg1: tensor<32x4x32x8xf32>, %arg2: tensor<128x256xf32>):
    %2 = "linalg.unpack"(%arg1, %arg2) <{inner_dims_pos = array<i64: 0, 1>, outer_dims_perm = array<i64: 1, 0>, static_inner_tiles = array<i64: 32, 8>}> : (tensor<32x4x32x8xf32>, tensor<128x256xf32>) -> tensor<128x256xf32>
    "func.return"(%2) : (tensor<128x256xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.unpack"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 32, 8>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

