#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x256xf32>, tensor<128x256xf32>, tensor<128x256xf32>) -> tensor<128x256xf32>, sym_name = "tile_elementwise"}> ({
  ^bb0(%arg1: tensor<128x256xf32>, %arg2: tensor<128x256xf32>, %arg3: tensor<128x256xf32>):
    %2 = "linalg.elementwise"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<add>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.addf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) : (tensor<128x256xf32>, tensor<128x256xf32>, tensor<128x256xf32>) -> tensor<128x256xf32>
    "func.return"(%2) : (tensor<128x256xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.elementwise"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 32, 64>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "tile_elementwise_dynamic"}> ({
  ^bb0(%arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>, %arg3: tensor<?x?xf32>):
    %2 = "linalg.elementwise"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<add>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.addf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%2) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.elementwise"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 10, 20>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<128x256xf32>, memref<128x256xf32>) -> (), sym_name = "tile_elementwise_memref"}> ({
  ^bb0(%arg1: memref<128x256xf32>, %arg2: memref<128x256xf32>):
    "linalg.elementwise"(%arg1, %arg2) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<negf>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      %2 = "arith.negf"(%arg3) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (memref<128x256xf32>, memref<128x256xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.elementwise"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 32, 64>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x256xf32>, tensor<128x256xf32>, tensor<128x256xf32>) -> tensor<128x256xf32>, sym_name = "tile_elementwise_forall"}> ({
  ^bb0(%arg1: tensor<128x256xf32>, %arg2: tensor<128x256xf32>, %arg3: tensor<128x256xf32>):
    %2 = "linalg.elementwise"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<add>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.addf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) : (tensor<128x256xf32>, tensor<128x256xf32>, tensor<128x256xf32>) -> tensor<128x256xf32>
    "func.return"(%2) : (tensor<128x256xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.elementwise"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.tile_using_forall"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 0>, static_tile_sizes = array<i64: 32, 64>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<256xf32>, tensor<128x256xf32>) -> tensor<128x256xf32>, sym_name = "tile_elementwise_broadcast"}> ({
  ^bb0(%arg1: tensor<256xf32>, %arg2: tensor<128x256xf32>):
    %2 = "linalg.elementwise"(%arg1, %arg2) <{indexing_maps = [#map, #map1], kind = #linalg.elementwise_kind<exp>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      %3 = "math.exp"(%arg3) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) : (tensor<256xf32>, tensor<128x256xf32>) -> tensor<128x256xf32>
    "func.return"(%2) : (tensor<128x256xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.elementwise"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 32, 64>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x256xf32>, tensor<128x256xf32>) -> tensor<128x256xf32>, sym_name = "tile_and_fuse_elementwise"}> ({
  ^bb0(%arg1: tensor<128x256xf32>, %arg2: tensor<128x256xf32>):
    %2 = "tensor.empty"() : () -> tensor<128x256xf32>
    %3 = "linalg.elementwise"(%arg1, %2) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<exp>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32):
      %7 = "math.exp"(%arg6) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (tensor<128x256xf32>, tensor<128x256xf32>) -> tensor<128x256xf32>
    %4 = "tensor.empty"() : () -> tensor<128x256xf32>
    %5 = "linalg.elementwise"(%3, %arg2, %4) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<add>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %6 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%6) : (f32) -> ()
    }) : (tensor<128x256xf32>, tensor<128x256xf32>, tensor<128x256xf32>) -> tensor<128x256xf32>
    "func.return"(%5) : (tensor<128x256xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{op_attrs = {kind = #linalg.elementwise_kind<add>}, ops = ["linalg.elementwise"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.fuse"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_tile_sizes = array<i64: 32, 64>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

