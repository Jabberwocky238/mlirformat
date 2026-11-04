#map = affine_map<(d0, d1, d2, d3) -> (d0 + d2, d1 + d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
#map3 = affine_map<(d0, d1, d2, d3) -> (d0 + d1, d2 + d3)>
#map4 = affine_map<(d0, d1, d2, d3) -> (d1, d2)>
#map5 = affine_map<(d0, d1, d2, d3) -> (d0, d3)>
#map6 = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x8xi32>, tensor<3x3xi32>, tensor<6x6xi32>) -> tensor<6x6xi32>, sym_name = "conv2d"}> ({
  ^bb0(%arg30: tensor<8x8xi32>, %arg31: tensor<3x3xi32>, %arg32: tensor<6x6xi32>):
    %42 = "linalg.conv_2d"(%arg30, %arg31, %arg32) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg33: i32, %arg34: i32, %arg35: i32):
      %43 = "arith.muli"(%arg33, %arg34) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %44 = "arith.addi"(%arg35, %43) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%44) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<8x8xi32>, tensor<3x3xi32>, tensor<6x6xi32>) -> tensor<6x6xi32>
    "func.return"(%42) : (tensor<6x6xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi32, #sparse>, tensor<3x3xi32>) -> tensor<6x6xi32>, sym_name = "conv2d_CSR_dense_rotated"}> ({
  ^bb0(%arg25: tensor<8x8xi32, #sparse>, %arg26: tensor<3x3xi32>):
    %38 = "arith.constant"() <{value = dense<0> : tensor<6x6xi32>}> : () -> tensor<6x6xi32>
    %39 = "linalg.generic"(%arg25, %arg26, %38) <{indexing_maps = [#map3, #map4, #map5], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg27: i32, %arg28: i32, %arg29: i32):
      %40 = "arith.muli"(%arg27, %arg28) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %41 = "arith.addi"(%arg29, %40) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%41) : (i32) -> ()
    }) {sorted = true} : (tensor<8x8xi32, #sparse>, tensor<3x3xi32>, tensor<6x6xi32>) -> tensor<6x6xi32>
    "func.return"(%39) : (tensor<6x6xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi32>, tensor<3x3xi32>) -> tensor<6x6xi32, #sparse1>, sym_name = "conv2d_sparse_out"}> ({
  ^bb0(%arg20: tensor<8x8xi32>, %arg21: tensor<3x3xi32>):
    %34 = "tensor.empty"() : () -> tensor<6x6xi32, #sparse1>
    %35 = "linalg.conv_2d"(%arg20, %arg21, %34) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg22: i32, %arg23: i32, %arg24: i32):
      %36 = "arith.muli"(%arg22, %arg23) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %37 = "arith.addi"(%arg24, %36) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%37) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<8x8xi32>, tensor<3x3xi32>, tensor<6x6xi32, #sparse1>) -> tensor<6x6xi32, #sparse1>
    "func.return"(%35) : (tensor<6x6xi32, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi32, #sparse1>, tensor<3x3xi32>) -> tensor<6x6xi32, #sparse1>, sym_name = "conv2d_all_sparse_DCSR"}> ({
  ^bb0(%arg15: tensor<8x8xi32, #sparse1>, %arg16: tensor<3x3xi32>):
    %30 = "tensor.empty"() : () -> tensor<6x6xi32, #sparse1>
    %31 = "linalg.conv_2d"(%arg15, %arg16, %30) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg17: i32, %arg18: i32, %arg19: i32):
      %32 = "arith.muli"(%arg17, %arg18) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %33 = "arith.addi"(%arg19, %32) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%33) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<8x8xi32, #sparse1>, tensor<3x3xi32>, tensor<6x6xi32, #sparse1>) -> tensor<6x6xi32, #sparse1>
    "func.return"(%31) : (tensor<6x6xi32, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi32, #sparse>, tensor<3x3xi32>) -> tensor<6x6xi32, #sparse>, sym_name = "conv2d_all_sparse_CSR"}> ({
  ^bb0(%arg10: tensor<8x8xi32, #sparse>, %arg11: tensor<3x3xi32>):
    %26 = "tensor.empty"() : () -> tensor<6x6xi32, #sparse>
    %27 = "linalg.conv_2d"(%arg10, %arg11, %26) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg12: i32, %arg13: i32, %arg14: i32):
      %28 = "arith.muli"(%arg12, %arg13) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %29 = "arith.addi"(%arg14, %28) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%29) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<8x8xi32, #sparse>, tensor<3x3xi32>, tensor<6x6xi32, #sparse>) -> tensor<6x6xi32, #sparse>
    "func.return"(%27) : (tensor<6x6xi32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi32, #sparse2>, tensor<3x3xi32>) -> tensor<6x6xi32, #sparse2>, sym_name = "conv2d_all_sparse_CD"}> ({
  ^bb0(%arg5: tensor<8x8xi32, #sparse2>, %arg6: tensor<3x3xi32>):
    %22 = "tensor.empty"() : () -> tensor<6x6xi32, #sparse2>
    %23 = "linalg.conv_2d"(%arg5, %arg6, %22) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: i32, %arg8: i32, %arg9: i32):
      %24 = "arith.muli"(%arg7, %arg8) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %25 = "arith.addi"(%arg9, %24) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%25) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<8x8xi32, #sparse2>, tensor<3x3xi32>, tensor<6x6xi32, #sparse2>) -> tensor<6x6xi32, #sparse2>
    "func.return"(%23) : (tensor<6x6xi32, #sparse2>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi32, #sparse3>, tensor<3x3xi32>) -> tensor<6x6xi32, #sparse3>, sym_name = "conv2d_all_sparse_CSC"}> ({
  ^bb0(%arg0: tensor<8x8xi32, #sparse3>, %arg1: tensor<3x3xi32>):
    %18 = "tensor.empty"() : () -> tensor<6x6xi32, #sparse3>
    %19 = "linalg.conv_2d"(%arg0, %arg1, %18) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: i32, %arg3: i32, %arg4: i32):
      %20 = "arith.muli"(%arg2, %arg3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %21 = "arith.addi"(%arg4, %20) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%21) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<8x8xi32, #sparse3>, tensor<3x3xi32>, tensor<6x6xi32, #sparse3>) -> tensor<6x6xi32, #sparse3>
    "func.return"(%19) : (tensor<6x6xi32, #sparse3>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = dense<[[1, 0, -1], [0, 0, 0], [-1, 0, 1]]> : tensor<3x3xi32>}> : () -> tensor<3x3xi32>
    %3 = "arith.constant"() <{value = dense<[[1, 2, 3, 4, 0, 6, 7, 8], [2, 2, 4, 4, 0, 0, 6, 8], [2, 2, 4, 4, 0, 0, 6, 8], [2, 2, 3, 4, 0, 0, 7, 8], [1, 3, 3, 4, 0, 0, 6, 8], [3, 2, 3, 4, 0, 0, 7, 8], [1, 3, 3, 4, 3, 6, 6, 8], [1, 3, 3, 4, 3, 0, 7, 8]]> : tensor<8x8xi32>}> : () -> tensor<8x8xi32>
    %4 = "sparse_tensor.convert"(%3) : (tensor<8x8xi32>) -> tensor<8x8xi32, #sparse1>
    %5 = "sparse_tensor.convert"(%3) : (tensor<8x8xi32>) -> tensor<8x8xi32, #sparse>
    %6 = "sparse_tensor.convert"(%3) : (tensor<8x8xi32>) -> tensor<8x8xi32, #sparse2>
    %7 = "sparse_tensor.convert"(%3) : (tensor<8x8xi32>) -> tensor<8x8xi32, #sparse3>
    %8 = "arith.constant"() <{value = dense<0> : tensor<6x6xi32>}> : () -> tensor<6x6xi32>
    %9 = "func.call"(%3, %2, %8) <{callee = @conv2d}> : (tensor<8x8xi32>, tensor<3x3xi32>, tensor<6x6xi32>) -> tensor<6x6xi32>
    %10 = "func.call"(%3, %2) <{callee = @conv2d_sparse_out}> : (tensor<8x8xi32>, tensor<3x3xi32>) -> tensor<6x6xi32, #sparse1>
    %11 = "func.call"(%4, %2) <{callee = @conv2d_all_sparse_DCSR}> : (tensor<8x8xi32, #sparse1>, tensor<3x3xi32>) -> tensor<6x6xi32, #sparse1>
    %12 = "func.call"(%5, %2) <{callee = @conv2d_all_sparse_CSR}> : (tensor<8x8xi32, #sparse>, tensor<3x3xi32>) -> tensor<6x6xi32, #sparse>
    %13 = "func.call"(%6, %2) <{callee = @conv2d_all_sparse_CD}> : (tensor<8x8xi32, #sparse2>, tensor<3x3xi32>) -> tensor<6x6xi32, #sparse2>
    %14 = "func.call"(%7, %2) <{callee = @conv2d_all_sparse_CSC}> : (tensor<8x8xi32, #sparse3>, tensor<3x3xi32>) -> tensor<6x6xi32, #sparse3>
    %15 = "func.call"(%5, %2) <{callee = @conv2d_CSR_dense_rotated}> : (tensor<8x8xi32, #sparse>, tensor<3x3xi32>) -> tensor<6x6xi32>
    %16 = "vector.transfer_read"(%9, %0, %0, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map6}> : (tensor<6x6xi32>, index, index, i32) -> vector<6x6xi32>
    "vector.print"(%16) <{punctuation = #vector.punctuation<newline>}> : (vector<6x6xi32>) -> ()
    "sparse_tensor.print"(%10) : (tensor<6x6xi32, #sparse1>) -> ()
    "sparse_tensor.print"(%11) : (tensor<6x6xi32, #sparse1>) -> ()
    "sparse_tensor.print"(%12) : (tensor<6x6xi32, #sparse>) -> ()
    "sparse_tensor.print"(%13) : (tensor<6x6xi32, #sparse2>) -> ()
    "sparse_tensor.print"(%14) : (tensor<6x6xi32, #sparse3>) -> ()
    %17 = "vector.transfer_read"(%15, %0, %0, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map6}> : (tensor<6x6xi32>, index, index, i32) -> vector<6x6xi32>
    "vector.print"(%16) <{punctuation = #vector.punctuation<newline>}> : (vector<6x6xi32>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<8x8xi32, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<8x8xi32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%7) : (tensor<8x8xi32, #sparse3>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<8x8xi32, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%9) : (tensor<6x6xi32>) -> ()
    "bufferization.dealloc_tensor"(%10) : (tensor<6x6xi32, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%11) : (tensor<6x6xi32, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%12) : (tensor<6x6xi32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%13) : (tensor<6x6xi32, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%14) : (tensor<6x6xi32, #sparse3>) -> ()
    "bufferization.dealloc_tensor"(%15) : (tensor<6x6xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

