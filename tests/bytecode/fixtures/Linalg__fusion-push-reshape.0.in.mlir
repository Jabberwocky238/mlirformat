"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x16xf32>, tensor<16xf32>, tensor<?x112x16xf32>, index) -> tensor<?x112x16xf32>, sym_name = "reshape"}> ({
  ^bb0(%arg0: tensor<?x16xf32> loc("<stdin>":5:8), %arg1: tensor<16xf32> loc("<stdin>":5:33), %arg2: tensor<?x112x16xf32> loc("<stdin>":5:56), %arg3: index loc("<stdin>":5:85)):
    %0 = "tensor.expand_shape"(%arg0, %arg3) <{reassociation = [[0, 1], [2]], static_output_shape = array<i64: -9223372036854775808, 112, 16>}> : (tensor<?x16xf32>, index) -> tensor<?x112x16xf32> loc("<stdin>":6:10)
    %1 = "linalg.generic"(%0, %arg1, %arg2) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32 loc("<stdin>":8:10), %arg5: f32 loc("<stdin>":8:22), %arg6: f32 loc("<stdin>":8:34)):
      %2 = "arith.subf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":9:12)
      "linalg.yield"(%2) : (f32) -> () loc("<stdin>":10:7)
    }) : (tensor<?x112x16xf32>, tensor<16xf32>, tensor<?x112x16xf32>) -> tensor<?x112x16xf32> loc("<stdin>":7:10)
    "func.return"(%1) : (tensor<?x112x16xf32>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":4:3)
}) : () -> () loc("<stdin>":3:1)
