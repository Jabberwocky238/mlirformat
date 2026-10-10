#map = affine_map<() -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "tensor.from_elements"(%0) : (i32) -> tensor<1xi32>
    %2 = "tensor.collapse_shape"(%1) <{reassociation = []}> : (tensor<1xi32>) -> tensor<i32>
    %3 = "arith.constant"() <{value = 10 : i32}> : () -> i32
    %4 = "tensor.from_elements"(%3) : (i32) -> tensor<1xi32>
    %5 = "tensor.collapse_shape"(%4) <{reassociation = []}> : (tensor<1xi32>) -> tensor<i32>
    "cf.br"(%2)[^bb1] : (tensor<i32>) -> ()
  ^bb1(%6: tensor<i32>):  // 2 preds: ^bb0, ^bb2
    %7 = "tensor.empty"() : () -> tensor<i1>
    %8 = "linalg.generic"(%6, %5, %7) <{indexing_maps = [#map, #map, #map], iterator_types = [], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: i32, %arg4: i32, %arg5: i1):
      %14 = "arith.cmpi"(%arg3, %arg4) <{predicate = 2 : i64}> : (i32, i32) -> i1
      "linalg.yield"(%14) : (i1) -> ()
    }) : (tensor<i32>, tensor<i32>, tensor<i1>) -> tensor<i1>
    %9 = "tensor.extract"(%8) : (tensor<i1>) -> i1
    "cf.cond_br"(%9, %6)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 1, 0>}> : (i1, tensor<i32>) -> ()
  ^bb2(%10: tensor<i32>):  // pred: ^bb1
    %11 = "tensor.empty"() : () -> tensor<i32>
    %12 = "linalg.generic"(%10, %10, %11) <{indexing_maps = [#map, #map, #map], iterator_types = [], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg0: i32, %arg1: i32, %arg2: i32):
      %13 = "arith.addi"(%arg0, %arg1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%13) : (i32) -> ()
    }) : (tensor<i32>, tensor<i32>, tensor<i32>) -> tensor<i32>
    "cf.br"(%12)[^bb1] : (tensor<i32>) -> ()
  ^bb3:  // pred: ^bb1
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

