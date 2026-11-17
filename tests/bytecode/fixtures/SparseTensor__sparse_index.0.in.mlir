"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xi64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>>) -> tensor<?x?xi64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>>, sym_name = "dense_index"}> ({
  ^bb0(%arg3: tensor<?x?xi64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>> loc("<stdin>":6:8)):
    %12 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":7:11)
    %13 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":8:11)
    %14 = "sparse_tensor.lvl"(%arg3, %12) : (tensor<?x?xi64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>>, index) -> index loc("<stdin>":9:11)
    %15 = "sparse_tensor.lvl"(%arg3, %13) : (tensor<?x?xi64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>>, index) -> index loc("<stdin>":10:11)
    %16 = "tensor.empty"(%14, %15) : (index, index) -> tensor<?x?xi64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>> loc("<stdin>":11:11)
    %17 = "linalg.generic"(%arg3, %16) <{doc = "X(i,j) = A(i,j) * i * j", indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: i64 loc("<stdin>":13:10), %arg5: i64 loc("<stdin>":13:22)):
      %18 = "linalg.index"() <{dim = 0 : i64}> : () -> index loc("<stdin>":14:13)
      %19 = "linalg.index"() <{dim = 1 : i64}> : () -> index loc("<stdin>":15:13)
      %20 = "arith.index_cast"(%18) : (index) -> i64 loc("<stdin>":16:13)
      %21 = "arith.index_cast"(%19) : (index) -> i64 loc("<stdin>":17:13)
      %22 = "arith.muli"(%20, %arg4) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64 loc("<stdin>":18:13)
      %23 = "arith.muli"(%21, %22) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64 loc("<stdin>":19:13)
      "linalg.yield"(%23) : (i64) -> () loc("<stdin>":20:7)
    }) : (tensor<?x?xi64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>>, tensor<?x?xi64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>>) -> tensor<?x?xi64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>> loc("<stdin>":12:11)
    "func.return"(%17) : (tensor<?x?xi64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>>) -> () loc("<stdin>":22:5)
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = (tensor<?x?xi64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<?x?xi64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, sym_name = "sparse_index"}> ({
  ^bb0(%arg0: tensor<?x?xi64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":25:8)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":26:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":27:10)
    %2 = "sparse_tensor.lvl"(%arg0, %0) : (tensor<?x?xi64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, index) -> index loc("<stdin>":28:10)
    %3 = "sparse_tensor.lvl"(%arg0, %1) : (tensor<?x?xi64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, index) -> index loc("<stdin>":29:10)
    %4 = "tensor.empty"(%2, %3) : (index, index) -> tensor<?x?xi64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":30:10)
    %5 = "linalg.generic"(%arg0, %4) <{doc = "X(i,j) = A(i,j) * i * j", indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: i64 loc("<stdin>":32:10), %arg2: i64 loc("<stdin>":32:22)):
      %6 = "linalg.index"() <{dim = 0 : i64}> : () -> index loc("<stdin>":33:12)
      %7 = "linalg.index"() <{dim = 1 : i64}> : () -> index loc("<stdin>":34:12)
      %8 = "arith.index_cast"(%6) : (index) -> i64 loc("<stdin>":35:12)
      %9 = "arith.index_cast"(%7) : (index) -> i64 loc("<stdin>":36:12)
      %10 = "arith.muli"(%8, %arg1) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64 loc("<stdin>":37:13)
      %11 = "arith.muli"(%9, %10) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64 loc("<stdin>":38:13)
      "linalg.yield"(%11) : (i64) -> () loc("<stdin>":39:7)
    }) : (tensor<?x?xi64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<?x?xi64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<?x?xi64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":31:10)
    "func.return"(%5) : (tensor<?x?xi64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":41:5)
  }) : () -> () loc("<stdin>":24:3)
}) : () -> () loc("<stdin>":4:1)
