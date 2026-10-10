#map = affine_map<() -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<i32>) -> tensor<i1>, sym_name = "main"}> ({
  ^bb0(%arg0: tensor<i32>):
    %0 = "arith.constant"() <{value = 10 : i32}> : () -> i32
    %1 = "tensor.from_elements"(%0) : (i32) -> tensor<i32>
    %2 = "tensor.empty"() : () -> tensor<i1>
    %3 = "linalg.generic"(%arg0, %1, %2) <{indexing_maps = [#map, #map, #map], iterator_types = [], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg1: i32, %arg2: i32, %arg3: i1):
      %4 = "arith.cmpi"(%arg1, %arg2) <{predicate = 2 : i64}> : (i32, i32) -> i1
      "linalg.yield"(%4) : (i1) -> ()
    }) : (tensor<i32>, tensor<i32>, tensor<i1>) -> tensor<i1>
    "func.return"(%3) : (tensor<i1>) -> ()
  }) : () -> ()
}) : () -> ()

