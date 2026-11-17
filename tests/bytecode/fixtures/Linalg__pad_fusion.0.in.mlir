"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, index, index, index, index, f32) -> tensor<?x?xf32>, sym_name = "dynamic_pad_fusion"}> ({
  ^bb0(%arg0: tensor<?x?xf32> loc("<stdin>":4:8), %arg1: index loc("<stdin>":4:32), %arg2: index loc("<stdin>":4:46), %arg3: index loc("<stdin>":4:60), %arg4: index loc("<stdin>":4:74), %arg5: f32 loc("<stdin>":4:88)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":6:10)
    %2 = "tensor.dim"(%arg0, %0) : (tensor<?x?xf32>, index) -> index loc("<stdin>":7:10)
    %3 = "tensor.dim"(%arg0, %1) : (tensor<?x?xf32>, index) -> index loc("<stdin>":8:10)
    %4 = "tensor.empty"(%2, %3) : (index, index) -> tensor<?x?xf32> loc("<stdin>":9:10)
    %5 = "linalg.generic"(%arg0, %4) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg8: f32 loc("<stdin>":11:10), %arg9: f32 loc("<stdin>":11:22)):
      %7 = "arith.mulf"(%arg8, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":12:12)
      "linalg.yield"(%7) : (f32) -> () loc("<stdin>":13:7)
    }) : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":10:10)
    %6 = "tensor.pad"(%5, %arg1, %arg2, %arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 2, 2>, static_high = array<i64: -9223372036854775808, -9223372036854775808>, static_low = array<i64: -9223372036854775808, -9223372036854775808>}> ({
    ^bb0(%arg6: index loc("<stdin>":16:10), %arg7: index loc("<stdin>":16:24)):
      "tensor.yield"(%arg5) : (f32) -> () loc("<stdin>":17:7)
    }) : (tensor<?x?xf32>, index, index, index, index) -> tensor<?x?xf32> loc("<stdin>":15:10)
    "func.return"(%6) : (tensor<?x?xf32>) -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
