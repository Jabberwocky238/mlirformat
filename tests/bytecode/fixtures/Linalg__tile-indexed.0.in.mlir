"builtin.module"() ({
  "func.func"() <{function_type = (memref<50xindex>) -> (), sym_name = "indexed_vector"}> ({
  ^bb0(%arg1: memref<50xindex> loc("<stdin>":4:8)):
    "linalg.generic"(%arg1) <{indexing_maps = [affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg2: index loc("<stdin>":6:10)):
      %2 = "linalg.index"() <{dim = 0 : i64}> : () -> index loc("<stdin>":7:12)
      "linalg.yield"(%2) : (index) -> () loc("<stdin>":8:7)
    }) : (memref<50xindex>) -> () loc("<stdin>":5:5)
    "func.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":3:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":14:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":15:12)
      %1:2 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false>, static_sizes = array<i64: 10>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":16:14)
      "transform.yield"() : () -> () loc("<stdin>":17:7)
    }) : () -> () loc("<stdin>":13:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":12:3)
}) : () -> () loc("<stdin>":2:1)
