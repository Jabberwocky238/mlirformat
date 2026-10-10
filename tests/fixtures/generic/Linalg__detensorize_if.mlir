#map = affine_map<() -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<i32>, sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "tensor.from_elements"(%0) : (i32) -> tensor<i32>
    %2 = "arith.constant"() <{value = 10 : i32}> : () -> i32
    %3 = "tensor.from_elements"(%2) : (i32) -> tensor<i32>
    "cf.br"(%1)[^bb1] : (tensor<i32>) -> ()
  ^bb1(%4: tensor<i32>):  // pred: ^bb0
    %5 = "tensor.empty"() : () -> tensor<i1>
    %6 = "linalg.generic"(%4, %3, %5) <{indexing_maps = [#map, #map, #map], iterator_types = [], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: i32, %arg4: i32, %arg5: i1):
      %13 = "arith.cmpi"(%arg3, %arg4) <{predicate = 2 : i64}> : (i32, i32) -> i1
      "linalg.yield"(%13) : (i1) -> ()
    }) : (tensor<i32>, tensor<i32>, tensor<i1>) -> tensor<i1>
    %7 = "tensor.extract"(%6) : (tensor<i1>) -> i1
    "cf.cond_br"(%7, %4, %4)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 1, 1>}> : (i1, tensor<i32>, tensor<i32>) -> ()
  ^bb2(%8: tensor<i32>):  // pred: ^bb1
    %9 = "tensor.empty"() : () -> tensor<i32>
    %10 = "linalg.generic"(%8, %8, %9) <{indexing_maps = [#map, #map, #map], iterator_types = [], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg0: i32, %arg1: i32, %arg2: i32):
      %12 = "arith.addi"(%arg0, %arg1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%12) : (i32) -> ()
    }) : (tensor<i32>, tensor<i32>, tensor<i32>) -> tensor<i32>
    "cf.br"(%10)[^bb3] : (tensor<i32>) -> ()
  ^bb3(%11: tensor<i32>):  // 2 preds: ^bb1, ^bb2
    "func.return"(%11) : (tensor<i32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<i32>, sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "tensor.from_elements"(%0) : (i32) -> tensor<i32>
    %2 = "arith.constant"() <{value = 10 : i32}> : () -> i32
    %3 = "tensor.from_elements"(%2) : (i32) -> tensor<i32>
    "cf.br"(%1)[^bb1] : (tensor<i32>) -> ()
  ^bb1(%4: tensor<i32>):  // pred: ^bb0
    %5 = "tensor.empty"() : () -> tensor<i1>
    %6 = "linalg.generic"(%4, %3, %5) <{indexing_maps = [#map, #map, #map], iterator_types = [], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: i32, %arg4: i32, %arg5: i1):
      %14 = "arith.cmpi"(%arg3, %arg4) <{predicate = 2 : i64}> : (i32, i32) -> i1
      "linalg.yield"(%14) : (i1) -> ()
    }) : (tensor<i32>, tensor<i32>, tensor<i1>) -> tensor<i1>
    %7 = "tensor.extract"(%6) : (tensor<i1>) -> i1
    "cf.cond_br"(%7, %4, %4)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 1, 1>}> : (i1, tensor<i32>, tensor<i32>) -> ()
  ^bb2(%8: tensor<i32>):  // pred: ^bb1
    %9 = "tensor.empty"() : () -> tensor<i32>
    %10 = "linalg.generic"(%8, %8, %9) <{indexing_maps = [#map, #map, #map], iterator_types = [], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg0: i32, %arg1: i32, %arg2: i32):
      %13 = "arith.addi"(%arg0, %arg1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%13) : (i32) -> ()
    }) : (tensor<i32>, tensor<i32>, tensor<i32>) -> tensor<i32>
    "cf.br"(%10)[^bb3] : (tensor<i32>) -> ()
  ^bb3(%11: tensor<i32>):  // 2 preds: ^bb1, ^bb2
    "cf.br"(%11)[^bb4] : (tensor<i32>) -> ()
  ^bb4(%12: tensor<i32>):  // pred: ^bb3
    "func.return"(%12) : (tensor<i32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<i32>, sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "tensor.from_elements"(%0) : (i32) -> tensor<i32>
    %2 = "arith.constant"() <{value = 10 : i32}> : () -> i32
    %3 = "tensor.from_elements"(%2) : (i32) -> tensor<i32>
    "cf.br"(%1)[^bb1] : (tensor<i32>) -> ()
  ^bb1(%4: tensor<i32>):  // pred: ^bb0
    %5 = "tensor.empty"() : () -> tensor<i1>
    %6 = "linalg.generic"(%4, %3, %5) <{indexing_maps = [#map, #map, #map], iterator_types = [], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: i32, %arg4: i32, %arg5: i1):
      %14 = "arith.cmpi"(%arg3, %arg4) <{predicate = 2 : i64}> : (i32, i32) -> i1
      "linalg.yield"(%14) : (i1) -> ()
    }) : (tensor<i32>, tensor<i32>, tensor<i1>) -> tensor<i1>
    %7 = "tensor.extract"(%6) : (tensor<i1>) -> i1
    "cf.cond_br"(%7, %4, %4)[^bb2, ^bb2] <{operandSegmentSizes = array<i32: 1, 1, 1>}> : (i1, tensor<i32>, tensor<i32>) -> ()
  ^bb2(%8: tensor<i32>):  // 2 preds: ^bb1, ^bb1
    %9 = "tensor.from_elements"(%2) : (i32) -> tensor<i32>
    %10 = "tensor.empty"() : () -> tensor<i32>
    %11 = "linalg.generic"(%8, %9, %10) <{indexing_maps = [#map, #map, #map], iterator_types = [], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg0: i32, %arg1: i32, %arg2: i32):
      %13 = "arith.addi"(%arg0, %arg1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%13) : (i32) -> ()
    }) : (tensor<i32>, tensor<i32>, tensor<i32>) -> tensor<i32>
    "cf.br"(%11)[^bb3] : (tensor<i32>) -> ()
  ^bb3(%12: tensor<i32>):  // pred: ^bb2
    "func.return"(%12) : (tensor<i32>) -> ()
  }) : () -> ()
}) : () -> ()

