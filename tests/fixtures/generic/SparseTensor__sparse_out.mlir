#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map4 = affine_map<(d0, d1, d2) -> (d2, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x16xf32, #sparse>) -> tensor<32x16xf32, #sparse>, sym_name = "sparse_simply_dynamic1"}> ({
  ^bb0(%arg15: tensor<32x16xf32, #sparse>):
    %22 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %23 = "linalg.generic"(%arg15) <{doc = "X(i,j) *= 2 or X(i,j) += X(i,j)", indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg16: f32):
      %24 = "arith.mulf"(%arg16, %22) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%24) : (f32) -> ()
    }) : (tensor<32x16xf32, #sparse>) -> tensor<32x16xf32, #sparse>
    "func.return"(%23) : (tensor<32x16xf32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32x16xf32, #sparse>) -> tensor<32x16xf32, #sparse>, sym_name = "sparse_simply_dynamic2"}> ({
  ^bb0(%arg13: tensor<32x16xf32, #sparse>):
    %20 = "linalg.generic"(%arg13) <{doc = "X(i,j) *= 2 or X(i,j) += X(i,j)", indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg14: f32):
      %21 = "arith.addf"(%arg14, %arg14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%21) : (f32) -> ()
    }) : (tensor<32x16xf32, #sparse>) -> tensor<32x16xf32, #sparse>
    "func.return"(%20) : (tensor<32x16xf32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<10x20xf32, #sparse1>) -> tensor<10x20xf32, #sparse>, sym_name = "sparse_truly_dynamic"}> ({
  ^bb0(%arg10: tensor<10x20xf32, #sparse1>):
    %16 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %17 = "tensor.empty"() : () -> tensor<10x20xf32, #sparse>
    %18 = "linalg.generic"(%arg10, %17) <{doc = "X(i,j) = A(i,j) * 2.0", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg11: f32, %arg12: f32):
      %19 = "arith.mulf"(%arg11, %16) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%19) : (f32) -> ()
    }) : (tensor<10x20xf32, #sparse1>, tensor<10x20xf32, #sparse>) -> tensor<10x20xf32, #sparse>
    "func.return"(%18) : (tensor<10x20xf32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?xi32, #sparse2>, tensor<?x?x?xi32, #sparse2>) -> tensor<?x?xi32, #sparse>, sym_name = "sumred"}> ({
  ^bb0(%arg5: tensor<?x?x?xi32, #sparse2>, %arg6: tensor<?x?x?xi32, #sparse2>):
    %8 = "arith.constant"() <{value = 0 : index}> : () -> index
    %9 = "arith.constant"() <{value = 1 : index}> : () -> index
    %10 = "tensor.dim"(%arg5, %8) : (tensor<?x?x?xi32, #sparse2>, index) -> index
    %11 = "tensor.dim"(%arg5, %9) : (tensor<?x?x?xi32, #sparse2>, index) -> index
    %12 = "tensor.empty"(%10, %11) : (index, index) -> tensor<?x?xi32, #sparse>
    %13 = "linalg.generic"(%arg5, %arg6, %12) <{doc = "X(i,j) = SUM_k A(i,j,k) * B(i,j,k)", indexing_maps = [#map1, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: i32, %arg8: i32, %arg9: i32):
      %14 = "arith.muli"(%arg7, %arg8) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %15 = "arith.addi"(%arg9, %14) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%15) : (i32) -> ()
    }) : (tensor<?x?x?xi32, #sparse2>, tensor<?x?x?xi32, #sparse2>, tensor<?x?xi32, #sparse>) -> tensor<?x?xi32, #sparse>
    "func.return"(%13) : (tensor<?x?xi32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf32, #sparse>, tensor<?x?xf32, #sparse>) -> tensor<?x?xf32, #sparse>, sym_name = "matmat"}> ({
  ^bb0(%arg0: tensor<?x?xf32, #sparse>, %arg1: tensor<?x?xf32, #sparse>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "tensor.dim"(%arg0, %0) : (tensor<?x?xf32, #sparse>, index) -> index
    %3 = "tensor.dim"(%arg1, %1) : (tensor<?x?xf32, #sparse>, index) -> index
    %4 = "tensor.empty"(%2, %3) : (index, index) -> tensor<?x?xf32, #sparse>
    %5 = "linalg.generic"(%arg0, %arg1, %4) <{doc = "C(i,j) = SUM_k A(i,k) * B(k,j)", indexing_maps = [#map3, #map4, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %6 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %7 = "arith.addf"(%arg4, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (tensor<?x?xf32, #sparse>, tensor<?x?xf32, #sparse>, tensor<?x?xf32, #sparse>) -> tensor<?x?xf32, #sparse>
    "func.return"(%5) : (tensor<?x?xf32, #sparse>) -> ()
  }) : () -> ()
}) : () -> ()

