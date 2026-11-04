#map = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xi64, #sparse>) -> tensor<?x?xi64, #sparse>, sym_name = "dense_index"}> ({
  ^bb0(%arg3: tensor<?x?xi64, #sparse>):
    %12 = "arith.constant"() <{value = 0 : index}> : () -> index
    %13 = "arith.constant"() <{value = 0 : index}> : () -> index
    %14 = "sparse_tensor.lvl"(%arg3, %12) : (tensor<?x?xi64, #sparse>, index) -> index
    %15 = "sparse_tensor.lvl"(%arg3, %13) : (tensor<?x?xi64, #sparse>, index) -> index
    %16 = "tensor.empty"(%14, %15) : (index, index) -> tensor<?x?xi64, #sparse>
    %17 = "linalg.generic"(%arg3, %16) <{doc = "X(i,j) = A(i,j) * i * j", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: i64, %arg5: i64):
      %18 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %19 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %20 = "arith.index_cast"(%18) : (index) -> i64
      %21 = "arith.index_cast"(%19) : (index) -> i64
      %22 = "arith.muli"(%20, %arg4) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      %23 = "arith.muli"(%21, %22) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      "linalg.yield"(%23) : (i64) -> ()
    }) : (tensor<?x?xi64, #sparse>, tensor<?x?xi64, #sparse>) -> tensor<?x?xi64, #sparse>
    "func.return"(%17) : (tensor<?x?xi64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xi64, #sparse1>) -> tensor<?x?xi64, #sparse1>, sym_name = "sparse_index"}> ({
  ^bb0(%arg0: tensor<?x?xi64, #sparse1>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "sparse_tensor.lvl"(%arg0, %0) : (tensor<?x?xi64, #sparse1>, index) -> index
    %3 = "sparse_tensor.lvl"(%arg0, %1) : (tensor<?x?xi64, #sparse1>, index) -> index
    %4 = "tensor.empty"(%2, %3) : (index, index) -> tensor<?x?xi64, #sparse1>
    %5 = "linalg.generic"(%arg0, %4) <{doc = "X(i,j) = A(i,j) * i * j", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: i64, %arg2: i64):
      %6 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %7 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %8 = "arith.index_cast"(%6) : (index) -> i64
      %9 = "arith.index_cast"(%7) : (index) -> i64
      %10 = "arith.muli"(%8, %arg1) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      %11 = "arith.muli"(%9, %10) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      "linalg.yield"(%11) : (i64) -> ()
    }) : (tensor<?x?xi64, #sparse1>, tensor<?x?xi64, #sparse1>) -> tensor<?x?xi64, #sparse1>
    "func.return"(%5) : (tensor<?x?xi64, #sparse1>) -> ()
  }) : () -> ()
}) : () -> ()

