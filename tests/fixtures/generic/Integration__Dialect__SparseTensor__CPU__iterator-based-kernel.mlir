#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> ()>
#map2 = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed(nonunique), d1 : singleton(nonunique, soa), d2 : singleton(nonunique, soa), d3 : singleton(soa)), explicitVal = 1 : i32 }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x3x4x5xi32, #sparse>) -> tensor<i32>, sym_name = "sqsum"}> ({
  ^bb0(%arg5: tensor<2x3x4x5xi32, #sparse>):
    %15 = "arith.constant"() <{value = dense<0> : tensor<i32>}> : () -> tensor<i32>
    %16 = "linalg.generic"(%arg5, %15) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: i32, %arg7: i32):
      %17 = "arith.muli"(%arg6, %arg6) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %18 = "arith.addi"(%arg7, %17) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%18) : (i32) -> ()
    }) : (tensor<2x3x4x5xi32, #sparse>, tensor<i32>) -> tensor<i32>
    "func.return"(%16) : (tensor<i32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4xi32, #sparse1>, tensor<4xi32, #sparse1>) -> tensor<4xi32>, sym_name = "vec_add"}> ({
  ^bb0(%arg0: tensor<4xi32, #sparse1>, %arg1: tensor<4xi32, #sparse1>):
    %12 = "arith.constant"() <{value = dense<0> : tensor<4xi32>}> : () -> tensor<4xi32>
    %13 = "linalg.generic"(%arg0, %arg1, %12) <{indexing_maps = [#map2, #map2, #map2], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: i32, %arg3: i32, %arg4: i32):
      %14 = "arith.addi"(%arg2, %arg3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%14) : (i32) -> ()
    }) : (tensor<4xi32, #sparse1>, tensor<4xi32, #sparse1>, tensor<4xi32>) -> tensor<4xi32>
    "func.return"(%13) : (tensor<4xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = sparse<[[0, 1, 2, 3], [1, 1, 2, 3], [1, 2, 2, 3], [1, 2, 3, 4]], 1> : tensor<2x3x4x5xi32>}> : () -> tensor<2x3x4x5xi32>
    %3 = "arith.constant"() <{value = dense<[0, 1, 2, 3]> : tensor<4xi32>}> : () -> tensor<4xi32>
    %4 = "arith.constant"() <{value = dense<[1, 0, 3, 0]> : tensor<4xi32>}> : () -> tensor<4xi32>
    %5 = "sparse_tensor.convert"(%2) : (tensor<2x3x4x5xi32>) -> tensor<2x3x4x5xi32, #sparse>
    %6 = "func.call"(%5) <{callee = @sqsum}> : (tensor<2x3x4x5xi32, #sparse>) -> tensor<i32>
    %7 = "tensor.extract"(%6) : (tensor<i32>) -> i32
    %8 = "sparse_tensor.convert"(%3) : (tensor<4xi32>) -> tensor<4xi32, #sparse1>
    %9 = "sparse_tensor.convert"(%4) : (tensor<4xi32>) -> tensor<4xi32, #sparse1>
    %10 = "func.call"(%8, %9) <{callee = @vec_add}> : (tensor<4xi32, #sparse1>, tensor<4xi32, #sparse1>) -> tensor<4xi32>
    "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (i32) -> ()
    %11 = "vector.transfer_read"(%10, %0, %1) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map2}> : (tensor<4xi32>, index, i32) -> vector<4xi32>
    "vector.print"(%11) <{punctuation = #vector.punctuation<newline>}> : (vector<4xi32>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<2x3x4x5xi32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<i32>) -> ()
    "bufferization.dealloc_tensor"(%8) : (tensor<4xi32, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%9) : (tensor<4xi32, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%10) : (tensor<4xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

