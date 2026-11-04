#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xi32, #sparse>, tensor<?x?x?xi32, #sparse>) -> tensor<?x?xi32, #sparse1>, sym_name = "redsum"}> ({
  ^bb0(%arg0: tensor<?x?x?xi32, #sparse>, %arg1: tensor<?x?x?xi32, #sparse>):
    %5 = "arith.constant"() <{value = 0 : index}> : () -> index
    %6 = "arith.constant"() <{value = 1 : index}> : () -> index
    %7 = "tensor.dim"(%arg0, %5) : (tensor<?x?x?xi32, #sparse>, index) -> index
    %8 = "tensor.dim"(%arg0, %6) : (tensor<?x?x?xi32, #sparse>, index) -> index
    %9 = "tensor.empty"(%7, %8) : (index, index) -> tensor<?x?xi32, #sparse1>
    %10 = "linalg.generic"(%arg0, %arg1, %9) <{doc = "X(i,j) = SUM_k A(i,j,k) * B(i,j,k)", indexing_maps = [#map, #map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: i32, %arg3: i32, %arg4: i32):
      %11 = "arith.muli"(%arg2, %arg3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %12 = "arith.addi"(%arg4, %11) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%12) : (i32) -> ()
    }) : (tensor<?x?x?xi32, #sparse>, tensor<?x?x?xi32, #sparse>, tensor<?x?xi32, #sparse1>) -> tensor<?x?xi32, #sparse1>
    "func.return"(%10) : (tensor<?x?xi32, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = sparse<[[1, 1, 3], [2, 0, 0], [2, 2, 1], [2, 2, 2], [2, 2, 3]], [1, 2, 3, 4, 5]> : tensor<3x3x4xi32>}> : () -> tensor<3x3x4xi32>
    %1 = "arith.constant"() <{value = sparse<[[1, 0, 0], [1, 1, 3], [2, 2, 1], [2, 2, 3]], [6, 7, 8, 9]> : tensor<3x3x4xi32>}> : () -> tensor<3x3x4xi32>
    %2 = "sparse_tensor.convert"(%0) : (tensor<3x3x4xi32>) -> tensor<?x?x?xi32, #sparse>
    %3 = "sparse_tensor.convert"(%1) : (tensor<3x3x4xi32>) -> tensor<?x?x?xi32, #sparse>
    %4 = "func.call"(%2, %3) <{callee = @redsum}> : (tensor<?x?x?xi32, #sparse>, tensor<?x?x?xi32, #sparse>) -> tensor<?x?xi32, #sparse1>
    "sparse_tensor.print"(%4) : (tensor<?x?xi32, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%2) : (tensor<?x?x?xi32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%3) : (tensor<?x?x?xi32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<?x?xi32, #sparse1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

