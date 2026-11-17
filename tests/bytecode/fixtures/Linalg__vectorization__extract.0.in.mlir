"builtin.module"() ({
  "func.func"() <{function_type = (tensor<80x16xf32>, tensor<1x3xf32>, index) -> tensor<1x3xf32>, sym_name = "masked_static_vectorize_nd_tensor_extract_with_affine_apply_contiguous"}> ({
  ^bb0(%arg1: tensor<80x16xf32> loc("<stdin>":5:8), %arg2: tensor<1x3xf32> loc("<stdin>":5:34), %arg3: index loc("<stdin>":5:58)):
    %1 = "arith.constant"() <{value = 79 : index}> : () -> index loc("<stdin>":6:10)
    %2 = "linalg.generic"(%arg2) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg4: f32 loc("<stdin>":8:10)):
      %3 = "linalg.index"() <{dim = 1 : i64}> : () -> index loc("<stdin>":9:12)
      %4 = "affine.apply"(%3, %arg3) <{map = affine_map<(d0, d1) -> (d0 + d1)>}> : (index, index) -> index loc("<stdin>":10:12)
      %5 = "tensor.extract"(%arg1, %1, %4) : (tensor<80x16xf32>, index, index) -> f32 loc("<stdin>":11:12)
      "linalg.yield"(%5) : (f32) -> () loc("<stdin>":12:7)
    }) : (tensor<1x3xf32>) -> tensor<1x3xf32> loc("<stdin>":7:10)
    "func.return"(%2) : (tensor<1x3xf32>) -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":4:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":18:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":19:12)
      "transform.structured.vectorize"(%0) <{scalable_sizes = array<i1: false, false>, static_vector_sizes = array<i64: 1, 4>, vectorize_nd_extract}> : (!transform.any_op) -> () loc("<stdin>":20:7)
      "transform.yield"() : () -> () loc("<stdin>":21:7)
    }) : () -> () loc("<stdin>":17:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":16:3)
}) : () -> () loc("<stdin>":3:1)
