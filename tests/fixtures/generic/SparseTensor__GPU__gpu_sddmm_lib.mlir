#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32, #sparse>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32, #sparse>, sym_name = "SDDMM_block"}> ({
  ^bb0(%arg0: tensor<?x?xf32, #sparse>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>):
    %0 = "linalg.generic"(%arg1, %arg2, %arg0) <{doc = "S(i,j) += spy[S(i,j)] x SUM_k A(i,k) B(k,j)", indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
      %2 = "sparse_tensor.unary"(%arg5) ({
      ^bb0(%arg8: f32):
        %5 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "sparse_tensor.yield"(%5) : (f32) -> ()
      }, {
      }) : (f32) -> f32
      %3 = "sparse_tensor.reduce"(%arg5, %2, %1) ({
      ^bb0(%arg6: f32, %arg7: f32):
        %4 = "arith.addf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "sparse_tensor.yield"(%4) : (f32) -> ()
      }) : (f32, f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32, #sparse>) -> tensor<?x?xf32, #sparse>
    "func.return"(%0) : (tensor<?x?xf32, #sparse>) -> ()
  }) : () -> ()
}) : () -> ()

