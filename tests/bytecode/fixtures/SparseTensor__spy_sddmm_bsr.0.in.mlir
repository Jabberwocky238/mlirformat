"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>>, sym_name = "SDDMM_block"}> ({
  ^bb0(%arg0: tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>> loc("<stdin>":7:8), %arg1: tensor<?x?xf32> loc("<stdin>":7:41), %arg2: tensor<?x?xf32> loc("<stdin>":7:65)):
    %0 = "linalg.generic"(%arg1, %arg2, %arg0) <{doc = "S(i,j) += spy[S(i,j)] x SUM_k A(i,k) B(k,j)", indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":9:10), %arg4: f32 loc("<stdin>":9:22), %arg5: f32 loc("<stdin>":9:34)):
      %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":10:12)
      %2 = "sparse_tensor.unary"(%arg5) ({
      ^bb0(%arg8: f32 loc("<stdin>":12:12)):
        %5 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":13:14)
        "sparse_tensor.yield"(%5) : (f32) -> () loc("<stdin>":14:9)
      }, {
      }) : (f32) -> f32 loc("<stdin>":11:12)
      %3 = "sparse_tensor.reduce"(%arg5, %2, %1) ({
      ^bb0(%arg6: f32 loc("<stdin>":18:12), %arg7: f32 loc("<stdin>":18:24)):
        %4 = "arith.addf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":19:14)
        "sparse_tensor.yield"(%4) : (f32) -> () loc("<stdin>":20:9)
      }) : (f32, f32, f32) -> f32 loc("<stdin>":17:12)
      "linalg.yield"(%3) : (f32) -> () loc("<stdin>":22:7)
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>>) -> tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>> loc("<stdin>":8:10)
    "func.return"(%0) : (tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>>) -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":6:3)
}) : () -> () loc("<stdin>":5:1)
