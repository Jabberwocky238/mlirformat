"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?xf32>, tensor<?x?xf32>, index, index) -> tensor<?x?xf32>, sym_name = "foo"}> ({
  ^bb0(%arg1: tensor<?x?xf32> loc("<stdin>":8:8), %arg2: tensor<?x?xf32> loc("<stdin>":8:32), %arg3: tensor<?xf32> loc("<stdin>":8:56), %arg4: tensor<?x?xf32> loc("<stdin>":8:78), %arg5: index loc("<stdin>":8:102), %arg6: index loc("<stdin>":8:116)):
    %4 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":9:10)
    %5 = "linalg.fill"(%4, %arg4) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg13: f32 loc("<stdin>":11:10), %arg14: f32 loc("<stdin>":11:23)):
      "linalg.yield"(%arg13) : (f32) -> () loc("<stdin>":12:7)
    }) {__producer__} : (f32, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":10:10)
    %6 = "linalg.matmul"(%arg1, %arg2, %5) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg10: f32 loc("<stdin>":15:10), %arg11: f32 loc("<stdin>":15:23), %arg12: f32 loc("<stdin>":15:36)):
      %11 = "arith.mulf"(%arg10, %arg11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":16:13)
      %12 = "arith.addf"(%arg12, %11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":17:13)
      "linalg.yield"(%12) : (f32) -> () loc("<stdin>":18:7)
    }) {__producer__} : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":14:10)
    %7 = "linalg.generic"(%arg3, %6, %arg4) <{indexing_maps = [affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: f32 loc("<stdin>":21:10), %arg8: f32 loc("<stdin>":21:22), %arg9: f32 loc("<stdin>":21:34)):
      %8 = "arith.maximumf"(%arg8, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":22:12)
      %9 = "arith.cmpf"(%arg7, %4) <{fastmath = #arith.fastmath<none>, predicate = 2 : i64}> : (f32, f32) -> i1 loc("<stdin>":23:12)
      %10 = "arith.select"(%9, %4, %8) : (i1, f32, f32) -> f32 loc("<stdin>":24:13)
      "linalg.yield"(%10) : (f32) -> () loc("<stdin>":25:7)
    }) {__root__} : (tensor<?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":20:10)
    "func.return"(%7) : (tensor<?x?xf32>) -> () loc("<stdin>":27:5)
  }) : () -> () loc("<stdin>":7:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":31:10)):
      %0 = "transform.structured.match"(%arg0) <{op_attrs = {__root__}}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":32:12)
      %1 = "transform.structured.match"(%arg0) <{op_attrs = {__producer__}}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":33:12)
      %2:2 = "transform.structured.tile_using_forall"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 0>, static_num_threads = array<i64: 10, 20>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":34:14)
      %3:2 = "transform.structured.fuse_into_containing_op"(%1, %2#1) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":35:14)
      "transform.yield"() : () -> () loc("<stdin>":36:7)
    }) : () -> () loc("<stdin>":30:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":29:3)
}) : () -> () loc("<stdin>":6:1)
