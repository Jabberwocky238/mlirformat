#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>, sym_name = "pack_elemwise"}> ({
  ^bb0(%arg6: tensor<?x?xf32>, %arg7: tensor<?x?x?x?xf32>, %arg8: tensor<?x?x?x?xf32>):
    %12 = "arith.constant"() <{value = 8 : index}> : () -> index
    %13 = "arith.constant"() <{value = 4 : index}> : () -> index
    %14 = "vector.vscale"() : () -> index
    %15 = "arith.muli"(%12, %14) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %16 = "arith.muli"(%13, %14) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %17 = "linalg.pack"(%arg6, %arg7, %15, %16) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 2>, static_inner_tiles = array<i64: -9223372036854775808, -9223372036854775808>}> : (tensor<?x?xf32>, tensor<?x?x?x?xf32>, index, index) -> tensor<?x?x?x?xf32>
    %18 = "linalg.generic"(%17, %arg8) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg9: f32, %arg10: f32):
      %19 = "math.exp"(%arg9) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%19) : (f32) -> ()
    }) : (tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    "func.return"(%18) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "ones_equal"}> ({
    ^bb0(%arg5: !transform.any_op):
      %10 = "transform.structured.match"(%arg5) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %11:3 = "transform.structured.fuse"(%10) <{inner_tile_alignments = array<i64: 2, 2>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_tile_sizes = array<i64: 1, 1, 0, 0>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "ones_multiple"}> ({
    ^bb0(%arg4: !transform.any_op):
      %8 = "transform.structured.match"(%arg4) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %9:3 = "transform.structured.fuse"(%8) <{inner_tile_alignments = array<i64: 1, 1>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_tile_sizes = array<i64: 1, 1, 0, 0>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "ones_nohint"}> ({
    ^bb0(%arg3: !transform.any_op):
      %6 = "transform.structured.match"(%arg3) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %7:3 = "transform.structured.fuse"(%6) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_tile_sizes = array<i64: 1, 1, 0, 0>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "inner_equal"}> ({
    ^bb0(%arg2: !transform.any_op):
      %4 = "transform.structured.match"(%arg2) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %5:3 = "transform.structured.fuse"(%4) <{inner_tile_alignments = array<i64: 2, 2>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_tile_sizes = array<i64: 0, 0, 8, 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "inner_multiple"}> ({
    ^bb0(%arg1: !transform.any_op):
      %2 = "transform.structured.match"(%arg1) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %3:3 = "transform.structured.fuse"(%2) <{inner_tile_alignments = array<i64: 1, 1>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_tile_sizes = array<i64: 0, 0, 8, 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "inner_nohint"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.fuse"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_tile_sizes = array<i64: 0, 0, 8, 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

