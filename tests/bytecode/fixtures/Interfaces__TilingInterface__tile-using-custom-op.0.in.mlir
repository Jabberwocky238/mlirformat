"builtin.module"() ({
  "builtin.module"() ({
    "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?xf32>) -> tensor<?x?xf32>, sym_name = "generic_parallel"}> ({
    ^bb0(%arg1: tensor<?x?xf32> loc("<stdin>":6:10), %arg2: tensor<?xf32> loc("<stdin>":6:34)):
      %2 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":7:12)
      %3 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":8:12)
      %4 = "tensor.dim"(%arg1, %2) : (tensor<?x?xf32>, index) -> index loc("<stdin>":9:12)
      %5 = "tensor.dim"(%arg1, %3) : (tensor<?x?xf32>, index) -> index loc("<stdin>":10:12)
      %6 = "tensor.empty"(%4, %5) : (index, index) -> tensor<?x?xf32> loc("<stdin>":11:12)
      %7 = "linalg.generic"(%arg1, %arg2, %6) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
      ^bb0(%arg3: f32 loc("<stdin>":13:12), %arg4: f32 loc("<stdin>":13:24), %arg5: f32 loc("<stdin>":13:36)):
        %8 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":14:14)
        "linalg.yield"(%8) : (f32) -> () loc("<stdin>":15:9)
      }) : (tensor<?x?xf32>, tensor<?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":12:12)
      "func.return"(%7) : (tensor<?x?xf32>) -> () loc("<stdin>":17:7)
    }) : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":4:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":22:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":23:12)
      %1:2 = "transform.test.tile_using_custom_loop"(%0) <{tile_sizes = [10, 20]}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":24:14)
      "transform.yield"() : () -> () loc("<stdin>":25:7)
    }) : () -> () loc("<stdin>":21:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":20:3)
}) : () -> () loc("<stdin>":3:1)
