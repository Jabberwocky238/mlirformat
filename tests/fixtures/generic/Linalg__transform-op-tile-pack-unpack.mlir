"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x256xf32>, tensor<4x8x32x32xf32>) -> tensor<4x8x32x32xf32>, sym_name = "NC_to_NCnc"}> ({
  ^bb0(%arg1: tensor<128x256xf32>, %arg2: tensor<4x8x32x32xf32>):
    %2 = "linalg.pack"(%arg1, %arg2) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 32, 32>}> : (tensor<128x256xf32>, tensor<4x8x32x32xf32>) -> tensor<4x8x32x32xf32>
    "func.return"(%2) : (tensor<4x8x32x32xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 2, 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x256xf32>, tensor<32x4x32x8xf32>) -> tensor<32x4x32x8xf32>, sym_name = "KC_to_CKkc"}> ({
  ^bb0(%arg1: tensor<128x256xf32>, %arg2: tensor<32x4x32x8xf32>):
    %2 = "linalg.pack"(%arg1, %arg2) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, outer_dims_perm = array<i64: 1, 0>, static_inner_tiles = array<i64: 32, 8>}> : (tensor<128x256xf32>, tensor<32x4x32x8xf32>) -> tensor<32x4x32x8xf32>
    "func.return"(%2) : (tensor<32x4x32x8xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 2, 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x15xf32>, tensor<2x8x8x2xf32>, f32) -> tensor<2x8x8x2xf32>, sym_name = "pad_and_pack_static"}> ({
  ^bb0(%arg1: tensor<13x15xf32>, %arg2: tensor<2x8x8x2xf32>, %arg3: f32):
    %2 = "linalg.pack"(%arg1, %arg2, %arg3) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_inner_tiles = array<i64: 8, 2>}> : (tensor<13x15xf32>, tensor<2x8x8x2xf32>, f32) -> tensor<2x8x8x2xf32>
    "func.return"(%2) : (tensor<2x8x8x2xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 2, 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?x8x2xf32>, f32) -> tensor<?x?x8x2xf32>, sym_name = "pad_and_pack_partially_dynamic"}> ({
  ^bb0(%arg1: tensor<?x?xf32>, %arg2: tensor<?x?x8x2xf32>, %arg3: f32):
    %2 = "linalg.pack"(%arg1, %arg2, %arg3) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_inner_tiles = array<i64: 8, 2>}> : (tensor<?x?xf32>, tensor<?x?x8x2xf32>, f32) -> tensor<?x?x8x2xf32>
    "func.return"(%2) : (tensor<?x?x8x2xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 2, 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?x?x?xf32>, f32, index, index) -> tensor<?x?x?x?xf32>, sym_name = "pad_and_pack_fully_dynamic"}> ({
  ^bb0(%arg1: tensor<?x?xf32>, %arg2: tensor<?x?x?x?xf32>, %arg3: f32, %arg4: index, %arg5: index):
    %2 = "linalg.pack"(%arg1, %arg2, %arg3, %arg4, %arg5) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 1, 2>, static_inner_tiles = array<i64: -9223372036854775808, -9223372036854775808>}> : (tensor<?x?xf32>, tensor<?x?x?x?xf32>, f32, index, index) -> tensor<?x?x?x?xf32>
    "func.return"(%2) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 2, 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x8x32x16xf32>, tensor<256x128xf32>) -> tensor<256x128xf32>, sym_name = "NCnc_to_NC"}> ({
  ^bb0(%arg1: tensor<8x8x32x16xf32>, %arg2: tensor<256x128xf32>):
    %2 = "linalg.unpack"(%arg1, %arg2) <{inner_dims_pos = array<i64: 0, 1>, static_inner_tiles = array<i64: 32, 16>}> : (tensor<8x8x32x16xf32>, tensor<256x128xf32>) -> tensor<256x128xf32>
    "func.return"(%2) : (tensor<256x128xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.unpack"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 2, 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
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
      %1:3 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 2, 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x4x2x4xf32>, tensor<8x128xf32>) -> tensor<8x128xf32>, sym_name = "perfect_CKkc_to_KC"}> ({
  ^bb0(%arg1: tensor<32x4x2x4xf32>, %arg2: tensor<8x128xf32>):
    %2 = "linalg.unpack"(%arg1, %arg2) <{inner_dims_pos = array<i64: 0, 1>, outer_dims_perm = array<i64: 1, 0>, static_inner_tiles = array<i64: 2, 4>}> : (tensor<32x4x2x4xf32>, tensor<8x128xf32>) -> tensor<8x128xf32>
    "func.return"(%2) : (tensor<8x128xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.unpack"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 2, 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x2x2xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "dynamic_perfect_CKkc_to_KC"}> ({
  ^bb0(%arg1: tensor<?x?x2x2xf32>, %arg2: tensor<?x?xf32>):
    %2 = "linalg.unpack"(%arg1, %arg2) <{inner_dims_pos = array<i64: 0, 1>, outer_dims_perm = array<i64: 1, 0>, static_inner_tiles = array<i64: 2, 2>}> : (tensor<?x?x2x2xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%2) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.unpack"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 2, 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x6x6x2xf32>, tensor<1x6x6x8xf32>) -> tensor<1x6x6x8xf32>, sym_name = "perfect_NKPQk_to_NPQK"}> ({
  ^bb0(%arg1: tensor<1x4x6x6x2xf32>, %arg2: tensor<1x6x6x8xf32>):
    %2 = "linalg.unpack"(%arg1, %arg2) <{inner_dims_pos = array<i64: 3>, outer_dims_perm = array<i64: 0, 3, 1, 2>, static_inner_tiles = array<i64: 2>}> : (tensor<1x4x6x6x2xf32>, tensor<1x6x6x8xf32>) -> tensor<1x6x6x8xf32>
    "func.return"(%2) : (tensor<1x6x6x8xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.unpack"]}> : (!transform.any_op) -> !transform.any_op
      %1:5 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false, false, false>, static_sizes = array<i64: 1, 1, 1, 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> index, sym_name = "get_dynamic_tile_size", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "fully_dynamic_unpack"}> ({
  ^bb0(%arg1: tensor<?x?x?x?xf32>, %arg2: tensor<?x?xf32>):
    %2 = "func.call"() <{callee = @get_dynamic_tile_size}> : () -> index
    %3 = "linalg.unpack"(%arg1, %arg2, %2, %2) <{inner_dims_pos = array<i64: 1, 0>, static_inner_tiles = array<i64: -9223372036854775808, -9223372036854775808>}> : (tensor<?x?x?x?xf32>, tensor<?x?xf32>, index, index) -> tensor<?x?xf32>
    "func.return"(%3) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.unpack"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 4, 8>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x6x6x8xf32>, tensor<1x4x6x6x2xf32>) -> tensor<1x4x6x6x2xf32>, sym_name = "perfect_NPQK_to_NKPQk"}> ({
  ^bb0(%arg1: tensor<1x6x6x8xf32>, %arg2: tensor<1x4x6x6x2xf32>):
    %2 = "linalg.pack"(%arg1, %arg2) <{inner_dims_pos = array<i64: 3>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, outer_dims_perm = array<i64: 0, 3, 1, 2>, static_inner_tiles = array<i64: 2>}> : (tensor<1x6x6x8xf32>, tensor<1x4x6x6x2xf32>) -> tensor<1x4x6x6x2xf32>
    "func.return"(%2) : (tensor<1x4x6x6x2xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.any_op
      %1:5 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false, false, false>, static_sizes = array<i64: 1, 1, 1, 1>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

