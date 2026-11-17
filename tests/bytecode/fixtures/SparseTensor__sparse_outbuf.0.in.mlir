"builtin.module"() ({
  "func.func"() <{function_type = (tensor<10xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<10xf32>) -> tensor<10xf32>, sym_name = "allout_inplace"}> ({
  ^bb0(%arg7: tensor<10xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":5:8), %arg8: tensor<10xf32> loc("<stdin>":5:40)):
    %5 = "linalg.generic"(%arg7, %arg8) <{indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg9: i32 loc("<stdin>":7:10), %arg10: f32 loc("<stdin>":7:22)):
      %6 = "arith.sitofp"(%arg9) : (i32) -> f32 loc("<stdin>":8:12)
      "linalg.yield"(%6) : (f32) -> () loc("<stdin>":9:7)
    }) : (tensor<10xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<10xf32>) -> tensor<10xf32> loc("<stdin>":6:10)
    "func.return"(%5) : (tensor<10xf32>) -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":4:3)
  "func.func"() <{function_type = (tensor<10xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<10xf32>, sym_name = "allout_materialize"}> ({
  ^bb0(%arg4: tensor<10xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":14:8)):
    %2 = "tensor.empty"() : () -> tensor<10xf32> loc("<stdin>":15:10)
    %3 = "linalg.generic"(%arg4, %2) <{indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg5: i32 loc("<stdin>":17:10), %arg6: f32 loc("<stdin>":17:22)):
      %4 = "arith.sitofp"(%arg5) : (i32) -> f32 loc("<stdin>":18:12)
      "linalg.yield"(%4) : (f32) -> () loc("<stdin>":19:7)
    }) : (tensor<10xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<10xf32>) -> tensor<10xf32> loc("<stdin>":16:10)
    "func.return"(%3) : (tensor<10xf32>) -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":13:3)
  "func.func"() <{function_type = (tensor<10xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<10xf32>) -> tensor<10xf32>, sym_name = "update_inplace"}> ({
  ^bb0(%arg0: tensor<10xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":24:8), %arg1: tensor<10xf32> loc("<stdin>":24:40)):
    %0 = "linalg.generic"(%arg0, %arg1) <{indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":26:10), %arg3: f32 loc("<stdin>":26:22)):
      %1 = "arith.addf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":27:12)
      "linalg.yield"(%1) : (f32) -> () loc("<stdin>":28:7)
    }) : (tensor<10xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<10xf32>) -> tensor<10xf32> loc("<stdin>":25:10)
    "func.return"(%0) : (tensor<10xf32>) -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":23:3)
}) : () -> () loc("<stdin>":3:1)
