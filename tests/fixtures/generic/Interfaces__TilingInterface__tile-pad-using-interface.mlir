"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, f32) -> tensor<?x?xf32>, sym_name = "dynamic_2d_pad_tensor"}> ({
  ^bb0(%arg1: tensor<?x?xf32>, %arg2: f32):
    %2 = "tensor.pad"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 5, 3>, static_low = array<i64: 3, 4>}> ({
    ^bb0(%arg3: index, %arg4: index):
      "tensor.yield"(%arg2) : (f32) -> ()
    }) : (tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%2) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.pad"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 2, 3>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, f32) -> tensor<?x?xf32>, sym_name = "dynamic_2d_pad_tensor_inner_tiling"}> ({
  ^bb0(%arg1: tensor<?x?xf32>, %arg2: f32):
    %2 = "tensor.pad"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 5, 3>, static_low = array<i64: 3, 4>}> ({
    ^bb0(%arg3: index, %arg4: index):
      "tensor.yield"(%arg2) : (f32) -> ()
    }) : (tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%2) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.pad"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 0, 3>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<7x9xf32>, f32) -> tensor<15x16xf32>, sym_name = "static_pad_tensor"}> ({
  ^bb0(%arg1: tensor<7x9xf32>, %arg2: f32):
    %2 = "tensor.pad"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 5, 3>, static_low = array<i64: 3, 4>}> ({
    ^bb0(%arg3: index, %arg4: index):
      "tensor.yield"(%arg2) : (f32) -> ()
    }) : (tensor<7x9xf32>) -> tensor<15x16xf32>
    "func.return"(%2) : (tensor<15x16xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.pad"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 2, 3>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<7x9xf32>, f32) -> tensor<15x16xf32>, sym_name = "static_pad_tensor_inner_tiling"}> ({
  ^bb0(%arg1: tensor<7x9xf32>, %arg2: f32):
    %2 = "tensor.pad"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 5, 3>, static_low = array<i64: 3, 4>}> ({
    ^bb0(%arg3: index, %arg4: index):
      "tensor.yield"(%arg2) : (f32) -> ()
    }) : (tensor<7x9xf32>) -> tensor<15x16xf32>
    "func.return"(%2) : (tensor<15x16xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.pad"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 0, 3>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, f32) -> tensor<?x?xf32>, sym_name = "dynamic_2d_pad_tensor_outer_tiling"}> ({
  ^bb0(%arg1: tensor<?x?xf32>, %arg2: f32):
    %2 = "tensor.pad"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 5, 3>, static_low = array<i64: 3, 4>}> ({
    ^bb0(%arg3: index, %arg4: index):
      "tensor.yield"(%arg2) : (f32) -> ()
    }) : (tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%2) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.pad"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 2, 3>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<7x9xf32>, f32) -> tensor<15x16xf32>, sym_name = "static_pad_tensor_outer_tiling"}> ({
  ^bb0(%arg1: tensor<7x9xf32>, %arg2: f32):
    %2 = "tensor.pad"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 5, 3>, static_low = array<i64: 3, 4>}> ({
    ^bb0(%arg3: index, %arg4: index):
      "tensor.yield"(%arg2) : (f32) -> ()
    }) : (tensor<7x9xf32>) -> tensor<15x16xf32>
    "func.return"(%2) : (tensor<15x16xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.pad"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 0, 3>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, f32) -> tensor<?x?xf32, #test.tensor_encoding<"encoding">>, sym_name = "dynamic_2d_pad_tensor_with_encoding"}> ({
  ^bb0(%arg1: tensor<?x?xf32>, %arg2: f32):
    %2 = "tensor.pad"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 5, 3>, static_low = array<i64: 3, 4>}> ({
    ^bb0(%arg3: index, %arg4: index):
      "tensor.yield"(%arg2) : (f32) -> ()
    }) : (tensor<?x?xf32>) -> tensor<?x?xf32, #test.tensor_encoding<"encoding">>
    "func.return"(%2) : (tensor<?x?xf32, #test.tensor_encoding<"encoding">>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.pad"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 2, 3>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

