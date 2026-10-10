#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
#map2 = affine_map<() -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<10xi32>, tensor<i32>) -> tensor<i32>, sym_name = "main"}> ({
  ^bb0(%arg0: tensor<10xi32>, %arg1: tensor<i32>):
    "cf.br"(%arg0)[^bb1] : (tensor<10xi32>) -> ()
  ^bb1(%0: tensor<10xi32>):  // 2 preds: ^bb0, ^bb2
    %1 = "tensor.empty"() : () -> tensor<i32>
    %2 = "linalg.generic"(%0, %1) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg7: i32, %arg8: i32):
      %11 = "arith.addi"(%arg8, %arg7) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%11) : (i32) -> ()
    }) : (tensor<10xi32>, tensor<i32>) -> tensor<i32>
    %3 = "tensor.empty"() : () -> tensor<i1>
    %4 = "linalg.generic"(%2, %arg1, %3) <{indexing_maps = [#map2, #map2, #map2], iterator_types = [], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: i32, %arg5: i32, %arg6: i1):
      %10 = "arith.cmpi"(%arg4, %arg5) <{predicate = 2 : i64}> : (i32, i32) -> i1
      "linalg.yield"(%10) : (i1) -> ()
    }) : (tensor<i32>, tensor<i32>, tensor<i1>) -> tensor<i1>
    %5 = "tensor.extract"(%4) : (tensor<i1>) -> i1
    "cf.cond_br"(%5, %2, %2)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 1, 1>}> : (i1, tensor<i32>, tensor<i32>) -> ()
  ^bb2(%6: tensor<i32>):  // pred: ^bb1
    %7 = "tensor.empty"() : () -> tensor<10xi32>
    %8 = "linalg.generic"(%6, %7) <{indexing_maps = [#map1, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: i32, %arg3: i32):
      "linalg.yield"(%arg2) : (i32) -> ()
    }) : (tensor<i32>, tensor<10xi32>) -> tensor<10xi32>
    "cf.br"(%8)[^bb1] : (tensor<10xi32>) -> ()
  ^bb3(%9: tensor<i32>):  // pred: ^bb1
    "func.return"(%9) : (tensor<i32>) -> ()
  }) : () -> ()
}) : () -> ()

