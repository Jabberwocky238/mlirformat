"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x3x3x5xf32>, tensor<6x6x5x2xf32>) -> tensor<6x6x5x2xf32>, sym_name = "tile_winograd_filter"}> ({
  ^bb0(%arg1: tensor<2x3x3x5xf32>, %arg2: tensor<6x6x5x2xf32>):
    %2 = "linalg.winograd_filter_transform"(%arg1, %arg2) <{fmr = 1 : i32}> : (tensor<2x3x3x5xf32>, tensor<6x6x5x2xf32>) -> tensor<6x6x5x2xf32>
    "func.return"(%2) : (tensor<6x6x5x2xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.winograd_filter_transform"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false, false, false>, static_sizes = array<i64: 1, 0, 0, 1>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x3x3x5xf32>, tensor<6x6x5x2xf32>) -> tensor<6x6x5x2xf32>, sym_name = "tile_winograd_filter"}> ({
  ^bb0(%arg1: tensor<2x3x3x5xf32>, %arg2: tensor<6x6x5x2xf32>):
    %2 = "linalg.winograd_filter_transform"(%arg1, %arg2) <{fmr = 1 : i32}> : (tensor<2x3x3x5xf32>, tensor<6x6x5x2xf32>) -> tensor<6x6x5x2xf32>
    "func.return"(%2) : (tensor<6x6x5x2xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.winograd_filter_transform"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false, false, false>, static_sizes = array<i64: 1, 0, 0, 2>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x3x1x5xf32>, tensor<6x1x5x2xf32>) -> tensor<6x1x5x2xf32>, sym_name = "tile_winograd_filter"}> ({
  ^bb0(%arg1: tensor<2x3x1x5xf32>, %arg2: tensor<6x1x5x2xf32>):
    %2 = "linalg.winograd_filter_transform"(%arg1, %arg2) <{fmr = 1 : i32}> : (tensor<2x3x1x5xf32>, tensor<6x1x5x2xf32>) -> tensor<6x1x5x2xf32>
    "func.return"(%2) : (tensor<6x1x5x2xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.winograd_filter_transform"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false, false, false>, static_sizes = array<i64: 1, 0, 0, 1>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x10x10x5xf32>, tensor<6x6x2x2x2x5xf32>) -> tensor<6x6x2x2x2x5xf32>, sym_name = "tile_winograd_input"}> ({
  ^bb0(%arg1: tensor<2x10x10x5xf32>, %arg2: tensor<6x6x2x2x2x5xf32>):
    %2 = "linalg.winograd_input_transform"(%arg1, %arg2) <{fmr = 1 : i32}> : (tensor<2x10x10x5xf32>, tensor<6x6x2x2x2x5xf32>) -> tensor<6x6x2x2x2x5xf32>
    "func.return"(%2) : (tensor<6x6x2x2x2x5xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.winograd_input_transform"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false, false, false, false, false>, static_sizes = array<i64: 0, 0, 1, 1, 0, 0>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x10x10x5xf32>, tensor<6x6x2x2x2x5xf32>) -> tensor<6x6x2x2x2x5xf32>, sym_name = "tile_winograd_input"}> ({
  ^bb0(%arg1: tensor<2x10x10x5xf32>, %arg2: tensor<6x6x2x2x2x5xf32>):
    %2 = "linalg.winograd_input_transform"(%arg1, %arg2) <{fmr = 1 : i32}> : (tensor<2x10x10x5xf32>, tensor<6x6x2x2x2x5xf32>) -> tensor<6x6x2x2x2x5xf32>
    "func.return"(%2) : (tensor<6x6x2x2x2x5xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.winograd_input_transform"]}> : (!transform.any_op) -> !transform.any_op
      %1:5 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false, false, false, false, false>, static_sizes = array<i64: 0, 0, 1, 1, 1, 1>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x10x10x5xf32>, tensor<6x6x2x2x2x5xf32>) -> tensor<6x6x2x2x2x5xf32>, sym_name = "tile_winograd_input"}> ({
  ^bb0(%arg1: tensor<2x10x10x5xf32>, %arg2: tensor<6x6x2x2x2x5xf32>):
    %2 = "linalg.winograd_input_transform"(%arg1, %arg2) <{fmr = 1 : i32}> : (tensor<2x10x10x5xf32>, tensor<6x6x2x2x2x5xf32>) -> tensor<6x6x2x2x2x5xf32>
    "func.return"(%2) : (tensor<6x6x2x2x2x5xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.winograd_input_transform"]}> : (!transform.any_op) -> !transform.any_op
      %1:5 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false, false, false, false, false>, static_sizes = array<i64: 0, 0, 2, 2, 2, 2>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x1x10x5xf32>, tensor<1x6x1x2x2x5xf32>) -> tensor<1x6x1x2x2x5xf32>, sym_name = "tile_winograd_input"}> ({
  ^bb0(%arg1: tensor<2x1x10x5xf32>, %arg2: tensor<1x6x1x2x2x5xf32>):
    %2 = "linalg.winograd_input_transform"(%arg1, %arg2) <{fmr = 1 : i32}> : (tensor<2x1x10x5xf32>, tensor<1x6x1x2x2x5xf32>) -> tensor<1x6x1x2x2x5xf32>
    "func.return"(%2) : (tensor<1x6x1x2x2x5xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.winograd_input_transform"]}> : (!transform.any_op) -> !transform.any_op
      %1:5 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false, false, false, false, false>, static_sizes = array<i64: 0, 0, 1, 1, 1, 1>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<6x6x2x2x2x2xf32>, tensor<2x8x8x2xf32>) -> tensor<2x8x8x2xf32>, sym_name = "tile_winograd_output"}> ({
  ^bb0(%arg1: tensor<6x6x2x2x2x2xf32>, %arg2: tensor<2x8x8x2xf32>):
    %2 = "linalg.winograd_output_transform"(%arg1, %arg2) <{fmr = 1 : i32}> : (tensor<6x6x2x2x2x2xf32>, tensor<2x8x8x2xf32>) -> tensor<2x8x8x2xf32>
    "func.return"(%2) : (tensor<2x8x8x2xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.winograd_output_transform"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false, false, false, false, false>, static_sizes = array<i64: 0, 0, 1, 1, 0, 0>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<6x6x2x2x3x5xf32>, tensor<3x8x8x5xf32>) -> tensor<3x8x8x5xf32>, sym_name = "tile_winograd_output"}> ({
  ^bb0(%arg1: tensor<6x6x2x2x3x5xf32>, %arg2: tensor<3x8x8x5xf32>):
    %2 = "linalg.winograd_output_transform"(%arg1, %arg2) <{fmr = 1 : i32}> : (tensor<6x6x2x2x3x5xf32>, tensor<3x8x8x5xf32>) -> tensor<3x8x8x5xf32>
    "func.return"(%2) : (tensor<3x8x8x5xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.winograd_output_transform"]}> : (!transform.any_op) -> !transform.any_op
      %1:5 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false, false, false, false, false>, static_sizes = array<i64: 0, 0, 2, 2, 2, 2>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<6x1x2x1x3x5xf32>, tensor<3x8x1x5xf32>) -> tensor<3x8x1x5xf32>, sym_name = "tile_winograd_output"}> ({
  ^bb0(%arg1: tensor<6x1x2x1x3x5xf32>, %arg2: tensor<3x8x1x5xf32>):
    %2 = "linalg.winograd_output_transform"(%arg1, %arg2) <{fmr = 1 : i32}> : (tensor<6x1x2x1x3x5xf32>, tensor<3x8x1x5xf32>) -> tensor<3x8x1x5xf32>
    "func.return"(%2) : (tensor<3x8x1x5xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.winograd_output_transform"]}> : (!transform.any_op) -> !transform.any_op
      %1:5 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false, false, false, false, false>, static_sizes = array<i64: 0, 0, 1, 1, 1, 1>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

