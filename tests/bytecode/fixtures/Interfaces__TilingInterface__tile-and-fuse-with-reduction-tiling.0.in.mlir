"builtin.module"() ({
  "builtin.module"() ({
    "func.func"() <{function_type = (tensor<?x?xf32>) -> tensor<?xf32>, sym_name = "tile_and_fuse_with_partial_reduction_outer_parallel"}> ({
    ^bb0(%arg1: tensor<?x?xf32> loc("<stdin>":6:10)):
      %2 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":7:12)
      %3 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":8:12)
      %4 = "tensor.dim"(%arg1, %2) : (tensor<?x?xf32>, index) -> index loc("<stdin>":9:12)
      %5 = "tensor.empty"(%4) : (index) -> tensor<?xf32> loc("<stdin>":10:12)
      %6 = "linalg.fill"(%3, %5) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg4: f32 loc("<stdin>":12:12), %arg5: f32 loc("<stdin>":12:24)):
        "linalg.yield"(%arg4) : (f32) -> () loc("<stdin>":13:9)
      }) : (f32, tensor<?xf32>) -> tensor<?xf32> loc("<stdin>":11:12)
      %7 = "linalg.generic"(%arg1, %6) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg2: f32 loc("<stdin>":16:12), %arg3: f32 loc("<stdin>":16:24)):
        %8 = "arith.addf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":17:14)
        "linalg.yield"(%8) : (f32) -> () loc("<stdin>":18:9)
      }) : (tensor<?x?xf32>, tensor<?xf32>) -> tensor<?xf32> loc("<stdin>":15:12)
      "func.return"(%7) : (tensor<?xf32>) -> () loc("<stdin>":20:7)
    }) : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":4:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":25:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":26:12)
      %1:2 = "transform.test.tile_and_fuse_outer_parallel_partial_reduction"(%0) <{reduction_dims = [], tile_sizes = [128]}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":27:14)
      "transform.yield"() : () -> () loc("<stdin>":28:7)
    }) : () -> () loc("<stdin>":24:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":23:3)
}) : () -> () loc("<stdin>":3:1)
