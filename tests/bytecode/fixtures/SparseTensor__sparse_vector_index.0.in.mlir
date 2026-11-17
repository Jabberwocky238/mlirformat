"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8xi64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<8xi64>, sym_name = "sparse_index_1d_conj"}> ({
  ^bb0(%arg3: tensor<8xi64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":5:8)):
    %5 = "tensor.empty"() : () -> tensor<8xi64> loc("<stdin>":6:10)
    %6 = "linalg.generic"(%arg3, %5) <{doc = "X(i) = a(i) op i", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: i64 loc("<stdin>":8:10), %arg5: i64 loc("<stdin>":8:22)):
      %7 = "linalg.index"() <{dim = 0 : i64}> : () -> index loc("<stdin>":9:12)
      %8 = "arith.index_cast"(%7) : (index) -> i64 loc("<stdin>":10:12)
      %9 = "arith.muli"(%arg4, %8) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64 loc("<stdin>":11:12)
      "linalg.yield"(%9) : (i64) -> () loc("<stdin>":12:7)
    }) : (tensor<8xi64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<8xi64>) -> tensor<8xi64> loc("<stdin>":7:10)
    "func.return"(%6) : (tensor<8xi64>) -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":4:3)
  "func.func"() <{function_type = (tensor<8xi64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<8xi64>, sym_name = "sparse_index_1d_disj"}> ({
  ^bb0(%arg0: tensor<8xi64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":17:8)):
    %0 = "tensor.empty"() : () -> tensor<8xi64> loc("<stdin>":18:10)
    %1 = "linalg.generic"(%arg0, %0) <{doc = "X(i) = a(i) op i", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: i64 loc("<stdin>":20:10), %arg2: i64 loc("<stdin>":20:22)):
      %2 = "linalg.index"() <{dim = 0 : i64}> : () -> index loc("<stdin>":21:12)
      %3 = "arith.index_cast"(%2) : (index) -> i64 loc("<stdin>":22:12)
      %4 = "arith.addi"(%arg1, %3) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64 loc("<stdin>":23:12)
      "linalg.yield"(%4) : (i64) -> () loc("<stdin>":24:7)
    }) : (tensor<8xi64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<8xi64>) -> tensor<8xi64> loc("<stdin>":19:10)
    "func.return"(%1) : (tensor<8xi64>) -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":16:3)
}) : () -> () loc("<stdin>":3:1)
