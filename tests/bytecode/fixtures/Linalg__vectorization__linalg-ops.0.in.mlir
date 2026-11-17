"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>, tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>, sym_name = "vectorize_dynamic_identity"}> ({
  ^bb0(%arg1: tensor<?xf32> loc("<stdin>":4:8), %arg2: tensor<?xf32> loc("<stdin>":4:30), %arg3: tensor<?xf32> loc("<stdin>":4:52)):
    %1 = "linalg.generic"(%arg1, %arg2, %arg3) <{indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32 loc("<stdin>":6:10), %arg5: f32 loc("<stdin>":6:22), %arg6: f32 loc("<stdin>":6:34)):
      %2 = "arith.addf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":7:12)
      "linalg.yield"(%2) : (f32) -> () loc("<stdin>":8:7)
    }) : (tensor<?xf32>, tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32> loc("<stdin>":5:10)
    "func.return"(%1) : (tensor<?xf32>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":3:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":14:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":15:12)
      "transform.structured.vectorize"(%0) <{scalable_sizes = array<i1: false>, static_vector_sizes = array<i64: 4>}> : (!transform.any_op) -> () loc("<stdin>":16:7)
      "transform.yield"() : () -> () loc("<stdin>":17:7)
    }) : () -> () loc("<stdin>":13:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":12:3)
}) : () -> () loc("<stdin>":2:1)
