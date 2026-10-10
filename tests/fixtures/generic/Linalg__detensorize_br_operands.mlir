#map = affine_map<() -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (i1, i32) -> tensor<i32>, sym_name = "if_true_test"}> ({
  ^bb0(%arg0: i1, %arg1: i32):
    %0 = "tensor.from_elements"(%arg0) : (i1) -> tensor<i1>
    %1 = "tensor.from_elements"(%arg1) : (i32) -> tensor<i32>
    %2 = "arith.constant"() <{value = dense<10> : tensor<i32>}> : () -> tensor<i32>
    %3 = "tensor.empty"() : () -> tensor<i8>
    %4 = "linalg.generic"(%0, %3) <{indexing_maps = [#map, #map], iterator_types = [], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg5: i1, %arg6: i8):
      %11 = "arith.extui"(%arg5) : (i1) -> i8
      "linalg.yield"(%11) : (i8) -> ()
    }) : (tensor<i1>, tensor<i8>) -> tensor<i8>
    %5 = "tensor.extract"(%4) : (tensor<i8>) -> i8
    %6 = "arith.trunci"(%5) <{overflowFlags = #arith.overflow<none>}> : (i8) -> i1
    "cf.cond_br"(%6, %1)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 1>}> : (i1, tensor<i32>) -> ()
  ^bb1:  // pred: ^bb0
    %7 = "tensor.empty"() : () -> tensor<i32>
    %8 = "linalg.generic"(%1, %2, %7) <{indexing_maps = [#map, #map, #map], iterator_types = [], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: i32, %arg3: i32, %arg4: i32):
      %10 = "arith.addi"(%arg2, %arg3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%10) : (i32) -> ()
    }) : (tensor<i32>, tensor<i32>, tensor<i32>) -> tensor<i32>
    "cf.br"(%8)[^bb2] : (tensor<i32>) -> ()
  ^bb2(%9: tensor<i32>):  // 2 preds: ^bb0, ^bb1
    "func.return"(%9) : (tensor<i32>) -> ()
  }) : () -> ()
}) : () -> ()

