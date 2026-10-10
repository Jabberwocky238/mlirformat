"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, f32) -> tensor<?x?xf32>, sym_name = "dynamic_pad_tensor_3_4"}> ({
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
  "func.func"() <{function_type = (tensor<?x?xf32>, f32) -> tensor<?x?xf32>, sym_name = "dynamic_pad_tensor_0_3"}> ({
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
  "func.func"() <{function_type = (tensor<7x9xf32>, f32) -> tensor<15x16xf32>, sym_name = "static_pad_tensor_3_4"}> ({
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
  "func.func"() <{function_type = (tensor<7x9xf32>, f32) -> tensor<15x16xf32>, sym_name = "fuse_static_pad_tensor_3_4"}> ({
  ^bb0(%arg1: tensor<7x9xf32>, %arg2: f32):
    %2 = "tensor.pad"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 5, 3>, static_low = array<i64: 3, 4>}> ({
    ^bb0(%arg5: index, %arg6: index):
      "tensor.yield"(%arg2) : (f32) -> ()
    }) : (tensor<7x9xf32>) -> tensor<15x16xf32>
    %3 = "tensor.empty"() : () -> tensor<15x16xf32>
    %4 = "linalg.copy"(%2, %3) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      "linalg.yield"(%arg3) : (f32) -> ()
    }) : (tensor<15x16xf32>, tensor<15x16xf32>) -> tensor<15x16xf32>
    "func.return"(%4) : (tensor<15x16xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.copy"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.fuse"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_tile_sizes = array<i64: 2, 3>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<7x9xf32>, f32) -> tensor<15x16xf32>, sym_name = "static_pad_tensor_0_3"}> ({
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
  "func.func"() <{function_type = (tensor<7x9xf32>, tensor<14x15xf32>, f32) -> tensor<14x15xf32>, sym_name = "static_pad_tile_evenly_0_3"}> ({
  ^bb0(%arg1: tensor<7x9xf32>, %arg2: tensor<14x15xf32>, %arg3: f32):
    %2 = "tensor.pad"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 7, 6>, static_low = array<i64: 0, 0>}> ({
    ^bb0(%arg4: index, %arg5: index):
      "tensor.yield"(%arg3) : (f32) -> ()
    }) : (tensor<7x9xf32>) -> tensor<14x15xf32>
    "func.return"(%2) : (tensor<14x15xf32>) -> ()
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

