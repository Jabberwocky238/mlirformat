"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x256xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>, sym_name = "pack"}> ({
  ^bb0(%arg6: tensor<128x256xf32>, %arg7: tensor<?x?x?x?xf32>):
    %12 = "arith.constant"() <{value = 8 : index}> : () -> index
    %13 = "arith.constant"() <{value = 4 : index}> : () -> index
    %14 = "vector.vscale"() : () -> index
    %15 = "arith.muli"(%12, %14) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %16 = "arith.muli"(%13, %14) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %17 = "linalg.pack"(%arg6, %arg7, %15, %16) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 2>, static_inner_tiles = array<i64: -9223372036854775808, -9223372036854775808>}> : (tensor<128x256xf32>, tensor<?x?x?x?xf32>, index, index) -> tensor<?x?x?x?xf32>
    "func.return"(%17) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "ones_equal"}> ({
    ^bb0(%arg5: !transform.any_op):
      %10 = "transform.structured.match"(%arg5) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.any_op
      %11:3 = "transform.structured.tile_using_for"(%10) <{inner_tile_alignments = array<i64: 2, 2>, scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 1, 1>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "ones_multiple"}> ({
    ^bb0(%arg4: !transform.any_op):
      %8 = "transform.structured.match"(%arg4) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.any_op
      %9:3 = "transform.structured.tile_using_for"(%8) <{inner_tile_alignments = array<i64: 1, 1>, scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 1, 1>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "ones_nohint"}> ({
    ^bb0(%arg3: !transform.any_op):
      %6 = "transform.structured.match"(%arg3) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.any_op
      %7:3 = "transform.structured.tile_using_for"(%6) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 1, 1>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "twofour_equal"}> ({
    ^bb0(%arg2: !transform.any_op):
      %4 = "transform.structured.match"(%arg2) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.any_op
      %5:3 = "transform.structured.tile_using_for"(%4) <{inner_tile_alignments = array<i64: 2, 2>, scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 2, 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "twofour_multiple"}> ({
    ^bb0(%arg1: !transform.any_op):
      %2 = "transform.structured.match"(%arg1) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.any_op
      %3:3 = "transform.structured.tile_using_for"(%2) <{inner_tile_alignments = array<i64: 1, 1>, scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 2, 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "twofour_nohint"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 2, 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

