#map = affine_map<() -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<i32>, tensor<i32>) -> tensor<i32>, sym_name = "main"}> ({
  ^bb0(%arg0: tensor<i32>, %arg1: tensor<i32>):
    "cf.br"(%arg0)[^bb1] : (tensor<i32>) -> ()
  ^bb1(%0: tensor<i32>):  // 2 preds: ^bb0, ^bb2
    %1 = "tensor.empty"() : () -> tensor<i1>
    %2 = "linalg.generic"(%0, %arg1, %1) <{indexing_maps = [#map, #map, #map], iterator_types = [], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg5: i32, %arg6: i32, %arg7: i1):
      %9 = "arith.cmpi"(%arg5, %arg6) <{predicate = 2 : i64}> : (i32, i32) -> i1
      "linalg.yield"(%9) : (i1) -> ()
    }) : (tensor<i32>, tensor<i32>, tensor<i1>) -> tensor<i1>
    %3 = "tensor.extract"(%2) : (tensor<i1>) -> i1
    "cf.cond_br"(%3, %0, %0)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 1, 1>}> : (i1, tensor<i32>, tensor<i32>) -> ()
  ^bb2(%4: tensor<i32>):  // pred: ^bb1
    %5 = "tensor.empty"() : () -> tensor<i32>
    %6 = "linalg.generic"(%4, %4, %5) <{indexing_maps = [#map, #map, #map], iterator_types = [], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: i32, %arg3: i32, %arg4: i32):
      %8 = "arith.addi"(%arg2, %arg3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%8) : (i32) -> ()
    }) : (tensor<i32>, tensor<i32>, tensor<i32>) -> tensor<i32>
    "cf.br"(%6)[^bb1] : (tensor<i32>) -> ()
  ^bb3(%7: tensor<i32>):  // pred: ^bb1
    "func.return"(%7) : (tensor<i32>) -> ()
  }) : () -> ()
}) : () -> ()

