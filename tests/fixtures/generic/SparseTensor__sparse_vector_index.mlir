#map = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8xi64, #sparse>) -> tensor<8xi64>, sym_name = "sparse_index_1d_conj"}> ({
  ^bb0(%arg3: tensor<8xi64, #sparse>):
    %5 = "tensor.empty"() : () -> tensor<8xi64>
    %6 = "linalg.generic"(%arg3, %5) <{doc = "X(i) = a(i) op i", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: i64, %arg5: i64):
      %7 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %8 = "arith.index_cast"(%7) : (index) -> i64
      %9 = "arith.muli"(%arg4, %8) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      "linalg.yield"(%9) : (i64) -> ()
    }) : (tensor<8xi64, #sparse>, tensor<8xi64>) -> tensor<8xi64>
    "func.return"(%6) : (tensor<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8xi64, #sparse>) -> tensor<8xi64>, sym_name = "sparse_index_1d_disj"}> ({
  ^bb0(%arg0: tensor<8xi64, #sparse>):
    %0 = "tensor.empty"() : () -> tensor<8xi64>
    %1 = "linalg.generic"(%arg0, %0) <{doc = "X(i) = a(i) op i", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: i64, %arg2: i64):
      %2 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %3 = "arith.index_cast"(%2) : (index) -> i64
      %4 = "arith.addi"(%arg1, %3) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      "linalg.yield"(%4) : (i64) -> ()
    }) : (tensor<8xi64, #sparse>, tensor<8xi64>) -> tensor<8xi64>
    "func.return"(%1) : (tensor<8xi64>) -> ()
  }) : () -> ()
}) : () -> ()

